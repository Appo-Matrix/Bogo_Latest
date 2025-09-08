import 'package:bogo_latest/core/utils/common/common_widgets/primary_button.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: BAppColors.white),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.maybePop(context);
                    }
                  },
                ),
              ),

              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(BImages.authProfileImage),
                backgroundColor: BAppColors.backGroundColor,
              ),
              const SizedBox(height: 40),

              // Title
              Text(
                "OTP code verification",
                style: BAppStyles.poppins(
                  color: Colors.white,
                  fontSize: BSizes.fontSizeLgx,
                  weight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              // Subtitle
              Text(
                "We have sent an OTP code to your PHONE\n0550505050 Enter the code below to verify",
                textAlign: TextAlign.center,
                style: BAppStyles.poppins(
                  color: Colors.white,
                  fontSize: BSizes.fontSizeEaSm,
                  weight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),

              // OTP Fields Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                      (index) => Container(
                    width: 80,
                    height: 92,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: otpControllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: BAppStyles.poppins(
                        color: Colors.white,
                        fontSize: BSizes.fontSizeLgx,
                        weight: FontWeight.bold,
                      ),
                      cursorColor: BAppColors.white,
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Continue Button
              PrimaryButton(
                height: 92,
                width: 336,
                borderRadius: 46,
                backgroundColor: BAppColors.buttonGreen,
                text: 'Continue',
                onPressed: () {
                  context.push('/registerCompleteScreen');
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
