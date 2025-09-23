import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double height;
  final double prefixIconSize;
  final double textSize;
  final Color hintTextColor;
  final dynamic prefixIcon;
  final bool isDark;

  const CustomTextField(
      {required this.hintText,
      this.height = 92,
      this.hintTextColor = BAppColors.lightGray400,
      this.prefixIconSize = BSizes.iconMd + 2,
      this.textSize = 12,
      this.isDark = false,
      this.prefixIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        expands: true,
        maxLines: null,
        minLines: null,
        style: BAppStyles.body.copyWith(
            color: isDark ? BAppColors.white : BAppColors.black1000,
            fontSize: textSize),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: BAppStyles.body
                .copyWith(color: hintTextColor, fontSize: textSize),
            prefixIcon: prefixIcon == null
                ? null
                : prefixIcon is IconData
                    ? Icon(
                        prefixIcon,
                        size: 26,
                        color: isDark ? BAppColors.white : BAppColors.black1000,
                      )
                    : SizedBox(
                        height: prefixIconSize,
                        width: prefixIconSize,
                        child: Center(
                          child: SvgPicture.asset(
                            prefixIcon,
                            color: isDark
                                ? BAppColors.white
                                : BAppColors.black1000,
                          ),
                        )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(
                    color: isDark ? BAppColors.white : BAppColors.black1000)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(
                    color: isDark ? BAppColors.white : BAppColors.black1000))),
      ),
    );
  }
}
