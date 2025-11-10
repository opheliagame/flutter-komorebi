import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:flutter_komorebi/src/features/connection/usecase/connection_usecase.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreatePage extends HookConsumerWidget {
  const CreatePage({super.key, required this.entityType});

  final EntityType entityType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionListStream = ref.watch(collectionsListStreamProvider(ROOT_COLLECTION_ID));
    final connectedCollections = useState<List<CollectionEntity>>([]);

    final inputTextEditingController = useTextEditingController();
    final dropdownValue = useState<EntityType?>(entityType);
    final pickedImage = useState<XFile?>(null);
    final dropdownButtonCollection = useState<CollectionEntity?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('create connection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (entityType == EntityType.note)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AsyncValueWidget(
                  value: collectionListStream,
                  data: (collections) {
                    return DropdownButton(
                      value: dropdownButtonCollection.value,
                      items: collections
                          .map(
                            (c) => DropdownMenuItem(
                              value: c,
                              child: Text(c.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        dropdownButtonCollection.value = value;
                        connectedCollections.value.add(value);
                      },
                    );
                  },
                ),
              ),

            if (connectedCollections.value.isNotEmpty)
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: connectedCollections.value
                    .map(
                      (c) => InputChip(
                        label: Text(c.name),
                        selected: connectedCollections.value.contains(c),
                        onDeleted: () {
                          connectedCollections.value.remove(c);
                        },
                      ),
                    )
                    .toList(),
              ),

            // input area
            _InputWidget(
              inputTextEditingController: inputTextEditingController,
            ),

            if (pickedImage.value != null)
              FutureBuilder(
                future: pickedImage.value!.readAsBytes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.memory(snapshot.data!);
                  }
                  return SizedBox.shrink();
                },
              )
            else
              //
              _InputImagePicker(onPickImage: (image) {
                pickedImage.value = image;
              }),

            TextButton(
              onPressed: () {
                final value = inputTextEditingController.value.text;
                if (value.isEmpty && pickedImage.value == null) return;

                if (dropdownValue.value == EntityType.collection) {
                  // create collection
                  ref
                      .read(collectionsNotifierProvider.notifier)
                      .createCollection(
                        collectionName: value,
                        media: pickedImage.value,
                      )
                      .then((result) {
                    if (result) {
                      inputTextEditingController.clear();

                      context.pop();
                    }
                  });
                } else if (dropdownValue.value == EntityType.note) {
                  // create note in collection
                  ref
                      .read(connectionUsecaseProvider)
                      .createNoteAndConnect(
                          content: value,
                          media: pickedImage.value,
                          collectionIds: connectedCollections.value.map((c) => c.id).toList())
                      .then((result) {
                    if (result) {
                      inputTextEditingController.clear();

                      context.pop();
                    }
                  });
                }
              },
              child: Text('submit'),
            ),

            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

class _InputWidget extends HookConsumerWidget {
  const _InputWidget({required this.inputTextEditingController});

  final TextEditingController inputTextEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Form(
            child: TextFormField(
              controller: inputTextEditingController,
              autofocus: true,
              maxLines: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InputImagePicker extends ConsumerWidget {
  const _InputImagePicker({
    required this.onPickImage,
  });

  final void Function(XFile) onPickImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> pickSingleImage() async {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // save image

        onPickImage(image);
      } else {
        // TODO(urgent): handle error handling
      }
    }

    return GestureDetector(
      onTap: () {
        pickSingleImage();
      },
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(border: Border.all()),
        child: Center(child: Text("add media")),
      ),
    );
  }
}
