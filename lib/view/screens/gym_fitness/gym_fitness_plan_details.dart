import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/drawer_screens/family_members/add_family_members.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_plan_widget.dart';
import 'package:cradenthealth/view/widgets/person_profile_details_widget.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GymFitnessPlanDetails extends StatelessWidget {
  GymFitnessPlanDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor,
          title: "My Subscription",
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 22),
              Image.asset(
                AppImages.planImage,
                height: getProportionateScreenHeight(85),
                width: getProportionateScreenWidth(85),
              ),
              CustomSizedBoxHeight(height: 16),
              CustomText(
                  textName: "Cultfit",
                  textColor: AppColors.primaryColor,
                  fontWeightType: FontWeightType.medium,
                  fontFamily: FontFamily.poppins,
                  fontSize: 36),
              CustomText(
                  textName: "Platinum",
                  textColor: AppColors.primaryColor,
                  fontWeightType: FontWeightType.medium,
                  fontFamily: FontFamily.poppins,
                  fontSize: 36),
              CustomSizedBoxHeight(height: 7),
              CustomText(
                  textName: "Membership Till 10 November 2024",
                  textColor: AppColors.primaryColor,
                  fontWeightType: FontWeightType.medium,
                  fontFamily: FontFamily.poppins,
                  fontSize: 18),
              CustomSizedBoxHeight(height: 10),
              Divider(
                color: AppColors.blackColor.withOpacity(0.1),
                height: 0,
              ),
              CustomSizedBoxHeight(height: 15),
              CustomText(
                  textName: "*Your Benefits*",
                  textColor: AppColors.primaryColor,
                  fontWeightType: FontWeightType.semiBold,
                  fontFamily: FontFamily.poppins,
                  fontSize: 18),
              CustomSizedBoxHeight(height: 29),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(26)),
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
              ),
              CustomSizedBoxHeight(height: 49),
              Divider(
                color: AppColors.blackColor.withOpacity(0.1),
                height: 0,
              ),
              CustomSizedBoxHeight(height: 29),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: GymPlanWidget(),
              ),
              CustomSizedBoxHeight(height: 26),
            ],
          ),
        ));
  }
}
