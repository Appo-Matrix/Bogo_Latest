import 'package:flutter/material.dart';
class ClockIconPng extends StatelessWidget {
  final String? assetPath;
  const ClockIconPng({super.key, this.assetPath});

  @override
  Widget build(BuildContext context) {
    if (assetPath != null && assetPath!.isNotEmpty) {
      return Image.asset(
        assetPath!,
        height: 16,
        width: 16,
        fit: BoxFit.contain,
      );
    }
    return const Icon(Icons.access_time, size: 16, color: Colors.white);
  }
}