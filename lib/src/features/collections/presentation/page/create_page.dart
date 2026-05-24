import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
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
    final selectedCollections = useState<List<CollectionEntity>>([]);
    final dropdownKey = useMemoized(() => GlobalKey<DropdownSearchState<CollectionEntity>>());

    final inputTextEditingController = useTextEditingController();
    final collectionSearchController = useTextEditingController();
    final collectionSearchFocusNode = useFocusNode();
    final dropdownValue = useState<EntityType?>(entityType);
    final pickedImage = useState<Uint8List?>(null);

    final isEdit = collectionId != null || noteId != null ? true : false;
    final isCompleted = useState(false);

    useEffect(() {
      if (collectionId != null) {
        ref.read(collectionsRepositoryProvider).getCollection(collectionId!).then((collection) {
          inputTextEditingController.text = collection.name;
          pickedImage.value = collection.media;
        });
      }
      return () {};
    }, [collectionId]);

    useEffect(() {
      if (noteId != null) {
        ref.read(notesRepositoryProvider).getNote(noteId!).then((note) {
          inputTextEditingController.text = note.content ?? '';
          pickedImage.value = note.media;
        });

        ref.read(collectionsRepositoryProvider).getCollectionsOfNote(noteId!).then((result) {
          selectedCollections.value = result;
        });
      }
      return () {};
    }, [noteId]);

    // pop page once editing or creation task is complete
    useEffect(() {
      if (isCompleted.value == true) {
        selectedCollections.value = [];
        context.router.back();
      }
      return () {};
    }, [isCompleted.value]);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'update ${entityType.name}' : 'create ${entityType.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (entityType == EntityType.note)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: DropdownSearch<CollectionEntity>.multiSelection(
                  key: dropdownKey,
                  items: (filter, _) {
                    final all = ref.read(collectionsListStreamProvider).valueOrNull ?? [];
                    return filter.isEmpty
                        ? all
                        : all.where((c) => c.name.toLowerCase().contains(filter.toLowerCase())).toList();
                  },
                  selectedItems: selectedCollections.value,
                  itemAsString: (c) => c.name,
                  compareFn: (a, b) => a.id == b.id,
                  onSelected: (items) {
                    selectedCollections.value = items;
                  },
                  popupProps: MultiSelectionPopupProps.modalBottomSheet(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      controller: collectionSearchController,
                      focusNode: collectionSearchFocusNode,
                      decoration: const InputDecoration(hintText: 'search or create a collection…'),
                    ),
                    onDisplayed: () => collectionSearchFocusNode.requestFocus(),
                    emptyBuilder: (ctx, searchEntry) {
                      final name = searchEntry.trim();
                      if (name.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('start typing to create a new collection'),
                        );
                      }
                      return ListTile(
                        leading: const Icon(Icons.add),
                        title: Text('create "$name"'),
                        onTap: () async {
                          await ref
                              .read(collectionsNotifierProvider.notifier)
                              .createCollection(collectionName: name, media: null);
                          collectionSearchController.clear();
                        },
                      );
                    },
                  ),
                  decoratorProps: const DropDownDecoratorProps(
                    decoration: InputDecoration(
                      labelText: 'collections',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
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
              onPressed: () async {
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
                        isCompleted.value = true;
                      }
                    });
                  } else {
                    ref
                        .read(collectionsNotifierProvider.notifier)
                        .createCollection(
                          collectionName: value,
                          media: pickedImage.value,
                        )
                        .then((result) {
                      if (result) {
                        inputTextEditingController.clear();
                        isCompleted.value = true;
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
                            collectionIds: selectedCollections.value.map((c) => c.id).toList(),
                          );

                      inputTextEditingController.clear();
                      isCompleted.value = true;
                    });
                  } else {
                    final result = await ref.read(connectionUsecaseProvider).createNoteAndConnect(
                          content: value,
                          media: pickedImage.value,
                          collectionIds: selectedCollections.value.map((c) => c.id).toList(),
                        );

                    if (result) {
                      inputTextEditingController.clear();
                      isCompleted.value = true;
                    }
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
