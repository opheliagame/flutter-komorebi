import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:image_picker/image_picker.dart';

class DriftNotesRepository implements NotesRepository {
  final database = AppDatabase();

  @override
  Future<List<Note>> getAllNotes() {
    final query = database.select(database.notes).get();
    return query;
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    final query = database.select(database.notes).watch();
    return query;
  }

  @override
  Future<Note> getNote(int noteId) async {
    final query = database.select(database.notes)..where((q) => q.id.equals(noteId));
    return await query.getSingle();
  }

  @override
  Future<List<Note>> getNotesInCollection(int collectionId) async {
    final query = database.select(database.notes)
      ..join(
        [
          innerJoin(database.collectionNotes, database.collectionNotes.noteId.equalsExp(database.notes.id)),
        ],
      )
      ..where((q) => database.collectionNotes.collectionId.equals(collectionId));

    final notes = query.get();
    return notes;

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
  }

  @override
  Stream<List<Note>> watchNotesInCollection(int collectionId) {
    final query = database.select(database.collectionNotes).join(
      [
        innerJoin(database.notes, database.notes.id.equalsExp(database.collectionNotes.noteId)),
      ],
    )..where(database.collectionNotes.collectionId.equals(collectionId));

    final notes = query.watch().map((rows) {
      return rows.map((row) {
        return row.readTable(database.notes);
      }).toList();
    });
    return notes;
  }

  @override
  Future<bool> createNote(String? content, XFile? media, int? collectionId) async {
    Uint8List? pickedMedia;
    if (media != null) {
      debugPrint('createCollection: saving ${media.name}');
      pickedMedia = await media.readAsBytes();
    }

    try {
      final noteId = await database.into(database.notes).insert(
            NotesCompanion.insert(
              content: Value.absentIfNull(content),
              media: Value.absentIfNull(pickedMedia),
              createdAt: DateTime.now(),
              modifiedAt: DateTime.now(),
            ),
          );

      if (collectionId != null) {
        await database.into(database.collectionNotes).insert(
              CollectionNotesCompanion.insert(noteId: noteId, collectionId: collectionId),
            );
      }

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
