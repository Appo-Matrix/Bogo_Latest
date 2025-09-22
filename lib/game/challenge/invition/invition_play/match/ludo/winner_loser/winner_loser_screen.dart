import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/match/ludo/winner_loser/widgets/custom_action_button.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/match/ludo/winner_loser/widgets/hotel_card.dart';
import 'package:flutter/material.dart';
import '../../../widgets/profile_avatars.dart';

class WinnerLoserScreen extends StatefulWidget {
  const WinnerLoserScreen({super.key});

  @override
  State<WinnerLoserScreen> createState() => _WinnerLoserScreenState();
}

class _WinnerLoserScreenState extends State<WinnerLoserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                // Loser profile avatar
                Container(
                  height: 83,
                  width: 83,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(BImages.profileDive, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),

                // LOSER image
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Image.asset(BImages.loser, height: 40),
                  ],
                ),

                const Spacer(),

                // Cartoon avatar
                Image.asset(BImages.loserAvatar, height: 130, width: 98),
                const SizedBox(width: 16),
              ],
            ),

            // Loser Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Avinash Kumar ",
                      style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: BSizes.fontSizeMd,
                        weight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text:
                          "lost the\nchallenge, and he has to pay\nfor the next destination",
                      style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: BSizes.fontSizeMd,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Winner Section Container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: BAppColors.black900,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(34),
                  bottomRight: Radius.circular(34),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              child: Column(
                children: [
                  // Winner text
                  Image.asset(BImages.winner, height: 40),
                  const SizedBox(height: 12),

                  // Winner profile
                  ProfileAvatars(
                    imagePath: BImages.profileDive,
                    fontSize: BSizes.fontSizeSmx,
                    name: "Avinash Kumar",
                    isOnline: true,
                    imageHeight: 130,
                    imageWidth: 130,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "VANISH220",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeSm,
                      weight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Hotel Card with cartoon
                  HotelCard(
                    hotelName: "Ramada Hotel",
                    date: "18/06/2025",
                    time: "10:00",
                    avatarPath: BImages.ramada,
                  ),

                  const SizedBox(height: 35),

                  // Exit & Share buttons
                  Row(
                    children: [
                      // Exit button
                      CustomActionButton(
                        text: "Exit",
                        onTap: () {
                          // exit logic
                        },
                        bgColor: BAppColors.red900,
                        width: 124,
                      ),

                      const Spacer(),

                      // Share Story button
                      CustomActionButton(
                        text: "Share Story",
                        onTap: () {
                          // share story logic
                        },
                        bgColor: BAppColors.primary,
                        width: 225,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
