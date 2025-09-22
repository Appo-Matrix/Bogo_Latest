import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';

class ActionSquare extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const ActionSquare({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // background transparent for ripple
      child: InkWell(
        borderRadius: BorderRadius.circular(20), // ripple respect kare border
        onTap: onTap,
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: BAppColors.black900,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: BAppColors.black700, width: 2),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
