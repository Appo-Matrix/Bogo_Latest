import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/setting/about/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bogo_ai_badge.dart';
import '../widgets/bogo_badge_pill.dart';
import '../widgets/bogo_menu_item.dart';
import '../widgets/bogo_toggle_button.dart';
import '../widgets/profile_card.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _light = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Stack(
          children: [
            // Right tilted phone mock (responsive)
            Positioned(
              right: 0,
              bottom: screenHeight * 0.25,
              child: Transform.rotate(
                angle: -0.02,
                child: Image.asset(
                  BImages.phoneMock,
                  height: screenWidth * 0.85,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Content
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                16,
                6,
                16,
                screenHeight * 0.18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, color: BAppColors.white),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "Settings",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BAppStyles.poppins(
                            color: BAppColors.white,
                            fontSize: BSizes.fontSizeLg,
                            weight: FontWeight.w900,
                          ),
                        ),
                      ),
                      BogoToggleButton(
                        label: "Light",
                        icon: Icons.light_mode,
                        selected: _light == true,
                        onTap: () => setState(() => _light = true),
                      ),
                      const SizedBox(width: 10),
                      BogoToggleButton(
                        label: "Dark",
                        icon: Icons.dark_mode,
                        selected: _light == false,
                        onTap: () => setState(() => _light = false),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Profile card
                  ProfileCard(
                    name: "AVINASH KUMAR",
                    accountType: "PREMIUM ACCOUNT",
                 onTap: (){
                   context.push('/identityVerificationScreen');

                 },
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // Pills row
                  Row(
                    children: [
                      Expanded(
                        child: BogoBadgePill(
                          asset: BImages.emojiFace,
                          label: '2000 XP',
                          pillColor: BAppColors.black900,
                          iconBgColor: BAppColors.black500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: BogoBadgePill(
                          asset: BImages.emojiFace,
                          label: 'Friends',
                          pillColor: BAppColors.black900,
                          iconBgColor: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: BogoBadgePill(
                          asset: BImages.emojiFace,
                          label: 'Booking',
                          pillColor: BAppColors.black900,
                          iconBgColor: BAppColors.blue700,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Menu options
                  ...[
                    BogoMenuItem(
                      icon: Icons.home_rounded,
                      title: "Dashboard",
                      onTap: () {
                        context.push('/settingDashboardScreen');

                      },
                    ),
                    BogoMenuItem(
                      icon: Icons.verified_user_rounded,
                      title: "Identity verification",
                      onTap: () {
                        context.push('/faceVerificationScreen');
                      },
                    ),
                    BogoMenuItem(
                      icon: Icons.language_rounded,
                      title: "Language",
                      onTap: () {
                        context.push('/languageScreen');
                      },
                    ),
                    BogoMenuItem(
                      icon: Icons.info_rounded,
                      title: "About us",
                      onTap: () {
                       context.push('/aboutScreen');
                      },
                    ),
                    BogoMenuItem(
                      icon: Icons.chat_bubble_rounded,
                      title: "Contact us",
                      onTap: () {
                        context.push('/supportScreen');

                      },
                    ),
                    BogoMenuItem(
                      icon: Icons.power_settings_new_rounded,
                      title: "Sign Out",
                      onTap: () {
                        context.push('/shareRewardScreen');
                      },
                    ),
                  ],
                ],
              ),
            ),

            // Bottom-left orb (fixed position, responsive)
            BogoAiBadge(
              onTap: () {
                context.push('/bogoAiScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
