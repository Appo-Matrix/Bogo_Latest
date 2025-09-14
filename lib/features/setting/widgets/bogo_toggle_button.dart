import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';

class BogoToggleButton extends StatelessWidget {
  const BogoToggleButton({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: selected ? BAppColors.main : BAppColors.black900,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 20,
                color: selected ? BAppColors.white : BAppColors.black300),
            const SizedBox(height: 3),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: BAppStyles.poppins(
                color: selected ? BAppColors.white : BAppColors.black300,
                fontSize: BSizes.fontSizeSm,
                weight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
