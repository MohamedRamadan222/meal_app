import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/widgets/custom_text_field.dart';
import 'package:meals_app/core/widgets/primary_button_widget.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/db_helper/db_helper.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../home_screen/data/models/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Add Meal', style: AppTextStyles.black16Medium),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child:
                isLoading
                    ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 80,
                      child: Center(
                        child: SizedBox(
                          width: 40.sp,
                          height: 40.sp,
                          child: const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Meal Name', style: AppTextStyles.black16Medium),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: mealNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Add Meal Name ";
                            } else if (val.length < 3) {
                              return "Please Add More Than 3 characters";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(16),
                        Text('Image URL', style: AppTextStyles.black16Medium),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: imageUrlController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Add Image Url";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(16),
                        Text('Rate', style: AppTextStyles.black16Medium),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: rateController,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Add Rate ";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(12),
                        Text('Time', style: AppTextStyles.black16Medium),
                        const HeightSpace(12),
                        CustomTextField(
                          controller: timeController,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Add Time For Meal";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(12),
                        Text('Description', style: AppTextStyles.black16Medium),
                        const HeightSpace(12),
                        CustomTextField(
                          maxLines: 3,
                          controller: descriptionController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Add Description For Meal ";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(70),
                        PrimaryButtonWidget(
                          buttonText: 'Add Meal',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              Meal meal = Meal(
                                name: mealNameController.text,
                                imageUrl: imageUrlController.text,
                                rate: double.parse(rateController.text),
                                description: descriptionController.text,
                                time: timeController.text,
                              );
                              dbHelper.insertMeal(meal).then((value) {
                                GoRouter.of(
                                  context,
                                ).pushReplacementNamed(AppRoutes.homeScreen);
                              });
                            }
                          },
                        ),
                        const HeightSpace(20),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
