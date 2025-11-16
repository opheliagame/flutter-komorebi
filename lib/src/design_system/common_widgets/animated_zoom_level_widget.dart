import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  const AnimatedZoomLevelWidget({
    super.key,
    required this.childBuilder,
    this.onZoomFinished,
  });

  /// ⬅️ You provide a widget based on current zoom level
  final Widget Function(ZoomLevelType zoomLevel) childBuilder;

  final void Function(ZoomLevelType)? onZoomFinished;

  @override
  State<AnimatedZoomLevelWidget> createState() => _AnimatedZoomLevelWidgetState();
}

class _AnimatedZoomLevelWidgetState extends State<AnimatedZoomLevelWidget> {
  double _scale = 1.0;
  double _baseScale = 1.0;

  bool _hasStartedScale = false;

  ZoomLevelType zoomLevel = ZoomLevelType.medium;

  final double minScale = 0.8;
  final double maxScale = 1.4;

  late ScaleGestureRecognizer _scaleGesture;

  @override
  void initState() {
    super.initState();

    _scaleGesture = ScaleGestureRecognizer()
      ..team = GestureArenaTeam() // allows pinch to override scroll
      ..onStart = _onScaleStart
      ..onUpdate = _onScaleUpdate
      ..onEnd = _onScaleEnd;
  }

  // ------------------------------
  // SCALE HANDLERS
  // ------------------------------

  void _onScaleStart(ScaleStartDetails d) {
    setState(() {
      _hasStartedScale = true;
      _baseScale = _scale;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails d) {
    if (d.pointerCount < 2) return;

    final newScale = (_baseScale * d.scale).clamp(minScale, maxScale);

    setState(() => _scale = newScale);
  }

  void _onScaleEnd(ScaleEndDetails d) {
    setState(() => _hasStartedScale = false);

    // Pick next zoom level based on final scale
    if (_scale > 1.15) {
      zoomLevel = zoomLevel.zoomIn();
    } else if (_scale < 0.9) {
      zoomLevel = zoomLevel.zoomOut();
    }

    // Reset scale overlay
    setState(() => _scale = 1.0);

    widget.onZoomFinished?.call(zoomLevel);
  }

  // ------------------------------
  // BUILD
  // ------------------------------

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.translucent,
      gestures: {
        ScaleGestureRecognizer: GestureRecognizerFactoryWithHandlers<ScaleGestureRecognizer>(
          () => _scaleGesture,
          (instance) {},
        ),
      },
      child: Stack(
        children: [
          // Base view — interactive
          AnimatedOpacity(
            opacity: _hasStartedScale ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            child: widget.childBuilder(zoomLevel),
          ),

          if (_hasStartedScale)
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              child: Transform.scale(
                scale: _scale,
                alignment: Alignment.center,
                child: IgnorePointer(
                  ignoring: true, // Prevents scroll/gesture conflicts
                  child: widget.childBuilder(zoomLevel),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
