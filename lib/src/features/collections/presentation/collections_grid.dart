import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_list_page.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/create_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsGrid extends ConsumerWidget {
  const CollectionsGrid({super.key, required this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = ref.watch(collectionsListStreamProvider(collectionId));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncValueWidget(
        value: collectionsListValue,
        data: (collections) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ...collections.map(
                (collection) => CollectionTile(collection: collection),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return CreatePage(collectionId: collectionId);
                    }));
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CollectionTile extends HookConsumerWidget {
  const CollectionTile({
    super.key,
    required this.collection,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = useState<bool>(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CollectionsListPage(
                collection: collection,
              ),
            ),
          );
        },
        onLongPress: () {
          isEdit.value = true;
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: !isEdit.value
                ? Stack(
                    children: [
                      Center(
                        child: Text(
                          collection.name,
                          softWrap: true,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (kDebugMode)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(collection.id.toString()),
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
                          collection.name,
                          softWrap: true,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // child: Form(
                        //   child: TextFormField(
                        //     initialValue: collection.name,
                        //     onFieldSubmitted: (value) {
                        //       if (value.isEmpty) return;
                        //       // TODO implement edit
                        //       // ref.read(collectionsNotifierProvider.notifier).upda
                        //     },
                        //   ),
                        // ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
