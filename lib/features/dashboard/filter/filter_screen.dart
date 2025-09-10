import 'package:flutter/material.dart';
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
  int _selectedPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1) bg -> WHITE
      backgroundColor: BAppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // left rail
                Container(
                  width: 60,
                  height: double.infinity,
                  color: const Color(0xFFEAEAEA),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: BAppColors.black1000),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _railItem("Category", active: true),
                              _railItem("maps"),
                              _railItem("Price"),
                              _railItem("Option"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // main panel
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "filters",
                          style: BAppStyles.poppins(
                            color: BAppColors.black1000,
                            fontSize: BSizes.fontSizeLgx,
                            weight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 18),

                        Text(
                          "category",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize: BSizes.fontSizeMd,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 14),

                        // --- category grid (3 per row, tight & NO overflow) ---
                        LayoutBuilder(
                          builder: (context, c) {
                            const cols = 3;
                            const cross = 12.0; // crossAxisSpacing
                            const main = 12.0; // mainAxisSpacing

                            // available width inside the main panel
                            final itemWidth =
                                (c.maxWidth - cross * (cols - 1)) / cols;

                            // desired item height = black box + gap + one-line label
                            const boxH = 100.0;
                            const gapH = 6.0;
                            const labelH =
                                22.0; // ~ one line for your font size
                            final itemHeight = boxH + gapH + labelH;

                            final ratio =
                                itemWidth / itemHeight; // <- childAspectRatio

                            return GridView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: cols,
                                crossAxisSpacing: cross,
                                mainAxisSpacing: main,
                                childAspectRatio: ratio,
                              ),
                              children: const [
                                _CategoryCell(
                                    label: "restaurants",
                                    asset: XImagesExtra.catRestaurants),
                                _CategoryCell(
                                    label: "Fast food",
                                    asset: XImagesExtra.catFastFood),
                                _CategoryCell(
                                    label: "pizza",
                                    asset: XImagesExtra.catPizza),
                                _CategoryCell(
                                    label: "Icecream",
                                    asset: XImagesExtra.catIcecream),
                                _CategoryCell(
                                    label: "Coffee shop",
                                    asset: XImagesExtra.catCoffee),
                                _CategoryCell(
                                    label: "Patisserie",
                                    asset: XImagesExtra.catDonut),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 18),
                        // was 50

                        Text(
                          "localisation",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize: BSizes.fontSizeMd,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: BAppColors.white,
                            border: Border.all(
                                color: BAppColors.black900, width: 1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: BAppColors.black1000, size: 22),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Alger , galleried",
                                  style: BAppStyles.poppins(
                                    color: BAppColors.black1000,
                                    fontSize: BSizes.fontSizeMd,
                                    weight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded,
                                  color: BAppColors.black1000, size: 24),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          "Price",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize: BSizes.fontSizeMd,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _priceChip(index: 0, text: "- 5000 DA"),
                              const SizedBox(width: 10),
                              _priceChip(
                                  index: 1, text: "- 8000 DA", filled: false),
                              const SizedBox(width: 10),
                              _priceChip(
                                  index: 2, text: "- 10000 DA", filled: false),
                              const SizedBox(width: 10),
                              _priceChip(
                                  index: 3, text: "- 15000 DA", filled: false),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          "Option",
                          style: BAppStyles.poppins(
                            color: BAppColors.black900,
                            fontSize: BSizes.fontSizeMd,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: BAppColors.main,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.add,
                              color: BAppColors.white, size: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // bottom-right confirm corner
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  color: BAppColors.black1000,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(28)),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.check, color: BAppColors.white, size: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _railItem(String label, {bool active = false}) {
    return RotatedBox(
      quarterTurns: -1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: active ? BAppColors.main : BAppColors.black300,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: BAppStyles.poppins(
              color: BAppColors.black900,
              fontSize: BSizes.fontSizeSm,
              weight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceChip(
      {required int index, required String text, bool filled = true}) {
    final bool sel = _selectedPrice == index && filled;
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => setState(() => _selectedPrice = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: sel ? BAppColors.main.withOpacity(0.75) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: BAppColors.black900, width: 1),
        ),
        child: Text(
          text,
          style: BAppStyles.poppins(
            color: sel ? BAppColors.white : BAppColors.black1000,
            fontSize: BSizes.fontSizeMd,
            weight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

// === 3-per-row grid cells ===
class _CategoryCell extends StatelessWidget {
  final String label;
  final String asset;

  const _CategoryCell({required this.label, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          // was 104
          height: 100,
          // was 104
          decoration: BoxDecoration(
            color: BAppColors.black1000,
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: Image.asset(asset, width: 66, height: 66, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6), // was 8
        SizedBox(
          width: 100, // was 104
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: BAppStyles.poppins(
              color: BAppColors.black900,
              fontSize: BSizes.fontSizeSm,
              weight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// TEMP assets -> apne BImages.* se replace kar dena
class XImagesExtra {
  static const String catRestaurants = BImages.squareImage;
  static const String catFastFood = BImages.squareImage;
  static const String catPizza = BImages.squareImage;
  static const String catIcecream = BImages.squareImage;
  static const String catCoffee = BImages.squareImage;
  static const String catDonut = BImages.squareImage;
}
