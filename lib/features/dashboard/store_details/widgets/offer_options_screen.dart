import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
class OfferOptionsScreen extends StatelessWidget {
  const OfferOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:BAppColors.black1000.withOpacity(0.5), // background for contrast
      body: DecoratedBox(decoration: BoxDecoration(

        color: Colors.transparent, // background color
      ),
        child: Stack(
          children: [
            Positioned(
              top: 113,
              left: 24,
              child: Container(
                width: 380,
                height: 380,
                decoration: BoxDecoration(
                  color: BAppColors.black1000, // background color
                  borderRadius: BorderRadius.circular(35), // rounded corners
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildOption(
                        icon: Icons.percent,
                        text: "Invite friends to go out",
                        onTap: () {},
                      ),
                      SizedBox(height: 16),

                      _buildOption(
                        icon: Icons.sports_esports,
                        text: "Play a game for the offer",
                        onTap: () {},
                      ),
                      SizedBox(height: 16),

                      _buildOption(
                        icon: Icons.share,
                        text: "Share the offer",
                        onTap: () {},
                      ),
                      SizedBox(height: 16),

                      _buildOption(
                        icon: Icons.report,
                        text: "Report the offer",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildOption({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: BAppColors.white, size: 22),
              SizedBox(width: 12),
              Text(
                text,
                style:  BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: 16,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, color: BAppColors.black100, size: 16),
        ],
      ),
    ),
  );
}
