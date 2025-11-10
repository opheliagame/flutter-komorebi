import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SamplePage extends HookConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // temp checking if this works
    // final collectionId = useState(null);
    // final noteIds = ref.watch(notesListStreamProvider(null)).map<Iterable<int>>(
    //       data: (d) => d.value.map((e) => e.id),
    //       error: (_) => Iterable<int>.empty(),
    //       loading: (_) => Iterable<int>.empty(),
    //     );
    final noteId = useState(0);

    final buttonData = [
      _SamplePageTextButton(
        route: HomeRoute(),
        name: 'Home Page',
      ),
      _SamplePageTextButton(
        route: HomeListRoute(),
        name: 'Home list page',
      ),
      _SamplePageTextButton(
        route: CollectionsListRoute(),
        name: 'collections list page',
      ),
      _SamplePageTextButton(
        route: NoteListRoute(),
        name: 'notes list page',
      ),
      _SamplePageTextButton(
        route: NoteDetailRoute(noteId: noteId.value),
        name: 'note detail page',
        options: ref.watch(allNoteIdsProvider),
        onSelectOption: (selectedNoteId) {
          noteId.value = selectedNoteId;
          debugPrint('setting current note detail note id to ${noteId.value}');
        },
      ),
      _SamplePageTextButton(
        // default root note id is 0 not null
        route: CreateRoute(collectionId: 0),
        name: 'create page',
      ),
      _SamplePageTextButton(
        route: SearchRoute(),
        name: 'search page',
      ),
      _SamplePageTextButton(
        route: RoamRoute(),
        name: 'roam page',
      ),
      _SamplePageTextButton(
        route: HistoryListRoute(),
        name: 'history list page',
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

class _SamplePageTextButton<T extends Object> extends StatelessWidget {
  const _SamplePageTextButton({
    required this.route,
    required this.name,
    this.options,
    this.onSelectOption,
  });

  final PageRouteInfo<Object?> route;
  final String name;
  final AsyncValue<Iterable<T>>? options;
  final Function(T)? onSelectOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.pushRoute(route);
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
                print(options);

                return Autocomplete<T>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    // if (textEditingValue.text.isEmpty) {
                    //   return const Iterable.empty();
                    // }

                    return options.where(
                      (e) => e.toString().toLowerCase().contains(textEditingValue.text.toLowerCase()),
                    );
                  },
                  onSelected: (T option) {
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
