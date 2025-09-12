import 'dart:math';

import 'package:bogo_latest/features/setting/dashboard/widgets/custom_app_bar.dart';
import 'package:bogo_latest/features/setting/dashboard/widgets/left_column.dart';
import 'package:bogo_latest/features/setting/dashboard/widgets/right_column.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class SettingDashboardScreen extends StatefulWidget {
  const SettingDashboardScreen({super.key});

  @override
  State<SettingDashboardScreen> createState() => _SettingDashboardScreenState();
}

class _SettingDashboardScreenState extends State<SettingDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double colW = (w - 16 /*left*/ - 16 /*right*/ - 2 /*gap*/ - 0.5) / 2;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              CustomAppBar(
                profileImage: BImages.profile,
                onBack: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "Dashboard",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.xl,
                      weight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Grid two columns
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LEFT COLUMN
                  LeftColumn(width: colW),

                  const SizedBox(width: 2),

                  // RIGHT COLUMN
                  RightColumn(width: colW)
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ===== helpers inline =====
  BoxDecoration _cardDecor() => BoxDecoration(
        color: BAppColors.black900,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      );

  Widget _legendDot(Color c, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label,
            style: BAppStyles.poppins(
              color: BAppColors.black300,
              fontSize: BSizes.fontSizeSm,
              weight: FontWeight.w700,
            )),
      ],
    );
  }
}

// ===== custom painters (inline) =====
class _ArcPainter extends CustomPainter {
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

    // grey trail
    canvas.drawArc(rect, start, sweep, false, base);
    // blue segment
    canvas.drawArc(rect, start + 0.5, sweep * 0.55, false, blue);
    // orange head
    canvas.drawArc(rect, start + sweep * 0.1, sweep * 0.35, false, orange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RadialDaysPainter extends CustomPainter {
  final double progress; // 0..1
  _RadialDaysPainter({required this.progress});

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
  bool shouldRepaint(covariant _RadialDaysPainter old) =>
      old.progress != progress;
}
