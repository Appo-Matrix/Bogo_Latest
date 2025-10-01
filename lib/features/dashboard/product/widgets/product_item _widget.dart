import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.product,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final Map<String, String> product; // uses the map directly
  final bool selected;
  final VoidCallback onTap;

  bool get _isNetwork => (product["image"] ?? '').startsWith('http');

  @override
  Widget build(BuildContext context) {
    final String name = product["name"] ?? "Product";
    final String price = product["price"] ?? "";
    final String desc = product["desc"] ?? "";
    final String image = product["image"] ?? BImages.pizza;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row: image, title, trailing selector
        Row(
          children: [
            SizedBox(width: BSizes.md,),
            Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BSizes.defaultSpace),
                image: DecorationImage(
                  image: _isNetwork ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: BSizes.md - BSizes.xs),
            Expanded(
              child: Text(
                name,
                style: BAppStyles.poppins(
                  color: BAppColors.black1000,
                  weight: FontWeight.w700,
                  fontSize: BSizes.iconMd, // 30
                ),
              ),
            ),
            // Trailing selection dot (grey → primary)
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: BSizes.iconLg,
                height: BSizes.iconLg,
                decoration: BoxDecoration(
                  color: selected ? BAppColors.main : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? BAppColors.main : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: BSizes.md),

        // Black description card with pointer and price
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -8,
              left: 36,
              child: Transform.rotate(
                angle: 0.785398, // 45deg in radians
                child: Container(
                  width: BSizes.md,
                  height: BSizes.md,
                  color: BAppColors.black900,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(BSizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35), // matches your visual spec
                color: BAppColors.black900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: BSizes.sm),
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(BSizes.borderRadiusLg),
                          color: BAppColors.black500,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Size',
                              style: BAppStyles.poppins(
                                color: BAppColors.white,
                                weight: FontWeight.w500,
                                fontSize: BSizes.fontSizeEaSm, // 13
                              ),
                            ),
                            const SizedBox(width: BSizes.xs),
                            const Icon(Icons.arrow_drop_down, size: BSizes.iconSm, color: BAppColors.white),
                            Text(
                              'S',
                              style: BAppStyles.poppins(
                                color: BAppColors.primary,
                                weight: FontWeight.w700,
                                fontSize: BSizes.fontSizeEaSm,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_up, size: BSizes.iconSm, color: BAppColors.white),
                          ],
                        ),
                      ),
                      Text(
                        price,
                        style: BAppStyles.poppins(
                          color: BAppColors.main,
                          weight: FontWeight.w600,
                          fontSize: BSizes.fontSizeLg, // 18
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: BSizes.sm),
                  Text(
                    desc,
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      weight: FontWeight.w500,
                      fontSize: BSizes.fontSizeSm, // 14
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        if (selected) ...[
          const SizedBox(height: BSizes.md - BSizes.xs),
          const SupplementTile(title: 'Extra Cheese', price: '100 DA'),
          const SupplementTile(title: 'Sauce Mix', price: '200 DA'),
          const SupplementTile(title: 'French Fries', price: '250 DA'),
          const SupplementTile(title: 'French Fries', price: '250 DA'),
        ],
      ],
    );
  }
}
class SupplementTile extends StatelessWidget {
  const SupplementTile({required this.title, required this.price, super.key});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: BSizes.md - BSizes.xs),
      padding: const EdgeInsets.symmetric(horizontal: BSizes.md, vertical: BSizes.md),
      decoration: BoxDecoration(
        color: BAppColors.lightGray100,
        borderRadius: BorderRadius.circular(BSizes.cardRadiusLg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: BAppStyles.poppins(
                color: BAppColors.black1000,
                weight: FontWeight.w500,
                fontSize: BSizes.fontSizeMd, // 16
              ),
            ),
          ),
          Container(
            height: 48, // responsive, smaller than 79 for better density
            constraints: const BoxConstraints(minWidth: 140),
            padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
            decoration: BoxDecoration(
              color: BAppColors.main,
              borderRadius: BorderRadius.circular(BSizes.buttonRadius),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  price,
                  style: BAppStyles.poppins(
                    color: Colors.white,
                    weight: FontWeight.w500,
                    fontSize: BSizes.fontSizeMd, // 16
                  ),
                ),
                const SizedBox(width: BSizes.sm),
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: BAppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: BSizes.iconSm, color: BAppColors.main),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}