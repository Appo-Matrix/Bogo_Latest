import 'package:bogo_latest/features/dashboard/reservation/widgets/reservation_calendar.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
class RailItem extends StatelessWidget {
  final String label;
  final bool selected;
  const RailItem({required this.label, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              color: BAppColors.main,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected ? kBlack : BAppColors.black400,
            ),
          ),
        ],
      ),
    );
  }
}