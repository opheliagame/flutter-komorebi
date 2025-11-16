import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryItemShortWidget extends ConsumerWidget {
  const HistoryItemShortWidget({super.key, required this.historyItem});

  final HistoryExpandedEntity historyItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (historyItem.historyType) {
      HistoryType.unidentified => SizedBox(),
      HistoryType.addNote => HistoryItemNoteWidget(historyItem: historyItem),
      HistoryType.updateNote => HistoryItemNoteWidget(
          historyItem: historyItem,
          isEdit: true,
        ),
      HistoryType.deleteNote => HistoryItemNoteWidget(
          historyItem: historyItem,
          isDelete: true,
        ),
      HistoryType.addCollection => HistoryItemCollectionWidget(historyItem: historyItem),
      HistoryType.updateCollection => HistoryItemCollectionWidget(
          historyItem: historyItem,
          isEdit: true,
        ),
      HistoryType.deleteCollection => HistoryItemCollectionWidget(
          historyItem: historyItem,
          isDelete: true,
        ),
      HistoryType.addConnection => HistoryItemConnectionWidget(historyItem: historyItem),
      HistoryType.removeConnection => HistoryItemConnectionWidget(
          historyItem: historyItem,
          isRemove: true,
        ),
    };
  }
}

class HistoryItemCollectionWidget extends StatelessWidget {
  const HistoryItemCollectionWidget({
    super.key,
    required this.historyItem,
    this.isEdit = false,
    this.isDelete = false,
  });

  final HistoryExpandedEntity historyItem;
  final bool isEdit;
  final bool isDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          if (!isEdit && !isDelete)
            Expanded(child: Text('created collection on ${historyItem.collectionEntity?.createdAt.toString()}'))
          else if (isEdit)
            Expanded(child: Text('updated collection on ${historyItem.collectionEntity?.modifiedAt.toString()}'))
          else if (isDelete)
            Expanded(child: Text('deleted collection on ${historyItem.collectionEntity?.modifiedAt.toString()}'))
        ],
      ),
    );
  }
}

class HistoryItemNoteWidget extends StatelessWidget {
  const HistoryItemNoteWidget({
    super.key,
    required this.historyItem,
    this.isEdit = false,
    this.isDelete = false,
  });

  final HistoryExpandedEntity historyItem;
  final bool isEdit;
  final bool isDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          if (!isEdit && !isDelete)
            Expanded(child: Text('created note on ${historyItem.noteEntity?.createdAt.toString()}'))
          else if (isEdit)
            Expanded(child: Text('updated note on ${historyItem.noteEntity?.modifiedAt.toString()}'))
          else if (isDelete)
            Expanded(child: Text('deleted note on ${historyItem.noteEntity?.modifiedAt.toString()}')),
        ],
      ),
    );
  }
}

class HistoryItemConnectionWidget extends StatelessWidget {
  const HistoryItemConnectionWidget({
    super.key,
    required this.historyItem,
    this.isRemove = false,
  });

  final HistoryExpandedEntity historyItem;
  final bool isRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${isRemove ? 'removed' : 'addded'} connection to ${historyItem.collectionEntity?.name}',
            ),
          )
        ],
      ),
    );
  }
}
