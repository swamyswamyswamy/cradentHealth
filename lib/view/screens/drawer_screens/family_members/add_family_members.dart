import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddFamilyMembers extends StatelessWidget {
  AddFamilyMembers({super.key});

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
                CustomSizedBoxHeight(height: 20),
                Inputfield(
                    fillColor: AppColors.secondaryColor,
                    controller: TextEditingController(),
                    // maxLength: 10,
                    label: "Date of birth",
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
                          label: "Height",
                          keyboardType: TextInputType.text,
                          hinttext: ""),
                    ),
                    CustomSizedBoxWidth(width: 40),
                    Expanded(
                      child: Inputfield(
                          fillColor: AppColors.secondaryColor,
                          controller: TextEditingController(),
                          // maxLength: 10,
                          label: "Weight",
                          keyboardType: TextInputType.text,
                          hinttext: ""),
                    ),
                  ],
                ),
                CustomSizedBoxHeight(height: 20),
                Inputfield(
                    fillColor: AppColors.secondaryColor,
                    controller: TextEditingController(),
                    // maxLength: 10,
                    label: "Eye Sight",
                    keyboardType: TextInputType.text,
                    hinttext: ""),
                CustomSizedBoxHeight(height: 12),
                Inputfield(
                    fillColor: AppColors.secondaryColor,
                    controller: TextEditingController(),
                    // maxLength: 10,
                    label: "BMI( Body mass index )",
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
                          label: "BP",
                          keyboardType: TextInputType.text,
                          hinttext: ""),
                    ),
                    CustomSizedBoxWidth(width: 40),
                    Expanded(
                      child: Inputfield(
                          fillColor: AppColors.secondaryColor,
                          controller: TextEditingController(),
                          // maxLength: 10,
                          label: "Suger",
                          keyboardType: TextInputType.text,
                          hinttext: ""),
                    ),
                  ],
                ),
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
        ));
  }
}
