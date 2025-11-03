import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreatePage extends HookConsumerWidget {
  const CreatePage({super.key, required this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputTextEditingController = useTextEditingController();
    final dropdownValue = useState<EntityType?>(EntityType.note);
    final pickedImage = useState<XFile?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('create connection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton<EntityType>(
              value: dropdownValue.value,
              items: EntityType.values
                  .map(
                    (e) => DropdownMenuItem<EntityType>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                dropdownValue.value = value;
              },
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

                print('selected image');
              }),

            // input area
            _InputWidget(
              inputTextEditingController: inputTextEditingController,
            ),

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
                        parentCollectionId: collectionId,
                      )
                      .then((result) {
                    if (result) {
                      inputTextEditingController.clear();

                      context.pop();
                    }
                  });
                } else if (dropdownValue.value == EntityType.note) {
                  // create note
                  ref.read(notesRepositoryProvider).createNote(value, pickedImage.value, collectionId).then((result) {
                    if (result) {
                      inputTextEditingController.clear();

                      context.pop();
                    }
                  });
                }
              },
              child: Text('submit'),
            ),
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
        decoration: BoxDecoration(border: Border.all()),
        child: Center(child: Text("add media")),
      ),
    );
  }
}
