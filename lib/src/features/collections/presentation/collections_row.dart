import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/common_widgets/collection_tile.dart';
import 'package:flutter_komorebi/src/common_widgets/new_collection_tile.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatedCollectionsRow extends ConsumerWidget {
  const RelatedCollectionsRow({super.key, required this.collection});

  final Collection? collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = ref.watch(collectionsListStreamProvider(collection?.id));

    return AsyncValueWidget(
      value: collectionsListValue,
      data: (collections) {
        return Row(
          children: [
            NewCollectionTile(collectionId: collection?.id),
            SizedBox(width: 8),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final relatedCollection = collections[index];
                  return CollectionTile(collection: relatedCollection);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
