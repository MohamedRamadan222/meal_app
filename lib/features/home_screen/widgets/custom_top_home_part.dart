import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_assets/app_assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';

class CustomTopHomePart extends StatelessWidget {
  const CustomTopHomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeScreenTopImage,
          width: double.infinity,
          height: 270.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 15.w,
          top: 30.h,
          bottom: 30.h,
          child: Container(
            width: 220.w,
            height: 186.h,
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Welcome Add A New Recipe',
              textAlign: TextAlign.left,
              style: AppTextStyles.onBoardingTitleStyle,
            ),
          ),
        ),
      ],
    );
  }
}
