import 'package:flutter/material.dart';
import '../../core/utils/constants/app_colors.dart';
import '../../core/utils/constants/app_sizes.dart';

class BOutlinedButtonTheme {
  BOutlinedButtonTheme._();

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: BAppColors.dark,
      side: const BorderSide(color: BAppColors.black400),
      textStyle: const TextStyle(
        fontSize: 16,
        color: BAppColors.black400,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: BSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: BAppColors.light,
      side: const BorderSide(color: BAppColors.lightGray200),
      textStyle: const TextStyle(
        fontSize: 16,
        color: BAppColors.lightGray100,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: BSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BSizes.buttonRadius),
      ),
    ),
  );
}
