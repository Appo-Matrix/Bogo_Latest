import 'package:bogo_latest/core/utils/common/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/common/common_widgets/primary_button.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../auth_home/widgets/social_icon_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
          child: Column(
            children: [
              /// Top logo + corner
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(

                  child: Image.asset(
                    BImages.appLogo,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
          SizedBox(height: BSizes.spaceBtwSections),
              /// Form section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    'Create your Account',
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeLIx,
                      weight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: BSizes.spaceBtwSections),

                  /// Phone number field
                  CustomTextField(
                    hintText: 'Your email',
                    svgIcon: SvgPicture.asset(BImages.person),
                  ),
                  SizedBox(height:BSizes.spaceBtwInputFields),
                  /// Password field
                  CustomTextField(
                    hintText: 'Password',
                    svgIcon: SvgPicture.asset(BImages.lock),
                  ),
                  SizedBox(height:BSizes.spaceBtwItems),

                  /// Remember Me + Forgot
                  const LoginOptionsRow(),

                  const SizedBox(height: BSizes.spaceBtwItems),

                  /// Sign In button
                  PrimaryButton(
                    text: 'Sign Up',
                    onPressed: () {
                      // Handle sign in
                    },
                  ),

                  const SizedBox(height: BSizes.spaceBtwSections),

                  /// Social login row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SocialButton(
                          color: BAppColors.facebookContainarColor,
                          iconPath: BImages.facebook,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SocialButton(
                          color: BAppColors.googleContainerColor,
                          iconPath: BImages.google,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SocialButton(
                          color: BAppColors.black1000,
                          iconPath: BImages.iphone,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: BSizes.spaceBtwSections),
                  /// Already have account row
                  Container(
                    width: double.infinity,
                    height: 42,
                    decoration: BoxDecoration(
                      color: BAppColors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Text(
                                'Already have an account ?',
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 18),

                        /// 👉 Custom inline button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push('/registerScreen');
                            },
                            child: Container(
                              height: 42, // match parent container height
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: BAppColors.black1000, // button background
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                'Sign In',
                                style: BAppStyles.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  weight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ✅ Login Options Row with Checkbox
class LoginOptionsRow extends StatefulWidget {
  const LoginOptionsRow({super.key});

  @override
  State<LoginOptionsRow> createState() => _LoginOptionsRowState();
}

class _LoginOptionsRowState extends State<LoginOptionsRow> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Switch(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value;
              });
            },
            activeColor: BAppColors.primary, // dot color when ON
            activeTrackColor: BAppColors.white, // track color when ON
            inactiveThumbColor: BAppColors.white, // dot color when OFF
            inactiveTrackColor:  BAppColors.white.withOpacity(0.2), // track color when OFF
            trackOutlineColor: MaterialStateProperty.all(BAppColors.lightGray300), // 👈 border color
          ),
          Text(
            'Remember me',
            style: BAppStyles.poppins(
              color: BAppColors.white,
              fontSize: 14,
              weight: FontWeight.w400,
            ),
          ),

        ],
      ),
    );
  }
}

