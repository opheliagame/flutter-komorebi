import 'dart:typed_data';

import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/drift_collections_repository_impl.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CollectionsRepository {
  // crud operations
  Future<List<CollectionEntity>> getRootCollections();
  Stream<List<CollectionEntity>> watchRootCollections();
  Future<CollectionEntity> getCollection(int collectionId);

  Future<bool> createCollection({
    required String collectionName,
    required String? description,
    required Uint8List? media,
  });
  Future<bool> updateCollection({
    required int collectionId,
    required String collectionName,
    required String? description,
    required Uint8List? media,
  });
  Future<bool> deleteCollection(int collectionId);
  Future<bool> deleteAllCollections();

  // notes related operations
  Future<List<CollectionEntity>> getCollectionsOfNote(int noteId);
  Stream<List<CollectionEntity>> watchCollectionsOfNote(int noteId);
}

// TODO switch this based on env variable
final collectionsRepositoryProvider = Provider<CollectionsRepository>((ref) {
  return DriftCollectionsRepository(ref.read(appDatabaseProvider));
});

final collectionsListFutureProvider =
    FutureProvider.family.autoDispose<List<CollectionEntity>, int>((ref, currentCollectionId) async {
  final repository = ref.watch(collectionsRepositoryProvider);
  final connectionsRepository = ref.watch(connectionRepositoryProvider);

  return currentCollectionId == ROOT_COLLECTION_ID
      ? repository.getRootCollections()
      : connectionsRepository.getRelatedCollections(currentCollectionId);
});

final collectionsListStreamProvider = StreamProvider.family<List<CollectionEntity>, int>((ref, currentCollectionId) {
  final repository = ref.watch(collectionsRepositoryProvider);
  final connectionsRepository = ref.watch(connectionRepositoryProvider);

  return currentCollectionId == ROOT_COLLECTION_ID
      ? repository.watchRootCollections()
      : connectionsRepository.watchRelatedCollections(currentCollectionId);
});

final collectionSingleFutureProvider = FutureProvider.family.autoDispose<CollectionEntity, int>((ref, id) {
  final repository = ref.watch(collectionsRepositoryProvider);

  return repository.getCollection(id);
});

final allCollectionIdsProvider = StreamProvider<Iterable<int>>((ref) {
  final repository = ref.read(collectionsRepositoryProvider);

  final notes = repository.watchRootCollections();
  return notes.map((e) => e.map((e1) => e1.id));
});
