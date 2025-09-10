import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final Widget child;

  const AppScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: SafeArea(child: child),
      ),
    );
  }
}
