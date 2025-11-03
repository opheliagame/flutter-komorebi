import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:image_picker/image_picker.dart';

class FakeNotesRepository implements NotesRepository {
  @override
  Future<Note> getNote(int noteId) {
    return Future(
      () => Note(id: 1, createdAt: DateTime(2024), modifiedAt: DateTime(2024)),
    );
  }

  @override
  Future<List<Note>> getNotesInCollection(int collectionId) {
    return Future(() => []);
  }

  @override
  Future<bool> createNote(String? text, XFile? media, int? collectionId) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    // TODO: implement watchAllNotes
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchNotesInCollection(int collectionId) {
    // TODO: implement watchNotesInCollection
    throw UnimplementedError();
  }
}
