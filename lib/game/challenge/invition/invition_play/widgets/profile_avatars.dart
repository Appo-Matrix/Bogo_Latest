import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_styles.dart';
import '../../../../../core/utils/constants/app_sizes.dart';

class ProfileAvatars extends StatelessWidget {
  final String imagePath;
  final String name;
  final double fontSize;
  final bool isOnline;
  final double imageHeight;
  final double imageWidth;

  const ProfileAvatars({
    super.key,
    required this.imagePath,
    required this.name,
    this.isOnline = false,
    required this.imageHeight,
    required this.imageWidth,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),

        // Avatar with border + optional online dot
        SizedBox(
          height: imageHeight,
          width: imageWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(71.5),
                  border: Border.all(
                    color: BAppColors.black800,
                    width: 5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 127,
                      height: 127,
                    ),
                  ),
                ),
              ),

              // Online dot (only show if true)
              if (isOnline)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: BAppColors.deeper1,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          spreadRadius: 6,
                          blurRadius: 10,
                          offset: const Offset(2, 6),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Name
        Text(
          name,
          textAlign: TextAlign.center,
          style: BAppStyles.poppins(
            color: BAppColors.white,
            fontSize: fontSize,
            weight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
