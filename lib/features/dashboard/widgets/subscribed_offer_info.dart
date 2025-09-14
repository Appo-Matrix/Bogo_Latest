import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:dotted_line_flutter/dotted_line_flutter.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:bogo_latest/core/utils/common_widgets/notch_clippers.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscribedOfferInfo extends StatelessWidget {
  final String hotelTitle;
  final String hotelImagePath;
  final String personTitle;
  final String profilePicPath;
  final String roomType;
  final String userMessage;
  final String barCodeData;
  final int adultCount;
  final int childCount;
  final int roomCount;
  final String initialDate;
  final String endDate;

  const SubscribedOfferInfo(
      {required this.initialDate,
      required this.endDate,
      required this.hotelTitle,
      required this.hotelImagePath,
      required this.personTitle,
      required this.profilePicPath,
      required this.roomType,
      required this.barCodeData,
      required this.adultCount,
      required this.childCount,
      required this.roomCount,
      super.key,
      required this.userMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: DoubleHorizontalNotchedClipper(),
        child: Container(
          height: 676,
          width: 382,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: BAppColors.lightGray100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: BSizes.size35,
                ),
                ClipPath(
                  clipper: DoubleVerticalMidNotchedClipper(),
                  child: Container(
                    height: 112,
                    width: 353,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: BAppColors.black1000),
                    child: Center(
                      child: ListTile(
                          leading: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(hotelImagePath))),
                          ),
                          title: Text(
                            hotelTitle,
                            style: _textStyle(
                                BAppColors.white, 20, FontWeight.w700),
                          ),
                          subtitle: Text(
                            roomType,
                            style: _textStyle(
                                BAppColors.white, 15, FontWeight.w400),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: BSizes.size20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 86,
                        width: 350,
                        decoration: BoxDecoration(
                            color: BAppColors.lightGray400.withOpacity(.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _dateContainer(initialDate),
                            _dateContainer(endDate)
                          ],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 212,
                      width: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35)),
                          color: BAppColors.lightGray200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                        image: AssetImage(profilePicPath))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  personTitle,
                                  style: BAppStyles.poppins(
                                      color: BAppColors.black1000,
                                      fontSize: 12,
                                      weight: FontWeight.w400),
                                )),
                          ),
                          SizedBox(
                            height: BSizes.size5,
                          ),
                          Container(
                            height: 102,
                            width: 150,
                            decoration: BoxDecoration(
                                color: BAppColors.lightGray700,
                                borderRadius: BorderRadius.circular(35)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  userMessage,
                                  style: BAppStyles.body.copyWith(
                                      fontFamily: AppFontFamilies.aBeeZee,
                                      color: BAppColors.white,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 212,
                      width: 176,
                      decoration: BoxDecoration(
                          color: BAppColors.lightGray300,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(35))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _customListTile(
                              "assets/icons/adult.png", "Adults", adultCount),
                          _dashedLines(BAppColors.lightGray400),
                          _customListTile(
                              "assets/icons/child.png", "Children", childCount),
                          _dashedLines(BAppColors.lightGray400),
                          _customListTile(
                              "assets/icons/rooms.png", "Room", roomCount),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 90,
                    child: Center(child: _dashedLines(BAppColors.white))),
                SizedBox(
                  height: BSizes.cardRadiusSm,
                ),
                SizedBox(
                  height: 73,
                  width: 350,
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    // Choose barcode type (e.g., EAN13, QR, etc.)
                    data: barCodeData,
                    // The data to encode
                    width: 350,
                    height: 73,
                    color: Colors.black,
                    backgroundColor: Colors.transparent,
                    drawText: false,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customListTile(String imagePath, String title, int trailing) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: BSizes.cardRadiusSm,
      ),
      SizedBox.square(
        dimension: 45,
        child: Center(child: Image.asset(imagePath)),
      ),
      SizedBox(
        width: BSizes.size5,
      ),
      Text(
        title,
        style: BAppStyles.body
            .copyWith(fontWeight: FontWeight.w600, color: BAppColors.white),
      ),
      Spacer(),
      Text(
        "$trailing",
        style: BAppStyles.body
            .copyWith(fontWeight: FontWeight.w600, color: BAppColors.white),
      ),
      SizedBox(
        width: BSizes.size20,
      ),
    ],
  );
}

Widget _dashedLines(Color lineColor) {
  return DottedLine(
    axis: Axis.horizontal,
    dashWidth: 10,
    dashGap: 10,
    height: 4,
    colors: [lineColor],
  );
}

TextStyle _textStyle(Color fontColor, double size, FontWeight weight) {
  return BAppStyles.poppins(color: fontColor, fontSize: size, weight: weight);
}

Widget _dateContainer(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: BAppColors.lightGray600,
            borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: SizedBox.square(
            dimension: 18,
            child: SvgPicture.asset(
              BImages.driving,
              color: BAppColors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        width: BSizes.cardRadiusSm,
      ),
      Text(
        text,
        style: BAppStyles.poppins(
            color: BAppColors.white, fontSize: 16, weight: FontWeight.w400),
      )
    ],
  );
}
