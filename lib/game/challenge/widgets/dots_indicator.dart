import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int length;
  final int index;
  final Color activeColor;
  final Color inactiveColor;

  const DotsIndicator({
    super.key,
    required this.length,
    required this.index,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (i) {
        final isActive = i == index;
        return Padding(
          padding: const EdgeInsets.only(right: 6),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isActive ? 8 : 28, // UI: first dot small, others pill
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
