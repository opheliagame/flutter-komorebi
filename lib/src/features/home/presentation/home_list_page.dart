import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_grid.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_row.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeListPage extends ConsumerWidget {
  const HomeListPage({super.key, this.collection});

  final Collection? collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection?.name ?? 'Komorebi'),
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
            if (collection != null)
              SizedBox(
                height: 120,
                child: RelatedCollectionsRow(collection: collection!),
              )
            else
              SizedBox(
                height: 240,
                child: CollectionsGrid(collectionId: collection?.id),
              ),
            Flexible(
              flex: 1,
              child: NotesGrid(
                collectionId: collection?.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
