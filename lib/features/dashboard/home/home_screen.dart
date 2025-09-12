import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/features/dashboard/filter/filter_screen.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/bogo_icon_button.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/bogo_search_textfield.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/bogo_store_card.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/category_selector.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/restaurant_list_tile.dart';
import 'widgets/bogo_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _rng = Random();
  int _selectedIndex = -1;

  late final List<CategoryItem> _categories = [
    CategoryItem(iconPath: BImages.filter, label: 'Restaurants'),
    CategoryItem(iconPath: BImages.filter, label: 'Hotels'),
    CategoryItem(iconPath: BImages.filter, label: 'Dishes'),
    CategoryItem(iconPath: BImages.filter, label: 'Cafes'),
  ];

  late final Map<String, List<RestaurantListTile>> _byCategory = {
    'restaurants': [
      RestaurantListTile(
        imageAsset: BImages.squareImage,
        title: 'Bogo Restaurant',
        distance: '5.2KM',
        country: 'Pakistan',
        rating: '4.2',
        ratingCount: '55',
        xp: '300',
      ),
      RestaurantListTile(
        imageAsset: BImages.squareImage,
        title: 'Grill House',
        distance: '3.1KM',
        country: 'Pakistan',
        rating: '4.5',
        ratingCount: '81',
        xp: '260',
      ),
      RestaurantListTile(
        imageAsset: BImages.squareImage,
        title: 'Burger Hub',
        distance: '4.8KM',
        country: 'Pakistan',
        rating: '4.3',
        ratingCount: '41',
        xp: '210',
      ),
    ],
    'hotels': [
      RestaurantListTile(
        imageAsset: BImages.squareImage,
        title: 'Ramada Hotel',
        distance: '2.0KM',
        country: 'Afghanistan',
        rating: '4.7',
        ratingCount: '120',
        xp: '500',
      ),
    ],
    'dishes': [
      RestaurantListTile(
        imageAsset: BImages.squareImage,
        title: 'Beef Rice',
        distance: '1.2KM',
        country: 'Karachi',
        rating: '4.1',
        ratingCount: '22',
        xp: '150',
      ),
    ],
    'cafes': [
      RestaurantListTile(
        imageAsset: BImages.squareImage,
        title: 'Tea Cafe',
        distance: '0.9KM',
        country: 'Lahore',
        rating: '4.6',
        ratingCount: '66',
        xp: '200',
      ),
    ],
  };

  late final List<RestaurantListTile> _initialRandomRestaurants = [];

  @override
  void initState() {
    super.initState();
    final seed =
        List<RestaurantListTile>.from(_byCategory['restaurants'] ?? []);
    seed.shuffle(_rng); // randomize once
    _initialRandomRestaurants.addAll(seed);
  }

  List<Widget> get _tilesToShow {
    if (_selectedIndex == -1) return _initialRandomRestaurants;
    if (_selectedIndex < 0 || _selectedIndex >= _categories.length) {
      return _initialRandomRestaurants;
    }
    final key = _categories[_selectedIndex].label.toLowerCase();
    return List<Widget>.from(_byCategory[key] ?? _initialRandomRestaurants);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // screen size
    final isTablet = size.width > 600; // simple breakpoint
    final horizontalPadding = isTablet ? 32.0 : 16.0;

    return Scaffold(
      appBar: BogoAppBar(showNotification: true, onNotificationTap: () {}),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),

              // Search + Filter row
              Row(
                children: [
                  Expanded(child: BogoSearchField()),
                  const SizedBox(width: 8),
                  BogoIconButton(
                    assetPath: BImages.filter,
                    backgroundColor: BAppColors.black1000,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Store Card (scale for bigger screens)
              BogoStoreCard(
                images: [BImages.cards, BImages.cards, BImages.cards],
                storeName: 'Store Name',
                distance: '5.2KM',
                location: 'Afghanistan',
              ),

              const SizedBox(height: 20),

              // Category Selector responsive
              LayoutBuilder(
                builder: (context, constraints) {
                  return CategorySelector(
                    categories: _categories,
                    onCategorySelected: (i) => setState(() {
                      _selectedIndex = i;
                    }),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Restaurant Tiles
              ..._tilesToShow.map(
                (tile) => tile,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
