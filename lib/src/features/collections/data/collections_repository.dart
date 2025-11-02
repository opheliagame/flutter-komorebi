import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/drift_collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/current_collection_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CollectionsRepository {
  Future<List<Collection>> getRootCollections();
  Stream<List<Collection>> watchRootCollections();
  Future<List<Collection>> getSubCollections(int collectionId);
  Future<bool> createCollection(String collectionName);
  Future<bool> deleteCollection(int collectionId);
}

// TODO switch this based on env variable
final collectionsRepositoryProvider = Provider<CollectionsRepository>((ref) {
  return DriftCollectionsRepository();
});

final collectionsListFutureProvider = FutureProvider.autoDispose<List<Collection>>((ref) async {
  final currentCollectionId = ref.watch(currentCollectionIdProvider);
  final repository = ref.watch(collectionsRepositoryProvider);

  return currentCollectionId == null
      ? repository.getRootCollections()
      : repository.getSubCollections(currentCollectionId);
});

final collectionsListStreamProvider = StreamProvider<List<Collection>>((ref) {
  final repository = ref.watch(collectionsRepositoryProvider);
  return repository.watchRootCollections();
});
