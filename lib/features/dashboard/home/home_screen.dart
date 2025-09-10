import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_dot_carousel.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_scaffold.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_text_field.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_spacers.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/dashboard/widgets/info_list_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: BImages.drawer,
        showLogo: true,
        showNotification: true,
        trailingBorder: true,
      ),
      body: AppScreen(
        child: Column(
          children: [
            AppSpacers.v10,
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  hintText: AppStrings.searchHint,
                  prefixIcon: BImages.search,
                )),
                AppSpacers.h5,
                AppButtons.square(
                  imageIcon: BImages.filter,
                  onTap: () {},
                ),
              ],
            ),
            AppSpacers.v20,
            AppDotCarousel(slides: [
              CarouselSlide(
                  carouselImage: BImages.carousel1,
                  onFavourite: () {},
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  onRate: () {}),
              CarouselSlide(
                  carouselImage: BImages.carousel1,
                  onFavourite: () {},
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  onRate: () {}),
              CarouselSlide(
                  carouselImage: BImages.carousel1,
                  onFavourite: () {},
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  onRate: () {})
            ], height: 177),
            AppSpacers.v20,
            Center(
              child: SizedBox(
                height: 120,
                width: 385,
                child: Center(
                  child: FixedPositionAnimatedButtonList(items: [
                    FixedPositionAnimatedButtonItem(
                        imageIcon: BImages.pizza,
                        onTap: () {},
                        textTitle: "restaurants"),
                    FixedPositionAnimatedButtonItem(
                        imageIcon: BImages.hotel,
                        onTap: () {},
                        textTitle: "hotels"),
                    FixedPositionAnimatedButtonItem(
                        imageIcon: BImages.sport,
                        onTap: () {},
                        textTitle: "sport"),
                    FixedPositionAnimatedButtonItem(
                        imageIcon: BImages.entertainment,
                        onTap: () {},
                        textTitle: "entertainment"),
                  ]),
                ),
              ),
            ),
            AppSpacers.v20,
            InfoItemList(items: [
              InfoItems(
                  imagePath: BImages.hotel3,
                  onFavourite: () {},
                  rating: 4.2,
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  views: 55,
                  notch1: "1=2",
                  notch2: "25%"),
              InfoItems(
                  imagePath: BImages.hotel2,
                  onFavourite: () {},
                  rating: 4.2,
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  views: 55,
                  notch1: "1=2",
                  notch2: "25%"),
              InfoItems(
                  imagePath: BImages.hotel3,
                  onFavourite: () {},
                  rating: 4.2,
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  views: 55,
                  notch1: "1=2",
                  notch2: "25%")
            ]),
            AppSpacers.v90
          ],
        ),
      ),
    );
  }
}
