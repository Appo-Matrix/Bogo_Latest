import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class ToggleOption extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const ToggleOption({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: BAppColors.black900,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.radio_button_unchecked,
            color: BAppColors.black400,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: 17,
                weight: FontWeight.w500,
              ),
            ),
          ),

          // ✅ Yes Button
          GestureDetector(
            onTap: () => onChanged(true),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: value ? BAppColors.main : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.check,
                    color: BAppColors.white,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'yes',
                    style: TextStyle(
                      color: BAppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),

          // ✅ No Button
          GestureDetector(
            onTap: () => onChanged(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: !value ? BAppColors.red700 : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.close,
                    color: BAppColors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'no',
                    style: TextStyle(
                      color: BAppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
