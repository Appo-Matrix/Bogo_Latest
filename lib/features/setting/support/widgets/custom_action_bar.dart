import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';

class CustomActionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onMessage;
  final VoidCallback? onCall;
  final VoidCallback? onMore;

  const CustomActionAppBar({
    super.key,
    this.onBack,
    this.onMessage,
    this.onCall,
    this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BAppColors.black1000,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: BAppColors.white, size: 26),
        onPressed: onBack ?? () => Navigator.of(context).maybePop(),
      ),
      actions: [
        _ActionIcon(
          icon: Icons.message,
          onTap: onMessage,
        ),
        const SizedBox(width: 8),
        _ActionIcon(
          icon: Icons.call,
          onTap: onCall,
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: BAppColors.white, size: 45),
          onPressed: onMore,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// 🔹 Reusable action icon widget
class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _ActionIcon({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 36,
          ),
        ),
      ),
    );
  }
}
