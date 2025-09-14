import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class RotatedLabelColumn extends StatelessWidget {
  final List<String> labels;
  final int activeIndex;

  const RotatedLabelColumn({
    super.key,
    required this.labels,
    this.activeIndex = 0, // jo active hai uska dot main color me hoga
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          final isActive = index == activeIndex;
          return RotatedLabelItem(
            label: labels[index],
            isActive: isActive,
          );
        }),
      ),
    );
  }
}

class RotatedLabelItem extends StatelessWidget {
  final String label;
  final bool isActive;

  const RotatedLabelItem({
    super.key,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? BAppColors.main : BAppColors.black300,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: BAppStyles.poppins(
              color: BAppColors.black900,
              fontSize: BSizes.fontSizeSm,
              weight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
