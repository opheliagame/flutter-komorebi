import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/design_system/app_color.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_text_button.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryItemListTile extends ConsumerWidget {
  const HistoryItemListTile({super.key, required this.historyItem});

  final HistoryExpandedEntity historyItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todo(design): add on click event to navigate to specific pages
    return Container(
      color: historyItem.tileBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // history type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('history type'),
              Text(historyItem.historyType.name),
            ],
          ),

          // history contents
          if (historyItem.hasCollection)
            CollectionTextButton(
              collectionId: historyItem.collectionEntity!.id,
              collectionName: historyItem.collectionEntity!.name,
            ),
          if (historyItem.hasNote) NoteListItem(note: historyItem.noteEntity!, onTap: () {}),
        ],
      ),
    );
  }
}
