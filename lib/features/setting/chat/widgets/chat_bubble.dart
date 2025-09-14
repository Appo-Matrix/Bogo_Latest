import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';

class ChatBubble extends StatelessWidget {
  final String title;        // First line (e.g. "hello!")
  final String subtitle;     // Second line (e.g. "im Tom How can i help you?")
  final String avatarImage;  // Avatar asset image
  final bool isBot;          // Different alignment for bot/user

  const ChatBubble({
    super.key,
    required this.title,
    required this.subtitle,
    this.avatarImage = BImages.appLogoGreen,
    this.isBot = true,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final double avatarSize = w * 0.18;       // responsive avatar size
    final double chatBubbleW = w * 0.75;      // bubble width

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isBot) SizedBox(width: w * 0.04), // spacing for bot message
        Stack(
          clipBehavior: Clip.none,
          children: [
            /// Chat bubble
            Container(
              width: chatBubbleW,
              padding: EdgeInsets.fromLTRB(
                isBot ? avatarSize * 0.9 : w * 0.04,
                h * 0.025,
                w * 0.04,
                h * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(w * 0.12),
                  bottomRight: Radius.circular(w * 0.12),
                  topLeft: Radius.circular(isBot ? w * 0.25 : w * 0.12),
                  bottomLeft: Radius.circular(isBot ? w * 0.05 : w * 0.12),
                ),
                gradient: isBot
                    ? const LinearGradient(
                  colors: [Color(0xFF8DD05E), Color(0xFF64AF4E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : const LinearGradient(
                  colors: [Color(0xFF3A3A3A), Color(0xFF2A2A2A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: w * 0.04,
                      weight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    subtitle,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: w * 0.035,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Avatar (only for bot)
            if (isBot)
              Positioned(
                left: -avatarSize * 0.35,
                top: -avatarSize * 0.15,
                child: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    color: BAppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      avatarImage,
                      width: avatarSize * 0.6,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (!isBot) SizedBox(width: w * 0.04), // spacing for user message
      ],
    );
  }
}
