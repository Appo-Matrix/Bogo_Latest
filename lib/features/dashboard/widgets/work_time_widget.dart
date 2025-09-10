import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_spacers.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class WorkTimeItem {
  final String day;
  final String startTime;
  final String endTime;

  const WorkTimeItem({
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}

class WorkTimeList extends StatelessWidget {
  final List<WorkTimeItem> items;

  const WorkTimeList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => _WorkTime(workTimeItem: item)).toList(),
    );
  }
}

class _WorkTime extends StatelessWidget {
  final WorkTimeItem workTimeItem;

  const _WorkTime({required this.workTimeItem, super.key});

  Widget _timeWidget(String time) {
    return Row(
      children: [
        const Icon(Icons.access_time_filled, color: BAppColors.white, size: 21),
        AppSpacers.h5,
        Text(
          time,
          style: BAppStyles.poppins(color: BAppColors.white, fontSize: 16, weight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            height: 92,
            width: double.infinity,
            decoration: BoxDecoration(
              color: BAppColors.backGroundColor,
              borderRadius: BorderRadius.circular(35),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              workTimeItem.day,
              style: BAppStyles.poppins(color: BAppColors.white, fontSize: 14, weight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.65,
              child: Container(
                height: 92,
                decoration: BoxDecoration(
                  color: BAppColors.black1000,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _timeWidget(workTimeItem.startTime),
                    const Text(".....", style: TextStyle(color: BAppColors.white)),
                    _timeWidget(workTimeItem.endTime),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
