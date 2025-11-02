import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeCollectionsRepository implements CollectionsRepository {
  @override
  Future<List<Collection>> getRootCollections() {
    return Future(() => []);
  }

  @override
  Stream<List<Collection>> watchRootCollections() {
    return Stream.empty();
  }

  @override
  Future<List<Collection>> getSubCollections(int collectionId) {
    return Future(() => []);
  }

  @override
  Future<bool> createCollection(String collectionName) {
    return Future(() => true);
  }

  @override
  Future<bool> deleteCollection(int collectionId) {
    return Future(() => true);
  }
}

final fakeCollectionsRepositoryProvider = Provider<FakeCollectionsRepository>((ref) {
  return FakeCollectionsRepository();
});
