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

class HraScreen extends StatelessWidget {
  String title;
  HraScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor,
          title: title,
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBoxHeight(height: 28),
                CustomDropdown(
                  dropdownItems: [
                    'Narasimha',
                  ],
                  getItemName: (item) => item, // Simply returns the item itself
                  getItemId: (item) => item, // ID same as the item in this case
                  initialValue: 'Narasimha', // Optional initial value
                  hintName: 'Narasimha',

                  textColor: Colors.black,
                  onChanged: (selectedValue) {
                    print('Selected: $selectedValue');
                  },
                ),
                CustomSizedBoxHeight(height: 24),
                CustomText(
                    textName: "Skin Problem",
                    textColor: AppColors.blackColor,
                    fontWeightType: FontWeightType.medium,
                    fontFamily: FontFamily.poppins,
                    fontSize: 14),
                CustomSizedBoxHeight(height: 19),
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
                CustomSizedBoxHeight(height: 58),
                AppButton(
                  height: 44,
                  onTap: () {
                    // Get.to(OtpVerificationScreen());
                  },
                  hasShadow: true,
                  label: "Submit",
                ),
                CustomSizedBoxHeight(height: 30),
              ],
            ),
          ),
        ));
  }
}
