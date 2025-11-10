import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_text_button.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NoteDetailPage extends HookConsumerWidget {
  const NoteDetailPage({super.key, required this.noteId});

  final int noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteStreamValue = ref.watch(noteStreamProvider(noteId));

    return Scaffold(
      appBar: AppBar(
        title: Text('note detail page'),
      ),
      body: SingleChildScrollView(
        // child: Text('kjka'),
        child: AsyncValueWidget(
          value: noteStreamValue,
          data: (note) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('note content'),
                Text(note.content.toString()),

                // connected collections area
                SizedBox(height: 8),
                AsyncValueWidget(
                  value: ref.watch(collectionsOfSingleNoteStreamProvider(noteId)),
                  data: (collections) {
                    return Column(
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
              ],
            );
          },
        ),
      ),
    );
  }
}
