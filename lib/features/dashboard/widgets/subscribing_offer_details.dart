import 'package:bogo_latest/core/utils/common_widgets/notch_clippers.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:dotted_line_flutter/dotted_line_flutter.dart';
import 'package:flutter/material.dart';

class SubscribingOfferDetails extends StatelessWidget {
  final double discountPercentage;
  final String roomType;
  final double roomPrice;
  final double discountAmount;
  final double totalAmount;

  const SubscribingOfferDetails(
      {required this.discountPercentage,
      required this.roomType,
      required this.roomPrice,
      required this.discountAmount,
      required this.totalAmount,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: ChatNotchedClipper(),
          child: Container(
            height: 77,
            decoration: BoxDecoration(
              color: BAppColors.backGroundColor,
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "$discountPercentage% Discount",
                style: BAppStyles.poppins(
                    color: BAppColors.white,
                    fontSize: 20,
                    weight: FontWeight.w600),
              ),
            )),
          ),
        ),
        Container(
          height: 53,
          decoration: BoxDecoration(
            color: BAppColors.lightGray500,
          ),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: BSizes.size35,
                ),
                Text(
                  roomType,
                  style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: 15,
                      weight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 183,
          decoration: BoxDecoration(
              color: BAppColors.black1000,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 53,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: BSizes.size35,
                    ),
                    Text(
                      "Price",
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 15,
                          weight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "$roomPrice DA",
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 15,
                          weight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: BSizes.size35,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 53,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: BSizes.size35,
                    ),
                    Text(
                      "Discount",
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 15,
                          weight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "$discountAmount DA",
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 15,
                          weight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: BSizes.size35,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DottedLine(
                  axis: Axis.horizontal,
                  lineThickness: 2,
                  dashGap: 4,
                  dashWidth: 10,
                  colors: [Colors.grey],
                ),
              ),
              SizedBox(
                height: 66,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: BSizes.size35,
                    ),
                    Text(
                      "Total amount ",
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 16,
                          weight: FontWeight.w700),
                    ),
                    Spacer(),
                    Text(
                      "$totalAmount DA",
                      style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: 16,
                          weight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: BSizes.size35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
