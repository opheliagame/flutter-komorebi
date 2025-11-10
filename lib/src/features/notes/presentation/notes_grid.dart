import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/note_tile.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesGrid extends ConsumerWidget {
  const NotesGrid({super.key, this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesListValue = ref.watch(notesListStreamProvider(collectionId ?? ROOT_COLLECTION_ID));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncValueWidget(
        value: notesListValue,
        data: (notes) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ...notes.map(
                (note) => NoteTile(
                  note: note,
                  onTap: () {
                    context.pushRoute(CreateRoute(entityType: EntityType.note));
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
