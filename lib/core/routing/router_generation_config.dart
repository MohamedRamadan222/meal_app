import 'package:meals_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_screen/home_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),

    ],
  );
}
