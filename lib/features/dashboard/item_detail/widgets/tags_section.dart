import 'package:flutter/material.dart';
import 'icon_card.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          IconCard(icon: Icons.free_breakfast, text: "Breakfast"),
          IconCard(icon: Icons.beach_access, text: "Beach"),
          IconCard(icon: Icons.fitness_center, text: "Gym"),
          IconCard(icon: Icons.spa, text: "Spa"),
          IconCard(icon: Icons.wifi, text: "Free WiFi"),
        ],
      ),
    );
  }
}
