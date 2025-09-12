import 'package:go_router/go_router.dart';

import '../../features/dashboard/map/map_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../services/navigation_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: NavigationHelper.navigatorKey,
    initialLocation: '/mapScreen',
    routes: [
      GoRoute(
        path: '/splashScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const SplashScreen(), state),
      ),
      GoRoute(
        path: '/mapScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const MapScreen(), state),
      ),


    ],
  );
}
