import 'package:flutter/material.dart';

class RibbonEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 400), // Adjust height
          painter: RibbonPainter(),
        ),
      ),
    );
  }
}

class RibbonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Drawing multiple layered waves to simulate 3D effect

    // Define some colors for depth effect
    final colors = [
      Colors.red.withOpacity(0.6),
      Colors.orange.withOpacity(0.6),
      Colors.yellow.withOpacity(0.6),
      Colors.green.withOpacity(0.6),
      Colors.blue.withOpacity(0.6),
      Colors.purple.withOpacity(0.6),
    ];

    // Define the number of layers
    int layers = colors.length;

    for (int i = 0; i < layers; i++) {
      final paint = Paint()
        ..shader = LinearGradient(
          colors: [
            colors[i],
            colors[(i + 1) % layers],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..style = PaintingStyle.fill;

      final path = Path();
      _drawRibbonPath(path, size, i * 20.0);
      canvas.drawPath(path, paint);
    }
  }

  void _drawRibbonPath(Path path, Size size, double yOffset) {
    path.moveTo(0, size.height * 0.5 + yOffset);

    for (int i = 0; i < size.width.toInt(); i += 100) {
      path.quadraticBezierTo(
        i + 50.0,
        size.height * (i % 2 == 0 ? 0.6 : 0.4) + yOffset,
        i + 100.0,
        size.height * 0.5 + yOffset,
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
