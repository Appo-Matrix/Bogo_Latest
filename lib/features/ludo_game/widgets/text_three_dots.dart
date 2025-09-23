import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_styles.dart';

class TextEvenlySpacedRow extends StatelessWidget {
  final String title;
  final Widget widget;

  const TextEvenlySpacedRow(
      {super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                BAppStyles.body.copyWith(color: BAppColors.white, fontSize: 18),
          ),
          widget
        ],
      ),
    );
  }
}
