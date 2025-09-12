import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';

class CategorySelector extends StatefulWidget {
  final List<CategoryItem> categories;
  final ValueChanged<int> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int _selectedIndex = -1;

  void _onTap(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1; // deselect
      } else {
        _selectedIndex = index; // select
      }
    });
    widget.onCategorySelected(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: List.generate(widget.categories.length, (index) {
        final isSelected = _selectedIndex == index;
        final item = widget.categories[index];

        return GestureDetector(
          onTap: () => _onTap(index),
          child: SizedBox(
            width: 80,
            height: 125,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // Background only
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 80,
                  height: isSelected ? 125 : 80,
                  decoration: BoxDecoration(
                    color: isSelected ? BAppColors.main : BAppColors.black1000,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

                // Icon stays fixed (constant position)
                Positioned(
                  top: 25,
                  child: Image.asset(
                    item.iconPath,
                    width: 28,
                    height: 28,
                    color: BAppColors.white,
                  ),
                ),

                // Label fixed baseline
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Text(
                    item.label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: BAppStyles.poppins(
                      fontSize: BSizes.fontSizeSm,
                      weight: FontWeight.w500,
                      color: isSelected
                          ? BAppColors.black1000
                          : BAppColors.black500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CategoryItem {
  final String iconPath;
  final String label;

  CategoryItem({required this.iconPath, required this.label});
}
