import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteTile extends ConsumerWidget {
  const NoteTile({
    super.key,
    required this.note,
    required this.onTap,
  });

  final NoteEntity note;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Stack(
          children: [
            if (note.content != null)
              Center(
                child: Text(
                  note.randomWord!,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
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
      ),
    );
  }
}
