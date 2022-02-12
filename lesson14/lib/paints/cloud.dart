import 'package:flutter/material.dart';

class Cloud extends CustomPainter {

  final double opacity;

  Cloud({this.opacity = 1});

  @override
  void paint(Canvas canvas, Size size) {
    var color = opacity > 0.5 ? getColor(opacity) : getColor(opacity).withOpacity(getOpacity(opacity));
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    path.moveTo(width * 0.1, height * 0.55);
    path.cubicTo(width * 0.1, height * 0.55, width - width / 0.95,
        height / 2.25, width * 0.05, height / 3);
    path.cubicTo(width * 0.1, height * 0.299, width * 0.175, height * 0.38,
        width * 0.259, height * 0.365);
    path.cubicTo(width * 0.285, height / 3, width * 0.55, height * 0.1,
        width * 0.755, height * 0.395);
    path.cubicTo(width * 0.7, height * 0.395, width / 1.25, height / 2.8,
        width * 0.859, height * 0.36);
    path.cubicTo(width * 0.9, height * 0.35, width * 1.1, height / 2.25,
        width * 0.9, height * 0.55);
    path.cubicTo(width * 0.9, height * 0.55, width * 0.45, height / 1.25,
        width * 0.099, height * 0.549);
    path.close();
    canvas.drawPath(path, paint);
  }

  double getOpacity(double value) {

    if(value >= 0.5) {
      return 1;
    }

    if (value < 0.2) {
      return  0;
    }

    return 10/3 * (value + 0.5) - 7/3;
  }

  getColor(double value) {
    if(value <= 0.5) {
      return Colors.grey;
    }

    if (value > 0.5 && value <= 0.6) {
      return Colors.grey[600];
    } else if (value > 0.6 && value <= 0.7) {
      return Colors.grey[700];
    } else if (value > 0.7) {
      return Colors.grey[800];
    }

    return Colors.grey[600];
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}