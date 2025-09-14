import 'package:flutter/material.dart';
import 'package:bogo_latest/features/dashboard/filter/widgets/category_grid.dart';
import 'package:bogo_latest/features/dashboard/filter/widgets/location_drop_down.dart';
import 'package:bogo_latest/features/dashboard/filter/widgets/price_chip.dart';
import 'package:bogo_latest/features/dashboard/filter/widgets/rotated_label_column.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final ValueNotifier<int> _selectedPrice = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final prices = ["- 5000 DA", "- 8000 DA", "- 10000 DA", "- 15000 DA"];

    // MediaQuery values
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 360; // small phones
    final isTablet = size.width >= 600;

    return Scaffold(
      backgroundColor: BAppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT RAIL
                Container(
                  width: isSmall ? 50 : 60,
                  height: double.infinity,
                  color: const Color(0xFFEAEAEA),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: isSmall ? 8 : 16), // responsive padding
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: isSmall ? 20 : 24,
                              color: BAppColors.black1000,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(height: isSmall ? 8 : 16),
                        RotatedLabelColumn(
                          labels: ["Category", "Maps", "Price", "Option"],
                          activeIndex: 0,
                        ),
                      ],
                    ),
                  ),
                ),

                // MAIN PANEL
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmall ? 12 : 16,
                      vertical: isSmall ? 20 : 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// FILTER TITLE
                        Text(
                          "filters",
                          style: BAppStyles.poppins(
                            color: BAppColors.black1000,
                            fontSize: isTablet
                                ? BSizes.fontSizeSm
                                : (isSmall
                                    ? BSizes.fontSizeSm
                                    : BSizes.fontSizeLgx),
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: isSmall ? 12 : 18),

                        // CATEGORY
                        Text(
                          "category",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize:
                                isSmall ? BSizes.fontSizeSm : BSizes.fontSizeMd,
                            weight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isSmall ? 10 : 14),

                        CategoryGrid(
                          columns: isTablet ? 5 : (isSmall ? 2 : 3),
                          categories: [
                            CategoryModel(
                                label: "Restaurants",
                                asset: BImages.squareImage),
                            CategoryModel(
                                label: "Fast food", asset: BImages.squareImage),
                            CategoryModel(
                                label: "Pizza", asset: BImages.squareImage),
                            CategoryModel(
                                label: "Ice cream", asset: BImages.squareImage),
                            CategoryModel(
                                label: "Coffee shop",
                                asset: BImages.squareImage),
                            CategoryModel(
                                label: "Patisserie",
                                asset: BImages.squareImage),
                          ],
                        ),

                        SizedBox(height: isSmall ? 14 : 18),

                        // LOCATION
                        Text(
                          "localisation",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize:
                                isSmall ? BSizes.fontSizeSm : BSizes.fontSizeMd,
                            weight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isSmall ? 8 : 10),

                        LocationDropdown(
                          onChanged: (country, city) {
                            debugPrint("Selected Location: $country , $city");
                          },
                        ),

                        SizedBox(height: isSmall ? 18 : 22),

                        // PRICE
                        Text(
                          "Price",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize:
                                isSmall ? BSizes.fontSizeSm : BSizes.fontSizeMd,
                            weight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isSmall ? 8 : 12),

                        ValueListenableBuilder<int>(
                          valueListenable: _selectedPrice,
                          builder: (context, selectedIndex, _) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(prices.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: PriceChip(
                                      label: prices[index],
                                      isSelected: selectedIndex == index,
                                      onTap: () => _selectedPrice.value = index,
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: isSmall ? 18 : 22),

                        // OPTION
                        Text(
                          "Option",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize:
                                isSmall ? BSizes.fontSizeSm : BSizes.fontSizeMd,
                            weight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isSmall ? 8 : 12),

                        Container(
                          height: isSmall ? 36 : 40,
                          width: isSmall ? 36 : 40,
                          decoration: BoxDecoration(
                            color: BAppColors.main,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: BAppColors.white,
                            size: isSmall ? 18 : 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // BOTTOM-RIGHT CONFIRM
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: isSmall ? 70 : 86,
                height: isSmall ? 70 : 86,
                decoration: BoxDecoration(
                  color: BAppColors.black1000,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(28)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  color: BAppColors.white,
                  size: isSmall ? 22 : 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
