import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_tile.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/floating_sliver_app_bar.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/more_options_action_button.dart';
import 'package:flutter_komorebi/src/design_system/spacing.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';
import 'package:flutter_komorebi/src/features/history/presentation/widget/history_item_short_widget.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/note_list_item.dart';
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            FloatingSliverAppBar(
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
            SliverToBoxAdapter(
              child: AsyncValueWidget(
                value: noteStreamValue,
                data: (note) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NoteListItem(note: note, onTap: null),

                        // connected collections area
                        SizedBox(height: 8),
                        AsyncValueWidget(
                          value: ref.watch(collectionsOfSingleNoteStreamProvider(noteId)),
                          data: (collections) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: kHorizontalPadding,
                                  child: Text('found in ${collections.length.toString()} collections'),
                                ),
                                SizedBox(height: 8),
                                Wrap(
                                  runSpacing: 10,
                                  spacing: 10,
                                  children: collections
                                      .map(
                                        (e) => CollectionTile(
                                          collection: e,
                                          onTap: () {
                                            context.router.push(CollectionListRoute(collectionId: e.id));
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            );
                          },
                        ),

                        // history
                        SizedBox(height: 24),
                        Padding(
                          padding: kHorizontalPadding,
                          child: Text(
                            'Note history',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: kHorizontalPadding,
                          child: AsyncValueWidget(
                            value: historyListStreamValue,
                            data: (historyItems) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: historyItems.map((historyItem) {
                                  return HistoryItemShortWidget(historyItem: historyItem);
                                }).toList(),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 32),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
