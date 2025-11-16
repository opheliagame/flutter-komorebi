import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/notes/presentation/notes_list.dart';

enum ZoomLevelType {
  small,
  medium,
  large,
  ;
}

extension ZoomLevelTypeExtension on ZoomLevelType {
  ZoomLevelType zoomIn() {
    return switch (this) {
      ZoomLevelType.small => ZoomLevelType.medium,
      ZoomLevelType.medium => ZoomLevelType.large,
      ZoomLevelType.large => ZoomLevelType.large,
    };
  }

  ZoomLevelType zoomOut() {
    return switch (this) {
      ZoomLevelType.small => ZoomLevelType.small,
      ZoomLevelType.medium => ZoomLevelType.small,
      ZoomLevelType.large => ZoomLevelType.medium,
    };
  }
}

class AnimatedZoomLevelWidget extends StatefulWidget {
  const AnimatedZoomLevelWidget({super.key, required this.child, this.onZoomFinished});

  final Widget child;
  final void Function(ZoomLevelType)? onZoomFinished;

  @override
  State<AnimatedZoomLevelWidget> createState() => _AnimatedZoomLevelWidgetState();
}

class _AnimatedZoomLevelWidgetState extends State<AnimatedZoomLevelWidget> {
  double _scale = 1.0;
  double _baseScale = 1.0;
  Offset _pos = Offset.zero;
  ZoomLevelType prevZoomLevel = ZoomLevelType.medium;
  ZoomLevelType zoomLevel = ZoomLevelType.medium;
  bool _hasStartedScale = false;

  final Offset _basePos = Offset.zero;
  final double minScale = 0.5;
  final double maxScale = 2.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onScaleStart: (details) {
        setState(() {
          _baseScale = _scale;
          _hasStartedScale = true;
        });
      },
      onScaleUpdate: (details) {
        if (details.pointerCount < 2) return;

        final newScale = (_baseScale * details.scale).clamp(minScale, maxScale);

        final delta = details.focalPointDelta / newScale;

        setState(() {
          _scale = newScale;
          _pos = _basePos + delta;
        });
      },
      onScaleEnd: (details) {
        setState(() {
          _hasStartedScale = false;
          _scale = _scale.clamp(minScale, maxScale);

          if (_scale > 1 && _scale < maxScale) {
            zoomLevel = zoomLevel.zoomIn();
          }
          if (_scale < 1) {
            zoomLevel = zoomLevel.zoomOut();
          }
        });

        // widget.onZoomFinished?.call(zoomLevel);
      },
      child: Stack(
        children: [
          /// Normal view
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: NotesList(
              zoomLevel: zoomLevel,
            ),
          ),

          if (_hasStartedScale)

            /// Zoomable view (Google-Photos-like)
            AnimatedOpacity(
              opacity: 0.5,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: IgnorePointer(
                ignoring: false, // only catch touches in zoom mode
                child: ClipRect(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(_pos.dx, _pos.dy)
                      ..scale(_scale),
                    child: NotesList(
                      zoomLevel: zoomLevel,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
