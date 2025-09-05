import 'package:flutter/material.dart';
import '../../core/utils/constants/app_colors.dart';
import '../../core/utils/constants/app_sizes.dart';
// If you have a separate file for sizes

/// Light and dark elevated button themes
class BElevatedButtonTheme {
  BElevatedButtonTheme._();

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: BAppColors.lightGray100,
      // Light foreground color (changed from default to lightGray100)
      backgroundColor: BAppColors.primary,
      // Primary background color (changed to primary)
      disabledForegroundColor: BAppColors.lightGray500,
      // Disabled foreground color (set to lightGray500)
      disabledBackgroundColor: BAppColors.lightGray300,
      // Disabled background color (set to lightGray300)
      side: const BorderSide(color: BAppColors.primary),
      // Border color (set to primary color)
      padding: const EdgeInsets.symmetric(vertical: BSizes.buttonHeight),
      // Vertical padding from JSizes
      textStyle: const TextStyle(
        fontSize: 16,
        // Font size set to 16
        color: BAppColors.lightGray100,
        // Text color for light mode (changed to lightGray100)
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BSizes.buttonRadius),
      ), // Button radius from JSizes
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: BAppColors.lightGray100,
      // Light foreground color (changed to lightGray100 for dark theme)
      backgroundColor: BAppColors.primary,
      // Primary background color (same as light theme)
      disabledForegroundColor: BAppColors.black400,
      // Disabled foreground color for dark mode (set to darkGray500)
      disabledBackgroundColor: BAppColors.black400,
      // Disabled background for dark mode (set to darkGray300)
      side: const BorderSide(color: BAppColors.primary),
      // Border color (set to primary color)
      padding: const EdgeInsets.symmetric(vertical: BSizes.buttonHeight),
      // Vertical padding from JSizes
      textStyle: const TextStyle(
        fontSize: 16,
        // Font size set to 16
        color: BAppColors.lightGray100,
        // Text color for dark mode (set to lightGray100)
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BSizes.buttonRadius),
      ), // Button radius from JSizes
    ),
  );
}
