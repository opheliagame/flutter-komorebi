import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NoteListPage extends ConsumerWidget {
  const NoteListPage({super.key, this.collection});

  final Collection? collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection?.name ?? S.of(context)?.app_name ?? ''),
      ),
      body: Column(
        children: [
          Text(collection?.name ?? 'root collection'),
          Expanded(
            child: NotesList(
              collectionId: collection?.id,
            ),
          ),
        ],
      ),
    );
  }
}
