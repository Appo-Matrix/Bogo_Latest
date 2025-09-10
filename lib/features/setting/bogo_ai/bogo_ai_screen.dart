import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoAiScreen extends StatefulWidget {
  const BogoAiScreen({super.key});

  @override
  State<BogoAiScreen> createState() => _BogoAiScreenState();
}

class _BogoAiScreenState extends State<BogoAiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000, // pure black base
      body: Stack(
        fit: StackFit.expand,
        children: [
          // === Top-left blue glow ===
          Positioned(
            left: -180,
            top: -180,
            child: Container(
              width: 420,
              height: 420,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF0D3A55), // deep bluish glow
                    Colors.transparent,
                  ],
                  radius: 0.95,
                ),
              ),
            ),
          ),

          // === Bottom-right purple glow ===
          Positioned(
            right: -180,
            bottom: -180,
            child: Container(
              width: 460,
              height: 460,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF6A3CF4), // vibrant purple
                    Colors.transparent,
                  ],
                  radius: 0.95,
                ),
              ),
            ),
          ),

          // === Back arrow ===
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: BAppColors.white, size: 28),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),

          // === Center content ===
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // orb
                  Image.asset(
                    BImages.bogoAi,
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 55),

                  // text + logo
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hi I am ",
                              style: BAppStyles.poppins(
                                color: BAppColors.white,
                                fontSize: BSizes.fontSizeLgx,
                                weight: FontWeight.w800,
                              ),
                            ),
                            Image.asset(
                              BImages.appLogo,
                              height: 70,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        Text(
                          "Your Voice Assistant",
                          style: BAppStyles.poppins(
                            color: BAppColors.white.withOpacity(0.8),
                            fontSize: BSizes.fontSizeLg,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 60),

                  // start button with glow
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: BAppColors.main.withOpacity(0.6),
                          blurRadius: 50,
                          spreadRadius: 6,
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () {},
                      child: Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          color: BAppColors.main,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.chevron_right,
                            color: BAppColors.white, size: 36),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
