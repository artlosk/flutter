import 'package:flutter/material.dart';

class Sun extends CustomPainter {
  final double opacity;

  Sun({this.opacity = 1});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.yellow.withOpacity(getOpacity(opacity))
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 3, paint);
  }

  double getOpacity(double value) {
    if (value <= 0.5) {
      return 1;
    }
    return 0;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}