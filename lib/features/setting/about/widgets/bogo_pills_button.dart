import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoPillButton extends StatelessWidget {
  final bool isActive;
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final double screenWidth;
  final double screenHeight;

  const BogoPillButton({
    super.key,
    required this.isActive,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: screenHeight * 0.07,
          decoration: BoxDecoration(
            color: isActive
                ? BAppColors.main
                : BAppColors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                width: screenHeight * 0.055,
                height: screenHeight * 0.055,
                decoration: BoxDecoration(
                  color: BAppColors.green400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  icon,
                  color: BAppColors.white,
                  size: screenWidth * 0.05,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: screenWidth * 0.03,
                    weight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
