import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool showFAQ = false; // toggle between About us and FAQ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back button and heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: BAppColors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    showFAQ ? "FAQ" : "About us",
                    style: BAppStyles.poppins(
                      color: BAppColors.white,
                      fontSize: BSizes.fontSizeLgx,
                      weight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // logo and pills
              Row(
                children: [
                  Image.asset(
                    XImagesExtra.logo,
                    width: 94,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 14),
                  GestureDetector(
                    onTap: () => setState(() => showFAQ = false),
                    child: Container(
                      width: 119,
                      height: 57,
                      decoration: BoxDecoration(
                        color: showFAQ
                            ? BAppColors.white.withOpacity(0.12)
                            : BAppColors.main,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: BAppColors.green400,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.info,
                              color: BAppColors.white,
                            ),
                          ),
                          Text(
                            "About us",
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => setState(() => showFAQ = true),
                    child: Container(
                      width: 119,
                      height: 57,
                      decoration: BoxDecoration(
                        color: showFAQ
                            ? BAppColors.main
                            : BAppColors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: BAppColors.green400,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.info,
                              color: BAppColors.white,
                            ),
                          ),
                          Text(
                            "FAQ",
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!showFAQ)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: BAppColors.black900,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                          child: Text(
                            "bogo is a lifestyle application that provides incentive offers (BOGO-X% -2for3) of well-known brands for dining, entertainment, leisure, beauty and hotels in all over Algeria. "
                            "Valid 7 days a week (excluding public holidays) and their length. Our app is set with a lot of great features that will make your experience more fun! "
                            "It's easy to use and you have always your offers with you. Offers are added monthly, exclusive from new traders every month. "
                            "You can share these amazing shows by sharing with family and friends.",
                            textAlign: TextAlign.justify,
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w600,
                              height: 1.8,
                            ),
                          ),
                        ),
                      if (showFAQ)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "Q${index + 1}: This is a temporary FAQ question?",
                                style: BAppStyles.poppins(
                                  color: BAppColors.white,
                                  fontSize: BSizes.fontSizeMd,
                                  weight: FontWeight.w600,
                                ),
                              ),
                            );
                          }),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class XImagesExtra {
  static const String logo = BImages.appLogo;
}
