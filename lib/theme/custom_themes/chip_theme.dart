
import 'package:flutter/material.dart';

import '../../core/utils/constants/app_colors.dart';
// Your JAppColors class

class BChipTheme {
  BChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: BAppColors.lightGray400.withOpacity(0.4), // Disabled color for light mode
    labelStyle: const TextStyle(color: BAppColors.lightGray700), // Label style for light mode
    selectedColor: BAppColors.primary, // Selected color
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Padding for chips
    checkmarkColor: BAppColors.lightGray100, // Checkmark color for light mode
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: BAppColors.black300, // Disabled color for dark mode
    labelStyle: TextStyle(color: BAppColors.lightGray100), // Label style for dark mode
    selectedColor: BAppColors.primary, // Selected color
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Padding for chips
    checkmarkColor: BAppColors.lightGray100, // Checkmark color for dark mode
  );
}
