import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_dot_carousel.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_scaffold.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_text_field.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/dashboard/widgets/info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: BImages.drawer,
        leadingColor: Colors.black,
        showLogo: true,
        showNotification: true,
        trailingBorder: false,
        onLeading: () {
          context.push('/settingScreen');
        },
      ),
      body: AppScreen(
        child: Column(
          children: [
            SizedBox(height: BSizes.size9 + 1),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  hintText: AppStrings.searchHint,
                  prefixIcon: BImages.search,
                )),
                SizedBox(width: BSizes.size5),
                AppButtons.square(
                  imageIcon: BImages.filter,
                  onTap: () {
                    context.push('/filterScreen');
                  },
                ),
              ],
            ),
            SizedBox(height: BSizes.xl - 4),
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
            SizedBox(height: BSizes.xl - 4),
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
            SizedBox(height: BSizes.xl - 4),
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
                  notch2: "25%",
                  onTap: () {
                    context.push('/itemDetailScreen');
                  }),
              InfoItems(
                  imagePath: BImages.hotel2,
                  onFavourite: () {},
                  rating: 4.2,
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  views: 55,
                  notch1: "1=2",
                  notch2: "25%",
                  onTap: () {
                  }),
              InfoItems(
                  imagePath: BImages.hotel3,
                  onFavourite: () {},
                  rating: 4.2,
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  views: 55,
                  notch1: "1=2",
                  notch2: "25%",
                  onTap: () {})
            ]),
            SizedBox(height: BSizes.size90)
          ],
        ),
      ),
    );
  }
}
