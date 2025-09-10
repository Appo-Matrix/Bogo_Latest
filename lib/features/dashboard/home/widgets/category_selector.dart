import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_sizes.dart';

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
        widget.onCategorySelected(-1);
      } else {
        _selectedIndex = index;
        widget.onCategorySelected(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.categories.length, (index) {
        final isSelected = _selectedIndex == index;
        final category = widget.categories[index];

        return GestureDetector(
          onTap: () => _onTap(index),
          child: Column(
            children: [
              // Box (height increases downward only)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 92,
                height: isSelected ? 125 : 92,
                decoration: BoxDecoration(
                  color: isSelected ? BAppColors.primary : BAppColors.black1000,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.topCenter,
                // Keep icon fixed
                padding: const EdgeInsets.only(top: 32),
                // Icon stays top
                child: Image.asset(
                  category.iconPath,
                  width: 28,
                  height: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              // Text always outside
              Text(
                category.label,
                style: BAppStyles.poppins(
                  fontSize: BSizes.fontSizeSm,
                  weight: FontWeight.w500,
                  color: isSelected ? BAppColors.primary : Colors.black,
                ),
              ),
            ],
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
