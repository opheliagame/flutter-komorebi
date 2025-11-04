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
  Stream<Note> watchNote(int noteId) {
    final query = database.select(database.notes)..where((q) => q.id.equals(noteId));
    return query.watchSingle();
  }

  @override
  Future<bool> createNote({required String? content, required XFile? media, required int? collectionId}) async {
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

  @override
  Future<bool> deleteNote(int noteId) async {
    final query = (database.delete(database.notes)..where((q) => q.id.equals(noteId))).go();
    try {
      await query;
      return true;
    } catch (e) {
      return false;
    }
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
  Future<List<Note>> getNotesInCollectionList(List<int> collectionIds) {
    final query = database.select(database.notes)
      ..join(
        [
          innerJoin(database.collectionNotes, database.collectionNotes.noteId.equalsExp(database.notes.id)),
        ],
      )
      ..where((q) => database.collectionNotes.collectionId.isIn(collectionIds));

    final notes = query.get();
    return notes;
  }

  @override
  Stream<List<Note>> watchNotesInCollectionList(List<int> collectionIds) {
    final query = database.select(database.notes)
      ..join(
        [
          innerJoin(database.collectionNotes, database.collectionNotes.noteId.equalsExp(database.notes.id)),
        ],
      )
      ..where((q) => database.collectionNotes.collectionId.isIn(collectionIds));

    final notes = query.watch();
    return notes;
  }

  @override
  Future<bool> addNoteToCollection({required int noteId, required int collectionId}) async {
    final query = database
        .into(database.collectionNotes)
        .insert(CollectionNotesCompanion.insert(noteId: noteId, collectionId: collectionId));

    try {
      await query;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds}) async {
    try {
      await database.batch((batch) {
        batch.insertAll(
          database.collectionNotes,
          List.from(collectionIds).map(
            (collectionId) => CollectionNotesCompanion.insert(noteId: noteId, collectionId: collectionId),
          ),
        );
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId}) async {
    final query = database.delete(database.collectionNotes)
      ..where((q) => q.noteId.equals(noteId) & q.collectionId.equals(collectionId));
    try {
      await query.go();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds}) async {
    try {
      await database.batch((batch) {
        batch.deleteWhere(
          database.collectionNotes,
          (q) => q.noteId.equals(noteId) & q.collectionId.isIn(collectionIds),
        );
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
