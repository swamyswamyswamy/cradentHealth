import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookingsWidget extends StatelessWidget {
  const BookingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSizedBoxHeight(height: 24),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: CustomDropdown(
            dropdownItems: [
              'Doctor Consultation',
            ],
            getItemName: (item) => item, // Simply returns the item itself
            getItemId: (item) => item, // ID same as the item in this case
            initialValue: 'Doctor Consultation', // Optional initial value
            hintName: 'Doctor Consultation',

            textColor: Colors.black,
            onChanged: (selectedValue) {
              print('Selected: $selectedValue');
            },
          ),
        ),
        CustomSizedBoxHeight(height: 26),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(20),
                    right: getProportionateScreenWidth(16),
                    left: getProportionateScreenWidth(16)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12),
                      vertical: getProportionateScreenHeight(10)),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: AppColors.blackColor.withOpacity(0.25)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          textName: "Dr. naveen",
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.semiBold,
                          fontFamily: FontFamily.poppins,
                          fontSize: 18),
                      Row(
                        children: [
                          CustomText(
                              textName: "Name : ",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.poppins,
                              fontSize: 16),
                          CustomText(
                              textName: "Narasimha",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                        ],
                      ),
                      CustomSizedBoxHeight(height: 2),
                      Row(
                        children: [
                          CustomText(
                              textName: "Age : ",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.poppins,
                              fontSize: 16),
                          CustomText(
                              textName: "20",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                          CustomSizedBoxWidth(width: 42),
                          CustomText(
                              textName: "Gender : ",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.poppins,
                              fontSize: 16),
                          CustomText(
                              textName: "Male",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                        ],
                      ),
                      CustomSizedBoxHeight(height: 2),
                      Row(
                        children: [
                          CustomText(
                              textName: "Visit : ",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.poppins,
                              fontSize: 16),
                          CustomText(
                              textName: "Direct",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                          Spacer(),
                          Icon(
                            Icons.date_range,
                            color: AppColors.pinkColor,
                          ),
                          CustomSizedBoxWidth(width: 6),
                          CustomText(
                              textName: "10-8-23",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                          CustomSizedBoxWidth(width: 12),
                          Icon(
                            Icons.schedule,
                            color: AppColors.pinkColor,
                          ),
                          CustomSizedBoxWidth(width: 6),
                          CustomText(
                              textName: "11:30 PM",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
