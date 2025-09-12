import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class BogoAiBadge extends StatelessWidget {
  final String title;
  final String imagePath;

  const BogoAiBadge({
    super.key,
    this.title = "BOGO",
    this.imagePath = BImages.bogoAi,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomLeft,
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: screenWidth * 0.04,
                weight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
