import 'package:flutter/material.dart';

class BogoIconButton extends StatelessWidget {
  final String assetPath;        // For dynamic image per screen
  final double size;             // Default size (width & height)
  final double borderRadius;     // Customizable radius
  final Color backgroundColor;   // Customizable background
  final VoidCallback? onTap;     // Optional tap handler

  const BogoIconButton({
    super.key,
    required this.assetPath,
    this.size = 64,
    this.borderRadius = 25,
    this.backgroundColor = Colors.black,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
