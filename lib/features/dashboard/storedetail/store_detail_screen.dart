import 'package:bogo_latest/features/dashboard/storedetail/widgets/back_button.dart';
import 'package:bogo_latest/features/dashboard/storedetail/widgets/custom_button_widgets.dart';
import 'package:bogo_latest/features/dashboard/storedetail/widgets/custom_outlined_button.dart';
import 'package:bogo_latest/features/dashboard/storedetail/widgets/offer_options_screen.dart';
import 'package:bogo_latest/features/dashboard/storedetail/widgets/store_card.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/app_styles.dart';

import '../productlist/product_list_screen.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({super.key});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(BSizes.sm),
            child: Column(
              children: [
                /// Top Row (Back + Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonWidgets(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  OfferOptionsScreen(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle,
                              size: BSizes.iconSm, color: BAppColors.black1000),
                          SizedBox(height: BSizes.xs),
                          Icon(Icons.circle,
                              size: BSizes.iconSm, color: BAppColors.black600),
                          SizedBox(height: BSizes.xs),
                          Icon(Icons.circle,
                              size: BSizes.iconSm, color: BAppColors.black400),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: BSizes.lg),

                const StoreCard(),

                SizedBox(height: BSizes.lg),

                /// Action Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomButton(icon: Icons.watch_later_rounded),
                    CustomButton(icon: Icons.calendar_month_sharp),
                    CustomButton(icon: Icons.tab_unselected),
                    CustomButton(icon: Icons.phone),
                  ],
                ),

                SizedBox(height: BSizes.lg),

                /// Information Header
                Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: BSizes.iconMd, color: BAppColors.black400),
                    SizedBox(width: BSizes.sm),
                    Text(
                      AppStrings.information,
                      style: BAppStyles.poppins(
                        weight: FontWeight.w600,
                        fontSize: BSizes.fontSizeMd,
                        color: BAppColors.black700,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: BSizes.sm),

                Text(
                  AppStrings.subTileInformation,
                  style: BAppStyles.poppins(
                    fontSize: BSizes.fontSizeMd,
                    weight: FontWeight.w400,
                    color: BAppColors.black600,
                  ),
                ),

                SizedBox(height: BSizes.lg),

                /// Horizontal scroll chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomOutlinedButton(
                        label: AppStrings.breakfast,
                          assetPath:  BImages.breakfastIncluded,

                        onPressed:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: BSizes.sm),
                      CustomOutlinedButton(
                        label: AppStrings.beach,

                        onPressed: (){}, assetPath:  BImages.beach,
                      ),
                      SizedBox(width: BSizes.sm),
                      CustomOutlinedButton(

                        label: AppStrings.parking,
                        assetPath:  BImages.parking,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}












