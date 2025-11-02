import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsGrid extends ConsumerWidget {
  const CollectionsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsListValue = ref.watch(collectionsListStreamProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncValueWidget(
        value: collectionsListValue,
        data: (collections) {
          return GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ...collections.map(
                (collection) => CollectionTile(collection: collection),
              ),
              NewCollectionTile(),
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
          // TODO move to sub collections on click
          // ref.read(currentCollectionIdProvider.notifier).state = collection.id;
        },
        onLongPress: () {
          isEdit.value = true;
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
            child: !isEdit.value
                ? Center(
                    child: Text(
                      collection.name,
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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

class NewCollectionTile extends HookConsumerWidget {
  const NewCollectionTile({super.key, this.edit = false});

  final bool edit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = useState<bool>(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isEdit.value = true;
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
              child: isEdit.value
                  ? Form(
                      child: TextFormField(
                        autofocus: true,
                        onFieldSubmitted: (value) {
                          if (value.isEmpty) return;
                          ref.read(collectionsNotifierProvider.notifier).createCollection(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        isEdit.value = true;
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
