
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// ---------- Theme colors ----------

class ReservationCalendar extends StatefulWidget {
  const ReservationCalendar({super.key});

  @override
  State<ReservationCalendar> createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  DateTime selectedDate = DateTime(2023, 1, 12);

  // static demo week
  final days = [10, 11, 12, 13, 14, 15, 16];
  final weekdays = ["M", "T", "W", "T", "F", "S", "S"];

  @override
  Widget build(BuildContext context) {
    final selectedDay = selectedDate.day;
    final formattedMonthYear = DateFormat("MMMM yyyy").format(selectedDate);

    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalPad = 16.0;
        const verticalPad = 14.0;
        const itemGap = 2.0;

        final usableW = constraints.maxWidth == double.infinity
            ? MediaQuery.of(context).size.width
            : constraints.maxWidth;
        final trackW = (usableW - (horizontalPad * 2));
        final slotW = (trackW - (itemGap * 2 * 7)) / 7;

        // Capsule sizing
        final capsuleW = slotW.clamp(24.0, 42.0);
        final capsuleH = (capsuleW * 1.45).clamp(34.0, 56.0);
        final radius = (capsuleW / 2).clamp(12.0, 20.0);

        // 👉 Compute needed total height (title ~22px, gap 10, paddings + capsuleH)
        final neededHeight = (verticalPad * 2) + 22 + 10 + capsuleH;

        return SizedBox(
          height: neededHeight, // <— claims enough vertical space to prevent bottom overflow
          child: Container(
            decoration: BoxDecoration(
              color: BAppColors.black1000,
              borderRadius: BorderRadius.circular(35),
            ),
            padding: const EdgeInsets.symmetric(horizontal: horizontalPad, vertical: verticalPad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Month + Year
                Text(
                  formattedMonthYear,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: BAppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),

                // Days row (horizontal scroll as safety on ultra-narrow widths)
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: trackW),
                      child: Row(
                        children: List.generate(days.length, (index) {
                          final day = days[index];
                          final week = weekdays[index];
                          final isSelected = day == selectedDay;
                          final isWeekend = index >= 5;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: itemGap),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    day,
                                  );
                                });
                              },
                              child: SizedBox(
                                width: slotW,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: capsuleW,
                                    height: capsuleH,
                                    decoration: BoxDecoration(
                                      color: isSelected ? BAppColors.main : Colors.transparent,
                                      borderRadius: BorderRadius.circular(radius),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          week,
                                          style: TextStyle(
                                            color: isSelected
                                                ? BAppColors.white
                                                : (isWeekend ? Colors.red : BAppColors.white),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "$day",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: isSelected
                                                ? BAppColors.white
                                                : (isWeekend ? Colors.red : BAppColors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
