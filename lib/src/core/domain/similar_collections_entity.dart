import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';

class SimilarCollectionsEntity {
  final CollectionEntity collection;
  final Iterable<CollectionEntity> similarCollections;

  SimilarCollectionsEntity({required this.collection, required this.similarCollections});
}
