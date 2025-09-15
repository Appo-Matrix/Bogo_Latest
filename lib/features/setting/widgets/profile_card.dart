import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String accountType;
  final String profileImage;
  final String? accountIcon; // optional crown ya koi aur icon
  final VoidCallback? onTap; // 👈 click callback

  const ProfileCard({
    super.key,
    required this.name,
    required this.accountType,
    this.profileImage = BImages.profile,
    this.accountIcon = BImages.crown,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24), // ripple effect ke liye
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: BAppColors.black900,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(profileImage),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Name
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Account Type Row
                  Row(
                    children: [
                      if (accountIcon != null)
                        Image.asset(accountIcon!, width: 16, height: 16),
                      if (accountIcon != null) const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          accountType,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BAppStyles.poppins(
                            color: BAppColors.black400,
                            fontSize: BSizes.fontSizeSm,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
