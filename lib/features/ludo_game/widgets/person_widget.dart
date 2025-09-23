import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

/// A simple widget that displays one person card.
class PersonCard extends StatelessWidget {
  final String profileImage;
  final String title;
  final VoidCallback onFollow;
  final VoidCallback? onFriend;
  final bool showFriendButton;

  const PersonCard({
    super.key,
    required this.profileImage,
    required this.title,
    required this.onFollow,
    this.onFriend,
    this.showFriendButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return showFriendButton
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: BSizes.size20,),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(image: AssetImage(profileImage))),
              ),
              const SizedBox(height: BSizes.cardRadiusSm),
              Text(
                title,
                style: BAppStyles.button.copyWith(fontSize: 12),
              ),
              const SizedBox(height: BSizes.cardRadiusSm),
              AppButtons.simple(
                onTap: onFollow,
                buttonText: "Follow",
                height: 32,
                width: 87,
                buttonColor: BAppColors.backGroundColor,
                fontSize: 13,
              ),
              if (showFriendButton && onFriend != null) ...[
                const SizedBox(height: BSizes.size35 + 20),
                AppButtons.square(
                  imageIcon: "assets/icons/add_friend_outline.svg",
                  buttonColor: BAppColors.darkGray400.withOpacity(.4),
                  onTap: onFriend!,
                  buttonText: "Friends",
                ),
              ],
            ],
          )
        : Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
              width: 124,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: BAppColors.darkGray500.withOpacity(.5),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  const SizedBox(height: BSizes.cardRadiusSm),
                  Text(
                    title,
                    style: BAppStyles.button.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: BSizes.cardRadiusSm),
                  AppButtons.simple(
                    onTap: onFollow,
                    buttonText: "Follow",
                    height: 32,
                    width: 87,
                    buttonColor: BAppColors.backGroundColor,
                    fontSize: 13,
                  ),
                  if (showFriendButton && onFriend != null) ...[
                    const SizedBox(height: BSizes.size35 + 20),
                    AppButtons.square(
                      imageIcon: "assets/icons/add_friend_outline.svg",
                      buttonColor: BAppColors.darkGray400.withOpacity(.4),
                      onTap: onFriend!,
                      buttonText: "Friends",
                    ),
                  ],
                ],
              ),
            ),
        );
  }
}
