import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class TaskRewardCard extends StatelessWidget {
  final int xp;
  final String title;
  final int progress;
  final int total;
  final String image;
  final VoidCallback onNext;

  const TaskRewardCard({
    super.key,
    required this.xp,
    required this.title,
    required this.progress,
    required this.total,
    required this.image,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = progress / total;

    return Container(
      height: 154,
      width: double.infinity,
      decoration: BoxDecoration(
        color: BAppColors.darkGray400,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            /// Left side (XP Badge + Image)
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(image))),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 37,
                    width: 94,
                    decoration: BoxDecoration(
                      color: BAppColors.yellow700.withOpacity(.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Center(
                              child: Image.asset(
                                "assets/icons/xp.png",
                              ),
                            ),
                          ),
                          Text(
                            "$xp xp",
                            style: BAppStyles.heading1.copyWith(
                                color: BAppColors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// Right side (Title + Progress)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(),
                  Text(
                    title,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: 18,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      /// Progress bar with number
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 43,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double width =
                                    constraints.maxWidth * progressValue;
                                return Stack(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: width,
                                      height: 43,
                                      decoration: BoxDecoration(
                                          color: BAppColors.backGroundColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: BAppColors.backGroundColor,
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "$progress",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      /// Arrow
                      AppButtons.square(
                          imageIcon: Icons.arrow_forward_ios_rounded,
                          size: 40,
                          isBackGTransparent: true,
                          onTap: onNext)
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
