import 'dart:math';

import 'package:bogo_latest/features/setting/dashboard/widgets/custom_app_bar.dart';
import 'package:bogo_latest/features/setting/dashboard/widgets/left_column.dart';
import 'package:bogo_latest/features/setting/dashboard/widgets/right_column.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class SettingDashboardScreen extends StatefulWidget {
  const SettingDashboardScreen({super.key});

  @override
  State<SettingDashboardScreen> createState() => _SettingDashboardScreenState();
}

class _SettingDashboardScreenState extends State<SettingDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double colW = (w - 16 /*left*/ - 16 /*right*/ - 2 /*gap*/ - 0.5) / 2;

    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              CustomAppBar(
                profileImage: BImages.profile,
                onBack: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "Dashboard",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.xl,
                      weight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Grid two columns
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LEFT COLUMN
                  LeftColumn(width: colW),

                  const SizedBox(width: 2),

                  // RIGHT COLUMN
                  RightColumn(width: colW)
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  }