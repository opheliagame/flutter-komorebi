import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';

class DriftCollectionsRepository implements CollectionsRepository {
  DriftCollectionsRepository(this.database);

  final AppDatabase database;

  @override
  Future<List<CollectionEntity>> getAllCollections() async {
    final query = database.select(database.collectionTable)
      ..orderBy(
        [(u) => OrderingTerm(expression: database.collectionTable.modifiedAt, mode: OrderingMode.desc)],
      );
    final collections = (await query.get()).map((e) => e.toDomain()).toList();
    return collections;
  }

  @override
  Stream<List<CollectionEntity>> watchAllCollections() {
    final query = database.select(database.collectionTable)
      ..orderBy(
        [(u) => OrderingTerm(expression: database.collectionTable.modifiedAt, mode: OrderingMode.desc)],
      );
    return query.watch().map((e) => e.map((e1) => e1.toDomain()).toList());
  }

  @override
  Future<CollectionEntity> getCollection(int collectionId) async {
    final query = database.select(database.collectionTable)..where((q) => q.id.equals(collectionId));

    return (await query.getSingle()).toDomain();
  }

  @override
  Future<bool> createCollection({
    required String collectionName,
    required String? description,
    required Uint8List? media,
  }) async {
    final query = database.into(database.collectionTable).insert(
          CollectionTableCompanion.insert(
            name: collectionName,
            description: Value.absentIfNull(description),
            media: Value.absentIfNull(media),
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
          ),
        );

    try {
      await query;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateCollection({
    required int collectionId,
    required String collectionName,
    required String? description,
    required Uint8List? media,
  }) async {
    final query = (database.update(database.collectionTable)..where((q) => q.id.equals(collectionId))).write(
      CollectionTableCompanion(
        name: Value(collectionName),
        description: Value.absentIfNull(description),
        media: Value.absentIfNull(media),
        modifiedAt: Value(DateTime.now()),
      ),
    );

    try {
      await query;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteCollection(int collectionId) async {
    final query = database.delete(database.collectionTable)..where((q) => q.id.equals(collectionId));
    try {
      await query.go();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteAllCollections() async {
    try {
      await database.batch((batch) {
        batch.deleteWhere(database.collectionNoteRefTable, (_) => const Constant(true));
        batch.deleteWhere(database.noteTable, (_) => const Constant(true));
        batch.deleteWhere(database.collectionTable, (_) => const Constant(true));
        batch.deleteWhere(database.noteCitationTable, (_) => const Constant(true));
        batch.deleteWhere(database.collectionMediaTable, (_) => const Constant(true));
      });

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<List<CollectionEntity>> getCollectionsOfNote(int noteId) async {
    final query = database.select(database.collectionTable).join([
      innerJoin(
          database.collectionNoteRefTable,
          database.collectionNoteRefTable.collectionId.equalsExp(database.collectionTable.id) &
              database.collectionNoteRefTable.noteId.equals(noteId)),
    ])
      ..distinct;

    final collections = (await query.get()).map((e) => e.readTable(database.collectionTable).toDomain()).toList();
    return collections;
  }

  @override
  Stream<List<CollectionEntity>> watchCollectionsOfNote(int noteId) {
    final query = database.select(database.collectionTable).join([
      innerJoin(
          database.collectionNoteRefTable,
          database.collectionNoteRefTable.collectionId.equalsExp(database.collectionTable.id) &
              database.collectionNoteRefTable.noteId.equals(noteId)),
    ])
      ..distinct;

    final collections = query.watch().map((rows) {
      return rows.map((e) => e.readTable(database.collectionTable).toDomain()).toList();
    });
    return collections;
  }
}
