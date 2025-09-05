import 'package:go_router/go_router.dart';

import '../../features/splash/splash_screen.dart';
import '../services/navigation_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: NavigationHelper.navigatorKey,
    initialLocation: '/splashScreen',
    routes: [
      GoRoute(
        path: '/splashScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const SplashScreen(), state),
      ),


    ],
  );
}
