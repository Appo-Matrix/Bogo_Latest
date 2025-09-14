import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/common_widgets/otp_input_field.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_strings.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/dashboard/widgets/profile_list_tile.dart';
import 'package:bogo_latest/features/dashboard/widgets/subscribing_offer_details.dart';
import 'package:flutter/material.dart';

class OfferOtpScreen extends StatelessWidget {
  const OfferOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        showBack: true,
        trailing: "assets/icons/scan.svg",
        trailingBorder: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 92,
                  width: 92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: BAppColors.lightGray300),
                      image: DecorationImage(image: AssetImage(BImages.logo))),
                ),
              ),
              SizedBox(
                height: BSizes.size20,
              ),
              Text(AppStrings.otpHint,
                  style: BAppStyles.poppins(
                      color: BAppColors.black1000,
                      fontSize: 23,
                      weight: FontWeight.w700)),
              SizedBox(
                height: BSizes.fontSizeLhx,
              ),
              OtpInputField(),
              SizedBox(
                height: BSizes.buttonWidth,
              ),
              SizedBox(
                height: BSizes.size5,
              ),
              ProfileListTile(
                  profilePicPath: "assets/images/profile.png",
                  title: AppStrings.aziri000,
                  accountType: AppStrings.premiumAccount,
                  typeImagePath: "assets/icons/premium.svg"),
              SizedBox(
                height: BSizes.size5,
              ),
              SubscribingOfferDetails(
                  discountPercentage: 25,
                  roomType: AppStrings.budgetDoubleRoom,
                  roomPrice: 2600,
                  discountAmount: 650,
                  totalAmount: 1850),
              SizedBox(
                height: BSizes.size35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
