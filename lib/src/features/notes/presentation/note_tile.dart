import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteTile extends ConsumerWidget {
  const NoteTile({
    super.key,
    required this.note,
    required this.onTap,
  });

  final Note note;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellowAccent.shade100,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Stack(
          children: [
            if (note.content != null) Positioned.fill(child: Text(note.content!)),
            if (note.media != null)
              Positioned.fill(
                child: Image.memory(
                  note.media!,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
