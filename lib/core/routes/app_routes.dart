import 'package:bogo_latest/features/auth/screens/Register/Register_screen.dart';
import 'package:bogo_latest/features/auth/screens/auth_home/auth_home_screen.dart';
import 'package:bogo_latest/features/auth/screens/login/login_screen.dart';
import 'package:bogo_latest/features/auth/screens/otp/otp_verification_screen.dart';
import 'package:bogo_latest/features/dashboard/filter/filter_screen.dart';
import 'package:bogo_latest/features/dashboard/home/home_screen.dart';
import 'package:bogo_latest/features/dashboard/home/language/language_screen.dart';
import 'package:bogo_latest/features/dashboard/item_detail/item_detail_screen.dart';
import 'package:bogo_latest/features/dashboard/screen/dashboard_screen.dart';
import 'package:bogo_latest/features/onboarding/onboarding_screen.dart';
import 'package:bogo_latest/features/auth/screens/register_complete/register_complete_screen.dart';
import 'package:bogo_latest/features/dashboard/offers/offer_info_screen.dart';
import 'package:bogo_latest/features/dashboard/offers/offers_screen.dart';
import 'package:bogo_latest/features/dashboard/profile/offer_otp_screen.dart';
import 'package:bogo_latest/features/dashboard/work_time/work_time_screen.dart';
import 'package:bogo_latest/features/setting/about/about_screen.dart';
import 'package:bogo_latest/features/setting/bogo_ai/bogo_ai_screen.dart';
import 'package:bogo_latest/features/setting/chat/live_chatting_screen.dart';
import 'package:bogo_latest/features/setting/dashboard/setting_dashboard_screen.dart';
import 'package:bogo_latest/features/setting/screen/setting_screen.dart';
import 'package:bogo_latest/features/setting/support/support_screen.dart';
import 'package:bogo_latest/features/setting/verification/camera_verification/screens/face_verification_screen.dart';
import 'package:bogo_latest/features/setting/verification/camera_verification/screens/id_card_verification_screen.dart';
import 'package:bogo_latest/features/setting/verification/camera_verification/screens/selfie_with_id_card_screen.dart';
import 'package:bogo_latest/features/setting/verification/identity_verification_screen.dart';
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
      GoRoute(
        path: '/homeScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const HomeScreen(), state),
      ),
      GoRoute(
        path: '/dashboardScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const DashboardScreen(), state),
      ),
      GoRoute(
        path: '/aboutScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const AboutScreen(), state),
      ),
      GoRoute(
        path: '/supportScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const SupportScreen(), state),
      ),
      GoRoute(
        path: '/liveChattingScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const LiveChattingScreen(), state),
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
        path: '/faceVerificationScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const FaceVerificationScreen(), state),
      ),
      GoRoute(
        path: '/idCardVerificationScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const IdCardVerificationScreen(), state),
      ),
      GoRoute(
        path: '/selfieWithIdCardScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const SelfieWithIdCardScreen(), state),
      ),
      GoRoute(
        path: '/identityVerificationScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const IdentityVerificationScreen(), state),
      ),
      GoRoute(
        path: '/settingDashboardScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const SettingDashboardScreen(), state),
      ),
      GoRoute(
        path: '/languageScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const LanguageScreen(), state),
      ),
      GoRoute(
        path: '/itemDetailScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const ItemDetailScreen(), state),
      ),
      GoRoute(
        path: '/bogoAiScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const BogoAiScreen(), state),
      ),
      GoRoute(
        path: '/settingScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const SettingScreen(), state),
      ),
      GoRoute(
        path: '/filterScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const FilterScreen(), state),
      ),
      GoRoute(
        path: '/filterScreen',
        pageBuilder: (context, state) =>
            NavigationHelper.slideFromRight(const FilterScreen(), state),
      ),
    ],
  );
}
