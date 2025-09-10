import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// === your custom themes ===
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
              // ===== Header =====
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: BAppColors.white),
                  ),
                  const SizedBox(width: 260),

                  // profile with green online dot
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: BAppColors.black700, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                              BImages.profile),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: BAppColors.main,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(color: Colors.green, blurRadius: 8)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 15,),
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

              // ===== Grid two columns =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------- LEFT COLUMN --------
                  Column(
                    children: [
                      // Saving cost
                      SizedBox(
                        width: colW,
                        height: 92,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(26)),
                          child: Container(
                            color: const Color(0xFFF9B233), // warm yellow
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(BImages.discount,
                                    width: 46, height: 46, fit: BoxFit.contain),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("saving cost",
                                        style: BAppStyles.poppins(
                                          color:
                                              BAppColors.white.withOpacity(0.9),
                                          fontSize: BSizes.fontSizeSm,
                                          weight: FontWeight.w700,
                                        )),
                                    Text("5600 DA",
                                        style: BAppStyles.poppins(
                                          color: BAppColors.white,
                                          fontSize: BSizes.fontSizeLg,
                                          weight: FontWeight.w900,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      // subscription cost + arc illustration area
                      SizedBox(
                        width: colW,
                        height: 294,
                        child: Container(
                          decoration: _cardDecor(),
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              // amounts
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "1400 DA\n",
                                          style: BAppStyles.poppins(
                                            color: const Color(0xFFFF5D31),
                                            fontSize: BSizes.fontSizeLg,
                                            weight: FontWeight.w900,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "The subscription cost\n\n",
                                          style: BAppStyles.poppins(
                                            color: BAppColors.black400,
                                            fontSize: BSizes.fontSizeSm,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "7000 DA\n",
                                          style: BAppStyles.poppins(
                                            color: const Color(0xFF1EA0FF),
                                            fontSize: BSizes.fontSizeLg,
                                            weight: FontWeight.w900,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "The expended amount",
                                          style: BAppStyles.poppins(
                                            color: BAppColors.black400,
                                            fontSize: BSizes.fontSizeSm,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // decorative arc (bottom-right)
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: CustomPaint(
                                    size: Size(colW * 0.9, 160),
                                    painter: _ArcPainter(),
                                  ),
                                ),
                              ),
                              // coins
                              Positioned(
                                left: 6,
                                bottom: 86,
                                child: Image.asset(BImages.coins,
                                    width: 54, height: 54, fit: BoxFit.contain),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Subscription (radial days + premium)
                      SizedBox(
                        width: colW,
                        height: 356,
                        child: Container(
                          decoration: _cardDecor(),
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              // radial gauge (custom paint)
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomPaint(
                                      size: const Size(
                                          double.infinity, double.infinity),
                                      painter:
                                          _RadialDaysPainter(progress: 14 / 30),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("14",
                                            style: BAppStyles.poppins(
                                              color: BAppColors.white,
                                              fontSize: BSizes.fontSizeESm,
                                              weight: FontWeight.w900,
                                            )),
                                        Text("day",
                                            style: BAppStyles.poppins(
                                              color: BAppColors.black400,
                                              fontSize: BSizes.fontSizeSm,
                                              weight: FontWeight.w700,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Subscription",
                                    style: BAppStyles.poppins(
                                      color: BAppColors.white,
                                      fontSize: BSizes.fontSizeMd,
                                      weight: FontWeight.w800,
                                    )),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: BAppColors.black900,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  children: [
                                    Image.asset(BImages.crown,
                                        width: 28, height: 28),
                                    const SizedBox(width: 10),
                                    Text("premium",
                                        style: BAppStyles.poppins(
                                          color: BAppColors.white,
                                          fontSize: BSizes.fontSizeMd,
                                          weight: FontWeight.w800,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 2),

                  // -------- RIGHT COLUMN --------
                  Column(
                    children: [
                      // Usage (line chart)
                      SizedBox(
                        width: colW,
                        height: 194,
                        child: Container(
                          decoration: _cardDecor(),
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Usage",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.white,
                                    fontSize: BSizes.fontSizeMd,
                                    weight: FontWeight.w800,
                                  )),
                              const SizedBox(height: 8),
                              Expanded(
                                child: LineChart(
                                  LineChartData(
                                    gridData: FlGridData(show: false),
                                    titlesData: FlTitlesData(show: false),
                                    borderData: FlBorderData(show: false),
                                    lineBarsData: [
                                      LineChartBarData(
                                        isCurved: true,
                                        color: BAppColors.black300,
                                        barWidth: 3,
                                        spots: const [
                                          FlSpot(0, 1),
                                          FlSpot(1, 1.6),
                                          FlSpot(2, 1.3),
                                          FlSpot(3, 2.2),
                                          FlSpot(4, 1.8),
                                          FlSpot(5, 2.6),
                                          FlSpot(6, 2.2),
                                          FlSpot(7, 3.0),
                                        ],
                                        dotData: FlDotData(show: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Orders
// Orders
                      SizedBox(
                        width: colW,
                        height: 94,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5D31),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Row(
                            children: [
                              // text side
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Orders",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: BAppStyles.poppins(
                                        color: BAppColors.white,
                                        fontSize: BSizes.fontSizeMd,
                                        weight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "150",
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: BAppStyles.poppins(
                                        color: BAppColors.white,
                                        fontSize: BSizes.fontSizeESm,
                                        weight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              // icon side (hard bounded)
                              SizedBox(
                                width: 44,
                                height: 44,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                    BImages.megaphone,
                                    errorBuilder: (_, __, ___) => const Icon(
                                        Icons.campaign,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Reservation
                      // Reservation
                      SizedBox(
                        width: colW,
                        height: 94,
                        child: Container(
                          decoration: _cardDecor(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Reservation",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: BAppStyles.poppins(
                                        color: BAppColors.white,
                                        fontSize: BSizes.fontSizeMd,
                                        weight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "20",
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: BAppStyles.poppins(
                                        color: BAppColors.white,
                                        fontSize: BSizes.fontSizeESm,
                                        weight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 44,
                                height: 44,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                    BImages.barcode,
                                    errorBuilder: (_, __, ___) => const Icon(
                                        Icons.qr_code,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Consumption (donut)
                      SizedBox(
                        width: colW,
                        height: 351,
                        child: Container(
                          decoration: _cardDecor(),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Expanded(
                                child: PieChart(
                                  PieChartData(
                                    startDegreeOffset: -90,
                                    centerSpaceRadius: 38,
                                    sectionsSpace: 2,
                                    sections: [
                                      PieChartSectionData(
                                        value: 45,
                                        color: const Color(0xFF1EA0FF),
                                      ),
                                      PieChartSectionData(
                                        value: 18,
                                        color: const Color(0xFFFF5D31),
                                      ),
                                      PieChartSectionData(
                                        value: 12,
                                        color: const Color(0xFF8852EE),
                                      ),
                                      PieChartSectionData(
                                        value: 10,
                                        color: const Color(0xFFF4C545),
                                      ),
                                      PieChartSectionData(
                                        value: 15,
                                        color: const Color(0xFF7BD36D),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text("Consumption",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.white,
                                    fontSize: BSizes.fontSizeMd,
                                    weight: FontWeight.w800,
                                  )),
                              const SizedBox(height: 10),
                              // legend
                              Wrap(
                                spacing: 16,
                                runSpacing: 8,
                                children: [
                                  _legendDot(
                                      const Color(0xFF7BD36D), "beauty & spa"),
                                  _legendDot(const Color(0xFFFF5D31), "hotels"),
                                  _legendDot(const Color(0xFF1EA0FF), "sport"),
                                  _legendDot(
                                      const Color(0xFFF4C545), "entertainment"),
                                  _legendDot(BAppColors.white, "restaurants"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
