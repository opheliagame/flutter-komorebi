import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ImageClipboardSamplePage extends ConsumerWidget {
  const ImageClipboardSamplePage({super.key, required this.isDebug});

  final bool isDebug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('image paste from clipboard sample page')),
      body: SafeArea(
        child: ImageClipboardWidget(
          isDebug: true,
          onPasteImage: (imageData) {
            // do nothing
          },
        ),
      ),
    );
  }
}

class ImageClipboardWidget extends StatefulWidget {
  const ImageClipboardWidget({super.key, required this.onPasteImage, this.isDebug = false});

  final bool isDebug;
  final void Function(Uint8List?) onPasteImage;

  @override
  State<ImageClipboardWidget> createState() => _ImageClipboardWidgetState();
}

class _ImageClipboardWidgetState extends State<ImageClipboardWidget> {
  static const platform = MethodChannel('image_clipboard');

  Uint8List? pastedImage;

  Future<void> copyImage(Uint8List bytes) async {
    await platform.invokeMethod('copyImage', {'bytes': bytes});
  }

  Future<void> pasteImage() async {
    final result = await platform.invokeMethod('pasteImage');
    if (result != null) {
      final imageData = Uint8List.fromList(result);
      widget.onPasteImage(imageData);
      setState(() {
        pastedImage = Uint8List.fromList(imageData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: pasteImage,
          child: Text('Paste Image'),
        ),
        if (widget.isDebug)
          if (pastedImage != null) Image.memory(pastedImage!, width: 200),
      ],
    );
  }
}
