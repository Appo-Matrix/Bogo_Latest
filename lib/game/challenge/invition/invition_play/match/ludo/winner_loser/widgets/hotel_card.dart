import 'package:flutter/material.dart';
import '../../../../../../../../core/utils/constants/app_assets.dart';
import '../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../../../../core/utils/constants/app_styles.dart';

class HotelCard extends StatelessWidget {
  final String hotelName;
  final String date;
  final String time;
  final String avatarPath;

  const HotelCard({
    super.key,
    required this.hotelName,
    required this.date,
    required this.time,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 171,
          width: 391,
          decoration: BoxDecoration(
            color: BAppColors.black1000,
            borderRadius: BorderRadius.circular(35),
          ),
          padding: const EdgeInsets.only(right: 100, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hotel avatar + name
              Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      avatarPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    hotelName,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.size20,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Date Row
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "date",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    date,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Time Row
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "time",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    time,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Cartoon overlay
        Positioned(
          right: -8,
          top: -32,
          child: Image.asset(
            BImages.cartoon,
            height: 194,
            width: 113,
          ),
        ),
      ],
    );
  }
}
