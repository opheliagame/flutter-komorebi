import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
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

    final buttonData = [
      _SamplePageTextButton(
        route: (_) => HomeRoute(),
        name: 'Home Page',
      ),
      _SamplePageTextButton(
        route: (_) => HomeListRoute(),
        name: 'Home list page',
      ),
      _SamplePageTextButton(
        route: (_) => CollectionsListRoute(),
        name: 'collections list page',
      ),
      _SamplePageTextButton(
        route: (_) => NoteListRoute(),
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

            // technical tests
            TextButton(
              onPressed: () {
                // context.pushRoute();
              },
              child: Text('grid scale test page'),
            )
          ],
        ),
      ),
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
    print('debug: current options length ${options?.value?.length}');

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
