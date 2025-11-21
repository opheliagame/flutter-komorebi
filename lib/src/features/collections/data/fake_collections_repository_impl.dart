import 'dart:typed_data';

import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeCollectionsRepository implements CollectionsRepository {
  @override
  Future<bool> deleteAllCollections() {
    // TODO: implement deleteAllCollections
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCollection(int collectionId) {
    // TODO: implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionEntity>> getCollectionsOfNote(int noteId) {
    // TODO: implement getCollectionsOfNote
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionEntity>> getAllCollections() {
    // TODO: implement getRootCollections
    throw UnimplementedError();
  }

  @override
  Stream<List<CollectionEntity>> watchCollectionsOfNote(int noteId) {
    // TODO: implement watchCollectionsOfNote
    throw UnimplementedError();
  }

  @override
  Stream<List<CollectionEntity>> watchAllCollections() {
    // TODO: implement watchRootCollections
    throw UnimplementedError();
  }

  @override
  Future<CollectionEntity> getCollection(int collectionId) {
    // TODO: implement getCollection
    throw UnimplementedError();
  }

  @override
  Future<bool> createCollection(
      {required String collectionName, required String? description, required Uint8List? media}) {
    // TODO: implement createCollection
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCollection(
      {required int collectionId,
      required String collectionName,
      required String? description,
      required Uint8List? media}) {
    // TODO: implement updateCollection
    throw UnimplementedError();
  }
}

final fakeCollectionsRepositoryProvider = Provider<FakeCollectionsRepository>((ref) {
  return FakeCollectionsRepository();
});
