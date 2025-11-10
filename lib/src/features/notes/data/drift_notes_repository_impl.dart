import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:image_picker/image_picker.dart';

class DriftNotesRepository implements NotesRepository {
  DriftNotesRepository(this.database);

  final AppDatabase database;

  @override
  Future<List<NoteEntity>> getAllNotes() async {
    final query = database.select(database.noteTable).get();
    final notes = (await query).map((e) => e.toDomain()).toList();
    return notes;
  }

  @override
  Stream<List<NoteEntity>> watchAllNotes() {
    final query = database.select(database.noteTable).watch();
    return query.map((e) => e.map((e1) => e1.toDomain()).toList());
  }

  @override
  Future<NoteEntity> getNote(int noteId) async {
    final query = database.select(database.noteTable)..where((q) => q.id.equals(noteId));
    return (await query.getSingle()).toDomain();
  }

  @override
  Stream<NoteEntity> watchNote(int noteId) {
    try {
      final query = database.select(database.noteTable)..where((q) => q.id.equals(noteId));
      return (query.watchSingle()).map((e) => e.toDomain());
    } catch (e) {
      debugPrint(e.toString());
      return Stream.error(e);
    }
  }

  @override
  Future<int> createNote({required String? content, required XFile? media}) async {
    Uint8List? pickedMedia;
    if (media != null) {
      debugPrint('createCollection: saving ${media.name}');
      pickedMedia = await media.readAsBytes();
    }

    try {
      final noteId = await database.into(database.noteTable).insert(
            NoteTableCompanion.insert(
              content: Value.absentIfNull(content),
              media: Value.absentIfNull(pickedMedia),
              createdAt: DateTime.now(),
              modifiedAt: DateTime.now(),
            ),
          );

      return noteId;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> deleteNote(int noteId) async {
    final query = (database.delete(database.noteTable)..where((q) => q.id.equals(noteId))).go();
    try {
      await query;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<NoteEntity>> getNotesInCollection(int collectionId) async {
    final query = database.select(database.noteTable)
      ..join(
        [
          innerJoin(database.collectionNoteTable, database.collectionNoteTable.noteId.equalsExp(database.noteTable.id)),
        ],
      )
      ..where((q) => database.collectionNoteTable.collectionId.equals(collectionId));

    final notes = (await query.get()).map((e) => e.toDomain()).toList();
    return notes;
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId) {
    final query = database.select(database.collectionNoteTable).join(
      [
        innerJoin(database.noteTable, database.noteTable.id.equalsExp(database.collectionNoteTable.noteId)),
      ],
    )..where(database.collectionNoteTable.collectionId.equals(collectionId));

    final notes = query.watch().map((rows) {
      return rows.map((row) {
        return row.readTable(database.noteTable).toDomain();
      }).toList();
    });
    return notes;
  }

  @override
  Future<List<NoteEntity>> getNotesInCollectionList(List<int> collectionIds) async {
    final query = database.select(database.noteTable)
      ..join(
        [
          innerJoin(database.collectionNoteTable, database.collectionNoteTable.noteId.equalsExp(database.noteTable.id)),
        ],
      )
      ..where((q) => database.collectionNoteTable.collectionId.isIn(collectionIds));

    final notes = (await query.get()).map((e) => e.toDomain()).toList();
    return notes;
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds) {
    final query = database.select(database.noteTable)
      ..join(
        [
          innerJoin(database.collectionNoteTable, database.collectionNoteTable.noteId.equalsExp(database.noteTable.id)),
        ],
      )
      ..where((q) => database.collectionNoteTable.collectionId.isIn(collectionIds));

    final notes = query.watch().map((e) => e.map((e1) => e1.toDomain()).toList());
    return notes;
  }
}
