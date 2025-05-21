import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import '../home_screen/data/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.whiteColor, width: 2),
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteColor,
                            size: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HeightSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name,
                      style: AppTextStyles.gray14Regular.copyWith(
                        color: Colors.black,
                        fontSize: 24.sp,
                      ),
                    ),
                    HeightSpace(21),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              const WidthSpace(4),
                              Text(
                                meal.time,
                                style: AppTextStyles.gray14Regular.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              const WidthSpace(4),
                              SizedBox(
                                child: Text(
                                  meal.rate.toString(),
                                  style: AppTextStyles.gray14Regular.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    HeightSpace(27),
                    const Divider(thickness: 2),
                    HeightSpace(24),
                    Text('Description', style: AppTextStyles.black16Medium),
                    HeightSpace(8),
                    Text(meal.description, style: AppTextStyles.gray14Regular),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
