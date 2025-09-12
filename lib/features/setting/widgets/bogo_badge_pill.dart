import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';

class BogoBadgePill extends StatelessWidget {
  const BogoBadgePill({
    super.key,
    required this.asset,
    required this.label,
    this.pillColor,
    this.iconBgColor,
    this.textColor,
    this.height = 64,
    this.horizontalPadding = 14,
    this.onTap,
  });

  final String asset;
  final String label;
  final Color? pillColor;
  final Color? iconBgColor;
  final Color? textColor;
  final double height;
  final double horizontalPadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double radius = height / 2;
    final double iconSide = height - 16;
    final double iconRadius = iconSide * 0.32;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: pillColor ?? BAppColors.black900,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 43,
              decoration: BoxDecoration(
                color: iconBgColor ?? const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(iconRadius),
              ),
              padding: EdgeInsets.all(iconSide * 0.16),
              child: Image.asset(asset, fit: BoxFit.contain),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: BAppStyles.poppins(
                  color: textColor ?? Colors.white,
                  fontSize: 12,
                  weight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
