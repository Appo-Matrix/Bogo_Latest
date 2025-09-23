import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const EventCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154,
      width: double.infinity,
      decoration: BoxDecoration(
          color: BAppColors.darkGray500.withOpacity(.5),
          borderRadius: BorderRadius.circular(35)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 112,
              width: 112,
              decoration: BoxDecoration(
                color: BAppColors.darkGray400,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(child: SvgPicture.asset(imagePath)),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: BSizes.cardRadiusSm,
                ),
                ListTile(
                  title: Text(
                    title,
                    style: BAppStyles.body
                        .copyWith(color: BAppColors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: BAppStyles.heading1
                        .copyWith(color: BAppColors.white, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AppButtons.square(
                        imageIcon: Icons.arrow_forward_ios_rounded,
                        size: 20,
                        isBackGTransparent: true,
                        onTap: onNext),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
