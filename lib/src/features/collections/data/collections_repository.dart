import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/drift_collections_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

abstract class CollectionsRepository {
  // crud operations
  Future<List<CollectionEntity>> getRootCollections();
  Stream<List<CollectionEntity>> watchRootCollections();
  Future<List<CollectionEntity>> getSubCollections(int collectionId);
  Stream<List<CollectionEntity>> watchSubCollections(int collectionId);
  Future<bool> createCollection({
    required String collectionName,
    required String? description,
    required XFile? media,
    required int? parentCollectionId,
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
    FutureProvider.family.autoDispose<List<CollectionEntity>, int?>((ref, currentCollectionId) async {
  final repository = ref.watch(collectionsRepositoryProvider);

  return currentCollectionId == null
      ? repository.getRootCollections()
      : repository.getSubCollections(currentCollectionId);
});

final collectionsListStreamProvider = StreamProvider.family<List<CollectionEntity>, int?>((ref, currentCollectionId) {
  final repository = ref.watch(collectionsRepositoryProvider);

  return currentCollectionId == null
      ? repository.watchRootCollections()
      : repository.watchSubCollections(currentCollectionId);
});


// final collectionSingleStreamProvider = StreamProvider.family.autoDispose<CollectionEntity, int>((ref, id) {
//    final repository = ref.watch(collectionsRepositoryProvider);

//   return repository
// });