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

  if (currentCollectionId == ROOT_COLLECTION_ID) {
    return repository.watchAllNotes();
  } else {
    return repository.watchNotesInCollection(currentCollectionId);
  }
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

final collectionsOfSingleNoteStreamProvider =
    StreamProvider.family.autoDispose<List<CollectionEntity>, int>((ref, noteId) {
  final repository = ref.read(collectionsRepositoryProvider);

  final result = repository.watchCollectionsOfNote(noteId);
  return result;
});
