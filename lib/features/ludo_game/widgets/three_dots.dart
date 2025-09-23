import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ThreeDots extends StatelessWidget {
  final VoidCallback onTap;

  const ThreeDots({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: List.generate(3, (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: BAppColors.white,
            ),
          );
        }),
      ),
    );
  }
}
