import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Widget? svgIcon;
  final ImageProvider? imageProvider; // ✅ for asset/network image
  final Widget? suffixIcon; // ✅ new property for right-side icon
  final TextEditingController? controller;
  final bool obscureText;
  final double width;
  final double height;
  final double borderRadius;
  final double opacity;
  final double borderWidth;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.svgIcon,
    this.imageProvider,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.width = 380,
    this.height = 66,
    this.borderRadius = 35,
    this.opacity = 1,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: BAppStyles.poppins(
            color: Colors.white,
            fontSize: BSizes.fontSizeLg,
            weight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: BAppStyles.poppins(
              color: Colors.white.withOpacity(0.5),
              fontSize: BSizes.md,
              weight: FontWeight.w400,
            ),
            filled: true,
            fillColor: const Color(0xFFD9D9D9).withOpacity(0.15),

            // ✅ Left Side (prefix)
            prefixIcon: (svgIcon != null || icon != null || imageProvider != null)
                ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 8), // ✅ better spacing
              child: svgIcon ??
                  (icon != null
                      ? Icon(
                    icon,
                    color: Colors.white,
                    size: BSizes.iconMd,
                  )
                      : (imageProvider != null
                      ? Image(
                    image: imageProvider!,
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  )
                      : null)),
            )
                : null,

            // ✅ Right Side (suffix)
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16), // ✅ spacing from edge
              child: suffixIcon,
            ),

            // ✅ Inside padding for text/hint
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
                width: borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: BAppColors.white,
                width: borderWidth + 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
