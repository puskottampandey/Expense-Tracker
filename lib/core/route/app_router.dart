import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/features/splash/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigationKey,
    routes: [
      GoRoute(path: Routes.root, builder: (context, state) => SplashScreen()),
    ],
  );
}
