import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_text_button.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/more_options_action_button.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';
import 'package:flutter_komorebi/src/features/history/presentation/widget/history_item_list_tile.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NoteDetailPage extends HookConsumerWidget {
  const NoteDetailPage({super.key, required this.noteId});

  final int noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteStreamValue = ref.watch(noteStreamProvider(noteId));
    final historyListStreamValue = ref.watch(historyListStreamProvider(noteId));

    return Scaffold(
      appBar: AppBar(
        title: Text('note detail page'),
        actions: [
          MoreOptionsActionButton(
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Note'),
                onTap: () {
                  context.pop();
                  context.pushRoute(CreateRoute(entityType: EntityType.note, noteId: noteId));
                },
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: AsyncValueWidget(
          value: noteStreamValue,
          data: (note) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NoteListItem(note: note, onTap: () {}),

                  // connected collections area
                  SizedBox(height: 8),
                  AsyncValueWidget(
                    value: ref.watch(collectionsOfSingleNoteStreamProvider(noteId)),
                    data: (collections) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('found in ${collections.length.toString()} collections'),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: collections
                                .map((e) => CollectionTextButton(collectionId: e.id, collectionName: e.name))
                                .toList(),
                          ),
                        ],
                      );
                    },
                  ),

                  // history
                  SizedBox(height: 8),
                  Flexible(
                    child: AsyncValueWidget(
                      value: historyListStreamValue,
                      data: (historyItems) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: historyItems.map((historyItem) {
                            return HistoryItemListTile(historyItem: historyItem);
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
