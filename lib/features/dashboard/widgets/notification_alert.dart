import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationAlert extends StatelessWidget {
  final String description;

  const NotificationAlert({required this.description,super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 610, maxHeight: 92),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: BAppColors.warning600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        child: Center(
          child: ListTile(
            leading: SvgPicture.asset(
              BImages.food,
              color: BAppColors.white,
            ),
            title: Text(
              description,
              style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: 16,
                  weight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
