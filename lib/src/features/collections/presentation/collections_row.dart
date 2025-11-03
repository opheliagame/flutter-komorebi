import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/common_widgets/collection_tile.dart';
import 'package:flutter_komorebi/src/common_widgets/new_collection_tile.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatedCollectionsRow extends ConsumerWidget {
  const RelatedCollectionsRow({super.key, required this.collection});

  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = ref.watch(collectionsListStreamProvider(collection.id));

    return AsyncValueWidget(
        value: collectionsListValue,
        data: (collections) {
          return Row(
            spacing: 10,
            children: [
              NewCollectionTile(collectionId: collection.id),
              ...collections.map((collection) {
                return CollectionTile(collection: collection);
              }),
            ],
          );
        });
  }
}
