import 'package:flutter/material.dart';
import '../../../core/utils/common/common_widgets/bogo_bottom_nav_bar.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../activity/activity_screen.dart';
import '../home/home_screen.dart';
import '../map/map_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  // App pages
  late final List<Widget> _pages = [
    const HomeScreen(key: PageStorageKey('home')),
    const ActivityScreen(key: PageStorageKey('activity')),
    // const MapScreen(key: PageStorageKey('maps')),
    const ProfileScreen(key: PageStorageKey('profile')),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) => setState(() => _currentIndex = index);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.white,
      // extendBody: true,
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BogoBottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onTap,
        barHeight: 92,
        // barWidth: 394,
        cornerRadius: 46,
        indicatorDiameter: 60,
        indicatorOverlap: 26,
        notchRadiusExtra: 8,
        barColor: BAppColors.black1000,
        indicatorColor: BAppColors.primary,
        selectedColor: BAppColors.white,
        unselectedColor: BAppColors.lightGray400,
        items: [
          BogoNavItem(asset: BImages.bottomHomeIcon, label: 'Home'),
          BogoNavItem(asset: BImages.bottomHomeIcon, label: 'Activity'),
          BogoNavItem(asset: BImages.bottomHomeIcon, label: 'Maps'),
          BogoNavItem(asset: BImages.bottomHomeIcon, label: 'Profile'),
        ],
      ),
    );
  }
}
