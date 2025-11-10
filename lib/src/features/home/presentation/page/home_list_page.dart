import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_row.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeListPage extends ConsumerWidget {
  const HomeListPage({super.key, this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionFutureValue = ref.watch(collectionSingleFutureProvider(collectionId ?? ROOT_COLLECTION_ID));

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionFutureValue.valueOrNull?.name ?? 'home list page'),
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
            SizedBox(
              height: 120,
              child: RelatedCollectionsRow(collectionId: collectionId),
            ),
            Flexible(
              flex: 1,
              child: NotesList(
                collectionId: collectionId,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
