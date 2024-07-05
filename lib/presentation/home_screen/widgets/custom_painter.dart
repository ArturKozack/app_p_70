import 'package:app_p_70/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.1393728);
    path_0.cubicTo(size.width, size.height * 0.06239930, size.width * 0.9528711,
        0, size.width * 0.8947368, 0);
    path_0.lineTo(size.width * 0.1052632, 0);
    path_0.cubicTo(size.width * 0.04712789, 0, 0, size.height * 0.06239930, 0,
        size.height * 0.1393728);
    path_0.lineTo(0, size.height * 0.8606272);
    path_0.cubicTo(0, size.height * 0.9375993, size.width * 0.04712789,
        size.height, size.width * 0.1052632, size.height);
    path_0.lineTo(size.width * 0.6763158, size.height);
    path_0.cubicTo(
        size.width * 0.7344500,
        size.height,
        size.width * 0.7815789,
        size.height * 0.9375993,
        size.width * 0.7815789,
        size.height * 0.8606272);
    path_0.lineTo(size.width * 0.7815789, size.height * 0.8501742);
    path_0.cubicTo(
        size.width * 0.7815789,
        size.height * 0.7732021,
        size.width * 0.8287079,
        size.height * 0.7108014,
        size.width * 0.8868421,
        size.height * 0.7108014);
    path_0.lineTo(size.width * 0.8947368, size.height * 0.7108014);
    path_0.cubicTo(size.width * 0.9528711, size.height * 0.7108014, size.width,
        size.height * 0.6484007, size.width, size.height * 0.5714286);
    path_0.lineTo(size.width, size.height * 0.1393728);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = theme.colorScheme.onPrimaryContainer.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
