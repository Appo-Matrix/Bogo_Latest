import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic leading;
  final String? title;
  final bool showBack;
  final bool showLogo;
  final bool showNotification;
  final dynamic trailing;
  final VoidCallback? onLeading;
  final VoidCallback? onTrailing;
  final bool trailingBorder;
  final bool isImage;
  final VoidCallback? onNotification;
  final double height;
  final Color leadingColor; // 👈 NEW PARAM

  const CustomAppBar({
    this.height = BSizes.appBarHeight,
    this.title,
    this.leading,
    this.onLeading,
    this.onNotification,
    this.trailing,
    this.onTrailing,
    this.isImage = false,
    this.showBack = false,
    this.showLogo = false,
    this.trailingBorder = false,
    this.showNotification = false,
    this.leadingColor = BAppColors.white, // 👈 default is white
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: (title != null && showLogo == false)
            ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// 🔹 Leading (Back icon OR custom icon)
            if (showBack && leading == null)
              GestureDetector(
                onTap: context.pop,
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: leadingColor,
                ),
              ),
            if (!showBack && leading != null)
              GestureDetector(
                onTap: onLeading,
                child: SizedBox(
                  child: leading is IconData
                      ? Icon(
                    leading,
                    color: leadingColor, // 👈 uses param
                  )
                      : SizedBox(
                    height: 32,
                    width: 32,
                    child: SvgPicture.asset(
                      leading,
                      color: leadingColor, // 👈 uses param
                    ),
                  ),
                ),
              ),

            SizedBox(width: BSizes.size35),

            /// 🔹 Title
            if (title != null)
              Text(
                title!,
                style: BAppStyles.poppins(
                  color: BAppColors.black1000,
                  fontSize: 18,
                  weight: FontWeight.w700,
                ),
              ),

            Spacer(),

            /// 🔹 Notifications
            if (trailing == null && showNotification == true)
              GestureDetector(
                onTap: onNotification,
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(BImages.notifications),
                ),
              ),

            /// 🔹 Trailing
            if (trailing != null)
              _buildTrailing(),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// 🔹 Leading (Back or Custom)
            if (showBack && leading == null)
              GestureDetector(
                onTap: context.pop,
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: leadingColor,
                ),
              ),
            if (!showBack && leading != null)
              GestureDetector(
                onTap: onLeading,
                child: SizedBox(
                  child: leading is IconData
                      ? Icon(
                    leading,
                    color: leadingColor, // 👈 uses param
                  )
                      : SizedBox(
                    height: 32,
                    width: 32,
                    child: SvgPicture.asset(
                      leading,
                      color: leadingColor, // 👈 uses param
                    ),
                  ),
                ),
              ),

            /// 🔹 Logo
            if (showLogo)
              SizedBox(
                height: 54,
                width: 104,
                child: Image.asset(
                  BImages.appLogo,
                  color: BAppColors.backGroundColor,
                ),
              ),

            /// 🔹 Notifications
            if (trailing == null && showNotification == true)
              GestureDetector(
                onTap: onNotification,
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(BImages.notifications),
                ),
              ),

            /// 🔹 Trailing
            if (trailing != null) _buildTrailing(),
          ],
        ),
      ),
    );
  }

  Widget _buildTrailing() {
    return GestureDetector(
      onTap: onTrailing,
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          border: Border.all(
            color: trailingBorder
                ? BAppColors.lightGray300
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: trailing is IconData
            ? Icon(
          trailing,
          size: 21,
          color: BAppColors.black1000,
        )
            : (isImage
            ? SizedBox(
          height: 21,
          width: 21,
          child: Center(child: Image.asset(trailing)),
        )
            : SizedBox(
          height: 21,
          width: 21,
          child: Center(child: SvgPicture.asset(trailing)),
        )),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
