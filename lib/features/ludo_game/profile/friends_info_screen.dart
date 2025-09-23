import 'package:bogo_latest/core/utils/common_widgets/app_scaffold.dart';
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
    final List<GProfileItems> gProfileList = [
      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),
      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),
      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),      GProfileItems(
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {},
          onTile: () {}),
    ];
    final List<StatusCardItems> statusCardList = [
      StatusCardItems(
          imagePath: BImages.addFriend,
          backgroundColor: BAppColors.lightPurple400.withOpacity(.5),
          title: AppStrings.smsInvite,
          onNext: () {}),
      StatusCardItems(
          imagePath: BImages.facebook2,
          backgroundColor: BAppColors.blue600,
          title: AppStrings.facebookFriend,
          onNext: () {}),
      StatusCardItems(
          imagePath: BImages.share,
          backgroundColor: BAppColors.lightBlue500.withOpacity(0.2),
          title: AppStrings.inviteSocialMedia,
          onNext: () {}),
    ];
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      /// <CustomAppBar>
      /// this is the CustomAppBar which overflows when called from another screen {
      appBar:  CustomAppBar(
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
      /// } </CustomAppBar>
      body: AppScreen(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: BSizes.size35),
          StatusCardList(statusCardList: statusCardList),
          SizedBox(height: BSizes.size35),
          TextEvenlySpacedRow(
              title: AppStrings.friends, widget: ThreeDots(onTap: () {})),
          GProfileList(gProfileList: gProfileList),
          SizedBox(height: BSizes.size35),
          TextEvenlySpacedRow(
              title: AppStrings.suggestedFriend,
              widget: ThreeDots(onTap: () {})),
          SizedBox(height: BSizes.size20),
          PersonList(personList: [
            PersonItems(
              profileImage: BImages.profile5,
              title: "ISLAM AZIRI",
              onFollow: () {},
            ),
            PersonItems(
              profileImage: BImages.profile5,
              title: "ISLAM AZIRI",
              onFollow: () {},
            ),
            PersonItems(
              profileImage: BImages.profile5,
              title: "ISLAM AZIRI",
              onFollow: () {},
            ),
            PersonItems(
              profileImage: BImages.profile5,
              title: "ISLAM AZIRI",
              onFollow: () {},
            ),
          ])
        ],
      )),
    );
  }
}
