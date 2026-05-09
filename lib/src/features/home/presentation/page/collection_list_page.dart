import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/more_options_action_button.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_row.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CollectionListPage extends ConsumerWidget {
  const CollectionListPage({super.key, required this.collectionId});

  final int collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionFutureValue = ref.watch(collectionSingleStreamProvider(collectionId));

    return Scaffold(
      appBar: AppBar(
          title: Text(
            '${collectionFutureValue.value?.name} ${collectionFutureValue.value?.id}',
          ),
          actions: [
            MoreOptionsActionButton(
              children: [
                ListTile(
                  title: Text('new collection'),
                  onTap: () {
                    context.pop();
                    context.pushRoute(CreateRoute(entityType: EntityType.collection));
                  },
                ),
                ListTile(
                  title: Text('new note'),
                  onTap: () {
                    context.pop();
                    context.pushRoute(CreateRoute(entityType: EntityType.note));
                  },
                )
              ],
            )
          ]),
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
    );
  }
}
