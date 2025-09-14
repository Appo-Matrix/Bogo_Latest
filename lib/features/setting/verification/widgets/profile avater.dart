import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath; // profile image
  final double radius; // avatar radius
  final bool showStatus; // show online status dot
  final Color statusColor; // online/offline color
  final bool showCrown; // show crown badge
  final double borderWidth; // border thickness

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.radius = 42,
    this.showStatus = true,
    this.statusColor = BAppColors.main,
    this.showCrown = true,
    this.borderWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Avatar with border
        Container(
          padding: EdgeInsets.all(borderWidth),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: BAppColors.black700, width: borderWidth),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(imagePath),
            onBackgroundImageError: (_, __) {},
          ),
        ),

        // Status Dot
        if (showStatus)
          Positioned(
            right: -2,
            top: 6,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: statusColor, blurRadius: 8),
                ],
              ),
            ),
          ),

        // Crown Badge
        if (showCrown)
          Positioned(
            right: 6,
            bottom: -2,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: BAppColors.black1000,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                BImages.crown,
                width: 14,
                height: 14,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.workspace_premium,
                  color: Colors.amber,
                  size: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
