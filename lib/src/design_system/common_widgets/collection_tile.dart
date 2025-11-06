import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionTile extends HookConsumerWidget {
  const CollectionTile({
    super.key,
    required this.collection,
  });

  // TODO remove widget dep on drift
  final CollectionEntity collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = useState<bool>(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.pushRoute(HomeListRoute(collection: collection));
        },
        onLongPress: () {
          isEdit.value = true;
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Theme.of(context).buttonTheme.colorScheme?.primaryContainer,
            child: !isEdit.value
                ? Stack(
                    children: [
                      if (collection.media != null)
                        Positioned.fill(
                          child: Image.memory(
                            collection.media!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Text('error fetching image');
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            collection.name ?? '',
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      if (kDebugMode)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(collection.id.toString()),
                          ),
                        ),
                    ],
                  )
                : Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            ref.read(collectionsNotifierProvider.notifier).deleteCollection(collection.id);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                      Center(
                        child: Text(
                          collection.name ?? '',
                          softWrap: true,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
