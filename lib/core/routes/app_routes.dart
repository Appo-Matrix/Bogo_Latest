import 'package:bogo_latest/features/auth/screens/Register/Register_screen.dart';
import 'package:bogo_latest/features/auth/screens/auth_home/auth_home_screen.dart';
import 'package:bogo_latest/features/auth/screens/login/login_screen.dart';
import 'package:bogo_latest/features/auth/screens/otp/otp_verification_screen.dart';
import 'package:bogo_latest/features/onboarding/onboarding_screen.dart';
import 'package:bogo_latest/features/auth/screens/register_complete/register_complete_screen.dart';
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
      GoRoute(
        path: '/onboardingScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const OnboardingScreen(), state),
      ),
      GoRoute(
        path: '/authHomeScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const AuthHomeScreen(), state),
      ),
      GoRoute(
        path: '/loginScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const LoginScreen(), state),
      ),
      GoRoute(
        path: '/registerScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const RegisterScreen(), state),
      ),
      GoRoute(
        path: '/otpVerificationScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const OtpVerificationScreen(), state),
      ),
      GoRoute(
        path: '/registerCompleteScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const RegisterCompleteScreen(), state),
      ),


    ],
  );
}
