import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(BSizes.cardRadiusLg),
      onTap: onPressed,
      child: Container(
        width: BSizes.imageThumbSize,
        height: BSizes.imageThumbSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(BSizes.cardRadiusLg),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: BAppColors.white,
          size: BSizes.iconMd,
        ),
      ),
    );
  }
}