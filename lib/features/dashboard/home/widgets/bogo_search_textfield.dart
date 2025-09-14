import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoSearchField extends StatelessWidget {
  final VoidCallback? onFilterTap;

  const BogoSearchField({super.key, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 64,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              const Icon(Icons.search, size: 22, color: Colors.black),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: BAppStyles.poppins(
                    fontSize: BSizes.fontSizeMd,
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Search from here...",
                    hintStyle: BAppStyles.poppins(
                      fontSize: BSizes.fontSizeMd,
                      weight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 0),
                  ),
                ),
              ),
              const SizedBox(width: 14),
            ],
          ),
        );
      },
    );
  }
}
