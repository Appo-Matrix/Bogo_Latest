import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/dashboard/product/widgets/product_item%20_widget.dart';
import 'package:bogo_latest/features/dashboard/store_details/widgets/back_button.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_styles.dart';

/// Make sure BSizes is imported from your tokens file
import '../../../core/utils/constants/app_sizes.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = "All";
  int? selectedIndex;

  /// ===== CATEGORY → PRODUCTS (as requested) =====
  final Map<String, List<Map<String, String>>> products = {
    "All": <Map<String, String>>[
      {
        "name": AppStrings.productName,
        "price": AppStrings.price,
        "image": BImages.pizza,
        "desc": AppStrings.description,
      },
      {
        "name": AppStrings.productName,
        "price": AppStrings.price,
        "image": BImages.pizza,
        "desc": AppStrings.description,
      },
      {
        "name": AppStrings.productName,
        "price": AppStrings.price,
        "image": BImages.pizza,
        "desc": AppStrings.description,
      },
    ],
    "Burger": <Map<String, String>>[
      {
        "name": AppStrings.productName,
        "price": AppStrings.price,
        "image": BImages.pizza,
        "desc": AppStrings.description,
      },
    ],
    "Pizza": <Map<String, String>>[
      {
        "name": AppStrings.productName,
        "price": AppStrings.price,
        "image": BImages.pizza,
        "desc": AppStrings.description,
      },
    ],
    "Tacos": <Map<String, String>>[
      {
        "name": AppStrings.productName,
        "price": AppStrings.price,
        "image": BImages.pizza,
        "desc": AppStrings.description,
      },
    ],
  };

  List<Map<String, String>> get _visibleProducts => products[selectedCategory] ?? const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: BSizes.spaceBtwSections),

                // Top Row with back button + profile
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonWidgets(),
                      Container(
                        width: BSizes.imageThumbSize,
                        height: BSizes.imageThumbSize,
                        decoration: BoxDecoration(
                          border: Border.all(color: BAppColors.black1000, width: 1.5),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(BImages.profile),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: BSizes.spaceBtwItems),

                // Horizontal category chips
                SizedBox(
                  height: BSizes.imageThumbSize, // visually balanced with profile
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
                    children: [
                      _buildCategoryChip("All"),
                      _buildCategoryChip("Burger"),
                      _buildCategoryChip("Pizza"),
                      _buildCategoryChip("Tacos"),
                    ],
                  ),
                ),

                const SizedBox(height: BSizes.sm),

                // Product List
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: BSizes.md,
                      vertical: BSizes.md,
                    ),
                    itemCount: _visibleProducts.length,
                    itemBuilder: (context, index) {
                      final p = _visibleProducts[index];
                      final selected = selectedIndex == index;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: BSizes.lg),
                        child: ProductItem(
                          product: p,
                          selected: selected,
                          onTap: () {
                            setState(() => selectedIndex = selected ? null : index);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Floating proceed arrow (visible when any selected)
            if (selectedIndex != null)
              Positioned(
                right: BSizes.md,
                bottom: BSizes.md,
                child: InkWell(onTap: (){ context.push('/enterPriceScreen');},
                  child: Container(
                    width: 95, // as per your spec
                    height: 96, // as per your spec
                    decoration: const BoxDecoration(
                      color: BAppColors.main,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: BSizes.iconLg,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Category chip builder
  Widget _buildCategoryChip(String title) {
    final bool isSelected = title == selectedCategory;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
          selectedIndex = null; // reset expansion when switching category
        });
      },
      child: Container(
        width: 105, // matches the provided visual spec
        height: 62, // matches the provided visual spec
        margin: const EdgeInsets.only(right: BSizes.md - BSizes.xs),
        decoration: BoxDecoration(
          color: isSelected ? BAppColors.main : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(BSizes.cardRadiusLg),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: BAppStyles.poppins(
            color: isSelected ? Colors.white : BAppColors.black1000,
            weight: FontWeight.w700,
            fontSize: BSizes.fontSizeLgx, // 24
          ),
        ),
      ),
    );
  }
}




