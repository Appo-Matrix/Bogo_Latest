import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final dynamic prefixIcon;

  const CustomTextField({required this.hintText, this.prefixIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: TextFormField(
        expands: true,
        maxLines: null,
        minLines: null,
        style: TextStyle(color: BAppColors.black1000),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: BAppColors.black1000.withOpacity(0.1)),
          prefixIcon: prefixIcon == null
              ? null
              : prefixIcon is IconData
              ? Icon(
            prefixIcon,
            size: 26,
            color: BAppColors.black1000,
          )
              : SizedBox(
            height: BSizes.iconMd + 2,
            width: BSizes.iconMd + 2,
            child: Center(
              child: SvgPicture.asset(
                prefixIcon,
                color: BAppColors.black1000,
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: BAppColors.lightGray300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: BAppColors.black1000)),
        ),
      ),
    );
  }
}
