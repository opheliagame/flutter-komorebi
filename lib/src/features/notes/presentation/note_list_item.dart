import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/core/extensions/datetime.dart';

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
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  dateFormatter.format(note.modifiedAt),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            if (note.content != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  note.content!,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
          ],
        ),
      ),
    );
  }
}
