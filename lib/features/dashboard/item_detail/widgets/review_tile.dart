import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ReviewTile extends StatelessWidget {
  final String name;
  final String comment;
  final String imagePath;

  const ReviewTile({
    super.key,
    required this.name,
    required this.comment,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),

        /// Review Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name + Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: BAppStyles.poppins(fontSize: 12, color: Colors.black54, weight: FontWeight.w600),
                  ),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              /// Comment
              Text(
                comment,
                style: BAppStyles.poppins(fontSize: 12, color: Colors.black54, weight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
