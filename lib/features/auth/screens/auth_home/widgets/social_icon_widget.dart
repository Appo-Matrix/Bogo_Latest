import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    final isSvg = iconPath.toLowerCase().endsWith(".svg");

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
          child: isSvg
              ? SvgPicture.asset(
            iconPath,
            width: 28,
            height: 28,
            color: Colors.white,
          )
              : Image.asset(
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
