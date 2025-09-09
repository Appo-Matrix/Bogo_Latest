import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class OnboardingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const OnboardingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 70;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Card background
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(24, 24, 24,60),
            decoration: BoxDecoration(
              color: BAppColors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: BAppStyles.poppins(
                    color: BAppColors.white.withOpacity(0.9),
                    fontSize: BSizes.fontSizeLg,
                    weight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  style: BAppStyles.poppins(
                    color: BAppColors.white.withOpacity(0.9),
                    fontSize: BSizes.fontSizeESm,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Overlapping button - fully clickable
          Positioned(
            bottom: -(buttonSize * 0.75),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent, // ✅ ensures whole area is tappable
              onTap: onNext,
              child: Container(
                width: buttonSize,
                height: buttonSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    color: BAppColors.backGroundColor,
                    width: 5,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
