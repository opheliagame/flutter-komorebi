import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_tile.dart';
import 'package:flutter_komorebi/src/features/connection/presentation/roam_notifier.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RoamPage extends ConsumerStatefulWidget {
  const RoamPage({super.key});

  @override
  ConsumerState<RoamPage> createState() => _RoamPageState();
}

class _RoamPageState extends ConsumerState<RoamPage> {
  @override
  void initState() {
    super.initState();
    // kick off with a random note after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(roamNotifierProvider.notifier).startRoam();
    });
  }

  @override
  Widget build(BuildContext context) {
    final roam = ref.watch(roamNotifierProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            roam.isLoading
                ? const Center(child: CircularProgressIndicator())
                : roam.currentNote == null
                    ? _EmptyRoam(onRetry: () => ref.read(roamNotifierProvider.notifier).startRoam())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Trail section (fixed top) ───────────────────────
                          if (roam.previousNote != null) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 24, 20, 4),
                              child: Text(
                                'you came from',
                                style: textTheme.labelSmall?.copyWith(
                                  color: Colors.black45,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            _CollectionChips(
                              collections: roam.previousCollections,
                              onTap: (col) => ref.read(roamNotifierProvider.notifier).roamIntoCollection(col),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                _preview(roam.previousNote!.content),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.black38,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              child: Divider(),
                            ),
                          ],

                          // ── Current note body (scrollable) ──────────────────
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushRoute(NoteDetailRoute(noteId: roam.currentNote!.id));
                                },
                                child: Text(
                                  roam.currentNote!.content ?? '',
                                  style: textTheme.displaySmall?.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // ── Connections + shuffle (fixed bottom) ────────────
                          if (roam.currentCollections.isNotEmpty) ...[
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 16, 20, 4),
                              child: Divider(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
                              child: Text(
                                'connections',
                                style: textTheme.labelSmall?.copyWith(
                                  color: Colors.black45,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            _CollectionChips(
                              collections: roam.currentCollections,
                              onTap: (col) => ref.read(roamNotifierProvider.notifier).roamIntoCollection(col),
                            ),
                          ],
                          const SizedBox(height: 16),
                          Center(
                            child: TextButton.icon(
                              onPressed: () => ref.read(roamNotifierProvider.notifier).startRoam(),
                              icon: const Icon(Icons.shuffle, size: 18),
                              label: const Text('random note'),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),

            // close button
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => context.router.popUntilRoot(),
                child: IconButton(
                  icon: const Icon(Icons.close, size: 48),
                  onPressed: () => context.router.popUntilRouteWithName(MainTabRoute.name),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _preview(String? content) {
    if (content == null || content.trim().isEmpty) return '(empty)';
    return content.trim();
  }
}

class _CollectionChips extends StatelessWidget {
  const _CollectionChips({required this.collections, required this.onTap});

  final List<CollectionEntity> collections;
  final void Function(CollectionEntity) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: collections
            .map(
              (col) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CollectionTile(
                  collection: col,
                  onTap: () => onTap(col),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _EmptyRoam extends StatelessWidget {
  const _EmptyRoam({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'No notes to roam through yet.',
            style: TextStyle(color: Colors.black45),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('try again'),
          ),
        ],
      ),
    );
  }
}
