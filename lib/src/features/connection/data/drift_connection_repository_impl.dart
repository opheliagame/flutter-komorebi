import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
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

  @override
  Future<List<CollectionEntity>> getRelatedCollections(int collectionId) async {
    final query = database.select(database.collectionTable)
      ..distinct
      ..join([
        innerJoin(database.relatedCollection, database.relatedCollection.id.equals(collectionId)),
      ]);

    try {
      final result = await query.get();
      return result.map((rows) => rows.toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<CollectionEntity>> watchRelatedCollections(int collectionId) {
    // id = collection id

    final cnAlias = database.collectionNoteTable.createAlias('cn1');

    final query = database.select(database.collectionTable).join([
      innerJoin(
        database.collectionNoteTable,
        database.collectionNoteTable.collectionId.equalsExp(database.collectionTable.id),
      ),
      innerJoin(
        database.collectionNoteTable.createAlias('cn2'),
        database.collectionNoteTable.createAlias('cn2').noteId.equalsExp(database.collectionNoteTable.noteId),
      ),
    ])
      ..where(database.collectionNoteTable.createAlias('cn2').collectionId.equals(collectionId))
      ..distinct;

    final list = query.watch().map(
          (rows) => rows.map((row) => row.readTable(database.collectionTable).toDomain()).toSet().toList(),
        );

    return list;

    // try {
    //   return query.watch().map(
    //         (rows) => rows.map((row) => row.toDomain()).toList(),
    //       );
    // } catch (e) {
    //   debugPrint(e.toString());
    //   rethrow;
    // }
  }
}
