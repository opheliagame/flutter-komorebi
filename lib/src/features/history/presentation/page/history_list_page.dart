import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_text_button.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HistoryListPage extends HookConsumerWidget {
  const HistoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyItemsStream = ref.watch(historyListStreamProvider);
    final filteredHistoryItems = useState<List<HistoryExpandedEntity>>(List.empty());
    final filterDropdownValue = useState<HistoryType?>(null);

    useEffect(() {
      filteredHistoryItems.value = historyItemsStream.value ?? [];

      return () {};
    }, [historyItemsStream]);

    return Scaffold(
      appBar: AppBar(
        title: Text('history list page'),
      ),
      body: AsyncValueWidget(
        value: historyItemsStream,
        data: (historyItems) {
          return Column(
            children: [
              DropdownButton(
                value: filterDropdownValue.value,
                items: [
                  DropdownMenuItem(
                    value: null,
                    child: Text('all'),
                  ),
                  ...HistoryType.values.map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                ].toList(),
                onChanged: (value) {
                  filterDropdownValue.value = value;
                  if (value == null) {
                    filteredHistoryItems.value = historyItems;
                  } else {
                    filteredHistoryItems.value = historyItems.where((e) => e.historyType == value).toList();
                  }
                },
              ),

              // history
              Expanded(
                child: ListView.separated(
                  itemCount: filteredHistoryItems.value.length,
                  itemBuilder: (context, index) {
                    final historyItem = filteredHistoryItems.value[index];

                    return Column(
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
                    );
                  },
                  separatorBuilder: (_, index) {
                    return SizedBox(height: 4);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
