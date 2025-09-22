import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_styles.dart';
import '../../../../../core/utils/constants/app_sizes.dart';

class ActionTile extends StatelessWidget {
  final String assetPath;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const ActionTile({
    super.key,
    required this.assetPath,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 380,
      decoration: BoxDecoration(
        color: BAppColors.black900,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Image.asset(assetPath),
          const SizedBox(width: 15),
          Text(
            text,
            style: BAppStyles.poppins(
              color: BAppColors.white,
              fontSize: BSizes.fontSizeMd,
              weight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(35),
            child: Icon(
              icon,
              color: BAppColors.white,
              size: BSizes.iconMd,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
