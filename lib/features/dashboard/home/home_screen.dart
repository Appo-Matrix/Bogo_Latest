import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/features/dashboard/filter/filter_screen.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/bogo_icon_button.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/bogo_search_textfield.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/bogo_store_card.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/category_selector.dart';
import 'package:bogo_latest/features/dashboard/home/widgets/restaurant_list_tile.dart';
import 'package:flutter/material.dart';
import 'widgets/bogo_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: BogoAppBar(
        showNotification: true,
        onNotificationTap: () {},
      ),

      // Body
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                // Search Text field and Box
                Row(
                  children: [
                    BogoSearchField(),
                    SizedBox(
                      width: 3,
                    ),
                    BogoIconButton(
                      assetPath: BImages.filter,
                      backgroundColor: BAppColors.black1000,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterScreen()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                BogoStoreCard(
                  images: [
                    BImages.cards,
                    BImages.cards,
                    BImages.cards,
                  ],
                  storeName: "Store Name",
                  distance: "5.2KM",
                  location: "Afghanistan",
                ),
                SizedBox(
                  height: 25,
                ),
                CategorySelector(
                  categories: [
                    CategoryItem(
                        iconPath: BImages.filter, label: "Restaurants"),
                    CategoryItem(iconPath: BImages.filter, label: "Hotels"),
                    CategoryItem(iconPath: BImages.filter, label: "Dishes"),
                    CategoryItem(iconPath: BImages.filter, label: "Cafes"),
                  ],
                  onCategorySelected: (index) {
                    if (index == -1) {
                      print("Show Mix (None selected)");
                    } else if (index == 0) {
                      print("Show Restaurants");
                    } else if (index == 1) {
                      print("Show Hotels");
                    } else if (index == 2) {
                      print("Show Dishes");
                    } else if (index == 3) {
                      print("Show Cafes");
                    }
                  },
                ),

                SizedBox(
                  height: 20,
                ),
                RestaurantListTile(
                  imageAsset: BImages.squareImage,
                  title: 'Store Name',
                  distance: '5.2KM',
                  country: 'Afghanistan',
                  rating: '4.2',
                  ratingCount: '55',
                  xp: '300',
                  initiallyFavorited: false,
                  showClosedOverlay:
                      false, // second item jaisa overlay chahiye to true
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
