import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/diagnostics/diagnosticslist_screen.dart';
import 'package:cradenthealth/view/screens/doctor_screens/doctors_list_screen.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_fitness_plans.dart';
import 'package:cradenthealth/view/screens/hra/hra_policy_screen.dart';
import 'package:cradenthealth/view/screens/hra/hra_screen.dart';
import 'package:cradenthealth/view/screens/opticles/lenskart_specs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreens extends StatelessWidget {
  final bool navigateBack;
  CategoriesScreens({super.key, this.navigateBack = true});

  final List<Map<String, dynamic>> categories = [
    {
      'title': "Book a consultation",
      'image': AppImages.consultationImage,
      'navigate': DoctorsListScreen(),
    },
    // {
    //   'title': "Pharmacy",
    //   'image': AppImages.pharmacyImage,
    //   'navigate': DiagnosticPaymentScreen(),
    // },
    // {
    //   'title': "Opticles",
    //   'image': AppImages.opticleImage,
    //   'navigate': LenskartSpecsScreen(title: "Opticles"),
    // },
    // {
    //   'title': "Gym & Fitness",
    //   'image': AppImages.gymFitnessImage,
    //   'navigate': GymFitnessPlans(),
    // },
    // {
    //   'title': "EAP",
    //   'image': AppImages.hraImage,
    //   'navigate': HraScreen(title: "EAP"),
    // },
    {
      'title': "Lab tests & packages",
      'image': AppImages.diagnosticsImage,
      'navigate': DiagnosticslistScreen(),
    },
    {
      'title': "HRA",
      'image': AppImages.hraImage,
      'navigate': HealthAssessmentIntroScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonVisible: navigateBack,
        backgroundColor: AppColors.whiteColor,
        title: "Categories",
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 35),
              Column(
                children:
                    List.generate((categories.length / 2).ceil(), (rowIndex) {
                  return Row(
                    children: List.generate(2, (colIndex) {
                      final index = (rowIndex * 2) + colIndex;
                      if (index < categories.length) {
                        final category = categories[index];
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getProportionateScreenHeight(
                                  colIndex != 1 ? 0 : 16),
                              right: getProportionateScreenHeight(
                                  colIndex == 1 ? 0 : 16),
                              bottom: getProportionateScreenWidth(26),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(category['navigate']);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: AppColors.blackColor
                                          .withOpacity(0.25),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    CustomSizedBoxHeight(height: 19),
                                    Image.asset(
                                      category['image'],
                                      height: getProportionateScreenHeight(80),
                                      width: getProportionateScreenWidth(80),
                                    ),
                                    CustomSizedBoxHeight(height: 8),
                                    CustomText(
                                      textName: category['title'],
                                      textColor: AppColors.blackColor,
                                      fontWeightType: FontWeightType.medium,
                                      fontFamily: FontFamily.montserrat,
                                      fontSize: 10,
                                    ),
                                    CustomSizedBoxHeight(height: 19),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Expanded(child: SizedBox());
                      }
                    }),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
