import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final base = Paint()
      ..color = const Color(0xFF3A3A3A)
      ..strokeWidth = 22
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final blue = Paint()
      ..color = const Color(0xFF1EA0FF)
      ..strokeWidth = 22
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final orange = Paint()
      ..color = const Color(0xFFFF5D31)
      ..strokeWidth = 22
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const start = 3.6; // radians
    const sweep = 2.6;

    canvas.drawArc(rect, start, sweep, false, base);
    canvas.drawArc(rect, start + 0.5, sweep * 0.55, false, blue);
    canvas.drawArc(rect, start + sweep * 0.1, sweep * 0.35, false, orange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
