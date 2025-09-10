import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';

class LiveChattingScreen extends StatefulWidget {
  const LiveChattingScreen({super.key});

  @override
  State<LiveChattingScreen> createState() => _LiveChattingScreenState();
}

class _LiveChattingScreenState extends State<LiveChattingScreen> {
  final TextEditingController _tc = TextEditingController();
  static const double _inputH = 78;
  static const double _inputRadius = 28;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Stack(
          children: [
            // App bar (back + profile)
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
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: BAppColors.black700, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(BImages.profile),
                        ),
                      ),
                      const Positioned(
                        right: 2,
                        top: 2,
                        child: CircleAvatar(
                            backgroundColor: Color(0xFF63E06E), radius: 5),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Messages (bottom aligned)
            Positioned.fill(
              top: 56,
              bottom: _inputH + 80,
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 314,
                      height: 92,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 14),
                      decoration: BoxDecoration(
                        color: BAppColors.black900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "hello im not beable to open",
                          textAlign: TextAlign.center,
                          style: BAppStyles.poppins(
                            color: BAppColors.white,
                            fontSize: BSizes.fontSizeMd,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12), // Space between messages

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 312,
                            height: 92,
                            padding: const EdgeInsets.fromLTRB(75, 28, 18, 16),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(46),
                                bottomRight: Radius.circular(46),
                                topLeft: Radius.circular(95),
                                bottomLeft: Radius.circular(16),
                              ),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF8DD05E),
                                  Color(0xFF64AF4E),
                                ],
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
                                  "hello!",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.white,
                                    fontSize: BSizes.fontSizeMd,
                                    weight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "im Tom How can i help you?",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.white,
                                    fontSize: BSizes.fontSizeSm,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: -25,
                            top: -10,
                            child: Container(
                              width: 78,
                              height: 78,
                              decoration: BoxDecoration(
                                color: BAppColors.white,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 10,
                                      offset: Offset(0, 4)),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  BImages.appLogoGreen,
                                  width: 48,
                                  height: 24,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom input (avatar + cloud outside top-left)
            Positioned(
              left: 16,
              right: 16,
              bottom: 12,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 384,
                    height: 92,
                    decoration: BoxDecoration(
                      color: const Color(0xFF232323),
                      borderRadius: BorderRadius.circular(41),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 18,
                            offset: Offset(0, 8)),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Center(
                          child: Image.asset(BImages.emojiFace,
                              width: 43, height: 43, fit: BoxFit.contain),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _tc,
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w700,
                            ),
                            decoration: InputDecoration(
                              hintText: "Text message",
                              hintStyle: BAppStyles.poppins(
                                color: BAppColors.white.withOpacity(0.85),
                                fontSize: BSizes.fontSizeMd,
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
                        Center(
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4B4B4B),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                BImages.sendTriangle,
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                                color: BAppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: -62,
                    child: Row(
                      children: [
                        Image.asset(BImages.user3d,
                            width: 62, height: 62, fit: BoxFit.contain),
                        Image.asset(BImages.thoughtCloud,
                            width: 51, height: 34, fit: BoxFit.contain),
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
