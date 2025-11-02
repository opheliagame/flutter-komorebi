import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';

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
}
