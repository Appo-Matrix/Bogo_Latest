import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';

class DotIndicators extends StatelessWidget {
  final int length;
  final int currentIndex;

  const DotIndicators(
      {super.key, required this.length, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: currentIndex == index ? 4 : 20,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: currentIndex == index
                ? BAppColors.backGroundColor
                : BAppColors.lightGray400.withOpacity(0.6),
          ),
        ),
      ),
    );
    ;
  }
}
