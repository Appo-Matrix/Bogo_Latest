import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/action_icon.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/information_section.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/map_card.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/offers_section.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/reviews_section.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/store_slider.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/tags_section.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: BSizes.sm),
        child: Column(
          children:  [
            StoreSlider(),
            SizedBox(height: BSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionIcon(Icons.call, "Call"),
                ActionIcon(Icons.chat, "Chat"),
                ActionIcon(Icons.location_on, "Map"),
                ActionIcon(Icons.share, "Share"),
              ],
            ),
            SizedBox(height: BSizes.spaceBtwSections),
            InformationSection(),
            SizedBox(height: BSizes.spaceBtwSections),
            TagsSection(),
            SizedBox(height: BSizes.spaceBtwSections),
            OffersSection(),
            SizedBox(height: BSizes.spaceBtwSections),
             Row(
              children: [
                Icon(Icons.location_on, color: Colors.black, size: 20),
                SizedBox(width: 6),
                Text(
                  "Map",
                  style: BAppStyles.poppins(fontSize: 14, color: Colors.black54, weight: FontWeight.w600),
                ),
              ],
            ),

            MapCard(),
            SizedBox(height: BSizes.spaceBtwSections),
            ReviewsSection(),
          ],
        ),
      ),
    );
  }
}
