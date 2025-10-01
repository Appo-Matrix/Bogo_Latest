import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
class BackButtonWidgets extends StatelessWidget {
  const BackButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BSizes.appBarHeight,
      width: BSizes.appBarHeight,
      decoration: BoxDecoration(
        color: BAppColors.white,
        borderRadius: BorderRadius.circular(BSizes.borderRadiusLg),
        boxShadow: [
          BoxShadow(
            color: BAppColors.black1000.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back,
          color: BAppColors.black1000,
          size: BSizes.iconLg,
        ),
      ),
    );
  }
}