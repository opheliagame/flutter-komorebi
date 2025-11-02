import 'package:flutter_komorebi/src/drift/database.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotesInCollection(int collectionId);
  Future<Note> getNote(int noteId);
}
