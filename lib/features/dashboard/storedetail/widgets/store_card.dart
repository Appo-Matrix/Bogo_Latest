import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_strings.dart';
class StoreCard extends StatefulWidget {
  const StoreCard({super.key});

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    BImages.pizza,
    BImages.appLoge,
    BImages.pizza,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BSizes.cardRadiusLg * 2),
      ),
      child: Stack(
        children: [
          /// Swipeable Images
          ClipRRect(
            borderRadius: BorderRadius.circular(BSizes.cardRadiusLg * 2),
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return Image.asset(images[index], fit: BoxFit.cover);
              },
            ),
          ),

          /// Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BSizes.cardRadiusLg * 2),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// Favorite icon
          Positioned(
            top: BSizes.sm,
            right: BSizes.md,
            child: Icon(Icons.favorite, color: BAppColors.white, size: BSizes.iconMd),
          ),
          SizedBox(height: 10,),

          /// Rating badge
          Positioned(
            top: BSizes.fontSizeLIx,
            right: BSizes.md,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: BSizes.sm,
                vertical: BSizes.xs,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(BSizes.borderRadiusMd),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: BAppColors.warning500, size: BSizes.iconSm),
                  SizedBox(width: BSizes.xs),
                  Text(
                    AppStrings.review,
                    style: TextStyle(
                      color: BAppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: BSizes.fontSizeSm,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Store info (bottom left)
          Positioned(
            bottom: BSizes.lg * 2,
            left: BSizes.md,
            right: BSizes.md,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: BSizes.buttonWidth / 2,
                  width: BSizes.buttonWidth / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BSizes.borderRadiusLg * 2),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      BImages.appLoge,
                      color: BAppColors.main,
                    ),
                  ),
                ),
                SizedBox(width: BSizes.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.storeName,
                      style: TextStyle(
                        color: BAppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: BSizes.fontSizeLg,
                      ),
                    ),
                    SizedBox(height: BSizes.xs),
                    Row(
                      children: const [
                        Icon(Icons.location_on,
                            color: BAppColors.white, size: BSizes.iconSm),
                        SizedBox(width: BSizes.xs),
                        Text(
                          AppStrings.location,
                          style: TextStyle(
                            color: BAppColors.lightGray200,
                            fontSize: BSizes.fontSizeSm,
                          ),
                        ),
                        SizedBox(width: BSizes.xs),
                        Text(
                          AppStrings.areaName,
                          style: TextStyle(
                            color: BAppColors.lightGray200,
                            fontSize: BSizes.fontSizeSm,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Page Indicator
          Positioned(
            bottom: BSizes.md,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: BSizes.xs),
                  width: BSizes.xs * 2,
                  height: BSizes.xs * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? BAppColors.main
                        :BAppColors.black600,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}