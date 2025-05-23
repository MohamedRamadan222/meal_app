import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/routing/router_generation_config.dart';
import 'features/onboarding/on_boarding_sevices/on_boarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnBoardingServices.initializeLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Meals App',
          routerConfig: RouterGenerationConfig.goRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
