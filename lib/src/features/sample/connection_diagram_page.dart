import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Path randomBlob({
  required Offset center,
  required double radius,
  int pointCount = 12,
  double randomness = 0.25, // deviation in radius
}) {
  final rnd = Random();

  // Generate radial points
  List<Offset> pts = [];
  for (int i = 0; i < pointCount; i++) {
    double angle = (2 * pi / pointCount) * i;

    // radial variation (makes more interesting shapes)
    double r = radius * (1 - randomness + rnd.nextDouble() * randomness * 2);

    pts.add(Offset(
      center.dx + cos(angle) * r,
      center.dy + sin(angle) * r,
    ));
  }

  // ---------- Catmull–Rom interpolation ----------
  Offset catmullRom(
    Offset p0,
    Offset p1,
    Offset p2,
    Offset p3,
    double t,
  ) {
    final t2 = t * t;
    final t3 = t2 * t;

    return Offset(
      0.5 *
          (2 * p1.dx +
              (p2.dx - p0.dx) * t +
              (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * t2 +
              (3 * p1.dx - p0.dx - 3 * p2.dx + p3.dx) * t3),
      0.5 *
          (2 * p1.dy +
              (p2.dy - p0.dy) * t +
              (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * t2 +
              (3 * p1.dy - p0.dy - 3 * p2.dy + p3.dy) * t3),
    );
  }

  final path = Path();

  // Move to the first point (t = 0.5 gives a good start)
  Offset start = catmullRom(
    pts[pts.length - 2],
    pts[pts.length - 1],
    pts[0],
    pts[1],
    0.5,
  );
  path.moveTo(start.dx, start.dy);

  // Add cubic segments
  for (int i = 0; i < pts.length; i++) {
    Offset p0 = pts[(i - 1 + pts.length) % pts.length];
    Offset p1 = pts[i];
    Offset p2 = pts[(i + 1) % pts.length];
    Offset p3 = pts[(i + 2) % pts.length];

    // sample catmull-rom points along the segment
    Offset pA = catmullRom(p0, p1, p2, p3, 0.33);
    Offset pB = catmullRom(p0, p1, p2, p3, 0.66);
    Offset pC = catmullRom(p0, p1, p2, p3, 1.0);

    // Convert to cubic Bézier
    path.cubicTo(pA.dx, pA.dy, pB.dx, pB.dy, pC.dx, pC.dy);
  }

  path.close();
  return path;
}

class RandomBlobPainter extends CustomPainter {
  final double radius;
  final int pointCount;
  final double randomnees;
  final double rx;
  final double ry;

  RandomBlobPainter(
      {super.repaint, this.radius = 80, this.pointCount = 16, this.randomnees = 0.4, this.rx = 1, this.ry = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final blob = randomBlob(
      center: center,
      radius: radius,
      pointCount: pointCount,
      randomness: randomnees,
      // ellipseX: rx,
      // ellipseY: ry,
    );

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(blob, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

@RoutePage()
class ConnectionDiagramPage extends StatefulWidget {
  const ConnectionDiagramPage({super.key});

  @override
  State<ConnectionDiagramPage> createState() => _ConnectionDiagramPageState();
}

class _ConnectionDiagramPageState extends State<ConnectionDiagramPage> {
  final random = Random();
  int n = Random().nextInt(5) + 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('connection diagram 1'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white38,
          child: GestureDetector(
            onTap: () {
              setState(() {
                n = random.nextInt(20);
              });
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Stack(
                    children: List.generate(n, (index) {
                      final x = random.nextDouble() * constraints.maxWidth / 2;
                      final y = random.nextDouble() * constraints.maxHeight / 2;
                      final w = random.nextDouble() * 200;
                      final h = random.nextDouble() * 600;

                      return Positioned(
                        left: x,
                        top: y,
                        child: CustomPaint(
                          size: Size(w, h),
                          painter: RandomBlobPainter(
                            radius: random.nextDouble() * 200,
                            rx: random.nextDouble() * 1,
                            ry: random.nextDouble() * 1,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
