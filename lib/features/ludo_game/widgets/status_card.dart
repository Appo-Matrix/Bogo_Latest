import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

import 'package:flutter_svg/flutter_svg.dart';

class StatusCardItems {
  final String imagePath;
  final Color backgroundColor;
  final String title;
  final int? count;
  final String? desc;
  final VoidCallback onNext;

  StatusCardItems(
      {required this.imagePath,
      required this.backgroundColor,
      required this.title,
      this.desc,
      this.count,
      required this.onNext});
}

class StatusCardList extends StatelessWidget {
  final List<StatusCardItems> statusCardList;

  const StatusCardList({required this.statusCardList, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: statusCardList.map((statusCardItems) {
          return _StatusCardWidget(statusCardItems: statusCardItems);
        }).toList(),
      ),
    );
  }
}

class _StatusCardWidget extends StatelessWidget {
  final StatusCardItems statusCardItems;

  const _StatusCardWidget({required this.statusCardItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 125,
        height: 160,
        decoration: BoxDecoration(
          color: statusCardItems.backgroundColor.withOpacity(.8),
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
                  statusCardItems.imagePath,
                  color: BAppColors.white,
                ),
              ),
              SizedBox(height: BSizes.cardRadiusSm),
              Text(
                statusCardItems.title,
                style: statusCardItems.desc != null
                    ? BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: 16,
                        weight: FontWeight.w600)
                    : BAppStyles.body.copyWith(color: BAppColors.white),
              ),
              SizedBox(height: BSizes.size5),
              if (statusCardItems.count != null && statusCardItems.desc == null)
                Text(
                  statusCardItems.count! < 10
                      ? "0${statusCardItems.count}"
                      : "${statusCardItems.count}",
                  style: BAppStyles.heading1.copyWith(color: BAppColors.white),
                ),
              if (statusCardItems.count == null && statusCardItems.desc != null)
                Text(
                  statusCardItems.desc!,
                  style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: 16,
                      weight: FontWeight.w600),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10,top: 5),
                  child: AppButtons.square(
                      imageIcon: Icons.arrow_forward_ios_rounded,
                      isBackGTransparent: true,
                      size: 15,
                      onTap: statusCardItems.onNext),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
