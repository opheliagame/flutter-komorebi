import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    route: CreateRoute(collectionId: null),
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
];

@RoutePage()
class SamplePage extends HookConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

class _SamplePageTextButton extends StatelessWidget {
  const _SamplePageTextButton({
    required this.route,
    required this.name,
  });

  final PageRouteInfo<Object?> route;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushRoute(route);
      },
      child: Text(name),
    );
  }
}
