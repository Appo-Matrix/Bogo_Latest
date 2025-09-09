import 'package:bogo_latest/core/utils/common/common_widgets/custom_text_field.dart';
import 'package:bogo_latest/core/utils/common/common_widgets/primary_button.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: BAppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // Profile Picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(BImages.authProfileImage),
                  backgroundColor: BAppColors.backGroundColor,
                ),
                const SizedBox(height: 40),

                // Username
                CustomTextField(
                  hintText: "afif000",
                  imageProvider: AssetImage(BImages.person),
                  controller: usernameCtrl,
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),

                // Full Name
                CustomTextField(
                  hintText: "afif behloui",
                  imageProvider: AssetImage(BImages.card),
                  controller: fullNameCtrl,
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),

                // Email
                CustomTextField(
                  hintText: "email@gmail.com",
                  imageProvider: AssetImage(BImages.message),
                  controller: emailCtrl,
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),

                // Phone
                CustomTextField(
                  hintText: "0555445544",
                  imageProvider: AssetImage(BImages.phone),

                  controller: phoneCtrl,
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),

                // Password with toggle
                CustomTextField(
                  hintText: "********",
                  imageProvider: AssetImage(BImages.lock), // left side image
                  controller: passwordCtrl,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton( // right side eye toggle
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: BAppColors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 50), // spacing before button

                // Continue Button
                PrimaryButton(
                  height: 92,
                  width: 336,
                  borderRadius: 46,
                  backgroundColor: BAppColors.buttonGreen,
                  text: 'Continue',
                  onPressed: () {
                    context.push('/otpVerificationScreen');
                  },
                ),

                const SizedBox(height: 30), // bottom safe padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
