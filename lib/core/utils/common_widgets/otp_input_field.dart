import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: PinTheme(
          height: 92,
          width: 92,
          textStyle: BAppStyles.poppins(
              color: BAppColors.white, fontSize: 30, weight: FontWeight.w700),
          decoration: BoxDecoration(
              color: BAppColors.lightGray1000,
              borderRadius: BorderRadius.circular(35))),
    );
  }
}
