import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/common_widgets/animated_zoom_level_widget.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_grid.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';

@RoutePage()
class GridScaleTestPage extends StatelessWidget {
  const GridScaleTestPage({super.key, required this.isCollectionGrid});

  final bool isCollectionGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated zoom test page'),
      ),
      body: AnimatedZoomLevelWidget(
        childBuilder: (zoomLevel) {
          if (isCollectionGrid) {
            return CollectionsGrid(zoomLevel: zoomLevel);
          } else {
            return NotesList(
              zoomLevel: zoomLevel,
            );
          }
        },
      ),
    );
  }
}
