import 'package:bogo_latest/features/dashboard/worktime/widgets/single_row_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../worktime_screen.dart';
class WorktimeList extends StatelessWidget {
  final List<WorkDay> items;
  final String? clockIconPath;

  // Layout tuning
  final double itemHeight; // overall row min height
  final double radius; // border radius for both pills
  final double overlap; // used when cardLeftFromScreen is null

  // Black card specs
  final double? cardWidth;
  final double? cardHeight;
  final double? cardLeftFromScreen; // absolute from screen left
  final Color cardColor;
  final Color cardShadowColor;

  // Green day chip specs
  final double? dayWidth;
  final double? dayHeight;
  final double? dayLeftFromScreen; // absolute from screen left
  final Color dayColor;

  // List paddings
  final double listHorizontalPadding; // ListView padding (for absolute math)
  final double listTopPadding; // to simulate absolute top for first row

  const WorktimeList({
    super.key,
    required this.items,
    this.clockIconPath,
    this.itemHeight = 100,
    this.radius = 35,
    this.overlap = 36,
    this.cardWidth = 281,
    this.cardHeight = 92,
    this.cardLeftFromScreen = 123,
    this.cardColor = BAppColors.black1000,
    this.cardShadowColor = BAppColors.black800,
    this.dayWidth = 328,
    this.dayHeight = 92,
    this.dayLeftFromScreen = 24,
    this.dayColor = BAppColors.main,
    this.listHorizontalPadding = 24,
    this.listTopPadding = 108,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        listHorizontalPadding, listTopPadding, listHorizontalPadding, 24,
      ),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        final day = items[index];
        return WorktimeItem(
          day: day.day,
          start: day.start,
          end: day.end,
          clockIconPath: clockIconPath,
          height: itemHeight,
          radius: radius,
          overlap: overlap,
          cardWidth: cardWidth,
          cardHeight: cardHeight,
          cardLeftFromScreen: cardLeftFromScreen,
          cardColor: cardColor,
          cardShadowColor: cardShadowColor,
          dayWidth: dayWidth,
          dayHeight: dayHeight,
          dayLeftFromScreen: dayLeftFromScreen,
          dayColor: dayColor,
          listHorizontalPadding: listHorizontalPadding,
        );
      },
    );
  }
}