import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/features/dashboard/profile/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import '../../../core/utils/common/common_widgets/custom_text_field.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool activityVisibility = true;
  bool autoAccept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      appBar: CustomAppBar(
          showBack: true,
          leadingColor: BAppColors.white
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
            child: Column(
              children: [
                // Profile Avatar
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: BAppColors.black700,
                            width: 4,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(BImages.profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: BAppColors.light,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -25,
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: BAppColors.cyan500,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: BAppColors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                ToggleOption(
                  title: 'Activity visibility',
                  value: activityVisibility,
                  onChanged: (v) => setState(() => activityVisibility = v),
                ),
                SizedBox(height: 16),
                ToggleOption(
                  title: 'Auto accept',
                  value: autoAccept,
                  onChanged: (v) => setState(() => autoAccept = v),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'afif000',
                  borderRadius: 35,
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'afif behlouli',
                  borderRadius: 35,
                  icon: Icons.remove_circle_outline,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'email@gmail.com',
                  borderRadius: 35,
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: '0555445544',
                  borderRadius: 35,
                  icon: Icons.phone_outlined,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: '...........',
                  borderRadius: 35,
                  icon: Icons.lock_outline,
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 336,
                    height: 92,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A), // light green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                        elevation: 6,
                        shadowColor: Colors.black.withOpacity(0.25),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
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

