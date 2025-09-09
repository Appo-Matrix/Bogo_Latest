import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final Color color;
  final String iconPath;
  final double size;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.color,
    required this.iconPath,
    this.size = 66,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 28,
            height: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
