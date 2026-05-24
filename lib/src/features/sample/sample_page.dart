import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/database_backup_service.dart';
import 'package:flutter_komorebi/src/data/drift/database_extension.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SamplePage extends HookConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionIds = ref.watch(allCollectionIdsProvider);
    final noteIds = ref.watch(allNoteIdsProvider);

    final notesZoom = useState(ZoomLevelType.medium);

    // var temp = NotesList(
    //   zoomLevel: notesZoom.value,
    //   // FIXME collectionId as constant 0 will fail
    //   collectionId: 0,
    // );

    useEffect(() {
      notesZoom.addListener(() {
        // temp = NotesList(
        //   // FIXME collectionId as constant 0 will fail
        //   collectionId: 0,
        //   zoomLevel: notesZoom.value,
        // );
      });

      return () {};
    }, []);

    final buttonData = [
      _SamplePageTextButton(
        route: (_) => HomeRoute(),
        name: 'Home Page',
      ),
      _SamplePageTextButton(
        route: (_) => CollectionListRoute(
          // FIXME collectionId as constant 0 will fail
          collectionId: 0,
        ),
        name: 'collection list page',
      ),
      _SamplePageTextButton(
        route: (_) => CollectionsListRoute(),
        name: 'all collections',
      ),
      _SamplePageTextButton(
        route: (_) => NoteListRoute(
          // FIXME collectionId as constant 0 will fail
          collectionId: 0,
        ),
        name: 'notes list page',
      ),
      _SamplePageTextButton(
        route: (_) => CreateRoute(entityType: EntityType.note),
        name: 'create note page',
      ),
      _SamplePageTextButton<int>(
        route: (id) => NoteDetailRoute(noteId: id ?? 0),
        name: 'note detail page',
        options: noteIds,
      ),
      _SamplePageTextButton<int>(
        route: (value) => CreateRoute(
          entityType: EntityType.note,
          noteId: value,
        ),
        name: 'update note page',
        options: noteIds,
      ),
      _SamplePageTextButton(
        route: (_) => CreateRoute(entityType: EntityType.collection),
        name: 'create collection page',
      ),
      _SamplePageTextButton<int>(
        route: (value) => CreateRoute(
          entityType: EntityType.collection,
          collectionId: value,
        ),
        name: 'update collection page',
        options: collectionIds,
      ),
      _SamplePageTextButton(
        route: (_) => SearchRoute(),
        name: 'search page',
      ),
      _SamplePageTextButton(
        route: (_) => RoamRoute(),
        name: 'roam page',
      ),
      _SamplePageTextButton(
        route: (_) => HistoryListRoute(),
        name: 'history list page',
      ),
      _SamplePageTextButton(
        route: (_) => ImageClipboardSampleRoute(isDebug: true),
        name: 'image clipboard sample page',
      ),
      _SamplePageTextButton(
        route: (_) => GridScaleTestRoute(isCollectionGrid: true),
        name: 'collection grid scale test route',
      ),
      _SamplePageTextButton(
        route: (value) => GridScaleTestRoute(
          isCollectionGrid: false,
          collectionId: value,
        ),
        name: 'notes list scale test route',
        options: collectionIds,
      ),
      _SamplePageTextButton(
        route: (_) => ConnectionDiagramRoute(),
        name: 'connection diagram page',
      ),
      _SamplePageTextButton(
        route: (_) => RecentsRoute(),
        name: 'recents page',
      ),
    ];

    final searchTextEditingController = useTextEditingController();

    final buttons = useState(buttonData);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)?.app_name ?? ''),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            _BackupSection(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(hintText: 'filter sample pages'),
                onChanged: (value) {
                  final filteredbuttons = buttonData.where((e) => e.name.toLowerCase().contains(value)).toList();
                  buttons.value = filteredbuttons;
                },
              ),
            ),
            ...buttons.value,
          ],
        ),
      ),
    );
  }
}

class _BackupSection extends ConsumerWidget {
  const _BackupSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () => ref.read(databaseBackupServiceProvider).exportDatabase(context),
          icon: const Icon(Icons.upload),
          label: const Text('export db'),
        ),
        const SizedBox(width: 8),
        TextButton.icon(
          onPressed: () => ref.read(databaseBackupServiceProvider).importDatabase(context),
          icon: const Icon(Icons.download),
          label: const Text('import db'),
        ),
        const SizedBox(width: 8),
        TextButton.icon(
          onPressed: () => ref.read(databaseBackupServiceProvider).loadSampleDatabase(context),
          icon: const Icon(Icons.dataset),
          label: const Text('load sample db'),
        ),
        const SizedBox(width: 8),
        TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('clear all data?'),
                content: const Text('This will permanently delete all collections, notes, and connections.'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('cancel')),
                  TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('clear')),
                ],
              ),
            );
            if (confirmed == true && context.mounted) {
              await ref.read(appDatabaseProvider).clearAllData();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('database cleared')),
                );
              }
            }
          },
          icon: const Icon(Icons.delete_forever),
          label: const Text('clear db'),
        ),
      ],
    );
  }
}

class _SamplePageTextButton<T extends Object> extends HookWidget {
  const _SamplePageTextButton({
    required this.route,
    required this.name,
    this.options,
    this.onSelectOption,
  });

  final PageRouteInfo<Object?> Function(T?) route;
  final String name;
  final AsyncValue<Iterable<T>>? options;
  // TODO(refactor): deprecated?
  final Function(T)? onSelectOption;

  @override
  Widget build(BuildContext context) {
    final selection = useState<T?>(null);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.pushRoute(route(selection.value));
          },
          child: Text(name),
        ),
        SizedBox(width: 4),

        // option selection
        if (options != null)
          Expanded(
            child: AsyncValueWidget(
              value: options!,
              data: (options) {
                return Autocomplete<T>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return options.where(
                      (e) => e.toString().toLowerCase().contains(textEditingValue.text.toLowerCase()),
                    );
                  },
                  onSelected: (T option) {
                    selection.value = option;
                    onSelectOption?.call(option);
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
