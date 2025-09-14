import 'package:bogo_latest/features/dashboard/home/home_screen.dart';
import 'package:bogo_latest/features/dashboard/home/item_detail_screen.dart';
import 'package:bogo_latest/features/dashboard/offers/offer_info_screen.dart';
import 'package:bogo_latest/features/dashboard/offers/offers_screen.dart';
import 'package:bogo_latest/features/dashboard/profile/offer_otp_screen.dart';
import 'package:bogo_latest/features/dashboard/work_time/work_time_screen.dart';
import 'package:bogo_latest/features/setting/verification/camera_verification/screens/face_verification_screen.dart';
import 'package:bogo_latest/theme/themes.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bogo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      // home: FaceVerificationScreen(),
      home: WorkTimeScreen(),
    );
  }
}

// return MaterialApp.router(
//   title: 'Bogo',
//   debugShowCheckedModeBanner: false,
//   themeMode: ThemeMode.system,
//   theme: BAppTheme.lightTheme,
//   darkTheme: BAppTheme.darkTheme,
//   routerConfig: AppRouter.router,
// );
