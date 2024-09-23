import 'dart:math';

import 'package:flutter/material.dart';

class MinimalistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, // Minimalist background
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
              itemBuilder: (context, index) => MinimalistTile(),
            ),
          ),
        ),
      );
}

class MinimalistTile extends StatefulWidget {
  @override
  _MinimalistTileState createState() => _MinimalistTileState();
}

class _MinimalistTileState extends State<MinimalistTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  static const double _minScale = 0.95;
  static const double _maxScale = 1.05;
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
      child: MinimalistTileWidget(),
    );
  }
}

class MinimalistTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomRotation =
        Random().nextBool() ? pi / 4 : 0.0; // Diagonal effect

    return SizedBox(
      width: 50,
      height: 50,
      child: Transform.rotate(
        angle: randomRotation,
        child: CustomPaint(
          painter: MinimalistPainter(),
        ),
      ),
    );
  }
}

class MinimalistPainter extends CustomPainter {
  static const double strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.shade300 // Soft minimalist color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    _drawDiagonalLine(canvas, size, paint);
  }

  void _drawDiagonalLine(Canvas canvas, Size size, Paint paint) {
    final Path diagonal = Path();
    diagonal.moveTo(0, 0);
    diagonal.lineTo(size.width, size.height); // Simple diagonal line

    canvas.drawPath(diagonal, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
