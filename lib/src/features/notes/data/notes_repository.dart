import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/drift_notes_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

abstract class NotesRepository {
  Future<List<Note>> getAllNotes();
  Stream<List<Note>> watchAllNotes();
  Future<List<Note>> getNotesInCollection(int collectionId);
  Stream<List<Note>> watchNotesInCollection(int collectionId);
  Future<Note> getNote(int noteId);
  Future<bool> createNote(String? text, XFile? media, int? collectionId);
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
