import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_tile.dart';
import 'package:flutter_komorebi/src/design_system/collection/new_collection_tile.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsGrid extends ConsumerWidget {
  const CollectionsGrid({super.key, this.collectionId, this.zoomLevel = ZoomLevelType.small});

  final ZoomLevelType zoomLevel;
  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = collectionId != null
        ? ref.watch(relatedCollectionsListStreamProvider(collectionId!))
        : ref.watch(collectionsListStreamProvider);
    final crossAxisCount = switch (zoomLevel) {
      ZoomLevelType.small => 4,
      ZoomLevelType.medium => 3,
      ZoomLevelType.large => 2,
    };

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncValueWidget(
        value: collectionsListValue,
        data: (collections) {
          return GridView.count(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              NewCollectionTile(),
              ...collections.map(
                (collection) => CollectionTile(
                  collection: collection,
                  onTap: () {
                    context.replaceRoute(CollectionListRoute(collectionId: collection.id));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
