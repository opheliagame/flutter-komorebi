import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePage extends HookConsumerWidget {
  const CreatePage({super.key, required this.collectionId});

  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputTextEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('make new item'),

          // input area
          _InputWidget(
            inputTextEditingController: inputTextEditingController,
          ),

          TextButton(
            onPressed: () {
              final value = inputTextEditingController.value.text;
              if (value.isEmpty) return;
              ref.read(collectionsNotifierProvider.notifier).createCollection(value, collectionId).then((result) {
                if (result) {
                  inputTextEditingController.clear();

                  Navigator.of(context).pop();
                }
              });
            },
            child: Text('submit'),
          ),
        ],
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
