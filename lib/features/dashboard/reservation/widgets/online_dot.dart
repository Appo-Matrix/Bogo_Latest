import 'package:bogo_latest/features/dashboard/reservation/widgets/reservation_calendar.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
class OnlineDot extends StatelessWidget {
  const OnlineDot({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(color: BAppColors.white, shape: BoxShape.circle),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: const BoxDecoration(color: BAppColors.main, shape: BoxShape.circle),
      ),
    );
  }
}