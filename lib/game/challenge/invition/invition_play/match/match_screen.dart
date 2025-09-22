import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/match/ludo/winner_loser/winner_loser_screen.dart';
import 'package:bogo_latest/game/challenge/invition/invition_play/match/widgets/circle_action_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/common/common_widgets/primary_button.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../widgets/profile_avatars.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Stack(
          children: [
            // Grid Containers with avatar
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Top-Left
                        Expanded(
                          child: Container(
                            color: BAppColors.black900,
                            child: Center(
                              child: ProfileAvatars(
                                imagePath: BImages.profileDive,
                                fontSize: BSizes.fontSizeSmx,
                                name: "Avinash Kumar",
                                isOnline: true,
                                imageHeight: 130,
                                imageWidth: 130,
                              ),
                            ),
                          ),
                        ),
                        // Top-Right
                        Expanded(
                          child: Container(
                            color: BAppColors.black900.withOpacity(.70),
                            child: Center(
                              child: ProfileAvatars(
                                imagePath: BImages.profileDive,
                                fontSize: BSizes.fontSizeSmx,
                                name: "Avinash Kumar",
                                isOnline: true,
                                imageHeight: 130,
                                imageWidth: 130,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Bottom-Left (Add user)
                        Expanded(
                          child: Container(
                            color: BAppColors.black900.withOpacity(.70),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleActionButton(
                                    icon: Icons.add,
                                    onTap: () {},
                                  ),
                                  const SizedBox(height: 12),
                                  const Text("Avinash Kumar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Bottom-Right
                        Expanded(
                          child: Container(
                            color: BAppColors.black900,
                            child: Center(
                              child: ProfileAvatars(
                                imagePath: BImages.profileDive,
                                fontSize: BSizes.fontSizeSmx,
                                name: "Avinash Kumar",
                                isOnline: true,
                                imageHeight: 130,
                                imageWidth: 130,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Back Icon
            Positioned(
              top: 8,
              left: 8,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back_outlined, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Primary Button
            Positioned(
              bottom: 20,
              left: (w - 384) / 2 < 24 ? 24 : (w - 384) / 2,
              right: (w - 384) / 2 < 24 ? 24 : (w - 384) / 2,
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
                        builder: (context) => const WinnerLoserScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
