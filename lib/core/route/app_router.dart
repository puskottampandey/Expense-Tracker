import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/features/authentication/presentation/screen/login_screen.dart';
import 'package:expensetracker/features/authentication/presentation/screen/signup_screen.dart';
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
    ],
  );
}
