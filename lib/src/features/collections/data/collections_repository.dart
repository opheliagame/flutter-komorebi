import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/drift_collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CollectionsRepository {
  Future<List<Collection>> getRootCollections();
  Stream<List<Collection>> watchRootCollections();
  Future<List<Collection>> getSubCollections(int collectionId);
  Stream<List<Collection>> watchSubCollections(int collectionId);
  Future<bool> createCollection(String collectionName, int? collectionId);
  Future<bool> deleteCollection(int collectionId);
  Future<bool> deleteAllCollections();
}

// TODO switch this based on env variable
final collectionsRepositoryProvider = Provider<CollectionsRepository>((ref) {
  return DriftCollectionsRepository();
});

final collectionsListFutureProvider =
    FutureProvider.family.autoDispose<List<Collection>, int?>((ref, currentCollectionId) async {
  final repository = ref.watch(collectionsRepositoryProvider);

  return currentCollectionId == null
      ? repository.getRootCollections()
      : repository.getSubCollections(currentCollectionId);
});

final collectionsListStreamProvider = StreamProvider.family<List<Collection>, int?>((ref, currentCollectionId) {
  final repository = ref.watch(collectionsRepositoryProvider);

  return currentCollectionId == null
      ? repository.watchRootCollections()
      : repository.watchSubCollections(currentCollectionId);
});
