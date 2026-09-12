import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/floating_sliver_app_bar.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/quick_action_fabs.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_row.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CollectionListPage extends ConsumerWidget {
  const CollectionListPage({super.key, required this.collectionId});

  final int collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionFutureValue = ref.watch(collectionSingleFutureProvider(collectionId));

    return Scaffold(
      floatingActionButton: const QuickActionFabs(),
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            FloatingSliverAppBar(
              forceElevated: innerBoxIsScrolled,
              title: Text(
                kDebugMode
                    ? '${collectionFutureValue.value?.name} ${collectionFutureValue.value?.id}'
                    : collectionFutureValue.value?.name ?? '',
              ),
              actions: [],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: RelatedCollectionsRow(collectionId: collectionId),
              ),
            ),
          ],
          body: AnimatedZoomLevelWidget(
            childBuilder: (zoomLevel) => NotesList(
              collectionId: collectionId,
              zoomLevel: zoomLevel,
            ),
          ),
        ),
      ),
    );
  }
}
