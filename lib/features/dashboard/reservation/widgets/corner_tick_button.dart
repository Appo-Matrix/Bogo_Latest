import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
class CornerTickButton extends StatelessWidget {
  const CornerTickButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Ink(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            color: BAppColors.black1000,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: const Center(
            child: Icon(Icons.check, color: BAppColors.white, size: 28),
          ),
        ),
      ),
    );
  }
}