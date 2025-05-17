import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/onboarding/on_boarding_sevices/on_boarding_services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> titles = [
    "Save Your Meals Ingredient",
    "Use Our App The Best  Best Choice",
    " Our App Your Ultimate Choice",
  ];
  List<String> descriptions = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    " All the best restaurants and their top menus are ready for you",
  ];

  int currentIndex = 0;

  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isFirstTime = OnBoardingServices.isFirstTime();
      OnBoardingServices.setFirstTimeWithFalse();
      if (isFirstTime == false) {
        context.pushReplacementNamed(AppRoutes.homeScreen);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onboardingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 450.h,
              padding: EdgeInsets.only(
                top: 32.sp,
                bottom: 32.sp,
                left: 38.sp,
                right: 22.sp,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 255.h,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    items: List.generate(titles.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 252.w,
                            //
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    titles[index],
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.onBoardingTitleStyle,
                                  ),
                                  HeightSpace(16),
                                  Text(
                                    descriptions[index],
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.onBoardingDescriptionStyle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  const HeightSpace(10),
                  DotsIndicator(
                    dotsCount: titles.length,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size(24, 6),
                      activeSize: const Size(24, 6),
                      color: const Color(0xffC2C2C2),
                      activeColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onTap: (index) {
                      carouselController.animateToPage(index);
                      currentIndex = index;
                      setState(() {});
                    },
                  ),
                  Spacer(),
                  currentIndex >= 2
                      ? InkWell(
                        onTap: () {
                          if (mounted) {
                            GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
                          }
                        },
                        child: Container(
                          width: 62.sp,
                          height: 62.sp,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.primaryColor,
                            size: 25.sp,
                          ),
                        ),
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  GoRouter.of(
                                    context,
                                  ).pushReplacement(AppRoutes.homeScreen);
                                }
                              });
                            },
                            child: Text('Skip', style: AppTextStyles.white14SemiBold),
                          ),
                          InkWell(
                            onTap: () {
                              if (currentIndex < titles.length - 1) {
                                currentIndex++;
                                carouselController.nextPage(); //
                                setState(() {});
                              }
                            },
                            child: Text('Next', style: AppTextStyles.white14SemiBold),
                          ),

                        ],
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

