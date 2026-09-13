import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:flutter_komorebi/src/features/connection/usecase/connection_usecase.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/search/data/semantic_search_service.dart';
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
    final isSelectionComplete = useState(false);

    final inputTextEditingController = useTextEditingController();
    final collectionSearchController = useTextEditingController(text: '');
    final collectionSearchFocusNode = useFocusNode();
    final collectionSearchQuery = useState('');
    final dropdownValue = useState<EntityType?>(entityType);
    final pickedImage = useState<Uint8List?>(null);

    final allCollections =
        ref.watch(collectionsListStreamProvider).valueOrNull ?? [];
    final semanticSearchResults = useState<List<int>>([]);

    useEffect(() {
      final query = collectionSearchQuery.value.trim();
      if (query.isEmpty) {
        semanticSearchResults.value = [];
        return null;
      }

      var isCancelled = false;
      final semanticSearch = ref.read(semanticSearchServiceProvider);
      Future<void>(() async {
        for (final collection in allCollections) {
          await semanticSearch.indexCollection(collection);
        }
        final matchIds =
            await semanticSearch.searchSimilarCollections(query: query);
        if (!isCancelled) {
          semanticSearchResults.value = matchIds;
        }
      }).catchError((error) {
        debugPrint('Collection semantic search failed: $error');
        if (!isCancelled) {
          semanticSearchResults.value = [];
        }
      });

      return () {
        isCancelled = true;
      };
    }, [collectionSearchQuery.value, allCollections]);

    final filteredCollections = useMemoized(() {
      final query = collectionSearchQuery.value.trim().toLowerCase();
      if (query.isEmpty) {
        return allCollections;
      }

      if (semanticSearchResults.value.isNotEmpty) {
        final collectionMap = {for (final c in allCollections) c.id: c};
        final results = <CollectionEntity>[];
        final seen = <int>{};

        for (final id in semanticSearchResults.value) {
          final c = collectionMap[id];
          if (c != null) {
            results.add(c);
            seen.add(id);
          }
        }

        for (final c in allCollections) {
          if (!seen.contains(c.id) &&
              (c.name.toLowerCase().contains(query) ||
                  (c.description != null &&
                      c.description!.toLowerCase().contains(query)))) {
            results.add(c);
          }
        }
        return results;
      }

      return allCollections
          .where((collection) =>
              collection.name.toLowerCase().contains(query) ||
              (collection.description != null &&
                  collection.description!.toLowerCase().contains(query)))
          .toList();
    }, [
      allCollections,
      collectionSearchQuery.value,
      semanticSearchResults.value
    ]);

    final isEdit = collectionId != null || noteId != null ? true : false;
    final isCompleted = useState(false);
    final requiresCollectionSelection =
        entityType == EntityType.note && !isEdit;

    void toggleCollectionSelection(CollectionEntity collection) {
      final ids = selectedCollections.value.map((entry) => entry.id).toList();
      if (ids.contains(collection.id)) {
        selectedCollections.value = selectedCollections.value
            .where((entry) => entry.id != collection.id)
            .toList();
      } else {
        selectedCollections.value = [...selectedCollections.value, collection];
      }
    }

    Future<void> createCollectionFromSearch(String name) async {
      final trimmedName = name.trim();
      if (trimmedName.isEmpty) {
        return;
      }

      final created = await ref
          .read(collectionsNotifierProvider.notifier)
          .createCollection(collectionName: trimmedName, media: null);

      if (created) {
        collectionSearchController.clear();
        collectionSearchQuery.value = '';
      }
    }

    useEffect(() {
      if (collectionId != null) {
        ref
            .read(collectionsRepositoryProvider)
            .getCollection(collectionId!)
            .then((collection) {
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

        ref
            .read(collectionsRepositoryProvider)
            .getCollectionsOfNote(noteId!)
            .then((result) {
          selectedCollections.value = result;
        });
      }
      return () {};
    }, [noteId]);

    useEffect(() {
      return () {};
    }, const []);

    useEffect(() {
      if (isCompleted.value == true) {
        selectedCollections.value = [];
        context.router.back();
      }
      return () {};
    }, [isCompleted.value]);

    final canSubmit = dropdownValue.value == EntityType.collection ||
        !requiresCollectionSelection ||
        selectedCollections.value.isNotEmpty;

    Future<void> pasteImageFromClipboard() async {
      const channel = MethodChannel('image_clipboard');
      final result = await channel.invokeMethod('pasteImage');
      if (result == null) {
        return;
      }

      pickedImage.value = Uint8List.fromList(result);
    }

    Future<void> addMediaFromGallery() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      final bytes = await image?.readAsBytes();
      if (image != null) {
        pickedImage.value = bytes;
      }
    }

    final showCollectionSelection =
        entityType == EntityType.note && !isEdit && !isSelectionComplete.value;
    final showSelectedCollectionsHeader =
        entityType == EntityType.note && !isEdit && isSelectionComplete.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            isEdit ? 'update ${entityType.name}' : 'create ${entityType.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showCollectionSelection) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: collectionSearchController,
                  focusNode: collectionSearchFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Search collections',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                  ),
                  onChanged: (value) {
                    collectionSearchQuery.value = value;
                  },
                ),
              ),
              if (selectedCollections.value.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: selectedCollections.value
                              .map(
                                (collection) => InputChip(
                                  label: Text(collection.name),
                                  selected: true,
                                  onSelected: (_) =>
                                      toggleCollectionSelection(collection),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: selectedCollections.value.isEmpty
                            ? null
                            : () => isSelectionComplete.value = true,
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ),
              if (collectionSearchQuery.value.trim().isEmpty &&
                  filteredCollections.isEmpty)
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text('No collections yet'),
                )
              else if (filteredCollections.isNotEmpty ||
                  collectionSearchQuery.value.trim().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (collectionSearchQuery.value.trim().isNotEmpty &&
                          filteredCollections.isEmpty)
                        ActionChip(
                          avatar: const Icon(Icons.add, size: 18),
                          label: Text(
                              'Create "${collectionSearchQuery.value.trim()}"'),
                          onPressed: () => createCollectionFromSearch(
                              collectionSearchQuery.value),
                        ),
                      ...filteredCollections.map((collection) {
                        final isSelected = selectedCollections.value
                            .any((entry) => entry.id == collection.id);
                        return ChoiceChip(
                          label: Text(
                            collection.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          selected: isSelected,
                          onSelected: (_) =>
                              toggleCollectionSelection(collection),
                          showCheckmark: false,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        );
                      }),
                    ],
                  ),
                ),
            ],
            if (showSelectedCollectionsHeader) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: selectedCollections.value
                            .map(
                              (collection) => InputChip(
                                label: Text(collection.name),
                                selected: true,
                                onSelected: (_) =>
                                    toggleCollectionSelection(collection),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () => isSelectionComplete.value = false,
                      child: const Text('Edit'),
                    ),
                  ],
                ),
              ),
            ],
            if (!requiresCollectionSelection ||
                isSelectionComplete.value ||
                selectedCollections.value.isNotEmpty &&
                    !showCollectionSelection) ...[
              // input area
              _InputWidget(
                inputTextEditingController: inputTextEditingController,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: pasteImageFromClipboard,
                      icon: const Icon(Icons.paste),
                      tooltip: 'Paste image',
                    ),
                    const SizedBox(width: 8),
                    if (isEdit || pickedImage.value == null)
                      IconButton(
                        onPressed: addMediaFromGallery,
                        icon: const Icon(Icons.image),
                        tooltip: 'Add media',
                      ),
                  ],
                ),
              ),

              if (pickedImage.value != null) Image.memory(pickedImage.value!),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: FilledButton.icon(
                  onPressed: canSubmit
                      ? () async {
                          final value = inputTextEditingController.value.text;
                          if (value.isEmpty && pickedImage.value == null) {
                            return;
                          }

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
                            if (requiresCollectionSelection &&
                                selectedCollections.value.isEmpty) {
                              return;
                            }

                            if (isEdit) {
                              ref
                                  .read(notesRepositoryProvider)
                                  .updateNote(
                                    noteId: noteId!,
                                    content: value,
                                    media: pickedImage.value,
                                  )
                                  .then((_) {
                                ref
                                    .read(connectionUsecaseProvider)
                                    .addNoteToCollectionList(
                                      noteId: noteId!,
                                      collectionIds: selectedCollections.value
                                          .map((c) => c.id)
                                          .toList(),
                                    );

                                inputTextEditingController.clear();
                                isCompleted.value = true;
                              });
                            } else {
                              final result = await ref
                                  .read(connectionUsecaseProvider)
                                  .createNoteAndConnect(
                                    content: value,
                                    media: pickedImage.value,
                                    collectionIds: selectedCollections.value
                                        .map((c) => c.id)
                                        .toList(),
                                  );

                              if (result) {
                                inputTextEditingController.clear();
                                isCompleted.value = true;
                              }
                            }
                          }
                        }
                      : null,
                  icon: const Icon(Icons.check),
                  label: const Text('Submit'),
                ),
              ),
            ],
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
