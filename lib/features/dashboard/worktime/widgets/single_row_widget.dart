import 'dart:math' as math;

import 'package:flutter/material.dart';



import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
import 'clockIcon_png.dart';
import 'dotted_divider.dart';
class WorktimeItem extends StatelessWidget {
  final String day;
  final String start;
  final String end;
  final String? clockIconPath;

  final double height;
  final double radius;
  final double overlap; // fallback overlap when not using absolute left

  // Black card
  final double? cardWidth;
  final double? cardHeight;
  final double? cardLeftFromScreen;
  final Color cardColor;
  final Color cardShadowColor;

  // Green chip
  final double? dayWidth;
  final double? dayHeight;
  final double? dayLeftFromScreen;
  final Color dayColor;

  final double listHorizontalPadding;

  const WorktimeItem({
    super.key,
    required this.day,
    required this.start,
    required this.end,
    this.clockIconPath,
    this.height = 100,
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
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Convert absolute "left from screen" to left within the row (respect ListView padding)
    final double effectiveCardLeft = (cardLeftFromScreen != null)
        ? (cardLeftFromScreen! - listHorizontalPadding)
        : (width * 0.50 - overlap);
    final double effectiveDayLeft = (dayLeftFromScreen != null)
        ? (dayLeftFromScreen! - listHorizontalPadding)
        : 0.0;

    // Clamp sizes for narrow screens
    final double effectiveCardWidth = math.min(cardWidth ?? (width - effectiveCardLeft), width - effectiveCardLeft);
    final double effectiveCardHeight = cardHeight ?? (height - 8);

    final double effectiveDayWidth = math.min(dayWidth ?? (effectiveCardLeft - 8), width - effectiveDayLeft);
    final double effectiveDayHeight = dayHeight ?? (height - 8);

    final double rowHeight = math.max(height, math.max(effectiveCardHeight, effectiveDayHeight));

    return SizedBox(
      height: rowHeight,
      child: Stack(
        children: [
          // Green day pill
          Positioned(
            left: effectiveDayLeft,
            width: effectiveDayWidth,
            top: (rowHeight - effectiveDayHeight) / 2,
            height: effectiveDayHeight,
            child: Container(
              decoration: BoxDecoration(
                color: dayColor, // #8BC255 by default
                borderRadius: BorderRadius.circular(radius),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.centerLeft,
              child: Text(
                day,
                style: BAppStyles.poppins(
                  fontSize: 14,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // Black time card with shadow (-4, 0, 4, #00000040)
          Positioned(
            left: effectiveCardLeft,
            width: effectiveCardWidth,
            top: (rowHeight - effectiveCardHeight) / 2,
            height: effectiveCardHeight,
            child: Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: Colors.white.withOpacity(0.06)),
                boxShadow: [
                  BoxShadow(
                    color: cardShadowColor, // #00000040
                    offset: const Offset(-4, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  ClockIconPng(assetPath: clockIconPath),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      start,
                      style: BAppStyles.poppins(
                        fontSize: 13,
                        weight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const DottedDivider(),
                  const SizedBox(width: 10),
                  ClockIconPng(assetPath: clockIconPath),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      end,
                      style: BAppStyles.poppins(
                        fontSize: 13,
                        weight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}