import 'package:flutter/material.dart';
import '../../../../../../core/utils/constants/app_colors.dart';

class CircleActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const CircleActionButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      width: 119,
      decoration: BoxDecoration(
        color: BAppColors.primary,
        borderRadius: BorderRadius.circular(75),
      ),
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: BAppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              icon,
              color: BAppColors.primary,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
