import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:image_picker/image_picker.dart';

class DriftCollectionsRepository implements CollectionsRepository {
  DriftCollectionsRepository(this.database);

  final AppDatabase database;

  @override
  Future<List<CollectionEntity>> getRootCollections() async {
    final query = database.select(database.collectionTable)
      ..orderBy(
        [(u) => OrderingTerm(expression: database.collectionTable.modifiedAt, mode: OrderingMode.desc)],
      );
    final collections = (await query.get()).map((e) => e.toDomain()).toList();
    return collections;
  }

  @override
  Stream<List<CollectionEntity>> watchRootCollections() {
    final query = database.select(database.collectionTable)
      ..orderBy(
        [(u) => OrderingTerm(expression: database.collectionTable.modifiedAt, mode: OrderingMode.desc)],
      );
    return query.watch().map((e) => e.map((e1) => e1.toDomain()).toList());
  }

  // @override
  // Future<List<CollectionEntity>> getSubCollections(int collectionId) async {
  //   final query = database.select(database.collectionTable);
  //   final collections = (await query.get()).map((e) => e.toDomain()).toList();
  //   return collections;
  // }

  // @override
  // Stream<List<CollectionEntity>> watchSubCollections(int collectionId) {
  //   final query = database.select(database.collectionTable)..where((q) => q.parentId.equals(collectionId));
  //   return query.watch().map((e) => e.map((e1) => e1.toDomain()).toList());
  // }

  @override
  Future<bool> createCollection({
    required String collectionName,
    required String? description,
    required XFile? media,
  }) async {
    Uint8List? pickedMedia;
    if (media != null) {
      debugPrint('createCollection: saving ${media.name}');
      pickedMedia = await media.readAsBytes();
    }

    final query = database.into(database.collectionTable).insert(
          CollectionTableCompanion.insert(
            name: collectionName,
            description: Value.absentIfNull(description),
            media: Value.absentIfNull(pickedMedia),
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
        batch.deleteWhere(database.collectionNoteTable, (_) => const Constant(true));
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
          database.collectionNoteTable,
          database.collectionNoteTable.collectionId.equalsExp(database.collectionTable.id) &
              database.collectionNoteTable.noteId.equals(noteId)),
    ])
      ..distinct;

    final collections = (await query.get()).map((e) => e.readTable(database.collectionTable).toDomain()).toList();
    return collections;
  }

  @override
  Stream<List<CollectionEntity>> watchCollectionsOfNote(int noteId) {
    final query = database.select(database.collectionTable).join([
      innerJoin(
          database.collectionNoteTable,
          database.collectionNoteTable.collectionId.equalsExp(database.collectionTable.id) &
              database.collectionNoteTable.noteId.equals(noteId)),
    ])
      ..distinct;

    final collections = query.watch().map((rows) {
      return rows.map((e) => e.readTable(database.collectionTable).toDomain()).toList();
    });
    return collections;
  }
}
