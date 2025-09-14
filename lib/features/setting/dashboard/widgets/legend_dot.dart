import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizing
    final dotSize = (screenWidth * 0.025).clamp(8, 16).toDouble();
    final fontSize = (screenWidth * 0.035).clamp(10, 16).toDouble();
    final spacing = (screenWidth * 0.015).clamp(4, 12).toDouble();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: spacing),
        Text(
          label,
          style: BAppStyles.poppins(
            color: BAppColors.black300,
            fontSize: fontSize,
            weight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
