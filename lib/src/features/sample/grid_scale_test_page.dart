import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';

@RoutePage()
class GridScaleTestPage extends StatelessWidget {
  const GridScaleTestPage({super.key, required this.child, this.onZoomFinished});

  final Widget child;
  final void Function(ZoomLevelType)? onZoomFinished;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated zoom test page'),
      ),
      body: AnimatedZoomLevelWidget(
        child: child,
        onZoomFinished: (value) {
          onZoomFinished?.call(value);

          print('inside test page');
          print(value);
          print(child.toStringDeep());
        },
      ),
    );
  }
}
