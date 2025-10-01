import 'package:bogo_latest/core/utils/common_widgets/notch_clippers.dart';
import 'package:bogo_latest/features/dashboard/product/product_list_screen.dart';
import 'package:bogo_latest/features/dashboard/store_details/widgets/back_button.dart';
import 'package:bogo_latest/features/dashboard/store_details/widgets/custom_outlined_button.dart';
import 'package:bogo_latest/features/dashboard/store_details/widgets/offer_options_screen.dart';
import 'package:dotted_line_flutter/dotted_line_flutter.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/common_widgets/app_buttons.dart';
import '../../../core/utils/common_widgets/app_dot_carousel.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/app_styles.dart';


class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({super.key});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(BSizes.sm),
            child: Column(
              children: [
                /// Top Row (Back + Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonWidgets(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfferOptionsScreen(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle,
                              size: BSizes.iconSm, color: BAppColors.black1000),
                          SizedBox(height: BSizes.xs),
                          Icon(Icons.circle,
                              size: BSizes.iconSm, color: BAppColors.black600),
                          SizedBox(height: BSizes.xs),
                          Icon(Icons.circle,
                              size: BSizes.iconSm, color: BAppColors.black400),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: BSizes.lg),

              AppDotCarousel(
                slides: [
                  CarouselSlide(
                      carouselImage: BImages.pizza,
                      onFavourite: () {},
                      title: AppStrings.hotelName,
                      leadingImage: BImages.logo,
                      distance: 5.2,
                      location: AppStrings.afghanistan,
                      onRate: () {}),
                  CarouselSlide(
                      carouselImage: BImages.pizza,
                      onFavourite: () {},
                      leadingImage: BImages.logo,
                      title: AppStrings.hotelName,
                      distance: 5.2,
                      location: AppStrings.afghanistan,
                      onRate: () {}),
                  CarouselSlide(
                      carouselImage: BImages.pizza,
                      onFavourite: () {},
                      leadingImage: BImages.logo,
                      title: AppStrings.hotelName,
                      distance: 5.2,
                      location: AppStrings.afghanistan,
                      onRate: () {}),
                ],
                height: 380,
                showRating: true,
              ),

                SizedBox(height: BSizes.lg),

                /// Action Buttons Row
                ///
                SquareButtonList(squareButtonItems: [
                  SquareButtonItems(imageIcons: BImages.clock, onTap: () {}),
                  SquareButtonItems(imageIcons: BImages.driving, onTap: () {}),
                  SquareButtonItems(imageIcons: BImages.read, onTap: () {}),
                  SquareButtonItems(imageIcons: BImages.call, onTap: () {}),
                ]),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const CustomButton(icon: Icons.watch_later_rounded),
                //     const CustomButton(icon: Icons.calendar_month_sharp),
                //
                //     const CustomButton(icon: Icons.phone),
                //   ],
                // ),

                SizedBox(height: BSizes.lg),

                /// Information Header
                Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: BSizes.iconMd, color: BAppColors.black400),
                    SizedBox(width: BSizes.sm),
                    Text(
                      AppStrings.information,
                      style: BAppStyles.poppins(
                        weight: FontWeight.w600,
                        fontSize: BSizes.fontSizeMd,
                        color: BAppColors.black700,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: BSizes.sm),

                Text(
                  AppStrings.subTileInformation,
                  style: BAppStyles.poppins(
                    fontSize: BSizes.fontSizeMd,
                    weight: FontWeight.w400,
                    color: BAppColors.black600,
                  ),
                ),

                SizedBox(height: BSizes.lg),

                /// Horizontal scroll chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomOutlinedButton(
                        label: AppStrings.breakfast,
                        assetPath: BImages.hotel,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: BSizes.sm),
                      CustomOutlinedButton(
                        label: AppStrings.beach,
                        onPressed: () {},
                        assetPath: BImages.hotel,
                      ),
                      SizedBox(width: BSizes.sm),
                      CustomOutlinedButton(
                        label: AppStrings.parking,
                        assetPath: BImages.hotel,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: BSizes.appBarHeight ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    notchContainer("get"),
                    verticallyDottedNotchContainer2("25%")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget notchContainer(String text) {
  return ClipPath(
    clipper: QuadVerticalNotchedClipper(),
    child: Container(
      height: 92,
      width: 181,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: BAppColors.black1000),
      child: Center(
        child: Text(
          text,
          style: BAppStyles.poppins(
              color: BAppColors.white, fontSize: 25, weight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Widget verticallyDottedNotchContainer2(String text) {
  return ClipPath(
    clipper: QuadVerticalNotchedClipper(),
    child: Container(
      height: 92,
      width: 181,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: BAppColors.black1000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: BSizes.cardRadiusSm,
          ),
          DottedLine(
            axis: Axis.vertical,
            height: 55,
            lineThickness: 3,
            dashWidth: 6,
            colors: [BAppColors.lightGray400],
            dashGap: 4,
          ),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: 25,
                        weight: FontWeight.w600),
                  ),
                  Text(
                    "discount",
                    style: BAppStyles.poppins(
                        color: BAppColors.white,
                        fontSize: 12,
                        weight: FontWeight.w600),
                  )
                ],
              )),
          DottedLine(
            axis: Axis.vertical,
            height: 55,
            lineThickness: 3,
            dashWidth: 6,
            colors: [BAppColors.lightGray400],
            dashGap: 4,
          ),
          SizedBox(
            width: BSizes.cardRadiusSm,
          ),
        ],
      ),
    ),
  );
}