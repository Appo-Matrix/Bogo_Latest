import 'package:bogo_latest/features/setting/bogo_ai/widgets/bogo_glow_widget.dart';
import 'package:bogo_latest/features/setting/bogo_ai/widgets/bogo_intro_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';

class BogoAiScreen extends StatefulWidget {
  const BogoAiScreen({super.key});

  @override
  State<BogoAiScreen> createState() => _BogoAiScreenState();
}

class _BogoAiScreenState extends State<BogoAiScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gradient Colors
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0D3A55), // deep blue
                  Color(0xFF050505), // dark base (blackish)
                  Color(0xFF6A3CF4), // purple
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
          ),

          // Back arrow
          Positioned(
            top: screenHeight * 0.02,
            left: screenWidth * 0.04,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: BAppColors.white, size: screenWidth * 0.07),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),

          // Center content
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// orb
                  Image.asset(
                    BImages.bogoAi,
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.45,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.06),

                  // text + logo
                  BogoIntroText(
                    title: "Hi I am ",
                    subtitle: "Your Voice Assistant",
                  ),

                  SizedBox(height: screenHeight * 0.07),

                  // start button with glow
                  BogoGlowButton(
                    size: screenWidth * 0.22,
                    onTap: () {
                      // navigate or action
                    },
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
