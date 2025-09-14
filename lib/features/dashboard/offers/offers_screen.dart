import 'package:bogo_latest/core/utils/common_widgets/app_scaffold.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/dashboard/widgets/notification_alert.dart';
import 'package:bogo_latest/features/dashboard/widgets/offer_card_widget.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OfferItems> items = [
      OfferItems(
          price: "1000 DA",
          leadingImage: BImages.hotel1,
          title: "Offer Name1",
          subtitle: "Category Name1",
          description: AppStrings.offerCardDesc,
          onGroup: () {},
          onFamilies: () {},
          onChildren: () {},
          onMore: () {},
          onNext: () {}),
      OfferItems(
          price: "5000 DA",
          leadingImage: BImages.hotel1,
          title: "Offer Name2",
          subtitle: "Category Name2",
          description: AppStrings.offerCardDesc,
          onGroup: () {},
          onFamilies: () {},
          onChildren: () {},
          onMore: () {},
          onNext: () {}),
      OfferItems(
          price: "9000 DA",
          leadingImage: BImages.hotel1,
          title: "Offer Name3",
          subtitle: "Category Name3",
          description: AppStrings.offerCardDesc,
          onGroup: () {},
          onFamilies: () {},
          onChildren: () {},
          onMore: () {},
          onNext: () {}),
      OfferItems(
          price: "12000 DA",
          leadingImage: BImages.hotel1,
          title: "Offer Name4",
          subtitle: "Category Name4",
          description: AppStrings.offerCardDesc,
          onGroup: () {},
          onFamilies: () {},
          onChildren: () {},
          onMore: () {},
          onNext: () {}),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        showBack: true,
        title: "offers",
      ),
      body: AppScreen(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: NotificationAlert(description: AppStrings.offerDesc),
            ),
            SizedBox(height: BSizes.size20),
            OfferItemsList(items: items)
          ],
        ),
      ),
    );
  }
}
