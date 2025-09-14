import 'package:flutter/material.dart';

class BSizes {
  static const double dividerHeight = 1.0; // 1
  static const double size2 = 2.0; // placeholder
  static const double size3 = 3.0; // placeholder
  static const double xs = 4.0; // 4
  static const double size5 = 5.0; // placeholder
  static const double size6 = 6.0; // placeholder
  static const double size7 = 7.0; // placeholder
  static const double sm = 8.0; // 8
  static const double size9 = 9.0; // placeholder
  static const double cardRadiusSm = 10.0; // 10
  static const double fontSizeXESm = 11.0; // 11
  static const double fontSizeESm = 12.0; // 12
  static const double borderRadiusLg = 12.0; // 12
  static const double inputFieldRadius = 12.0; // 12
  static const double cardRadiusMd = 12.0; // 12
  static const double iconXs = 12.0; // 12
  static const double fontSizeEaSm = 13.0; // 13
  static const double fontSizeSm = 14.0; // 14
  static const double fontSizeSmx = 15.0; // 15
  static const double spaceBtwItems = 16.0; // 16
  static const double spaceBtwInputFields = 16.0; // 16
  static const double md = 16.0; // 16
  static const double cardRadiusLg = 16.0; // 16
  static const double iconSm = 16.0; // 16
  static const double fontSizeMd = 16.0; // 16
  static const double fontSizeLg = 18.0; // 18
  static const double buttonHeight = 18.0; // 18
  static const double cardElevation = 2.0; // Already sorted
  static const double size20 = 20.0; // 24
  static const double lg = 24.0; // 24
  static const double xl = 24.0; // 24
  static const double iconMd = 24.0; // 24
  static const double defaultSpace = 24.0; // 24
  static const double fontSizeLgx = 24.0; // 24
  static const double iconLg = 32.0; // 32
  static const double size35 = 35.0; // 32
  static const double spaceBtwSections = 32.0; // 32
  static const double fontSizeLhx = 30.0; // 30
  static const double fontSizeLIx = 44.0; // 44
  static const double appBarHeight = 56.0; // 56
  static const double imageThumbSize = 80.0; // 80

  // Placeholders to cover missing sizes up to 100
  static const double size60 = 60.0;
  static const double size70 = 70.0;
  static const double size90 = 90.0;
  static const double size100 = 100.0;

  //  Buttons
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

  //  Image carousel height
  static const double imageCarouselHeight = 200.0;

  //  Dynamic screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
