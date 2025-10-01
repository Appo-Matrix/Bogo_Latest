import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/match/match_screen.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/widgets/action_square.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/widgets/action_tile.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/widgets/mini_calendar_bar.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/widgets/profile_avatars.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/widgets/search_offer_field.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/widgets/time_wheel_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/common/common_widgets/primary_button.dart';
import '../../../../core/utils/constants/app_assets.dart';

class InvitationPlayScreen extends StatefulWidget {
  const InvitationPlayScreen({super.key});

  @override
  State<InvitationPlayScreen> createState() => _InvitationPlayScreenState();
}

class _InvitationPlayScreenState extends State<InvitationPlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,

      // Body
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back, Share, Gift
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back (left)
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_outlined,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 12),

                    // Middle: profile avatar + name
                    Expanded(
                      child: ProfileAvatars(
                        imagePath: BImages.profileFriend,
                        name: "Avinash Kumar",
                        fontSize: 22,
                        isOnline: true,
                        imageHeight: 130,
                        imageWidth: 130,
                      ),
                    ),

                    // Right column: Share + Gift
                    Column(
                      children: [
                        ActionSquare(
                            onTap: () {},
                            child: Image.asset(BImages.shareIcon,
                                fit: BoxFit.contain)),
                        const SizedBox(height: 12),
                        ActionSquare(
                            onTap: () {},
                            child:
                                Image.asset(BImages.giftImage, fit: BoxFit.contain)),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
                // Search offer text field
                SearchOfferField(
                  assetPath: BImages.searchAddIcon,
                  hintText: "Search for an offer",
                  onChanged: (value) {},
                ),

                SizedBox(
                  height: 10,
                ),

                // Date Format
                MiniCalendarBar(
                  initialDate: DateTime(2023, 1, 12),
                  onDateChanged: (d) {
                    // handle selection
                  },
                ),

                SizedBox(
                  height: 10,
                ),
                // Time
                TimeWheelPicker(
                  initialTime: const TimeOfDay(hour: 6, minute: 30),
                  onChanged: (t) {},
                ),

                SizedBox(
                  height: 10,
                ),
                // Add Conditions
                ActionTile(
                  assetPath:BImages.privacyIcon,
                  text: "Add a condition",
                  icon: Icons.keyboard_arrow_down,
                  onTap: () {},
                ),

                // Primary Button
                SizedBox(height: 20), // instead of Spacer
                Center(
                  child: PrimaryButton(
                    height: 92,
                    width: 384,
                    text: "Start the game",
                    backgroundColor: BAppColors.primary,
                    borderRadius: 46,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MatchScreen()));
                    },
                  ),
                ),
                const SizedBox(height: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
