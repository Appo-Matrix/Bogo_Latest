import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBack;
  final String profileImage;

  const CustomAppBar({
    super.key,
    this.onBack,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back Button
        IconButton(
          onPressed: onBack ?? () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: BAppColors.white),
        ),
        const Spacer(),

        // Profile with green online dot
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: BAppColors.black700, width: 2),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(profileImage),
              ),
            ),
            Positioned(
              right: 1,
              top: 6,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: BAppColors.main,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Colors.green, blurRadius: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
