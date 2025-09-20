import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(BImages.rewardImage, height: 70),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Secure first place and win a one-month subscription",
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: 14,
                weight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward_ios,
              color: Colors.white, size: 16),
        ],
      ),
    );
  }
}
