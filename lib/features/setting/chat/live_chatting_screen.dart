import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/setting/chat/widgets/chat_bubble.dart';
import 'package:bogo_latest/features/setting/chat/widgets/chat_input_field.dart';
import 'package:flutter/material.dart';


class LiveChattingScreen extends StatefulWidget {
  const LiveChattingScreen({super.key});

  @override
  State<LiveChattingScreen> createState() => _LiveChattingScreenState();
}

class _LiveChattingScreenState extends State<LiveChattingScreen> {
  final TextEditingController _tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    // scaling factors
    final chatBubbleW = w * 0.75;
    final avatarSize = w * 0.18;
    final inputH = h * 0.11;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Stack(
          children: [
            // App Bar
            Positioned(
              left: 8,
              right: 8,
              top: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: BAppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(w * 0.01),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: BAppColors.black700, width: w * 0.005),
                        ),
                        child: CircleAvatar(
                          radius: w * 0.045,
                          backgroundImage: AssetImage(BImages.profile),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF63E06E),
                          radius: w * 0.015,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Messages
            Positioned.fill(
              top: h * 0.07,
              bottom: inputH + h * 0.05,
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.04, vertical: h * 0.05),
                children: [

                  // User Message
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: h * 0.08,         // fixed minimum height
                        maxWidth: chatBubbleW,  // responsive width
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05,
                        vertical: h * 0.019,
                      ),
                      decoration: BoxDecoration(
                        color: BAppColors.black900,
                        borderRadius: BorderRadius.circular(w * 0.08),
                      ),
                      child: Center(
                        child: Text(
                          "hello im not beable to open",
                          textAlign: TextAlign.center,
                          style: BAppStyles.poppins(
                            color: BAppColors.white,
                            fontSize: w * 0.04,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.015),

                  // Left aligned with avatar bubble
                  ChatBubble(
                    title: "hello!",
                    subtitle: "I'm Tom, how can I help you?",
                    isBot: true,
                  ),

                ],
              ),
            ),

            // Input Field
            Positioned(
              left: w * 0.04,
              right: w * 0.04,
              bottom: h * 0.015,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ChatInputField(
                    controller: _tc,
                    onSend: () {
                      print("Message Sent: ${_tc.text}");
                      _tc.clear();
                    },
                  ),


                  // Floating avatar + thought cloud
                  Positioned(
                    left: w * 0.06,
                    top: -h * 0.07,
                    child: Row(
                      children: [
                        Image.asset(BImages.user3d,
                            width: w * 0.15, height: w * 0.15),
                        Image.asset(BImages.thoughtCloud,
                            width: w * 0.12, height: h * 0.05),
                      ],
                    ),
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
