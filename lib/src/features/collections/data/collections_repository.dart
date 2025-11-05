import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/drift_collections_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

abstract class CollectionsRepository {
  // crud operations
  Future<List<Collection>> getRootCollections();
  Stream<List<Collection>> watchRootCollections();
  Future<List<Collection>> getSubCollections(int collectionId);
  Stream<List<Collection>> watchSubCollections(int collectionId);
  Future<bool> createCollection(
      {required String? collectionName, required XFile? media, required int? parentCollectionId});
  Future<bool> deleteCollection(int collectionId);
  Future<bool> deleteAllCollections();

  // notes related operations
  Future<List<Collection>> getCollectionsOfNote(int noteId);
  Stream<List<Collection>> watchCollectionsOfNote(int noteId);
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
