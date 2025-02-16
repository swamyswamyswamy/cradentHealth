import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor,
          title: "Edit Profile",
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 45),
              Stack(
                children: [
                  AppButton(
                    height: 100,
                    width: 100,
                    borderColor: AppColors.blackColor.withOpacity(0.1),
                    backgroundColor: AppColors.whiteColor,
                    borderRadius: 18,
                    child: Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(4)),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg"))),
                        )),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -15,
                    child: Container(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.whiteColor),
                      child: Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(2)),
                        child: Container(
                          height: getProportionateScreenHeight(30),
                          width: getProportionateScreenWidth(30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blueColor),
                          child: Center(
                              child: Icon(
                            Icons.edit,
                            color: AppColors.whiteColor,
                            size: 15,
                          )),
                        ),
                      ),
                    ),
                  )
                ],
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
              ),
              CustomSizedBoxHeight(height: 27),
              Container(
                color: AppColors.secondaryColor,
                height: getProportionateScreenHeight(9),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  children: [
                    CustomSizedBoxHeight(height: 28),
                    Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(),
                        // maxLength: 10,
                        label: "Name",
                        keyboardType: TextInputType.text,
                        hinttext: ""),
                    CustomSizedBoxHeight(height: 12),
                    Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(),
                        // maxLength: 10,
                        label: "Mobile Number",
                        keyboardType: TextInputType.text,
                        hinttext: ""),
                    CustomSizedBoxHeight(height: 12),
                    Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(),
                        // maxLength: 10,
                        label: "Email",
                        keyboardType: TextInputType.text,
                        hinttext: ""),
                    CustomSizedBoxHeight(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Inputfield(
                              fillColor: AppColors.secondaryColor,
                              controller: TextEditingController(),
                              // maxLength: 10,
                              label: "Age",
                              keyboardType: TextInputType.text,
                              hinttext: ""),
                        ),
                        CustomSizedBoxWidth(width: 40),
                        Expanded(
                          child: Inputfield(
                              fillColor: AppColors.secondaryColor,
                              controller: TextEditingController(),
                              // maxLength: 10,
                              label: "Gender",
                              keyboardType: TextInputType.text,
                              hinttext: ""),
                        ),
                      ],
                    ),
                    CustomSizedBoxHeight(height: 58),
                    CustomSizedBoxHeight(height: 26),
                    AppButton(
                      height: 44,
                      onTap: () {
                        // Get.to(OtpVerificationScreen());
                      },
                      hasShadow: true,
                      label: "Save",
                    ),
                  ],
                ),
              ),
              CustomSizedBoxHeight(height: 30),
            ],
          ),
        ));
  }
}
