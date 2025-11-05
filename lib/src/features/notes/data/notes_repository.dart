import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/drift_notes_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

abstract class NotesRepository {
  // crud operations
  Future<List<Note>> getAllNotes();
  Stream<List<Note>> watchAllNotes();
  Future<Note> getNote(int noteId);
  Stream<Note> watchNote(int noteId);
  Future<bool> createNote({required String? content, required XFile? media, required int? collectionId});
  Future<bool> deleteNote(int noteId);

  // history operations

  // collection related operations
  Future<List<Note>> getNotesInCollection(int collectionId);
  Stream<List<Note>> watchNotesInCollection(int collectionId);
  Future<List<Note>> getNotesInCollectionList(List<int> collectionIds);
  Stream<List<Note>> watchNotesInCollectionList(List<int> collectionIds);
  Future<bool> addNoteToCollection({required int noteId, required int collectionId});
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds});
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId});
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds});
}

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return DriftNotesRepository();
});

final notesListStreamProvider = StreamProvider.family<List<Note>, int?>((ref, currentCollectionId) {
  final repository = ref.watch(notesRepositoryProvider);

  if (currentCollectionId == null) {
    return repository.watchAllNotes();
  } else {
    return repository.watchNotesInCollection(currentCollectionId);
  }
});
