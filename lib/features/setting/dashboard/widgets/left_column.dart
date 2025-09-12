import 'package:bogo_latest/features/setting/dashboard/widgets/radial_days_painter.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';
import 'arc_painter.dart';

class LeftColumn extends StatelessWidget {
  final double width;

  const LeftColumn({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ===== Saving Cost =====
        SizedBox(
          width: width,
          height: 92,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(26)),
            child: Container(
              color: const Color(0xFFF9B233), // warm yellow
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    BImages.discount,
                    width: 46,
                    height: 46,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "saving cost",
                        style: BAppStyles.poppins(
                          color: BAppColors.white.withOpacity(0.9),
                          fontSize: BSizes.fontSizeSm,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "5600 DA",
                        style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: BSizes.fontSizeLg,
                          weight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // ===== Subscription Cost + Arc Illustration =====
        SizedBox(
          width: width,
          height: 294,
          child: Container(
            decoration: BoxDecoration(
              color: BAppColors.black900,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                // amounts
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "1400 DA\n",
                            style: BAppStyles.poppins(
                              color: const Color(0xFFFF5D31),
                              fontSize: BSizes.fontSizeLg,
                              weight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: "The subscription cost\n\n",
                            style: BAppStyles.poppins(
                              color: BAppColors.black400,
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "7000 DA\n",
                            style: BAppStyles.poppins(
                              color: const Color(0xFF1EA0FF),
                              fontSize: BSizes.fontSizeLg,
                              weight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: "The expended amount",
                            style: BAppStyles.poppins(
                              color: BAppColors.black400,
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // decorative arc (bottom-right)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomPaint(
                      size: Size(width * 0.9, 160),
                      painter: ArcPainter(),
                    ),
                  ),
                ),
                // coins
                Positioned(
                  left: 6,
                  bottom: 86,
                  child: Image.asset(
                    BImages.coins,
                    width: 54,
                    height: 54,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),

        // ===== Subscription (radial gauge + premium) =====
        SizedBox(
          width: width,
          height: 356,
          child: Container(
            decoration: BoxDecoration(
              color: BAppColors.black900,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                // radial gauge (custom paint)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(double.infinity, double.infinity),
                        painter: RadialDaysPainter(progress: 14 / 30),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "14",
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeESm,
                              weight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "day",
                            style: BAppStyles.poppins(
                              color: BAppColors.black400,
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Subscription",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: BAppColors.black900,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Image.asset(BImages.crown, width: 28, height: 28),
                      const SizedBox(width: 10),
                      Text(
                        "premium",
                        style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: BSizes.fontSizeMd,
                          weight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
