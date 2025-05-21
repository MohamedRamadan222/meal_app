import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';

class CustomFoodItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final double rate;
  final Function()? onTap;

  const CustomFoodItemWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.rate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: 137.w,
                height: 106.h,
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.error, color: AppColors.primaryColor),
                fit: BoxFit.cover,
              ),
              const HeightSpace(8),
              SizedBox(
                width: 120.w,

                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.black16Medium,
                ),
              ),
              const HeightSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primaryColor, size: 16.sp),
                      const WidthSpace(4),
                      SizedBox(
                        child: Text(
                          rate.toString(),
                          style: AppTextStyles.gray14Regular.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.watch_later, color: AppColors.primaryColor, size: 16.sp),
                      const WidthSpace(4),
                      Text(
                        time,
                        style: AppTextStyles.gray14Regular.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
