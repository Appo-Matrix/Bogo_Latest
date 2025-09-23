import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class PlayGame extends StatelessWidget {
  final VoidCallback onGame;
  final VoidCallback onNext;

  const PlayGame({super.key, required this.onGame, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      width: double.infinity,
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 154,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: BAppColors.backGroundColor,
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 175, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: BSizes.size20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppButtons.square(
                            imageIcon: "assets/icons/game.svg",
                            size: 25,
                            borderRadius: 0,
                            isBackGTransparent: true,
                            onTap: onGame),
                      ),
                      SizedBox(height: BSizes.cardRadiusSm),
                      Text(
                        "Challenge",
                        style: BAppStyles.body
                            .copyWith(fontSize: 18, color: BAppColors.white),
                      ),
                      SizedBox(height: BSizes.size5),
                      Text(
                        "play a game",
                        style: BAppStyles.heading1
                            .copyWith(fontSize: 18, color: BAppColors.white),
                      ),
                      SizedBox(height: BSizes.cardRadiusSm),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppButtons.square(
                          imageIcon: Icons.arrow_forward_ios_rounded,
                          isBackGTransparent: true,
                          size: 30,
                          onTap: onNext,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 25,
              child: Image.asset(
                "assets/images/dice.png",
                height: 102,
                width: 183,
              ),
            )
          ],
        ),
      ),
    );
  }
}
