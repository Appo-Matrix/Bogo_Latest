import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_sizes.dart';

class CustomInfoTile extends StatelessWidget {
  final Color backgroundColor; // main card color
  final Color iconBgColor; // left icon background color
  final Widget leadingIcon; // left icon widget
  final String title; // main text
  final String? subtitle; // optional subtitle
  final Widget? trailing; // optional trailing widget (chevron/edit/power)

  const CustomInfoTile({
    super.key,
    required this.backgroundColor,
    required this.iconBgColor,
    required this.leadingIcon,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          // Leading Icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: leadingIcon,
          ),
          const SizedBox(width: 12),

          // Title + Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: BSizes.fontSizeMd,
                    weight: FontWeight.w800,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BAppStyles.poppins(
                      color: BAppColors.black300,
                      fontSize: BSizes.fontSizeSm,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Trailing
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
