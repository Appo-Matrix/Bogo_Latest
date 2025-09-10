import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      appBar: AppBar(
        backgroundColor: BAppColors.black1000,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: BAppColors.white, size: 26),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Icon(
                Icons.message,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: BAppColors.white, size: 45),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ===== Illustration image =====
            Image.asset(
              BImages.supportIllustration,
              width: double.infinity,
              height: 240,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 65),

            // ===== Support Options =====
            Text(
              "Report a problem",
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: BSizes.fontSizeMd,
                weight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45),
            Text(
              "Report a violation",
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: BSizes.fontSizeMd,
                weight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45),
            Text(
              "Membership request",
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: BSizes.fontSizeMd,
                weight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 28),

            // ===== Query Button =====
            Container(
              width: 191,
              height: 62,
              decoration: BoxDecoration(
                color: BAppColors.black900,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: Text(
                "Query",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: BSizes.fontSizeMd,
                  weight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 55),

            // ===== Start live chat button =====
            Container(
              width: 336,
              height: 92,
              decoration: BoxDecoration(
                color: BAppColors.main,
                borderRadius: BorderRadius.circular(46),
              ),
              alignment: Alignment.center,
              child: Text(
                "Start live chat now",
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: BSizes.fontSizeLg,
                  weight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
