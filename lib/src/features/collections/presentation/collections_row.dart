import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_tile.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatedCollectionsRow extends ConsumerWidget {
  const RelatedCollectionsRow({super.key, required this.collectionId});

  final int collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = ref.watch(relatedCollectionsListStreamProvider(collectionId));

    return AsyncValueWidget(
      value: collectionsListValue,
      data: (collections) {
        return Row(
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final relatedCollection = collections[index];
                  return CollectionTile(
                    collection: relatedCollection,
                    onTap: () {
                      context.replaceRoute(CollectionListRoute(collectionId: relatedCollection.id));
                    },
                  );
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
