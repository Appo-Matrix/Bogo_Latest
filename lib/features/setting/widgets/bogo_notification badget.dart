import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';


class BogoNotificationBadge extends StatelessWidget {
  const BogoNotificationBadge({
    super.key,
    this.count = 1,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: BAppColors.main,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        "$count",
        style: BAppStyles.poppins(
          color: BAppColors.white,
          fontSize: BSizes.fontSizeSm,
          weight: FontWeight.w800,
        ),
      ),
    );
  }
}
