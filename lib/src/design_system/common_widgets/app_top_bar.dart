import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTopBar extends ConsumerWidget implements PreferredSizeWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(S.of(context)?.app_name ?? ''),
      actions: [
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            ref.read(collectionsRepositoryProvider).deleteAllCollections().then((result) {
              // TODO(urgent): add routing package, pop to home page
            });
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
