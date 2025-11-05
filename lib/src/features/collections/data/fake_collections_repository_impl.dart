import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
  Future<bool> createCollection(
      {required String? collectionName, required XFile? media, required int? parentCollectionId}) {
    return Future(() => true);
  }

  @override
  Future<bool> deleteCollection(int collectionId) {
    return Future(() => true);
  }

  @override
  Future<bool> deleteAllCollections() {
    // TODO: implement deleteAllCollections
    throw UnimplementedError();
  }

  @override
  Stream<List<Collection>> watchSubCollections(int collectionId) {
    // TODO: implement watchSubCollections
    throw UnimplementedError();
  }

  @override
  Future<List<Collection>> getCollectionsOfNote(int noteId) {
    // TODO: implement getCollectionsOfNote
    throw UnimplementedError();
  }

  @override
  Stream<List<Collection>> watchCollectionsOfNote(int noteId) {
    // TODO: implement watchCollectionsOfNote
    throw UnimplementedError();
  }
}

final fakeCollectionsRepositoryProvider = Provider<FakeCollectionsRepository>((ref) {
  return FakeCollectionsRepository();
});
