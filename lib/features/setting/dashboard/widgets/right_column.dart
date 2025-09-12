import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class RightColumn extends StatelessWidget {
  final double width;

  const RightColumn({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ===== Usage (line chart) =====
        SizedBox(
          width: width,
          height: 194,
          child: Container(
            decoration: BoxDecoration(
              color: BAppColors.black900,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Usage",
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: BSizes.fontSizeMd,
                    weight: FontWeight.w800,
                  ),
                ),
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

        // ===== Orders =====
        SizedBox(
          width: width,
          height: 94,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFF5D31),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                // icon side
                SizedBox(
                  width: 44,
                  height: 44,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      BImages.megaphone,
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.campaign, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),

        // ===== Reservation =====
        SizedBox(
          width: width,
          height: 94,
          child: Container(
            decoration: BoxDecoration(
              color: BAppColors.black900,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.qr_code, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),

        // ===== Consumption (donut) =====
        SizedBox(
          width: width,
          height: 351,
          child: Container(
            decoration: BoxDecoration(
              color: BAppColors.black900,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
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
                        PieChartSectionData(value: 45, color: const Color(0xFF1EA0FF)),
                        PieChartSectionData(value: 18, color: const Color(0xFFFF5D31)),
                        PieChartSectionData(value: 12, color: const Color(0xFF8852EE)),
                        PieChartSectionData(value: 10, color: const Color(0xFFF4C545)),
                        PieChartSectionData(value: 15, color: const Color(0xFF7BD36D)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Consumption",
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: BSizes.fontSizeMd,
                    weight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: const [
                    LegendDot(color: Color(0xFF7BD36D), label: "beauty & spa"),
                    LegendDot(color: Color(0xFFFF5D31), label: "hotels"),
                    LegendDot(color: Color(0xFF1EA0FF), label: "sport"),
                    LegendDot(color: Color(0xFFF4C545), label: "entertainment"),
                    LegendDot(color: Colors.white, label: "restaurants"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Legend Dot
class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
