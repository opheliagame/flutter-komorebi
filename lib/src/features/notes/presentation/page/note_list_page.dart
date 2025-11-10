import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NoteListPage extends ConsumerWidget {
  const NoteListPage({super.key, this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('note list page'),
      ),
      body: Column(
        children: [
          Text('note list'),
          Expanded(
            child: NotesList(
              collectionId: collectionId,
            ),
          ),
        ],
      ),
    );
  }
}
