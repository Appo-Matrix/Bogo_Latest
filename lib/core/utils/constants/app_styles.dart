import 'package:flutter/material.dart';

class BAppStyles {
  // 🔹 Base function
  static TextStyle poppins({
    required Color color,
    required double fontSize,
    required FontWeight weight,
    double height = 1.0,
  }) {
    return TextStyle(
      height: height,
      color: color,
      fontWeight: weight,
      fontSize: fontSize,
      fontFamily: AppFontFamilies.poppins,
      decorationColor: color,
    );
  }

  // 🔹 Predefined Styles
  static TextStyle heading1 = poppins(
    color: Colors.black,
    fontSize: 24,
    weight: FontWeight.bold,
  );

  static TextStyle heading2 = poppins(
    color: Colors.black,
    fontSize: 20,
    weight: FontWeight.w600,
  );

  static TextStyle body = poppins(
    color: Colors.grey,
    fontSize: 16,
    weight: FontWeight.normal,
  );

  static TextStyle caption = poppins(
    color: Colors.grey.shade600,
    fontSize: 12,
    weight: FontWeight.w400,
  );

  static TextStyle button = poppins(
    color: Colors.white,
    fontSize: 16,
    weight: FontWeight.w600,
  );
}

class AppFontFamilies {
  static String poppins = 'Poppins';
  static String baloo2 = 'Baloo2';
  static String aBeeZee = 'ABeeZee';
}
