import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StoreSlider extends StatefulWidget {
  const StoreSlider({super.key});

  @override
  State<StoreSlider> createState() => _StoreSliderState();
}

class _StoreSliderState extends State<StoreSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> _images = [
    BImages.authBackground,
    BImages.authBackground,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          // 🖼️ Carousel
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
            items: _images.map((imagePath) {
              return Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover);
            }).toList(),
          ),

          // 🤍 Favorite + ⭐ Rating
          Positioned(
            top: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Favorite
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.favorite_border, color: Colors.black, size: 20),
                ),
                const SizedBox(height: 8),

                // Rating
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "4.2",
                        style: BAppStyles.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔘 Gradient Overlay for bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                ),
              ),
            ),
          ),

          // 📍 Store Info on top of gradient
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Row(
              children: [
                // 🔵 Logo
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Image.asset(
                    BImages.logo, // Replace with your logo
                    height: 20,
                  ),
                ),
                const SizedBox(width: 8),

                // Store Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Store Name",
                      style: BAppStyles.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(
                          "5.2KM Afghanistan",
                          style: BAppStyles.poppins(
                            color: Colors.white70,
                            fontSize: 13,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔘 Bottom Indicator
          Positioned(
            bottom: 10,
            right: 16,
            child: Row(
              children: List.generate(_images.length, (index) {
                bool isActive = _currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 20,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(6),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
