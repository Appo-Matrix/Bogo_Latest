import 'dart:math';
import 'package:flutter/material.dart';

class RadialDaysPainter extends CustomPainter {
  final double progress; // 0..1
  RadialDaysPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.shortestSide / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final r = c * 0.78;

    // dial ticks
    final tick = Paint()
      ..color = Colors.white24
      ..strokeWidth = 2;
    for (var i = 0; i < 30; i++) {
      final a = (-90 + i * (360 / 30)) * 3.14159 / 180;
      final p1 = center + Offset(r * 0.82 * cos(a), r * 0.82 * sin(a));
      final p2 = center + Offset(r * 0.95 * cos(a), r * 0.95 * sin(a));
      canvas.drawLine(p1, p2, tick);
    }

    // progress arc
    final base = Paint()
      ..color = const Color(0xFF6430D9)
      ..strokeWidth = 18
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: r);
    canvas.drawArc(
        rect, -90 * 3.14159 / 180, 300 * progress * 3.14159 / 180, false, base);

    // end dot
    final endA = (-90 + 300 * progress) * 3.14159 / 180;
    final dot = center + Offset(r * cos(endA), r * sin(endA));
    final dp = Paint()..color = Colors.white;
    canvas.drawCircle(dot, 6, dp);
  }

  @override
  bool shouldRepaint(covariant RadialDaysPainter old) =>
      old.progress != progress;
}
