import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_dot_carousel.dart';
import 'package:bogo_latest/core/utils/common_widgets/app_scaffold.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/common_widgets/notch_clippers.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:dotted_line_flutter/dotted_line_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBack: true,
        trailing: "assets/icons/three_dots.svg",
      ),
      body: AppScreen(
          child: Column(
        children: [
          SizedBox(
            height: BSizes.size20,
          ),
          AppDotCarousel(
            slides: [
              CarouselSlide(
                  carouselImage: BImages.carousel2,
                  onFavourite: () {},
                  title: AppStrings.hotelName,
                  leadingImage: BImages.logo,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  onRate: () {}),
              CarouselSlide(
                  carouselImage: BImages.carousel2,
                  onFavourite: () {},
                  leadingImage: BImages.logo,
                  title: AppStrings.hotelName,
                  distance: 5.2,
                  location: AppStrings.afghanistan,
                  onRate: () {}),
              CarouselSlide(
                  carouselImage: BImages.carousel2,
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
          SquareButtonList(squareButtonItems: [
            SquareButtonItems(imageIcons: BImages.clock, onTap: () {}),
            SquareButtonItems(imageIcons: BImages.driving, onTap: () {}),
            SquareButtonItems(imageIcons: BImages.read, onTap: () {}),
            SquareButtonItems(imageIcons: BImages.call, onTap: () {}),
          ]),
          SizedBox(
            height: BSizes.size20,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Info.svg",
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: BSizes.cardRadiusSm,
              ),
              Text(
                "Information",
                style: BAppStyles.body.copyWith(
                    color: BAppColors.lightGray500,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 5),
            child: Text(
              AppStrings.infoDesc,
              style: BAppStyles.body,
            ),
          ),
          SizedBox(
            height: BSizes.buttonWidth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _notchContainer("get"),
              _verticallyDottedNotchContainer2("25%")
            ],
          )
        ],
      )),
    );
  }
}

Widget _notchContainer(String text) {
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

Widget _verticallyDottedNotchContainer2(String text) {
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
