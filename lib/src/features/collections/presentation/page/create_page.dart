import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/async_value_widget.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:flutter_komorebi/src/features/connection/usecase/connection_usecase.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/sample/image_clipboard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreatePage extends HookConsumerWidget {
  const CreatePage({
    super.key,
    required this.entityType,
    this.collectionId,
    this.noteId,
  });

  final EntityType entityType;
  final int? collectionId;
  final int? noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('got collection id $collectionId');
    final collectionListStream = ref.watch(relatedCollectionsListStreamProvider(ROOT_COLLECTION_ID));
    final prevConnectedCollections = useState<List<CollectionEntity>>([]);
    final newConnectedCollections = useState<List<CollectionEntity>>([]);
    final allConnectedCollections = [...prevConnectedCollections.value, ...newConnectedCollections.value];

    final inputTextEditingController = useTextEditingController();
    final dropdownValue = useState<EntityType?>(entityType);
    final pickedImage = useState<Uint8List?>(null);
    final dropdownButtonCollection = useState<CollectionEntity?>(null);

    final isEdit = collectionId != null || noteId != null ? true : false;

    useEffect(() {
      if (collectionId != null) {
        ref.read(collectionsRepositoryProvider).getCollection(collectionId!).then((collection) {
          print('setting text of collection for update');
          inputTextEditingController.text = collection.name;
          pickedImage.value = collection.media;
        });
      }

      return () {};
    }, [collectionId]);

    useEffect(() {
      if (noteId != null) {
        ref.watch(notesRepositoryProvider).getNote(noteId!).then((note) {
          print('setting text of note for update');
          inputTextEditingController.text = note.content ?? '';
          pickedImage.value = note.media;
        });

        ref.read(collectionsRepositoryProvider).getCollectionsOfNote(noteId!).then((result) {
          prevConnectedCollections.value = result;
        });
      }

      return () {};
    }, [noteId]);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'update ${entityType.name}' : 'create ${entityType.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (entityType == EntityType.note)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: AsyncValueWidget(
                    value: collectionListStream,
                    data: (collections) {
                      return DropdownButton(
                        isExpanded: true,
                        value: dropdownButtonCollection.value,
                        items: collections
                            .map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(
                                  c.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          dropdownButtonCollection.value = value;
                          newConnectedCollections.value.add(value);
                        },
                      );
                    },
                  ),
                ),
              ),

            if (allConnectedCollections.isNotEmpty)
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: allConnectedCollections
                    .map(
                      (c) => InputChip(
                        label: Text(c.name),
                        selected: allConnectedCollections.contains(c),
                        onDeleted: () {
                          allConnectedCollections.remove(c);
                        },
                      ),
                    )
                    .toList(),
              ),

            // input area
            _InputWidget(
              inputTextEditingController: inputTextEditingController,
            ),

            // paste from clipboard
            ImageClipboardWidget(
              onPasteImage: (image) {
                pickedImage.value = image;
              },
            ),

            if (pickedImage.value != null) Image.memory(pickedImage.value!),
            if (isEdit || pickedImage.value == null)
              _InputImagePicker(
                onPickImage: (image) {
                  pickedImage.value = image;
                },
              ),

            TextButton(
              onPressed: () {
                final value = inputTextEditingController.value.text;
                if (value.isEmpty && pickedImage.value == null) return;

                if (dropdownValue.value == EntityType.collection) {
                  if (isEdit) {
                    ref
                        .read(collectionsRepositoryProvider)
                        .updateCollection(
                          collectionId: collectionId!,
                          collectionName: value,
                          media: pickedImage.value,
                          description: '',
                        )
                        .then((result) {
                      if (result) {
                        inputTextEditingController.clear();

                        context.pop();
                      }
                    });
                  } else {
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
                  }
                } else if (dropdownValue.value == EntityType.note) {
                  if (isEdit) {
                    ref
                        .read(notesRepositoryProvider)
                        .updateNote(
                          noteId: noteId!,
                          content: value,
                          media: pickedImage.value,
                        )
                        .then((_) {
                      ref.read(connectionUsecaseProvider).addNoteToCollectionList(
                            noteId: noteId!,
                            collectionIds: newConnectedCollections.value.map((c) => c.id).toList(),
                          );

                      inputTextEditingController.clear();

                      context.pop();
                    });
                  } else {
                    // create note in collection
                    ref
                        .read(connectionUsecaseProvider)
                        .createNoteAndConnect(
                          content: value,
                          media: pickedImage.value,
                          collectionIds: newConnectedCollections.value.map((c) => c.id).toList(),
                        )
                        .then((result) {
                      if (result) {
                        inputTextEditingController.clear();

                        context.pop();
                      }
                    });
                  }
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
        child: Form(
          child: TextFormField(
            controller: inputTextEditingController,
            decoration: InputDecoration(
              hintText: 'What are you thinking about?',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            autofocus: true,
            minLines: 1,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
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

  final void Function(Uint8List?) onPickImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> pickSingleImage() async {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      final bytes = await image?.readAsBytes();

      if (image != null) {
        // save image

        onPickImage(bytes);
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
        child: Center(child: Text('add media')),
      ),
    );
  }
}
