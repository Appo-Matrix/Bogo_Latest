


import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class TaskRewardCard extends StatelessWidget {
  final int xp;
  final String title;
  final int progress;
  final int total;
  final String image;

  const TaskRewardCard({
    super.key,
    required this.xp,
    required this.title,
    required this.progress,
    required this.total,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = progress / total;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: BAppColors.black1000,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// Left side (XP Badge + Image)
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: BAppColors.purple1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                /// XP Badge
                Positioned(
                  top: 2,
                  left: 8,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "$xp XP",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                /// Image
                Center(
                  child: Image.asset(
                    BImages.user3d,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// Right side (Title + Progress)
          Expanded(
            child: Stack(
              children: [
                /// Title + Progress bar (aligned to left/top)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: 15,
                        weight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        /// Progress bar with number
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  double width =
                                      constraints.maxWidth * progressValue;
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: BAppColors.backGroundColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                left: 0,
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: BAppColors.backGroundColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "$progress",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),
                        // 👈 space between bar & arrow

                        /// Arrow
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
