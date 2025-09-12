import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';

class BogoGlowButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final Color color;

  const BogoGlowButton({
    super.key,
    required this.onTap,
    this.icon = Icons.chevron_right,
    this.size = 72,
    this.color = BAppColors.main,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: size * 0.6,
            spreadRadius: size * 0.1,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(size),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size * 0.4),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: BAppColors.white,
            size: size * 0.45,
          ),
        ),
      ),
    );
  }
}
