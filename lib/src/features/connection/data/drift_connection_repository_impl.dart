import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';

class DriftConnectionRepositoryImpl implements ConnectionRepository {
  final AppDatabase database;

  DriftConnectionRepositoryImpl(this.database);

  @override
  Future<bool> addNoteToCollection({required int noteId, required int collectionId}) async {
    final query = database
        .into(database.collectionNoteTable)
        .insert(CollectionNoteTableCompanion.insert(noteId: noteId, collectionId: collectionId));

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
          database.collectionNoteTable,
          List.from(collectionIds).map(
            (collectionId) => CollectionNoteTableCompanion.insert(noteId: noteId, collectionId: collectionId),
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
    final query = database.delete(database.collectionNoteTable)
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
          database.collectionNoteTable,
          (q) => q.noteId.equals(noteId) & q.collectionId.isIn(collectionIds),
        );
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
