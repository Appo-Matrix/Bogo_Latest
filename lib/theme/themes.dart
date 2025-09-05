
import 'package:flutter/material.dart';

import '../core/utils/constants/app_colors.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outline_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';



class BAppTheme {
  BAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    disabledColor: BAppColors.black700,
    brightness: Brightness.light,
    primaryColor: BAppColors.primary,
    textTheme: BTextTheme.lightTextTheme,
    chipTheme: BChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BAppBarTheme.lightAppBarTheme,
    checkboxTheme: BCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: BBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BTextFieldTheme.lightInputDecorationTheme,

  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    disabledColor: BAppColors.lightGray300,
    brightness: Brightness.dark,
    primaryColor: BAppColors.primary,
    textTheme: BTextTheme.darkTextTheme,
    chipTheme: BChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BAppBarTheme.darkAppBarTheme,
    checkboxTheme: BCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: BBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BTextFieldTheme.darkInputDecorationTheme,
  );

}