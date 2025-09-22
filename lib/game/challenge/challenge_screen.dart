import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/game/challenge/invition/invitation_screen.dart';
import 'package:bogo_latest/game/challenge/widgets/dots_indicator.dart';
import 'package:bogo_latest/game/challenge/widgets/game_banner_carousel.dart';
import 'package:flutter/material.dart';
import '../../core/utils/common/common_widgets/primary_button.dart';
import '../../core/utils/constants/app_styles.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,

      // App Bar
      // appBar: CustomAppBar(),
      appBar: AppBar(
        backgroundColor: BAppColors.black1000,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_outlined,
            color: BAppColors.white,
          ),
        ),
        title: Text(
          "Game",
          style: BAppStyles.poppins(
            color: BAppColors.white,
            fontSize: BSizes.fontSizeLg,
            weight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ludo Banner
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 102,
                    width: 323,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: (Image.asset(
                        BImages.ludo,
                        fit: BoxFit.contain,
                      )),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 45,
              ),

              // Scroll Images
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GameBannerCarousel(
                    imageAssets: [
                      BImages.dives1,
                      BImages.dives2,
                      BImages.dives1
                    ],
                    onIndexChanged: (i) => setState(() => _current = i),
                  ),
                  Positioned(
                    left: 12,
                    bottom: -18,
                    child: DotsIndicator(
                      length: 3,
                      index: _current,
                      activeColor: const Color(0xFF9BE050),
                      inactiveColor: const Color(0xFF2F4A2A),
                    ),
                  ),
                ],
              ),

              Spacer(),
              // Primary Button
              PrimaryButton(
                height: 92,
                width: 384,
                text: "Start the game",
                backgroundColor: BAppColors.primary,
                borderRadius: 46,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvitationScreen()));
                },
              ),
              SizedBox(
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
