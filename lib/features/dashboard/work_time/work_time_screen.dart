import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/features/dashboard/widgets/work_time_widget.dart';
import 'package:flutter/material.dart';

class WorkTimeScreen extends StatelessWidget {
  const WorkTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workItems = [
      const WorkTimeItem(
          day: 'Saturday', startTime: '10:00 PM', endTime: '10:00 PM'),
      const WorkTimeItem(
          day: 'Sunday', startTime: '10:00 PM', endTime: '10:00 PM'),
      const WorkTimeItem(
          day: 'Monday', startTime: '10:00 PM', endTime: '10:00 PM'),
      const WorkTimeItem(
          day: 'Tuesday', startTime: '10:00 PM', endTime: '10:00 PM'),
      const WorkTimeItem(
          day: 'Wednesday', startTime: '10:00 PM', endTime: '10:00 PM'),
      const WorkTimeItem(
          day: 'Thursday', startTime: '10:00 PM', endTime: '10:00 PM'),
      const WorkTimeItem(
          day: 'Friday', startTime: '10:00 PM', endTime: '10:00 PM'),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        showBack: true,
        title: "Worktime",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [WorkTimeList(items: workItems)],
          ),
        ),
      ),
    );
  }
}
