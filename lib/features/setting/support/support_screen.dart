import 'package:bogo_latest/core/utils/common/common_widgets/primary_button.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/setting/support/widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BAppColors.black1000,

      // Custom App Bar
      appBar: CustomActionAppBar(
        onBack: () => Navigator.pop(context),
        onMessage: () => print("Message tapped!"),
        onCall: () => print("Call tapped!"),
        onMore: () => print("More tapped!"),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: BSizes.md),
          child: Column(
            children: [
              // Illustration image responsive
              Image.asset(
                BImages.supportIllustration,
                width: screenW * 0.9,
                height: screenH * 0.28,
                fit: BoxFit.contain,
              ),
              SizedBox(height: BSizes.size60,),

              // Support Options (inline)
              Text(
                "Report a problem",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: BSizes.spaceBtwSections,),
              Text(
                "Report a violation",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: BSizes.spaceBtwSections,),
              Text(
                "Membership request",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: BSizes.spaceBtwSections,),

              // Query Button
              Container(
                width: screenW * 0.5,
                height: screenH * 0.07,
                decoration: BoxDecoration(
                  color: BAppColors.black600,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Query",
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: 14,
                    weight: FontWeight.w600,
                  ),
                ),
              ),

SizedBox(height: BSizes.spaceBtwSections),

              PrimaryButton(
                height: 92,
                width: 336,
                borderRadius: 46,
                backgroundColor: BAppColors.buttonGreen,
                text: 'Start Live Chat now',
                onPressed: () {
                  context.push('/liveChattingScreen');

                },
              ),

              SizedBox(height: screenH * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
