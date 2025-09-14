import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/setting/support/widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';


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
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.04),
          child: Column(
            children: [
              // Illustration image responsive
              Image.asset(
                BImages.supportIllustration,
                width: screenW * 0.9,
                height: screenH * 0.28,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenH * 0.07),

              // Support Options (inline)
              Text(
                "Report a problem",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: screenW * 0.045,
                  weight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenH * 0.05),
              Text(
                "Report a violation",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: screenW * 0.045,
                  weight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenH * 0.05),
              Text(
                "Membership request",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: screenW * 0.045,
                  weight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: screenH * 0.035),

              // Query Button
              Container(
                width: screenW * 0.5,
                height: screenH * 0.07,
                decoration: BoxDecoration(
                  color: BAppColors.black900,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Query",
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: screenW * 0.045,
                    weight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: screenH * 0.07),

              // Start live chat button
              Container(
                width: screenW * 0.85,
                height: screenH * 0.1,
                decoration: BoxDecoration(
                  color: BAppColors.main,
                  borderRadius: BorderRadius.circular(46),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Start live chat now",
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: screenW * 0.05,
                    weight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: screenH * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
