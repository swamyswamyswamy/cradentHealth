import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
                children: List.generate(7, (rowIndex) {
                  return Row(
                    children: List.generate(2, (colIndex) {
                      final index = (rowIndex * 2) + colIndex;
                      if (index < 7) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenHeight(
                                    colIndex != 1 ? 0 : 16),
                                right: getProportionateScreenHeight(
                                    colIndex == 1 ? 0 : 16),
                                bottom: getProportionateScreenWidth(26)),
                            child: Container(
                              // height: 70,\
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        color: AppColors.blackColor
                                            .withOpacity(0.25))
                                  ]),
                              child: Column(
                                children: [
                                  CustomSizedBoxHeight(height: 19),
                                  Image.asset(
                                    index == 0
                                        ? AppImages.consultationImage
                                        : index == 1
                                            ? AppImages.pharmacyImage
                                            : index == 2
                                                ? AppImages.opticleImage
                                                : index == 3
                                                    ? AppImages.gymFitnessImage
                                                    : index == 4
                                                        ? AppImages.hraImage
                                                        : index == 5
                                                            ? AppImages
                                                                .diagnosticsImage
                                                            : AppImages
                                                                .hraImage,
                                    height: getProportionateScreenHeight(80),
                                    width: getProportionateScreenWidth(80),
                                  ),
                                  CustomSizedBoxHeight(height: 8),
                                  CustomText(
                                      textName: index == 0
                                          ? "Schedule a consultation"
                                          : index == 1
                                              ? "Pharmacy"
                                              : index == 2
                                                  ? "Opticles"
                                                  : index == 3
                                                      ? "Gym & Fitness"
                                                      : index == 4
                                                          ? "EAP"
                                                          : index == 5
                                                              ? "Diagnostics"
                                                              : "HRA",
                                      textColor: AppColors.blackColor,
                                      fontWeightType: FontWeightType.medium,
                                      fontFamily: FontFamily.montserrat,
                                      fontSize: 10),
                                  CustomSizedBoxHeight(height: 19),
                                ],
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
