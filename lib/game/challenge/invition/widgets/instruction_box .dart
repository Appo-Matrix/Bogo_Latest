import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class InstructionBox extends StatelessWidget {
  final List<String> instructions;

  const InstructionBox({
    super.key,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 380,
      decoration: BoxDecoration(
        color: BAppColors.black900,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < instructions.length; i++) ...[
              _InstructionRow(text: instructions[i]),
              if (i != instructions.length - 1) const SizedBox(height: 45),
            ]
          ],
        ),
      ),
    );
  }
}

class _InstructionRow extends StatelessWidget {
  final String text;

  const _InstructionRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        Container(
          height: BSizes.fontSizeLg,  // 18
          width: BSizes.fontSizeLg,  // 18
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: BAppColors.white, width: 3),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: BAppStyles.poppins(
              color: BAppColors.white,
              fontSize: BSizes.fontSizeMd,
              weight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
