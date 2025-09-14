import 'package:bogo_latest/features/auth/screens/Register/Register_screen.dart';
import 'package:bogo_latest/features/auth/screens/auth_home/auth_home_screen.dart';
import 'package:bogo_latest/features/auth/screens/login/login_screen.dart';
import 'package:bogo_latest/features/auth/screens/otp/otp_verification_screen.dart';
import 'package:bogo_latest/features/dashboard/home/home_screen.dart';
import 'package:bogo_latest/features/onboarding/onboarding_screen.dart';
import 'package:bogo_latest/features/auth/screens/register_complete/register_complete_screen.dart';
import 'package:bogo_latest/features/dashboard/home/home_screen.dart';
import 'package:bogo_latest/features/dashboard/home/item_detail_screen.dart';
import 'package:bogo_latest/features/dashboard/offers/offer_info_screen.dart';
import 'package:bogo_latest/features/dashboard/offers/offers_screen.dart';
import 'package:bogo_latest/features/dashboard/profile/offer_otp_screen.dart';
import 'package:bogo_latest/features/dashboard/work_time/work_time_screen.dart';
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
      ),   GoRoute(
        path: '/homeScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const HomeScreen(), state),
      ),


      GoRoute(
        path: '/offersScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const OffersScreen(), state),
      ),
      GoRoute(
        path: '/offersInfoScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const OfferInfoScreen(), state),
      ),
      GoRoute(
        path: '/workTimeScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const WorkTimeScreen(), state),
      ),
      GoRoute(
        path: '/offerOtpScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const OfferOtpScreen(), state),
      ),
      GoRoute(
        path: '/homeScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const HomeScreen(), state),
      ),
      GoRoute(
        path: '/itemDetailScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const ItemDetailScreen(), state),
      ),
    ],
  );
}
