import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';

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
    final query = database.select(database.noteTable)
      ..orderBy([(u) => OrderingTerm(expression: database.noteTable.modifiedAt, mode: OrderingMode.desc)]);

    try {
      final result = query.watch();
      return result.map((e) => e.map((e1) => e1.toDomain()).toList());
    } catch (e) {
      rethrow;
    }
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
  Future<int> createNote({required String? content, required Uint8List? media}) async {
    try {
      final noteId = await database.into(database.noteTable).insert(
            NoteTableCompanion.insert(
              content: Value.absentIfNull(content),
              media: Value.absentIfNull(media),
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
  Future<int> updateNote({
    required int noteId,
    required String? content,
    required Uint8List? media,
  }) async {
    try {
      final newNoteId = await (database.update(database.noteTable)..where((q) => q.id.equals(noteId))).write(
        NoteTableCompanion(
          content: Value.absentIfNull(content),
          media: Value.absentIfNull(media),
          modifiedAt: Value(DateTime.now()),
        ),
      );

      return newNoteId;
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
          innerJoin(
              database.collectionNoteRefTable,
              database.collectionNoteRefTable.noteId.equalsExp(database.noteTable.id) &
                  database.collectionNoteRefTable.collectionId.equals(collectionId)),
        ],
      )
      ..orderBy([
        (u) => OrderingTerm(expression: database.noteTable.modifiedAt, mode: OrderingMode.desc),
      ]);

    final notes = (await query.get()).map((e) => e.toDomain()).toList();
    return notes;
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId) {
    final query = database.select(database.collectionNoteRefTable).join(
      [
        innerJoin(database.noteTable, database.noteTable.id.equalsExp(database.collectionNoteRefTable.noteId)),
      ],
    )
      ..where(database.collectionNoteRefTable.collectionId.equals(collectionId))
      ..orderBy([
        OrderingTerm(expression: database.noteTable.modifiedAt, mode: OrderingMode.desc),
      ]);

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
          innerJoin(
              database.collectionNoteRefTable, database.collectionNoteRefTable.noteId.equalsExp(database.noteTable.id)),
        ],
      )
      ..where((q) => database.collectionNoteRefTable.collectionId.isIn(collectionIds));

    final notes = (await query.get()).map((e) => e.toDomain()).toList();
    return notes;
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds) {
    final query = database.select(database.noteTable)
      ..join(
        [
          innerJoin(
              database.collectionNoteRefTable, database.collectionNoteRefTable.noteId.equalsExp(database.noteTable.id)),
        ],
      )
      ..where((q) => database.collectionNoteRefTable.collectionId.isIn(collectionIds));

    final notes = query.watch().map((e) => e.map((e1) => e1.toDomain()).toList());
    return notes;
  }
}
