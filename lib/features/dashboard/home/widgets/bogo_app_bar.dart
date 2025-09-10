import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_sizes.dart';

class BogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showNotification; // toggle notification icon
  final VoidCallback? onNotificationTap; // action for notification icon
  final Color backgroundColor;

  const BogoAppBar({
    super.key,
    this.showNotification = true,
    this.onNotificationTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: Row(
        children: [
          const SizedBox(width: BSizes.fontSizeLg),
          Image.asset(BImages.leadingIcon),
        ],
      ),
      title: Image.asset(BImages.appLogoGreen),
      actions: [
        if (showNotification)
          Padding(
            padding: const EdgeInsets.only(right: BSizes.cardRadiusMd),
            child: IconButton(
              icon: const Icon(Icons.notifications, size: 35),
              onPressed: onNotificationTap,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
