import 'package:bogo_latest/core/utils/common_widgets/app_scaffold.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/ludo_game/profile/friends_info_screen.dart';
import 'package:bogo_latest/features/ludo_game/widgets/active_profile_pic.dart';
import 'package:bogo_latest/features/ludo_game/widgets/event_card.dart';
import 'package:bogo_latest/features/ludo_game/widgets/g_profile_list_tile.dart';
import 'package:bogo_latest/features/ludo_game/widgets/person_widget.dart';
import 'package:bogo_latest/features/ludo_game/widgets/play_game.dart';
import 'package:bogo_latest/features/ludo_game/widgets/status_card.dart';
import 'package:bogo_latest/features/ludo_game/widgets/task_reward_card.dart';
import 'package:bogo_latest/features/ludo_game/widgets/text_three_dots.dart';
import 'package:bogo_latest/features/ludo_game/widgets/three_dots.dart';
import 'package:flutter/material.dart';

class GameProfileScreen extends StatelessWidget {
  const GameProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StatusCardItems> statusCardList = [
      StatusCardItems(
          imagePath: BImages.favourite,
          backgroundColor: BAppColors.orange800,
          title: "Favorite",
          count: 5,
          onNext: () {}),
      StatusCardItems(
          imagePath: BImages.driving,
          backgroundColor: BAppColors.purple400,
          title: "reservation",
          count: 2,
          onNext: () {}),
      StatusCardItems(
          imagePath: BImages.xp,
          backgroundColor: BAppColors.yellow700,
          title: "Total XP",
          count: 2000,
          onNext: () {}),
    ];
    final List<GProfileItems> gProfileList = [
      GProfileItems(
          onTile: () {},
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {}),
      GProfileItems(
          onTile: () {},
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {}),
      GProfileItems(
          onTile: () {},
          imagePath: BImages.profile5,
          titleText: "ISLAM AZIRI",
          subtitleText: "VANIS220",
          onTrailing: () {}),
    ];
    final List<PersonItems> personList = [
      PersonItems(
          profileImage: BImages.profile5,
          title: "ISLAM AZIRI",
          onFollow: () {},
          onFriend: () { // on Tap this button navigates to FriendsInfoScreen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FriendsInfoScreen()));
          }),
      PersonItems(
          profileImage: BImages.profile5,
          title: "ISLAM AZIRI",
          onFollow: () {},
          onFriend: () { // on Tap this button navigates to FriendsInfoScreen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FriendsInfoScreen()));
          }),
      PersonItems(
          profileImage: BImages.profile5,
          title: "ISLAM AZIRI",
          onFollow: () {},
          onFriend: () { // on Tap this button navigates to FriendsInfoScreen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FriendsInfoScreen()));
          }),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BAppColors.black1000,
      appBar: CustomAppBar(
          isDark: true,
          showBack: true,
          title: AppStrings.profile,
          trailingWidget: ActiveProfilePic(
              profilePic: BImages.completeScreen,
              buttonImage: BImages.edit,
              onProfile: () {},
              onButton: () {})),
      body: AppScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: BSizes.size35),
            StatusCardList(statusCardList: statusCardList),
            SizedBox(height: BSizes.size35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextEvenlySpacedRow(
                          title: AppStrings.friends,
                          widget: ThreeDots(onTap: () {})),
                      SizedBox(height: BSizes.size20),
                      SizedBox(
                          height: 280,
                          child: GProfileList(gProfileList: gProfileList))
                    ],
                  ),
                ),
                PersonList(
                  personList: personList,
                  showAddButton: true,
                ),
              ],
            ),
            SizedBox(height: BSizes.size20 + 10),
            PlayGame(
              onGame: () {},
              onNext: () {},
            ),
            SizedBox(height: BSizes.size20),
            EventCard(
                imagePath: BImages.p2p,
                title: AppStrings.goCollect,
                subtitle: AppStrings.goInvite,
                onNext: () {}),
            SizedBox(height: BSizes.size20),
            TaskRewardCard(
                xp: 100,
                title: AppStrings.invite10win100xp,
                progress: 0,
                onNext: () {},
                total: 100,
                image: BImages.invitePeople),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.viewMore,
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 12,
                          weight: FontWeight.w500),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
