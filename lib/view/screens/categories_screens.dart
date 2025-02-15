import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: Column(
            children: List.generate(8, (rowIndex) {
              return Row(
                children: List.generate(2, (colIndex) {
                  final index = (rowIndex * 2) + colIndex;
                  if (index < 8) {
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
                                    color:
                                        AppColors.blackColor.withOpacity(0.25))
                              ]),
                          child: Column(
                            children: [
                              CustomSizedBoxHeight(height: 19),
                              Image.asset(
                                AppImages.forgotImage,
                                height: getProportionateScreenHeight(80),
                                width: getProportionateScreenWidth(80),
                              ),
                              CustomSizedBoxHeight(height: 8),
                              CustomText(
                                  textName: "Schedule a consultation",
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
                    return SizedBox();
                  }
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
