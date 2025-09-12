import 'package:flutter/material.dart';



class BSizes {
  // Paddings and margin sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 24.0;

  // Icon Sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  //Font Size
  static const double fontSizeXESm = 11.0;
  static const double fontSizeESm = 12.0;
  static const double fontSizeEaSm = 13.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeSmx = 15.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeLgx = 24.0;
  static const double fontSizeLhx = 30.0;
  static const double fontSizeLIx = 44.0;

  // Button Sizes
  static const double buttonHeight = 18.0;
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

  // Appbar Height
  static const double appBarHeight = 56.0;

  // Image Size
  static const double imageThumbSize = 80.0;

  // Default Spacing between section
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;

  // Border Radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  // Divider
  static const double dividerHeight = 1.0;

  // Input Fields
  static const double inputFieldRadius = 12.0;
  static const double spaceBtwInputFields = 16.0;

  // Card Sizes
  static const double cardRadiusLg = 16.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 2.0;

  //Back Arrow Box Size
  static const double top = 41.0;
  static const double left = 23.0;

  //Zoom control
  static const double leftSide = 23.0;

  // Image carousal height
  static const double imageCarouselHeight = 200.0;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
