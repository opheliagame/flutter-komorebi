import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/similar_collections_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/connection/data/drift_connection_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ConnectionRepository {
  Future<bool> addNoteToCollection({required int noteId, required int collectionId});
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds});
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId});
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds});

  Future<List<CollectionEntity>> getSimilarCollectionsAsList({
    required int collectionId,
    required int limit,
    required int offset,
  });
  Stream<List<CollectionEntity>> watchSimilarCollectionsAsList(int collectionId);

  Future<SimilarCollectionsEntity> getSimilarCollections({
    required int collectionId,
    required int limit,
    required int offset,
  });
  Stream<SimilarCollectionsEntity> watchSimilarCollections(int collectionId);

  Future<List<SimilarCollectionsEntity>> getRecentSimilarCollections();
  Future<List<SimilarCollectionsEntity>> watchRecentSimilarCollections();
}

final connectionRepositoryProvider = Provider<ConnectionRepository>((ref) {
  return DriftConnectionRepositoryImpl(ref.read(appDatabaseProvider));
});

final recentSimilarCollectionsListFutureProvider = FutureProvider((ref) {
  final repository = ref.read(connectionRepositoryProvider);
  return repository.getRecentSimilarCollections();
});
