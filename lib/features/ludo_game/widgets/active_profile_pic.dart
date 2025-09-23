import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveProfilePic extends StatelessWidget {
  final String profilePic;
  final VoidCallback onProfile;
  final VoidCallback onButton;
  final String buttonImage;

  const ActiveProfilePic(
      {super.key,
      required this.profilePic,
      required this.buttonImage,
      required this.onProfile,
      required this.onButton});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: onProfile,
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            border: Border.all(color: BAppColors.lightGray700, width: 1.5),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Center(
            child: CircleAvatar(
              radius: 28,
              foregroundImage: AssetImage(profilePic),
            ),
          ),
        ),
      ),
      Positioned(
        right: -10,
        top: 5,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Center(child: SvgPicture.asset("assets/icons/green_dot.svg")),
        ),
      ),
      Positioned(
        bottom: 5,
        left: 0,
        child: AppButtons.square(
          imageIcon: buttonImage,
          onTap: onButton,
          imageSize: 9,
          buttonColor: BAppColors.blue600,
          size: 22,
          borderRadius: 7,
        ),
      )
    ]);
  }
}
