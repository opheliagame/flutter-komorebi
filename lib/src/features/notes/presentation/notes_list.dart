import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/note_list_item.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/note_tile.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesList extends ConsumerWidget {
  const NotesList({super.key, required this.collectionId, this.zoomLevel = ZoomLevelType.medium});

  final int collectionId;
  final ZoomLevelType zoomLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesListValue = ref.watch(notesListStreamProvider((collectionId)));

    return AsyncValueWidget(
      value: notesListValue,
      data: (notes) {
        if (notes.isEmpty) {
          return Center(child: Text('you havent collected any notes here'));
        } else if (zoomLevel == ZoomLevelType.large) {
          return ListView.separated(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];

              return NoteListItem(
                note: note,
                onTap: () {
                  context.pushRoute(NoteDetailRoute(noteId: note.id));
                },
              );
            },
            separatorBuilder: (_, index) {
              return Divider();
            },
          );
        } else if (zoomLevel == ZoomLevelType.medium) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            children: [
              ...notes.map(
                (note) => NoteTile(
                  note: note,
                  onTap: () {
                    context.pushRoute(NoteDetailRoute(noteId: note.id));
                  },
                ),
              ),
            ],
          );
        } else {
          return GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            children: [
              ...notes.map(
                (note) => NoteTile(
                  note: note,
                  onTap: () {
                    context.pushRoute(NoteDetailRoute(noteId: note.id));
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
