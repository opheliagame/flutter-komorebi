import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/common_widgets/collection_tile.dart';
import 'package:flutter_komorebi/src/common_widgets/new_collection_tile.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsGrid extends ConsumerWidget {
  const CollectionsGrid({super.key, required this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = ref.watch(collectionsListStreamProvider(collectionId));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncValueWidget(
        value: collectionsListValue,
        data: (collections) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              NewCollectionTile(collectionId: collectionId),
              ...collections.map(
                (collection) => CollectionTile(collection: collection),
              ),
            ],
          );
        },
      ),
    );
  }
}
