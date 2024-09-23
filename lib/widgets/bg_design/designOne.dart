import 'dart:math';

import 'package:flutter/material.dart';

class DiagonalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 60, // Controls grid layout
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 400,
              itemBuilder: (context, index) => AnimatedTile(),
            ),
          ),
        ),
      );
}

class AnimatedTile extends StatefulWidget {
  @override
  _AnimatedTileState createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  static const double _minScale = 0.9;
  static const double _maxScale = 1.1;
  static const int _animationDurationInSeconds = 2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: _animationDurationInSeconds),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: _minScale, end: _maxScale).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: TileWidget(),
    );
  }
}

class TileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomRotation = Random().nextBool() ? pi / 2 : 0.0;

    return SizedBox(
      width: 50,
      height: 50,
      child: Transform.rotate(
        angle: randomRotation,
        child: CustomPaint(
          painter: CurvedPainter(),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  static const double strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final double third = size.width / 2;

    final Paint paint = Paint()
      ..shader = const LinearGradient(
        // New color gradient
        colors: [Colors.orange, Colors.redAccent, Colors.deepPurple],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    _drawCurves(canvas, size, paint, third);
  }

  void _drawCurves(Canvas canvas, Size size, Paint paint, double third) {
    final Path topCurve = Path();
    topCurve.moveTo(third, 0);
    topCurve.quadraticBezierTo(third, third, 0, third);
    canvas.drawPath(topCurve, paint);

    final Path bottomCurve = Path();
    bottomCurve.moveTo(size.width, size.height - third);
    bottomCurve.quadraticBezierTo(size.width - third, size.height - third,
        size.width - third, size.height);
    canvas.drawPath(bottomCurve, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
