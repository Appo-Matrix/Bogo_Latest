import 'package:bogo_latest/features/setting/about/about_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../widgets/bogo_badge_pill.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Stack(
          children: [
            // Right tilted phone mock
            Positioned(
              right: 1,
              bottom: 0,
              child: Transform.rotate(
                angle: -0.02,
                child: Image.asset(
                  BImages.phoneMock,
                  height: 420,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, color: BAppColors.white),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Settings",
                        style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: BSizes.fontSizeLg,
                          weight: FontWeight.w900,
                        ),
                      ),
                      const Spacer(),

                      // Light toggle
                      GestureDetector(
                        onTap: () => setState(() => _light = true),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _light ? BAppColors.main : BAppColors.black900,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wb_sunny_rounded,
                                  size: 18,
                                  color: _light ? BAppColors.white : BAppColors.black300),
                              const SizedBox(height: 3),
                              Text(
                                "Light",
                                style: BAppStyles.poppins(
                                  color: _light ? BAppColors.white : BAppColors.black300,
                                  fontSize: BSizes.fontSizeSm,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Dark toggle
                      GestureDetector(
                        onTap: () => setState(() => _light = false),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: !_light ? BAppColors.main : BAppColors.black900,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.nightlight_round,
                                  size: 18,
                                  color: !_light ? BAppColors.white : BAppColors.black300),
                              const SizedBox(height: 3),
                              Text(
                                "Dark",
                                style: BAppStyles.poppins(
                                  color: !_light ? BAppColors.white : BAppColors.black300,
                                  fontSize: BSizes.fontSizeSm,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Profile card
                  Container(
                    width: 381,
                    height: 105,
                    decoration: BoxDecoration(
                      color: BAppColors.black900,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 25),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(BImages.profile),
                            ),
                            Positioned(
                              right: -4,
                              top: 4,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF63E06E),
                                  shape: BoxShape.circle,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.green, blurRadius: 8),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AVINASH KUMAR",
                              style: BAppStyles.poppins(
                                color: BAppColors.white,
                                fontSize: BSizes.fontSizeMd,
                                weight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Image.asset(BImages.crown, width: 16, height: 16),
                                const SizedBox(width: 6),
                                Text(
                                  "PREMIUM ACCOUNT",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.black400,
                                    fontSize: BSizes.fontSizeSm,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Pills row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BogoBadgePill(
                        asset: BImages.emojiFace,
                        label: '2000 XP',
                        pillColor: BAppColors.black900,
                        iconBgColor: BAppColors.black500,
                      ),
                      BogoBadgePill(
                        asset: BImages.emojiFace,
                        label: 'Friends',
                        pillColor: BAppColors.black900,
                        iconBgColor: Colors.red,
                      ),
                      BogoBadgePill(
                        asset: BImages.emojiFace,
                        label: 'Booking',
                        pillColor: BAppColors.black900,
                        iconBgColor: BAppColors.blue700,
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  /// Menu inline with onTap (currently placeholders)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Navigate to Dashboard screen
                          },
                          child: Row(
                            children: [
                              Icon(Icons.home_rounded, color: BAppColors.white, size: 22),
                              const SizedBox(width: 18),
                              Text(
                                "Dashboard",
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Navigate to Identity Verification screen
                          },
                          child: Row(
                            children: [
                              Icon(Icons.verified_user_rounded, color: BAppColors.white, size: 22),
                              const SizedBox(width: 18),
                              Text(
                                "Identity verification",
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Navigate to Language screen
                          },
                          child: Row(
                            children: [
                              Icon(Icons.language_rounded, color: BAppColors.white, size: 22),
                              const SizedBox(width: 18),
                              Text(
                                "Language",
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.info_rounded, color: BAppColors.white, size: 22),
                              const SizedBox(width: 18),
                              Text(
                                "About us",
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Contact us (badge closer to text)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Icon(Icons.chat_bubble_rounded,
                                      color: BAppColors.white, size: 22),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 18),
                              Text(
                                "Contact us",
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: BAppColors.main,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "1",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.white,
                                    fontSize: BSizes.fontSizeSm,
                                    weight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Row(
                            children: [
                              Icon(Icons.power_settings_new_rounded,
                                  color: Colors.white.withOpacity(0.9), size: 22),
                              const SizedBox(width: 18),
                              Text(
                                "Sign Out",
                                style: BAppStyles.poppins(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),

            /// Bottom-left orb (tight to corner)
            Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    BImages.bogoAi,
                    width: 58,
                    height: 58,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "BOGO",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w800,
                    ),
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
