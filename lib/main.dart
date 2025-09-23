import 'package:bogo_latest/features/setting/verification/camera_verification/screens/face_verification_screen.dart';
import 'package:bogo_latest/theme/themes.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bogo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      routerConfig:  AppRouter.router,
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
