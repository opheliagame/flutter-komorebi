import 'dart:math' show min, max, pi, cos, sin;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/similar_collections_entity.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectedNotesVisualization extends ConsumerWidget {
  const ConnectedNotesVisualization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsAsync = ref.watch(recentSimilarCollectionsListStreamProvider);

    return collectionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) {
        return const _EmptyVisualization();
      },
      data: (groups) {
        if (groups.isEmpty) return const _EmptyVisualization();
        return _VisualizationCanvas(groups: groups);
      },
    );
  }
}

class _EmptyVisualization extends StatelessWidget {
  const _EmptyVisualization();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No connections yet.\nStart creating notes and collections!',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black38,
            ),
      ),
    );
  }
}

class _VisualizationCanvas extends StatefulWidget {
  const _VisualizationCanvas({required this.groups});

  final List<SimilarCollectionsEntity> groups;

  @override
  State<_VisualizationCanvas> createState() => _VisualizationCanvasState();
}

class _VisualizationCanvasState extends State<_VisualizationCanvas> {
  late List<_NodeData> _nodes;
  late List<_EdgeData> _edges;

  static const double _padding = 72.0;

  @override
  void initState() {
    super.initState();
    _buildGraph();
  }

  @override
  void didUpdateWidget(_VisualizationCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.groups != widget.groups) {
      _buildGraph();
    }
  }

  double _nodeRx(int id) => 52.0 + (id * 37 % 44); // 52–96
  double _nodeRy(int id) => 80.0 + (id * 53 % 56); // 80–136
  double _nodeRotation(int id) => ((id * 73 % 160) - 80) * pi / 180; // -80° to +80°

  void _buildGraph() {
    final Map<int, _NodeData> nodeMap = {};

    for (final group in widget.groups) {
      nodeMap[group.collection.id] ??= _NodeData(
        id: group.collection.id,
        label: group.collection.name,
        position: Offset.zero,
        rx: _nodeRx(group.collection.id),
        ry: _nodeRy(group.collection.id),
        rotation: _nodeRotation(group.collection.id),
      );
      for (final similar in group.similarCollections) {
        nodeMap[similar.id] ??= _NodeData(
          id: similar.id,
          label: similar.name,
          position: Offset.zero,
          rx: _nodeRx(similar.id),
          ry: _nodeRy(similar.id),
          rotation: _nodeRotation(similar.id),
        );
      }
    }

    _nodes = nodeMap.values.toList();

    final edgeSet = <String>{};
    _edges = [];
    for (final group in widget.groups) {
      for (final similar in group.similarCollections) {
        final key = '${min(group.collection.id, similar.id)}-${max(group.collection.id, similar.id)}';
        if (edgeSet.add(key)) {
          _edges.add(_EdgeData(
            fromId: group.collection.id,
            toId: similar.id,
          ));
        }
      }
    }
  }

  void _assignPositions(Size canvasSize) {
    final count = _nodes.length;
    if (count == 0) return;

    final cx = canvasSize.width / 2;
    final cy = canvasSize.height / 2;

    if (count == 1) {
      _nodes[0] = _nodes[0].copyWith(position: Offset(cx, cy));
      return;
    }

    // Initial circular layout
    final usableW = canvasSize.width - _padding * 2;
    final usableH = canvasSize.height - _padding * 2;
    for (int i = 0; i < count; i++) {
      final angle = (2 * pi / count) * i - pi / 2;
      _nodes[i] = _nodes[i].copyWith(
        position: Offset(
          cx + cos(angle) * usableW * 0.38,
          cy + sin(angle) * usableH * 0.38,
        ),
      );
    }

    // Spring layout – pull connected nodes together so they overlap
    var nodeMap = {for (final n in _nodes) n.id: n};

    for (int iter = 0; iter < 80; iter++) {
      final forces = {for (final n in _nodes) n.id: Offset.zero};

      // Repulsion between all pairs
      for (int i = 0; i < _nodes.length; i++) {
        for (int j = i + 1; j < _nodes.length; j++) {
          final a = nodeMap[_nodes[i].id]!;
          final b = nodeMap[_nodes[j].id]!;
          final delta = a.position - b.position;
          final dist = delta.distance.clamp(1.0, double.infinity);
          final repulsion = 9000.0 / (dist * dist);
          final force = delta / dist * repulsion;
          forces[a.id] = forces[a.id]! + force;
          forces[b.id] = forces[b.id]! - force;
        }
      }

      // Attraction for connected pairs: pull until they overlap
      for (final edge in _edges) {
        final a = nodeMap[edge.fromId];
        final b = nodeMap[edge.toId];
        if (a == null || b == null) continue;
        final delta = b.position - a.position;
        final dist = delta.distance.clamp(1.0, double.infinity);
        // Target: overlap by ~45% of combined ry
        final targetDist = (a.ry + b.ry) * 0.55;
        final stretch = dist - targetDist;
        final force = delta / dist * stretch * 0.12;
        forces[a.id] = forces[a.id]! + force;
        forces[b.id] = forces[b.id]! - force;
      }

      // Apply forces, clamp to canvas bounds
      for (int i = 0; i < _nodes.length; i++) {
        final node = nodeMap[_nodes[i].id]!;
        var newPos = node.position + forces[node.id]! * 0.012;
        newPos = Offset(
          newPos.dx.clamp(_padding, canvasSize.width - _padding),
          newPos.dy.clamp(_padding, canvasSize.height - _padding),
        );
        final updated = node.copyWith(position: newPos);
        nodeMap[node.id] = updated;
        _nodes[i] = updated;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _assignPositions(size);

        return CustomPaint(
          painter: _EllipseGraphPainter(nodes: _nodes),
          // Invisible tap targets layered on top
          child: Stack(
            children: _nodes.map((node) {
              return Positioned(
                left: node.position.dx - node.rx - 8,
                top: node.position.dy - node.ry - 8,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => context.navigateTo(
                    CollectionListRoute(collectionId: node.id),
                  ),
                  child: SizedBox(
                    width: (node.rx + 8) * 2,
                    height: (node.ry + 8) * 2,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _EllipseGraphPainter extends CustomPainter {
  const _EllipseGraphPainter({required this.nodes});

  final List<_NodeData> nodes;

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (final node in nodes) {
      canvas.save();
      canvas.translate(node.position.dx, node.position.dy);
      canvas.rotate(node.rotation);

      // Outlined ellipse – no fill
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset.zero,
          width: node.rx * 2,
          height: node.ry * 2,
        ),
        strokePaint,
      );

      // Italic label centred inside the ellipse
      final tp = TextPainter(
        text: TextSpan(
          text: node.label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontStyle: FontStyle.italic,
            letterSpacing: 0.2,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      )..layout(maxWidth: node.rx * 1.5);

      tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _EllipseGraphPainter old) => old.nodes != nodes;
}

// ---------- Data classes ----------

class _NodeData {
  const _NodeData({
    required this.id,
    required this.label,
    required this.position,
    required this.rx,
    required this.ry,
    required this.rotation,
  });

  final int id;
  final String label;
  final Offset position;
  final double rx; // horizontal semi-axis
  final double ry; // vertical semi-axis
  final double rotation; // radians

  _NodeData copyWith({Offset? position}) => _NodeData(
        id: id,
        label: label,
        position: position ?? this.position,
        rx: rx,
        ry: ry,
        rotation: rotation,
      );
}

class _EdgeData {
  const _EdgeData({required this.fromId, required this.toId});
  final int fromId;
  final int toId;
}
