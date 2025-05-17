import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/widgets/custom_food_item_widget.dart';
import 'package:meals_app/features/home_screen/widgets/custom_top_home_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopHomePart(),
            const HeightSpace(25),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Text('Your Food', style: AppTextStyles.black16Medium),
                    ),
                    const HeightSpace(25),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 22.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomFoodItemWidget(
                            imageUrl: AppAssets.foodExampleImage,
                            name: 'Cheese Burger',
                            rate: 4.5,
                            time: '5-4',
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.add, color: AppColors.whiteColor,
            size: 30.sp ,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
