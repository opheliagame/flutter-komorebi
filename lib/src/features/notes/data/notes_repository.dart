// import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/drift_notes_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

abstract class NotesRepository {
  // crud operations
  Future<List<NoteEntity>> getAllNotes();
  Stream<List<NoteEntity>> watchAllNotes();
  Future<NoteEntity> getNote(int noteId);
  Stream<NoteEntity> watchNote(int noteId);
  Future<bool> createNote({required String? content, required XFile? media, required int? collectionId});
  Future<bool> deleteNote(int noteId);

  // history operations

  // collection related operations
  Future<List<NoteEntity>> getNotesInCollection(int collectionId);
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId);
  Future<List<NoteEntity>> getNotesInCollectionList(List<int> collectionIds);
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds);
  Future<bool> addNoteToCollection({required int noteId, required int collectionId});
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds});
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId});
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds});
}

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return DriftNotesRepository(ref.read(appDatabaseProvider));
});

final notesListStreamProvider = StreamProvider.family<List<NoteEntity>, int?>((ref, currentCollectionId) {
  final repository = ref.watch(notesRepositoryProvider);

  if (currentCollectionId == null) {
    return repository.watchAllNotes();
  } else {
    return repository.watchNotesInCollection(currentCollectionId);
  }
});
