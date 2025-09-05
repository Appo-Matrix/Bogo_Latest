

import 'package:flutter/material.dart';

import '../../core/utils/constants/app_colors.dart';
import '../../core/utils/constants/app_sizes.dart';


class BCheckBoxTheme{
  BCheckBoxTheme._();



  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BSizes.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return BAppColors.white;
      } else {
        return BAppColors.black900;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return BAppColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return BAppColors.white;

      } else {
        return BAppColors.black900;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return BAppColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
