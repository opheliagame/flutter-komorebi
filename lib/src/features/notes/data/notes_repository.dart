// import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'dart:typed_data';

import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/notes/data/drift_notes_repository_impl.dart';
import 'package:flutter_komorebi/src/features/search/data/semantic_search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class NotesRepository {
  // crud operations
  Future<List<NoteEntity>> getAllNotes();
  Stream<List<NoteEntity>> watchAllNotes();
  Future<NoteEntity> getNote(int noteId);
  Stream<NoteEntity> watchNote(int noteId);
  Future<int> createNote({
    required String? content,
    required Uint8List? media,
  });
  Future<int> updateNote({
    required int noteId,
    required String? content,
    required Uint8List? media,
  });
  Future<bool> deleteNote(int noteId);

  // collection related operations
  Future<List<NoteEntity>> getNotesInCollection(int collectionId);
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId);
  Future<List<NoteEntity>> getNotesInCollectionList(List<int> collectionIds);
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds);
}

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return DriftNotesRepository(
    ref.read(appDatabaseProvider),
    semanticSearchService: ref.read(semanticSearchServiceProvider),
  );
});

final notesListStreamProvider =
    StreamProvider.family<List<NoteEntity>, int>((ref, currentCollectionId) {
  final repository = ref.read(notesRepositoryProvider);

  // TODO(dev): do we need logic to watch all notes?
  return repository.watchNotesInCollection(currentCollectionId);
});

final noteStreamProvider =
    StreamProvider.family<NoteEntity, int>((ref, noteId) {
  final repository = ref.read(notesRepositoryProvider);
  return repository.watchNote(noteId);
});

final allNoteIdsProvider = StreamProvider<Iterable<int>>((ref) {
  final repository = ref.read(notesRepositoryProvider);

  final notes = repository.watchAllNotes();
  return notes.map((e) => e.map((e1) => e1.id));
});

final allNotesStreamProvider = StreamProvider<List<NoteEntity>>((ref) {
  final repository = ref.read(notesRepositoryProvider);
  return repository.watchAllNotes();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<NoteEntity>>((ref) async {
  final query = ref.watch(searchQueryProvider).trim();
  if (query.isEmpty) return [];

  final allNotes = await ref.watch(allNotesStreamProvider.future);
  final semanticService = ref.watch(semanticSearchServiceProvider);

  for (final note in allNotes) {
    await semanticService.indexNote(note);
  }
  final semanticMatchIds =
      await semanticService.searchSimilarNotes(query: query);
  if (semanticMatchIds.isNotEmpty) {
    final noteMap = {for (final n in allNotes) n.id: n};
    final results = <NoteEntity>[];
    final seen = <int>{};

    for (final id in semanticMatchIds) {
      final note = noteMap[id];
      if (note != null) {
        results.add(note);
        seen.add(id);
      }
    }

    // Append any keyword matches not in semantic results.
    final lowerQuery = query.toLowerCase();
    for (final n in allNotes) {
      if (!seen.contains(n.id) &&
          n.content != null &&
          n.content!.toLowerCase().contains(lowerQuery)) {
        results.add(n);
      }
    }
    return results;
  }

  final lowerQuery = query.toLowerCase();
  return allNotes
      .where((n) =>
          n.content != null && n.content!.toLowerCase().contains(lowerQuery))
      .toList();
});

final collectionsOfSingleNoteStreamProvider = StreamProvider.family
    .autoDispose<List<CollectionEntity>, int>((ref, noteId) {
  final repository = ref.read(collectionsRepositoryProvider);
  return repository.watchCollectionsOfNote(noteId);
});
