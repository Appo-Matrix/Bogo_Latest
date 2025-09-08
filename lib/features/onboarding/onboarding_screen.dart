import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/features/onboarding/widgets/onboarding_card.dart';
import 'package:bogo_latest/features/onboarding/widgets/onboarding_data.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    final lastIndex = OnboardingData.pages.length - 1;

    if (_currentPage < lastIndex) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // ✅ GoRouter navigation
      context.go('/authHomeScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: BAppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Logo
            Center(
              child: Image.asset(
                BImages.appLogo,
                height: size.height * 0.08,
                fit: BoxFit.contain,
              ),
            ),

            /// Main PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(), // ✅ swipe enabled
                itemCount: OnboardingData.pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = OnboardingData.pages[index];
                  return Column(
                    children: [
                      SizedBox(height: size.height * 0.05),

                      /// Image
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          page["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Card with Next button
                      OnboardingCard(
                        title: page["title"]!,
                        subtitle: page["subtitle"]!,
                        onNext: _nextPage, // ✅ correct function
                      ),

                      SizedBox(height: size.height * 0.08),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
