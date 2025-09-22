import 'package:bogo_latest/game/challenge/invition/invition_play/invitation_play_screen.dart';
import 'package:bogo_latest/game/challenge/invition/widgets/instruction_box%20.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/common/common_widgets/primary_button.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_colors.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BAppColors.black1000,

        // App Bar
        // appBar: CustomAppBar(),
        appBar: AppBar(
          backgroundColor: BAppColors.black1000,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: BAppColors.white,
            ),
          ),
        ),

        // Body
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 45),
                      child: InstructionBox(
                        instructions: const [
                          "Enter the proposition and its details",
                          "Choose the game",
                          "The loser in the game is the one who\npays the full price for the group",
                        ],
                      ),
                    ),
                    Positioned(
                      top: -20,
                      left: -25,
                      child: Image.asset(
                        BImages.backgroundCh1,
                        height: 123,
                        width: 248,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: PrimaryButton(
                    height: 92,
                    width: 384,
                    text: "NEXT",
                    backgroundColor: BAppColors.primary,
                    borderRadius: 46,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvitationPlayScreen()));
                    },
                  ),
                ),
                const SizedBox(height: 45),
              ],
            ),
          ),
        ));
  }
}
