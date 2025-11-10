import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/core/extensions/datetime.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesList extends ConsumerWidget {
  const NotesList({super.key, this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesListValue = ref.watch(notesListStreamProvider((collectionId ?? ROOT_COLLECTION_ID)));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncValueWidget(
        value: notesListValue,
        data: (notes) {
          if (notes.isEmpty) {
            return Center(child: Text('you havent collected any notes here'));
          }

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
        },
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (note.content != null)
              Text(
                note.content!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            if (note.media != null)
              Image.memory(
                note.media!,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Text('error fetching image');
                },
              ),
            Text(dateFormatter.format(note.modifiedAt)),
          ],
        ),
      ),
    );
  }
}
