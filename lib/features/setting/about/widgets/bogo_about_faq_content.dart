import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoAboutFaqContent extends StatelessWidget {
  final bool showFAQ;
  final double screenWidth;
  final double screenHeight;

  const BogoAboutFaqContent({
    super.key,
    required this.showFAQ,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!showFAQ)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: EdgeInsets.all(screenWidth * 0.045),
                child: Text(
                  "bogo is a lifestyle application that provides incentive offers (BOGO-X% -2for3) "
                      "of well-known brands for dining, entertainment, leisure, beauty and hotels in all over Algeria. "
                      "Valid 7 days a week (excluding public holidays) and their length. "
                      "Our app is set with a lot of great features that will make your experience more fun! "
                      "It's easy to use and you have always your offers with you. "
                      "Offers are added monthly, exclusive from new traders every month. "
                      "You can share these amazing shows by sharing with family and friends.",
                  textAlign: TextAlign.justify,
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: screenWidth * 0.035,
                    weight: FontWeight.w600,
                    height: 3,
                  ),
                ),
              ),
            if (showFAQ)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: Text(
                      "Q${index + 1}: This is a temporary FAQ question?",
                      style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: screenWidth * 0.04,
                        weight: FontWeight.w600,
                        height: 3,


                      ),
                    ),
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }
}
