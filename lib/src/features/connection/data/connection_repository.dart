import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/connection/data/drift_connection_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ConnectionRepository {
  Future<bool> addNoteToCollection({required int noteId, required int collectionId});
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds});
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId});
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds});

  Future<List<CollectionEntity>> getRelatedCollections(int collectionId);
  Stream<List<CollectionEntity>> watchRelatedCollections(int collectionId);
}

final connectionRepositoryProvider = Provider<ConnectionRepository>((ref) {
  return DriftConnectionRepositoryImpl(ref.read(appDatabaseProvider));
});
