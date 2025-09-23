import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_text_field.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/ludo_game/widgets/g_profile_list_tile.dart';
import 'package:bogo_latest/features/ludo_game/widgets/person_widget.dart';
import 'package:bogo_latest/features/ludo_game/widgets/status_card.dart';
import 'package:bogo_latest/features/ludo_game/widgets/text_three_dots.dart';
import 'package:bogo_latest/features/ludo_game/widgets/three_dots.dart';
import 'package:flutter/material.dart';

class FriendsInfoScreen extends StatelessWidget {
  const FriendsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      appBar: CustomAppBar(
        showBack: true,
        isDark: true,
        title: AppStrings.friends,
        trailingWidget: SizedBox(
          width: 232,
          child: CustomTextField(
            prefixIcon: BImages.addSearch,
            prefixIconSize: 16,
            hintText: AppStrings.nOu,
            hintTextColor: BAppColors.white,
            textSize: 15,
            height: 55,
            isDark: true,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: BSizes.size35),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    StatusCardWidget(
                        imagePath: BImages.addFriend,
                        backgroundColor:
                            BAppColors.lightPurple400.withOpacity(.5),
                        title: AppStrings.smsInvite,
                        onNext: () {}),
                    StatusCardWidget(
                        imagePath: BImages.facebook2,
                        backgroundColor: BAppColors.blue600,
                        title: AppStrings.facebookFriend,
                        onNext: () {}),
                    StatusCardWidget(
                        imagePath: BImages.share,
                        backgroundColor:
                            BAppColors.lightBlue500.withOpacity(0.2),
                        title: AppStrings.inviteSocialMedia,
                        onNext: () {}),
                  ],
                ),
              ),
              SizedBox(height: BSizes.size35),
              TextEvenlySpacedRow(
                  title: AppStrings.friends, widget: ThreeDots(onTap: () {})),
              GProfileWidget(
                  onTile: () {},
                  imagePath: BImages.profile5,
                  titleText: "ISLAM AZIRI",
                  subtitleText: "VANIS220",
                  onTrailing: () {}),
              GProfileWidget(
                  onTile: () {},
                  imagePath: BImages.profile5,
                  titleText: "ISLAM AZIRI",
                  subtitleText: "VANIS220",
                  onTrailing: () {}),
              GProfileWidget(
                  onTile: () {},
                  imagePath: BImages.profile5,
                  titleText: "ISLAM AZIRI",
                  subtitleText: "VANIS220",
                  onTrailing: () {}),
              SizedBox(height: BSizes.size35),
              TextEvenlySpacedRow(
                  title: AppStrings.suggestedFriend,
                  widget: ThreeDots(onTap: () {})),
              SizedBox(height: BSizes.size20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PersonCard(
                      profileImage: BImages.profile5,
                      title: "ISLAM AZIRI",
                      onFollow: () {},
                    ),
                    PersonCard(
                      profileImage: BImages.profile5,
                      title: "ISLAM AZIRI",
                      onFollow: () {},
                    ),
                    PersonCard(
                      profileImage: BImages.profile5,
                      title: "ISLAM AZIRI",
                      onFollow: () {},
                    ),
                    PersonCard(
                      profileImage: BImages.profile5,
                      title: "ISLAM AZIRI",
                      onFollow: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
