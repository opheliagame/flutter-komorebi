import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CollectionsListPage extends ConsumerWidget {
  const CollectionsListPage({super.key, this.collection});

  final Collection? collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection?.name ?? "Komorebi"),
        // TODO(design): show image in app bar when collection does not have a name
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              ref.read(collectionsRepositoryProvider).deleteAllCollections().then((result) {
                // TODO(urgent): add routing package, pop to home page
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CollectionsGrid(
                collectionId: collection?.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
