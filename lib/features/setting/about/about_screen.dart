import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/setting/about/widgets/bogo_about_faq_content.dart';
import 'package:bogo_latest/features/setting/about/widgets/bogo_pills_button.dart';
import 'package:flutter/material.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool showFAQ = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back button + heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: BAppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      showFAQ ? "FAQ" : "About us",
                      overflow: TextOverflow.ellipsis,
                      style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: screenWidth * 0.06, // responsive font
                        weight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              /// Logo and pills row
              Row(
                children: [
                  Image.asset(
                    BImages.appLogo, // 🔥 direct use, no extra class
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.05,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: screenWidth * 0.04),

                  /// About Us button
                  BogoPillButton(
                    isActive: !showFAQ,
                    label: "About Us",
                    icon: Icons.info,
                    onTap: () => setState(() => showFAQ = false),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(width: screenWidth * 0.03),

                  /// FAQ button
                  BogoPillButton(
                    isActive: showFAQ,
                    label: "FAQ",
                    icon: Icons.help_outline,
                    onTap: () => setState(() => showFAQ = true),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              /// Content (About us / FAQ)
              BogoAboutFaqContent(
                showFAQ: showFAQ,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
