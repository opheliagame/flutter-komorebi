import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SamplePage extends ConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)?.app_name ?? ''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _SamplePageTextButton(
              route: HomeRoute(),
              name: 'Home Page',
            ),
            _SamplePageTextButton(
              route: HomeListRoute(),
              name: 'Home list page',
            ),
            _SamplePageTextButton(
              route: CreateRoute(collectionId: null),
              name: 'create page',
            ),
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
        context.pushRoute(HomeRoute());
      },
      child: Text(name),
    );
  }
}
