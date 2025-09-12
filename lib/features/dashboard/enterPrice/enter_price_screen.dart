import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../storedetail/widgets/back_button.dart';
import '../worktime/worktime_screen.dart';
class EnterPriceScreen extends StatefulWidget {
  const EnterPriceScreen({super.key});

  @override
  State<EnterPriceScreen> createState() => _EnterPriceScreenState();
}

class _EnterPriceScreenState extends State<EnterPriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.white,
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                BackButtonWidgets(),

                // Next button
                InkWell(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  WorktimeScreen(),
                    ),
                  );
                },
                  child: Container(
                    width: 112,
                    height: 111,
                    padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    child:  Center(
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
            
          ),
          SizedBox(height: 200,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Enter total price',
                  style: TextStyle(
                    color: BAppColors.black1000,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  width: 283,
                  height: 92,
                  child: TextField(
                    textAlign: TextAlign.center, // center the text like in screenshot
                    style: const TextStyle(
                      color: BAppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: "2600 DA",
                      hintStyle: const TextStyle(
                        color:  BAppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      filled: true,
                      fillColor: BAppColors.black1000, // black background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none, // remove underline/border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
          SizedBox(height: 50,),


        ],
      ),),

    ) ;
  }
}
