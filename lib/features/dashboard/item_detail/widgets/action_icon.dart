import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const ActionIcon(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 92,
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(35)),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
