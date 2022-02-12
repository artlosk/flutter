import 'package:flutter/material.dart';

class Rain extends CustomPainter {

  final double opacity;

  Rain({this.opacity = 1});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue.withOpacity(getOpacity(opacity))
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double width = size.width;
    final double height = size.height;

    Path path = Path();
    path.moveTo(width * 0.2, height / 2);
    path.lineTo(width * 0.2 - (width * 0.2) / 2, height / 2 + (height / 2) / 3);

    path.moveTo(width * 0.5, height / 2);
    path.lineTo(width * 0.5 - (width * 0.1), height / 2 + (height / 2) / 3);

    path.moveTo(width * 0.8, height / 2);
    path.lineTo(width * 0.8 - (width * 0.1), height / 2 + (height / 2) / 3);

    canvas.drawPath(path, paint);
  }

  double getOpacity(double value) {
    if(value < 0.7) {
      return 0;
    }

    return 10/3 * value - 7/3;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}