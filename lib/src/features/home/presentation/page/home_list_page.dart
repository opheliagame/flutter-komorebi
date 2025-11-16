import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/more_options_action_button.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_row.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeListPage extends ConsumerWidget {
  const HomeListPage({super.key, this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionFutureValue = ref.watch(collectionSingleFutureProvider(collectionId ?? ROOT_COLLECTION_ID));

    return Scaffold(
      appBar: AppBar(title: Text(collectionFutureValue.valueOrNull?.name ?? 'home list page'), actions: [
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
