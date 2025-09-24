import 'package:bogo_latest/core/utils/common/common_widgets/primary_button.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ShareRewardScreen extends StatelessWidget {
  const ShareRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Top Bar (Back + XP Badge)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Back Button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: BAppColors.white),
                        onPressed: () => Navigator.pop(context),
                      ),

                      /// XP Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: BAppColors.warning400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.stars,
                                color: Colors.white, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              "50 XP",
                              style: BAppStyles.poppins(
                                color: BAppColors.white,
                                fontSize: 14,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// Banner Image
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: BAppColors.backGroundColor,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      BImages.advertistmentImage,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(
                    height: BSizes.spaceBtwSections,
                  ),

                  /// Continue Button
                  PrimaryButton(
                    height: 92,
                    width: 336,
                    borderRadius: 46,
                    backgroundColor: BAppColors.buttonGreen,
                    text: 'Share',
                    onPressed: () {
                      // TODO: navigation / share
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
