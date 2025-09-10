import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_spacers.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileListTile extends StatelessWidget {
  final String profilePicPath;
  final String title;
  final String accountType;
  final String typeImagePath;

  const ProfileListTile(
      {required this.profilePicPath,
      required this.title,
      required this.accountType,
      required this.typeImagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(profilePicPath),
      ),
      title: Text(
        title,
        style: BAppStyles.heading2,
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset(typeImagePath),
          AppSpacers.h10,
          Text(
            accountType,
            style: BAppStyles.poppins(
                color: BAppColors.black1000,
                fontSize: 16,
                weight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
