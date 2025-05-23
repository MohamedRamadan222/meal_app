import 'package:meals_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/features/add_meal_screen/add_meal_screen.dart';

import '../../features/home_screen/data/models/meal_model.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/meal_details_screen/meal_details_screen.dart';
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
      GoRoute(
        path: AppRoutes.addMealScreen,
        name: AppRoutes.addMealScreen,
        builder: (context, state) => const AddMealScreen(),
      ),
      GoRoute(
        path: AppRoutes.mealDitalesScreen,
        name: AppRoutes.mealDitalesScreen,
        builder: (context, state) {
          Meal meal = state.extra as Meal;

          return MealDetailsScreen(meal: meal);
        },
      ),
    ],
  );
}
