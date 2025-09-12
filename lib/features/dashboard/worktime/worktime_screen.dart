import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/dashboard/worktime/widgets/worktime_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../storedetail/widgets/back_button.dart'; // 👈 Import your BSizes


/// Worktime screen (clean with BSizes constants)
class WorktimeScreen extends StatelessWidget {
  const WorktimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final days = <WorkDay>[
      const WorkDay(AppStrings.saturday, '10:00 PM', '10:00 PM'),
      const WorkDay(AppStrings.sunday, '10:00 PM', '10:00 PM'),
      const WorkDay(AppStrings.monday, '10:00 PM', '10:00 PM'),
      const WorkDay(AppStrings.tuesday, '10:00 PM', '10:00 PM'),
      const WorkDay(AppStrings.wednesday, '10:00 PM', '10:00 PM'),
      const WorkDay(AppStrings.thursday, '10:00 PM', '10:00 PM'),
      const WorkDay(AppStrings.friday, '10:00 PM', '10:00 PM'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: BSizes.sm), // 8.0
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: BSizes.md), // 16.0
              child: Row(
                children: [
                  const BackButtonWidgets(),
                  const SizedBox(width: BSizes.sm), // 8.0
                  Text(
                    AppStrings.worktime, // 'Worktime',
                    style: BAppStyles.poppins(
                      fontSize: BSizes.fontSizeLg, // 18.0
                      weight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: WorktimeList(
                  items: days,
                  listTopPadding: BSizes.imageCarouselHeight / 2, // 100.0 instead of 108
                  listHorizontalPadding: BSizes.lg, // 24.0
                  dayWidth: 328, // 👈 You can create a constant for this if reused
                  dayHeight: 92, // 👈 same here
                  dayLeftFromScreen: BSizes.lg, // 24.0
                  dayColor: BAppColors.main,
                  cardWidth: 281,
                  cardHeight: 92,
                  radius: BSizes.cardRadiusLg + 19, // ~35 (16+19)
                  cardLeftFromScreen: 123,
                  cardColor: BAppColors.black1000,
                  cardShadowColor: BAppColors.black800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkDay {
  final String day;
  final String start;
  final String end;
  const WorkDay(this.day, this.start, this.end);
}
