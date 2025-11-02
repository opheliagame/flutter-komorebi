import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';

class DriftCollectionsRepository implements CollectionsRepository {
  final database = AppDatabase();

  @override
  Future<List<Collection>> getRootCollections() async {
    final query = database.select(database.collections)..where((q) => q.parentId.isNotNull());
    List<Collection> collections = await query.get();
    return collections;
  }

  @override
  Stream<List<Collection>> watchRootCollections() {
    final query = database.select(database.collections)..where((q) => q.parentId.isNull());
    return query.watch();
  }

  @override
  Future<List<Collection>> getSubCollections(int collectionId) async {
    final query = database.select(database.collections)..where((q) => q.parentId.equals(collectionId));
    List<Collection> collections = await query.get();
    return collections;
  }

  @override
  Stream<List<Collection>> watchSubCollections(int collectionId) {
    final query = database.select(database.collections)..where((q) => q.parentId.equals(collectionId));
    return query.watch();
  }

  @override
  Future<bool> createCollection(String collectionName, int? collectionId) async {
    final query = database.into(database.collections).insert(
          CollectionsCompanion.insert(
            name: collectionName,
            description: "",
            parentId: Value.absentIfNull(collectionId),
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
          ),
        );
    try {
      await query;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteCollection(int collectionId) async {
    final query = database.delete(database.collections)..where((q) => q.id.equals(collectionId));
    try {
      await query.go();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAllCollections() async {
    try {
      await database.transaction(() async {
        for (final table in database.allTables) {
          await database.delete(table).go();
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
