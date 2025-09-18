import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/common_widgets/notch_clippers.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferItems {
  final String price;
  final String leadingImage;
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onGroup;
  final VoidCallback onFamilies;
  final VoidCallback onChildren;
  final VoidCallback onMore;
  final VoidCallback onNext;
  final VoidCallback? onTap; // ✅ NEW: whole card click

  const OfferItems({
    required this.price,
    required this.leadingImage,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.onGroup,
    required this.onFamilies,
    required this.onChildren,
    required this.onMore,
    required this.onNext,
    this.onTap, // ✅
  });
}

class OfferItemsList extends StatelessWidget {
  final List<OfferItems> items;

  const OfferItemsList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return _OfferCardWidget(offerItems: item);
      }).toList(),
    );
  }
}

class _OfferCardWidget extends StatelessWidget {
  final OfferItems offerItems;

  const _OfferCardWidget({required this.offerItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: InkWell( // ✅ makes the whole card clickable
          onTap: offerItems.onTap,
          borderRadius: BorderRadius.circular(35), // ripple respects rounded corners
          child: SizedBox(
            height: 203,
            width: 392,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: ClipPath(
                      clipper: SingleHorizontalNotchedClipper(),
                      child: Container(
                        height: 203,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: BAppColors.backGroundColor,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 15),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: AppButtons.simple(
                                  buttonText: "More",
                                  height: 17,
                                  width: 49,
                                  textColor: BAppColors.backGroundColor,
                                  buttonColor: BAppColors.white,
                                  fontSize: 12,
                                  borderRadius: 9,
                                  onTap: offerItems.onMore,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30, bottom: 25),
                                child: GestureDetector(
                                  onTap: offerItems.onNext,
                                  child: SvgPicture.asset(
                                    "assets/icons/next.svg",
                                    height: 18,
                                    width: 24,
                                    color: BAppColors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.78,
                  child: ClipPath(
                    clipper: DoubleVerticalNotchedClipper(),
                    child: Container(
                      height: 203,
                      decoration: BoxDecoration(
                        color: BAppColors.black1000,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, right: 20),
                              child: Text(
                                offerItems.price,
                                style: _textStyle(20, FontWeight.w700),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              height: 62,
                              width: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: AssetImage(offerItems.leadingImage),
                                ),
                              ),
                            ),
                            title: Text(
                              offerItems.title,
                              style: _textStyle(18, FontWeight.w400),
                            ),
                            subtitle: Text(
                              offerItems.subtitle,
                              style: _textStyle(10, FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            child: Text(
                              offerItems.description,
                              style: _textStyle(11, FontWeight.w400),
                            ),
                          ),
                          SizedBox(height: BSizes.cardRadiusSm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _button(offerItems.onGroup, "Group",
                                  "assets/icons/people.svg"),
                              _button(offerItems.onFamilies, "families",
                                  "assets/icons/family.svg"),
                              _button(offerItems.onChildren, "children",
                                  "assets/icons/children.svg"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _button(VoidCallback onTap, String text, String imagePath) {
  return AppButtons.simple(
    onTap: onTap,
    buttonText: text,
    height: 32,
    width: 76,
    imageIcon: imagePath,
    borderRadius: 24,
    buttonColor: BAppColors.lightGray500,
    fontSize: 8,
  );
}

TextStyle _textStyle(double size, FontWeight weight) {
  return BAppStyles.poppins(
    color: BAppColors.white,
    fontSize: size,
    weight: weight,
  );
}
