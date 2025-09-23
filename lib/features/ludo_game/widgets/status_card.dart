import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

import 'package:flutter_svg/flutter_svg.dart';

class StatusCardWidget extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final String title;
  final int? count;
  final String? desc;
  final VoidCallback onNext;

  const StatusCardWidget(
      {required this.imagePath,
      required this.backgroundColor,
      required this.title,
      this.count,
      this.desc,
      required this.onNext,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 125,
        height: 160,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24.5,
                backgroundColor: BAppColors.white.withOpacity(0.25),
                child: SvgPicture.asset(
                  imagePath,
                  color: BAppColors.white,
                ),
              ),
              SizedBox(height: BSizes.cardRadiusSm),
              Text(
                title,
                style: BAppStyles.body.copyWith(color: BAppColors.white),
              ),
              SizedBox(height: BSizes.size5),
              if (count != null)
                Text(
                  count! < 10 ? "0$count" : "$count",
                  style: BAppStyles.heading1.copyWith(color: BAppColors.white),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5),
                  child: AppButtons.square(
                      imageIcon: Icons.arrow_forward_ios_rounded,
                      isBackGTransparent: true,
                      size: 15,
                      onTap: onNext),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
