import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/design_system/spacing.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RecentsPage extends ConsumerWidget {
  const RecentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentSimilarColllections = ref.watch(recentSimilarCollectionsListFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('recents page'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: kHorizontalPadding,
              child: Text('recent similar collections'),
            ),
            AsyncValueWidget(
              value: recentSimilarColllections,
              data: (similarCollections) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...similarCollections.map((collection) {
                      final displayString = collection.similarCollections.map((e) => e.name).join(',');
                      return Text('${collection.collection.name} is connected to $displayString collections');
                    }),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
