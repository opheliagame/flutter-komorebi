import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';

class DriftNotesRepository implements NotesRepository {
  final database = AppDatabase();

  @override
  Future<Note> getNote(int noteId) async {
    final query = database.select(database.notes)..where((q) => q.id.equals(noteId));
    return await query.getSingle();
  }

  @override
  Future<List<Note>> getNotesInCollection(int collectionId) async {
    // TODO write implementation
    // final noteIdsQuery = database.select(database.collectionNotes)
    //   ..where((q) => q.collectionId.equals(collectionId));
    // final noteIds = await noteIdsQuery.get();
    // final notesQuery = database.select(database.notes)
    //   ..join([
    //     leftOuterJoin(database.collectionNotes, on),
    //     leftOuterJoin(database.collectionNotes, database.collectionNotes.collectionId.equalsExp(collectionId)),
    //   ]);
    // final notes = await notesQuery.get();
    // return notes;

    return Future(() => []);
  }
}
