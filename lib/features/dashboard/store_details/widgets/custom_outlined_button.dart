import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final String assetPath;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;

  const CustomOutlinedButton({
    super.key,
    required this.label,
    required this.assetPath,
    this.onPressed,
    this.borderColor = BAppColors.black1000,
    this.textColor = BAppColors.black1000,
    this.width = 146,
    this.height = 62,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(BSizes.borderRadiusLg * 2),
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(BSizes.borderRadiusLg * 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: BSizes.iconLg,
              width: BSizes.iconLg,
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: BSizes.sm),
            Text(
              label,
              style: BAppStyles.poppins(
                color: textColor,
                fontSize: BSizes.fontSizeSm,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
