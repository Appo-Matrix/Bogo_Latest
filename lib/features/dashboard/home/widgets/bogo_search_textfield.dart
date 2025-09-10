import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoSearchField extends StatelessWidget {
  final VoidCallback? onFilterTap;

  const BogoSearchField({
    super.key,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ---- Search Text Field ----
        Container(
          height: 92,
          width: 284,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 18),
              const Icon(
                Icons.search,
                size: 28,
                color: Colors.black,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  style: BAppStyles.poppins(
                    fontSize: BSizes.fontSizeLg,
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Search from here...",
                    hintStyle: BAppStyles.poppins(
                      fontSize: BSizes.fontSizeLg,
                      weight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 2),
                  ),
                ),
              ),
              const SizedBox(width: 18),
            ],
          ),
        ),
      ],
    );
  }
}
