import 'package:flutter/material.dart';
import '../../core/utils/constants/app_colors.dart';

class BTextTheme {
  BTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: BAppColors.lightGray900,
    ),
    // Dark color for light theme
    headlineMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: BAppColors.lightGray900,
    ),
    // Slightly lighter dark color
    headlineSmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: BAppColors.lightGray900,
    ),

    // Light dark color
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: BAppColors.lightGray900,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: BAppColors.lightGray900,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: BAppColors.lightGray900,
    ),

    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: BAppColors.lightGray900,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: BAppColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: BAppColors.lightGray900.withOpacity(0.5),
    ),

    labelLarge: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: BAppColors.lightGray900,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: BAppColors.lightGray900.withOpacity(0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: BAppColors.white,
    ),
    // Light color for dark theme
    headlineMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: BAppColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: BAppColors.white,
    ),

    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: BAppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: BAppColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: BAppColors.white,
    ),

    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: BAppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: BAppColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: BAppColors.white,
    ),

    labelLarge: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: BAppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: BAppColors.white,
    ),
  );
}
