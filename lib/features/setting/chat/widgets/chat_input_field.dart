import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    this.hintText = "Text message",
    this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final double inputH = h * 0.1;       // responsive height
    final double sendBtn = w * 0.14;     // responsive send button size

    return Container(
      height: inputH,
      decoration: BoxDecoration(
        color: const Color(0xFF232323),
        borderRadius: BorderRadius.circular(w * 0.1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Row(
        children: [
          // Emoji
          Image.asset(
            BImages.emojiFace,
            width: w * 0.1,
            height: w * 0.1,
          ),
          SizedBox(width: w * 0.025),

          // Input
          Expanded(
            child: TextField(
              controller: controller,
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: w * 0.04,
                weight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: BAppStyles.poppins(
                  color: BAppColors.white.withOpacity(0.85),
                  fontSize: w * 0.04,
                  weight: FontWeight.w700,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          // Send Button
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: sendBtn,
              height: sendBtn,
              decoration: const BoxDecoration(
                color: Color(0xFF4B4B4B),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  BImages.sendTriangle,
                  width: sendBtn * 0.5,
                  fit: BoxFit.contain,
                  color: BAppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
