import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/core/extensions/datetime.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesList extends ConsumerWidget {
  const NotesList({super.key, this.collectionId, this.zoomLevel = ZoomLevelType.medium});

  final int? collectionId;
  final ZoomLevelType zoomLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesListValue = ref.watch(notesListStreamProvider((collectionId ?? ROOT_COLLECTION_ID)));

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
                (note) => NoteTile(note: note),
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
                (note) => NoteTile(note: note),
              ),
            ],
          );
        }
      },
    );
  }
}

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.note,
  });

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(NoteDetailRoute(noteId: note.id));
      },
      child: Stack(
        children: [
          if (note.content != null) Center(child: Text(note.randomWord!)),
          Positioned.fill(
            child: note.media != null
                ? Image.memory(
                    note.media!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('error fetching image');
                    },
                  )
                : SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}

class NoteListItem extends StatelessWidget {
  const NoteListItem({
    super.key,
    required this.note,
    required this.onTap,
  });

  final NoteEntity note;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (note.content != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  note.content!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
            if (note.media != null) ...[
              Image.memory(
                note.media!,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Text('error fetching image');
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(dateFormatter.format(note.modifiedAt)),
            ),
          ],
        ),
      ),
    );
  }
}
