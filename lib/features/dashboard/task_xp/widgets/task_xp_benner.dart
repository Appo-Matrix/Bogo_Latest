import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class XPBanner extends StatelessWidget {
  final PageController pageController;
  const XPBanner({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: BAppColors.backGroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              XPBannerSlide(
                image: BImages.taskImage,
                text: "5 XP for every time you play a game",
              ),
              XPBannerSlide(
                image: BImages.taskImage,
                text: "Earn rewards by completing tasks",
              ),
              XPBannerSlide(
                image: BImages.taskImage,
                text: "Earn rewards by completing tasks",
              ),
            ],
          ),

          /// XP Badge
          Positioned(
            top: 10,
            right: 12,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: BAppColors.warning400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "5 XP",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ),

          /// Page Indicator
          Positioned(
            bottom: 10,
            right: 12,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 4,
                dotWidth: 8,
                activeDotColor: Colors.white,
                dotColor: Colors.white38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class XPBannerSlide extends StatelessWidget {
  final String image;
  final String text;
  const XPBannerSlide({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, height: 80),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: BAppStyles.poppins(
              color: BAppColors.white,
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
