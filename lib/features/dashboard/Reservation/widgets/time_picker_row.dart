import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';


class TimePickerRow extends StatelessWidget {
  const TimePickerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hour
        _timeBox("06"),
        const SizedBox(width: 5),
        const Text(":", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(width: 5),

        // Minute
        _timeBox("30"),
        const SizedBox(width: 6),

        // AM / PM
        _timeBox("AM"),
      ],
    );
  }

  /// 🔲 Reusable time container
  Widget _timeBox(String value) {
    return Container(
      height: 82,
      width: 82,
      decoration: BoxDecoration(
        color: BAppColors.black200,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
