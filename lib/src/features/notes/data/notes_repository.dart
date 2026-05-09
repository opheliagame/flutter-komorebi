// import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'dart:typed_data';

import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/notes/data/drift_notes_repository_impl.dart';
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
  return DriftNotesRepository(ref.read(appDatabaseProvider));
});

final notesListStreamProvider = StreamProvider.family<List<NoteEntity>, int>((ref, currentCollectionId) {
  final repository = ref.read(notesRepositoryProvider);

  // TODO(dev): do we need logic to watch all notes?
  return repository.watchNotesInCollection(currentCollectionId);
});

final noteStreamProvider = StreamProvider.family<NoteEntity, int>((ref, noteId) {
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

final searchResultsProvider = Provider<AsyncValue<List<NoteEntity>>>((ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  final notesAsync = ref.watch(allNotesStreamProvider);
  if (query.isEmpty) return const AsyncValue.data([]);
  return notesAsync.whenData(
    (notes) => notes.where((n) => n.content != null && n.content!.toLowerCase().contains(query)).toList(),
  );
});

final collectionsOfSingleNoteStreamProvider =
    StreamProvider.family.autoDispose<List<CollectionEntity>, int>((ref, noteId) {
  final repository = ref.read(collectionsRepositoryProvider);
  return repository.watchCollectionsOfNote(noteId);
});
