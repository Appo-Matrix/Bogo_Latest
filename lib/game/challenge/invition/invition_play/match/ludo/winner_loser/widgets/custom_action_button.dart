import 'package:flutter/material.dart';
import '../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../../../../core/utils/constants/app_styles.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color bgColor;
  final double width;

  const CustomActionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(46),
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(46),
          child: Text(
            text,
            style: BAppStyles.poppins(
              color: BAppColors.white,
              fontSize: BSizes.fontSizeSmx,
              weight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
