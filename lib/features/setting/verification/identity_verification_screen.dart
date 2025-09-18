import 'package:bogo_latest/features/setting/verification/widgets/custom_info_tile.dart';
import 'package:bogo_latest/features/setting/verification/widgets/profile%20avater.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() => _IdentityVerificationScreenState();}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    // Responsive values
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamic font sizes
    final titleFont = screenWidth * 0.045; // ~4.5% of width
    final subFont = screenWidth * 0.035;

    // Avatar size responsive
    final avatarRadius = screenWidth * 0.12; // 12% of width

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, // 4% padding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // back button row
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,
                        color: BAppColors.white, size: screenWidth * 0.06),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),

              // Normal Profile Avatar with status + crown
              ProfileAvatar(
                imagePath: BImages.profile,
                radius: avatarRadius,
                showStatus: true,
                showCrown: true,
              ),

              SizedBox(height: screenHeight * 0.015),

              // name + premium text
              Text(
                "AVINASH KUMAR",
                textAlign: TextAlign.center,
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: titleFont,
                  weight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.008),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium,
                      size: screenWidth * 0.04, color: Colors.amber),
                  SizedBox(width: screenWidth * 0.015),
                  Text(
                    "PREMIUM ACCOUNT",
                    style: BAppStyles.poppins(
                      color: BAppColors.black300,
                      fontSize: subFont,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Identity verification
              CustomInfoTile(
                backgroundColor: BAppColors.black900,
                iconBgColor: const Color(0xFFFF6D4D),
                leadingIcon: Icon(Icons.close,
                    color: Colors.white, size: screenWidth * 0.07),
                title: "Identity verification",
                trailing: Icon(Icons.chevron_right,

                    color: Colors.white, size: screenWidth * 0.07),
                onTrailingTap: () {
                  debugPrint("Chevron clicked ✅");
                },
              ),
              SizedBox(height: screenHeight * 0.015),

              // Email
              CustomInfoTile(
                backgroundColor: BAppColors.black900,
                iconBgColor: BAppColors.main,
                leadingIcon: Icon(Icons.check,
                    color: Colors.white, size: screenWidth * 0.07),
                title: "Email",
                subtitle: "abdouplaystor@gmail.com",
                trailing: Icon(Icons.edit_outlined,
                    color: Colors.white, size: screenWidth * 0.055),
                onTrailingTap: () {
                  debugPrint("Chevron clicked ✅");
                },
              ),
              SizedBox(height: screenHeight * 0.015),

              // Phone
              CustomInfoTile(
                backgroundColor: BAppColors.black900,
                iconBgColor: BAppColors.main,
                leadingIcon: Icon(Icons.check,
                    color: Colors.white, size: screenWidth * 0.07),
                title: "Phone",
                subtitle: "05555555555",
                trailing: Icon(Icons.edit_outlined,
                    color: Colors.white, size: screenWidth * 0.055),
                onTrailingTap: () {
                  debugPrint("Chevron clicked ✅");
                },
              ),
              SizedBox(height: screenHeight * 0.015),

              // Facebook
              CustomInfoTile(
                backgroundColor: const Color(0xFF3F51B5),
                iconBgColor: Colors.white.withOpacity(0.18),
                leadingIcon: Image.asset(
                  BImages.facebook,
                  width: screenWidth * 0.06,
                  height: screenWidth * 0.06,
                  color: Colors.white,
                  errorBuilder: (_, __, ___) => Icon(Icons.facebook,
                      color: Colors.white, size: screenWidth * 0.06),
                ),
                title: "Facebook",
                subtitle: "Connect",
                trailing: Container(
                  width: screenWidth * 0.07,
                  height: screenWidth * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.16),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.power_settings_new,
                      color: Colors.white, size: screenWidth * 0.04),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
