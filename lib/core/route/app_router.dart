import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/features/authentication/presentation/screen/confirm_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/forgot_password_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/login_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/pin_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/reset_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/signup_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/verification_screen.dart';
import 'package:expensetracker/features/home/presentation/screen/main_screen.dart';
import 'package:expensetracker/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:expensetracker/features/splash/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigationKey,
    routes: [
      GoRoute(path: Routes.root, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: Routes.onboardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.signUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.verificationScreen,
        builder: (context, state) => VerificationScreen(),
      ),
      GoRoute(
        path: Routes.forgotPasswordScreen,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.confrimScreen,
        builder: (context, state) => ConfirmScreen(),
      ),
      GoRoute(
        path: Routes.resetScreen,
        builder: (context, state) => ResetScreen(),
      ),
      GoRoute(path: Routes.pinScreen, builder: (context, state) => PinScreen()),
      GoRoute(
        path: Routes.mainScreen,
        builder: (context, state) => MainScreen(),
      ),
    ],
  );
}
