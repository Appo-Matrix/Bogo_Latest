import 'package:bogo_latest/core/utils/common/common_widgets/primary_button.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class RegisterCompleteScreen extends StatelessWidget {
  const RegisterCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.backGroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ///  Main Column (Background + Text + Button)
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: double.infinity,
                      child: ClipRRect(
                        child: Image.asset(
                          BImages.authBackground,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // ⬅️ Back Button
                    Positioned(
                      top: 16,
                      left: 16,
                      child: GestureDetector(
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.maybePop(context);
                          }
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: BAppColors.backGroundColor,
                          size: 24,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 24,
                      top: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register\nComplete !",
                            style: BAppStyles.poppins(
                              color: Colors.white,
                              fontSize: BSizes.fontSizeLhx,
                              weight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "You have successfully created\nyour account.",
                            style: BAppStyles.poppins(
                              color: Colors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                PrimaryButton(
                  height: 92,
                  width: 336,
                  borderRadius: 46,
                  backgroundColor: BAppColors.buttonGreen,
                  text: 'Continue',
                  onPressed: () {
                    // TODO: Next screen navigation
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),

            ///  Center Positioned Profile Image with Glow
            Positioned(
              top: MediaQuery.of(context).size.height * 0.43,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.white.withOpacity(0.30),
                          Colors.transparent,
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: BAppColors.backGroundColor,
                    backgroundImage: AssetImage(BImages.completeScreen),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
