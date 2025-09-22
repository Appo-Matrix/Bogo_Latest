import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_styles.dart';
import '../../../../../core/utils/constants/app_sizes.dart';

class SearchOfferField extends StatelessWidget {
  final String assetPath;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchOfferField({
    super.key,
    required this.assetPath,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 373,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: const Color(0xFFCFCFCF),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Center(
            child: Image.asset(
              assetPath,
              height: 35,
              width: 35,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: BAppStyles.poppins(
                color: Colors.white,
                fontSize: BSizes.fontSizeMd,
                weight: FontWeight.w400,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: BAppStyles.poppins(
                  color: const Color(0xFFCFCFCF),
                  fontSize: BSizes.fontSizeMd,
                  weight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
