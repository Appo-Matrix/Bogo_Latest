import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoIntroText extends StatelessWidget {
  final String title;
  final String subtitle;

  const BogoIntroText({
    super.key,
    this.title = "Hi I am ",
    this.subtitle = "Your Voice Assistant",
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: screenWidth * 0.06,
                    weight: FontWeight.w800,
                  ),
                ),
              ),
              Image.asset(
                BImages.appLogo,
                height: screenHeight * 0.07,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            style: BAppStyles.poppins(
              color: BAppColors.white.withOpacity(0.8),
              fontSize: screenWidth * 0.045,
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
