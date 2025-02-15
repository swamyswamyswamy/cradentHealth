import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view/screens/drawer_screens/family_members/add_family_members.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_fitness_plan_details.dart';
import 'package:cradenthealth/view/widgets/person_profile_details_widget.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GymPlanWidget extends StatelessWidget {
  const GymPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                      textName: "100\$",
                      textColor: AppColors.primaryColor,
                      fontWeightType: FontWeightType.semiBold,
                      fontFamily: FontFamily.poppins,
                      fontSize: 20),
                  CustomSizedBoxWidth(width: 11)
                ],
              ),
              CustomSizedBoxHeight(height: 20),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(20)),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenHeight(2)),
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            height: getProportionateScreenHeight(20),
                            width: getProportionateScreenWidth(20),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                            child: Icon(
                              Icons.done,
                              color: AppColors.whiteColor,
                              size: 12,
                            ),
                          ),
                        ),
                        CustomSizedBoxWidth(width: 14),
                        Expanded(
                          child: CustomText(
                              textName:
                                  "High World Limit for  Questions & answers",
                              textColor: AppColors.primaryColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // CustomSizedBoxHeight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(13)),
                      child: Row(
                        children: [
                          CustomText(
                              textName: "Monthly",
                              textColor: AppColors.whiteColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                          CustomSizedBoxWidth(width: 8),
                          Icon(
                            Icons.expand_more,
                            color: AppColors.whiteColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: -10,
          child: Stack(
            children: [
              Image.asset(
                AppImages.fitnessPlanSticker,
                height: getProportionateScreenHeight(38),
                width: getProportionateScreenWidth(100),
              ),
              CustomText(
                  textName: "10% Off",
                  textColor: AppColors.primaryColor,
                  fontWeightType: FontWeightType.semiBold,
                  fontFamily: FontFamily.poppins,
                  fontSize: 16),
            ],
            alignment: Alignment.center,
          ),
        )
      ],
      clipBehavior: Clip.none,
    );
  }
}
