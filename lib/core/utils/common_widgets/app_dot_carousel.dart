import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_spacers.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/dashboard/widgets/location_info.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

/// Data model for each carousel slide
class CarouselSlide {
  final String carouselImage;
  final String? leadingImage;
  final String title;
  final double distance;
  final String location;
  final VoidCallback onFavourite;
  final VoidCallback onRate;

  const CarouselSlide({
    required this.carouselImage,
    this.leadingImage,
    required this.onFavourite,
    required this.title,
    required this.distance,
    required this.location,
    required this.onRate,
  });
}

class AppDotCarousel extends StatefulWidget {
  final List<CarouselSlide> slides; // Slide models
  final double height;
  final String? backgroundImage;
  final bool autoPlay;
  final bool showRating;
  final Duration autoPlayInterval;
  final Color activeDotColor;
  final Color inactiveDotColor;

  const AppDotCarousel({
    super.key,
    required this.slides,
    required this.height,
    this.backgroundImage,
    this.showRating = false,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.activeDotColor = BAppColors.backGroundColor,
    this.inactiveDotColor = BAppColors.lightGray400,
  }) : assert(slides.length > 0, 'Slides list cannot be empty');

  @override
  State<AppDotCarousel> createState() => _AppDotCarouselState();
}

class _AppDotCarouselState extends State<AppDotCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: widget.slides.map((slide) {
            return Container(
              width: 380,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(slide.carouselImage),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(35)),
              child: Center(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: AppButtons.backBlur(
                            imageIcon: BImages.favourite,
                            isBackGTransparent:
                                widget.showRating ? false : true,
                            blurScale: widget.showRating ? 12 : 0,
                            onTap: slide.onFavourite,
                          ),
                        )),
                    if (widget.showRating) AppSpacers.v10,
                    if (widget.showRating)
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: AppButtons.backBlur(
                              imageIcon: "assets/icons/rating.svg",
                              buttonText: "4.2",
                              height: 25,
                              isBackGTransparent: true,
                              blurScale: 12,
                              onTap: slide.onRate,
                            ),
                          )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: slide.leadingImage != null
                                    ? Image.asset(slide.leadingImage!)
                                    : null,
                                title: Text(
                                  slide.title,
                                  style: BAppStyles.poppins(
                                      color: BAppColors.white,
                                      fontSize: 22,
                                      weight: FontWeight.w500),
                                ),
                                subtitle: Center(
                                    child: LocationInfo(
                                        imageColor: BAppColors.white,
                                        fontColor: BAppColors.white,
                                        distance: "${slide.distance}\KM",
                                        location: slide.location)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  widget.slides.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: _currentIndex == index ? 4 : 20,
                                    height: 4,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: _currentIndex == index
                                          ? widget.activeDotColor
                                          : widget.inactiveDotColor
                                              .withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlay: widget.autoPlay,
            autoPlayInterval: widget.autoPlayInterval,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
