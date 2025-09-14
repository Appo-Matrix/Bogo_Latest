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

  const CustomAppBar(
      {this.height = BSizes.appBarHeight,
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
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        title: (title != null && showLogo == false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (showBack && leading == null)
                    GestureDetector(
                      onTap: context.pop,
                      child: leading is IconData
                          ? Icon(
                              leading,
                              size: 24,
                              color: BAppColors.black1000,
                            )
                          : SizedBox(
                              height: BSizes.iconMd + 2,
                              width: BSizes.iconMd - 2,
                              child: SvgPicture.asset(
                                BImages.back,
                                color: BAppColors.black1000,
                              )),
                    ),
                  if (!showBack && leading != null)
                    GestureDetector(
                      onTap: onLeading,
                      child: SizedBox(
                        child: leading is IconData
                            ? Icon(leading)
                            : SizedBox(
                                height: 32,
                                width: 32,
                                child: SvgPicture.asset(
                                  leading,
                                  color: BAppColors.black1000,
                                )),
                      ),
                    ),
                  SizedBox(
                    width: BSizes.size35,
                  ),
                  if (title != null)
                    Text(
                      title!,
                      style: BAppStyles.poppins(
                          color: BAppColors.black1000,
                          fontSize: 18,
                          weight: FontWeight.w700),
                    ),
                  Spacer(),
                  if (trailing == null && showNotification == true)
                    GestureDetector(
                      onTap: onNotification,
                      child: SizedBox(
                          height: 32,
                          width: 32,
                          child: SvgPicture.asset(
                            BImages.notifications,
                          )),
                    ),
                  if (trailing != null)
                    GestureDetector(
                      onTap: onTrailing,
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: trailingBorder
                                    ? BAppColors.lightGray300
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12)),
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
                                    child: Center(
                                        child: Image.asset(
                                      trailing,
                                    )),
                                  )
                                : SizedBox(
                                    height: 21,
                                    width: 21,
                                    child: Center(
                                        child: SvgPicture.asset(
                                      trailing,
                                    )),
                                  )),
                      ),
                    )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (showBack && leading == null)
                    GestureDetector(
                      onTap: context.pop,
                      child: leading is IconData
                          ? Icon(
                              leading,
                              size: 24,
                              color: BAppColors.black1000,
                            )
                          : SizedBox(
                              height: BSizes.iconMd + 2,
                              width: BSizes.iconMd - 2,
                              child: SvgPicture.asset(
                                BImages.back,
                                color: BAppColors.black1000,
                              )),
                    ),
                  if (!showBack && leading != null)
                    GestureDetector(
                      onTap: onLeading,
                      child: SizedBox(
                        child: leading is IconData
                            ? Icon(leading)
                            : SizedBox(
                                height: 32,
                                width: 32,
                                child: SvgPicture.asset(
                                  leading,
                                  color: BAppColors.black1000,
                                )),
                      ),
                    ),
                  if (showLogo)
                    SizedBox(
                        height: 54,
                        width: 104,
                        child: Image.asset(
                          BImages.appLogo,
                          color: BAppColors.backGroundColor,
                        )),
                  if (trailing == null && showNotification == true)
                    GestureDetector(
                      onTap: onNotification,
                      child: SizedBox(
                          height: 32,
                          width: 32,
                          child: SvgPicture.asset(
                            BImages.notifications,
                          )),
                    ),
                  if (trailing != null)
                    GestureDetector(
                      onTap: onTrailing,
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: trailingBorder
                                    ? BAppColors.lightGray300
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12)),
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
                                    child: Center(
                                        child: Image.asset(
                                      trailing,
                                    )),
                                  )
                                : SizedBox(
                                    height: 21,
                                    width: 21,
                                    child: Center(
                                        child: SvgPicture.asset(
                                      trailing,
                                    )),
                                  )),
                      ),
                    )
                ],
              ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
