import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationInfo extends StatelessWidget {
  final String distance;
  final String location;
  final Color fontColor;
  final Color imageColor;

  const LocationInfo(
      {required this.distance,
      this.fontColor = BAppColors.black1000,
      this.imageColor = BAppColors.lightGray600,
      required this.location,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/location.svg",
          color: imageColor,
        ),
        SizedBox(
          width: BSizes.size5,
        ),
        Text(distance,
            style: BAppStyles.body.copyWith(
              color: fontColor,
              fontFamily: AppFontFamilies.baloo2,
            )),
        SizedBox(
          width: BSizes.size5,
        ),
        Text(
          location,
          style: BAppStyles.poppins(
              color: fontColor, fontSize: 16, weight: FontWeight.w500),
        )
      ],
    );
  }
}
