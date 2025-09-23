import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/features/dashboard/widgets/subscribed_offer_info.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';

class OfferInfoScreen extends StatelessWidget {
  const OfferInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBack: true,
        title: "Offer",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: BSizes.size20),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: BSizes.size20,
              ),
              SubscribedOfferInfo(
                  initialDate: "18/06/2023",
                  endDate: "18/06/2023",
                  hotelTitle: "Hotel name",
                  hotelImagePath: BImages.hotel4,
                  userMessage: AppStrings.offerInfoHint,
                  personTitle: AppStrings.aziriAbdessatar,
                  profilePicPath: BImages.profile2,
                  roomType: AppStrings.budgetDoubleRoom,
                  barCodeData: "123456789012",
                  adultCount: 1,
                  childCount: 1,
                  roomCount: 1),
              SizedBox(
                height: BSizes.fontSizeLhx,
              ),
              DragButton(text: "Activate the offer", onActivated: () {})
            ],
          )),
        ),
      ),
    );
  }
}
