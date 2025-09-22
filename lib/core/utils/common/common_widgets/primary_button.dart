import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor; // if provided => border visible
  final double? borderWidth; // optional width
  final double width;
  final double height;
  final double borderRadius;
  final double opacity;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.width = 377, // default width
    this.height = 66, // default height
    this.borderRadius = 35, // default radius
    this.opacity = 1, // default opacity
  });

  @override
  Widget build(BuildContext context) {
    final hasBorder = borderColor != null;

    return Opacity(
      opacity: opacity,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? Colors.black,
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
            surfaceTintColor: MaterialStateProperty.all(Colors.transparent),

            side: MaterialStateProperty.all(
              hasBorder
                  ? BorderSide(color: borderColor!, width: borderWidth ?? 1) // default 1px
                  : BorderSide.none,
            ),

            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: BAppStyles.poppins(
              color: BAppColors.white,
              fontSize: BSizes.size22,
              weight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
