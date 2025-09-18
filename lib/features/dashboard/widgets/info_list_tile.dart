import 'package:bogo_latest/core/utils/common_widgets/notch_clippers.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/dashboard/widgets/location_info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoItems {
  final String imagePath;
  final String title;
  final String notch1;
  final String notch2;
  final VoidCallback onFavourite;
  final VoidCallback onTap; // 👈 new
  final double rating;
  final double distance;
  final String location;
  final int views;

  const InfoItems({
    required this.imagePath,
    required this.onFavourite,
    required this.onTap, // 👈 new
    required this.rating,
    required this.title,
    required this.distance,
    required this.location,
    required this.views,
    required this.notch1,
    required this.notch2,
  });
}

class InfoItemList extends StatelessWidget {
  final List<InfoItems> items;

  const InfoItemList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((items) {
        return _InfoListTile(infoItems: items);
      }).toList(),
    );
  }
}

class _InfoListTile extends StatelessWidget {
  final InfoItems infoItems;

  const _InfoListTile({required this.infoItems, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: infoItems.onTap, // 👈 whole card clickable
      borderRadius: BorderRadius.circular(12), // ripple radius
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox.square(
                  dimension: 100,
                  child: Image.asset(infoItems.imagePath),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      infoItems.title,
                      style: BAppStyles.poppins(
                          color: BAppColors.black1000,
                          fontSize: 22,
                          weight: FontWeight.w400),
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: BSizes.cardRadiusSm),
                        Center(
                          child: LocationInfo(
                            distance: "${infoItems.distance}KM",
                            location: infoItems.location,
                            fontColor: BAppColors.lightGray400,
                          ),
                        ),
                        SizedBox(height: BSizes.cardRadiusSm),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/rating.svg",
                              color: BAppColors.lightGray600,
                            ),
                            SizedBox(width: BSizes.cardRadiusSm),
                            Text("${infoItems.rating}", style: BAppStyles.body),
                            SizedBox(width: BSizes.cardRadiusSm),
                            Text("(${infoItems.views})", style: BAppStyles.body),
                          ],
                        ),
                        SizedBox(height: BSizes.cardRadiusSm),
                        Row(
                          children: [
                            _notchContainer(infoItems.notch1),
                            SizedBox(width: BSizes.cardRadiusSm),
                            _notchContainer(infoItems.notch2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppButtons.backBlur(
                imageIcon: Icons.favorite_border,
                imageColor: BAppColors.black1000,
                imageSize: 30,
                blurScale: 12,
                isBackGTransparent: true,
                onTap: infoItems.onFavourite, // favourite still separate
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _notchContainer(String text) {
  return ClipPath(
    clipper: QuadVerticalNotchedClipper(),
    child: Container(
      height: 26,
      width: 41,
      decoration: BoxDecoration(
          color: BAppColors.black1000, borderRadius: BorderRadius.circular(2)),
      child: Center(
        child: Text(
          text,
          style: BAppStyles.caption.copyWith(color: BAppColors.white),
        ),
      ),
    ),
  );
}
