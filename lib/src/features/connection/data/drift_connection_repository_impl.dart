import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/similar_collections_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';

class DriftConnectionRepositoryImpl implements ConnectionRepository {
  final AppDatabase database;

  DriftConnectionRepositoryImpl(this.database);

  @override
  Future<bool> addNoteToCollection({required int noteId, required int collectionId}) async {
    final query = database.into(database.collectionNoteRefTable).insert(CollectionNoteRefTableCompanion.insert(
          noteId: noteId,
          collectionId: collectionId,
          createdAt: DateTime.now(),
        ));

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
          database.collectionNoteRefTable,
          List.from(collectionIds).map(
            (collectionId) => CollectionNoteRefTableCompanion.insert(
              noteId: noteId,
              collectionId: collectionId,
              createdAt: DateTime.now(),
            ),
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
    final query = database.delete(database.collectionNoteRefTable)
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
          database.collectionNoteRefTable,
          (q) => q.noteId.equals(noteId) & q.collectionId.isIn(collectionIds),
        );
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  JoinedSelectStatement _getSimilarCollectionsQuery(int collectionId, {int? limit, int? offset}) {
    final cn1 = database.collectionNoteRefTable.createAlias('cn1');
    final cn2 = database.collectionNoteRefTable.createAlias('cn2');

    var query = database.select(database.collectionTable).join([
      innerJoin(
        cn1,
        cn1.collectionId.equalsExp(database.collectionTable.id),
      ),
      innerJoin(
        cn2,
        cn2.noteId.equalsExp(database.collectionNoteRefTable.noteId),
      ),
    ])
      ..where(cn2.collectionId.equals(collectionId))
      ..orderBy([OrderingTerm.desc(cn2.createdAt)])
      ..distinct;

    if (limit != null && offset != null) {
      query = query..limit(limit, offset: offset);
    }

    return query;
  }

  @override
  Future<List<CollectionEntity>> getSimilarCollectionsAsList({
    required int collectionId,
    required int limit,
    required int offset,
  }) async {
    final query = _getSimilarCollectionsQuery(collectionId, limit: limit, offset: offset);
    try {
      final result = await query.get();
      return result.map((rows) => rows.readTable(database.collectionTable).toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<CollectionEntity>> watchSimilarCollectionsAsList(int collectionId) {
    final list = _getSimilarCollectionsQuery(collectionId).watch().map(
          (rows) => rows.map((row) => row.readTable(database.collectionTable).toDomain()).toSet().toList(),
        );

    return list;
  }

  @override
  Future<List<SimilarCollectionsEntity>> getRecentSimilarCollections() async {
    // use 5 as default limit for now
    final limit = 5;

    final query = database.select(database.collectionTable).join(
      [
        innerJoin(database.collectionNoteRefTable,
            database.collectionTable.id.equalsExp(database.collectionNoteRefTable.collectionId)),
      ],
    )
      ..limit(limit)
      ..orderBy([OrderingTerm.desc(database.collectionNoteRefTable.createdAt)])
      ..distinct;

    try {
      final result = await query.get();

      List<SimilarCollectionsEntity> similarCollections = [];

      final recentUpdatedCollections = result.map((e) => e.readTable(database.collectionTable).toDomain());
      for (final collection in recentUpdatedCollections) {
        final result = await getSimilarCollectionsAsList(collectionId: collection.id, limit: limit, offset: 0);
        similarCollections.add(SimilarCollectionsEntity(collection: collection, similarCollections: result));
      }

      return similarCollections;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SimilarCollectionsEntity> getSimilarCollections({
    required int collectionId,
    required int limit,
    required int offset,
  }) {
    // TODO: implement getSimilarCollections
    throw UnimplementedError();
  }

  @override
  Future<List<SimilarCollectionsEntity>> watchRecentSimilarCollections() {
    // TODO: implement watchRecentSimilarCollections
    throw UnimplementedError();
  }

  @override
  Stream<SimilarCollectionsEntity> watchSimilarCollections(int collectionId) {
    // TODO: implement watchSimilarCollections
    throw UnimplementedError();
  }
}
