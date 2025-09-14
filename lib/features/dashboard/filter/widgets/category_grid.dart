import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class CategoryGrid extends StatelessWidget {
  final List<CategoryModel> categories;
  final int columns;
  final double crossSpacing;
  final double mainSpacing;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.columns = 3,
    this.crossSpacing = 12.0,
    this.mainSpacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        const boxH = 100.0;
        const gapH = 6.0;
        const labelH = 22.0;

        final itemWidth = (c.maxWidth - crossSpacing * (columns - 1)) / columns;
        final itemHeight = boxH + gapH + labelH;
        final ratio = itemWidth / itemHeight;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: crossSpacing,
            mainAxisSpacing: mainSpacing,
            childAspectRatio: ratio,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(
              label: category.label,
              asset: category.asset,
            );
          },
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final String asset;

  const CategoryItem({
    super.key,
    required this.label,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: BAppColors.black1000,
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            asset,
            width: 66,
            height: 66,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 100,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: BAppStyles.poppins(
              color: BAppColors.black900,
              fontSize: BSizes.fontSizeSm,
              weight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryModel {
  final String label;
  final String asset;

  CategoryModel({required this.label, required this.asset});
}
