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

class BookingsScreen extends StatelessWidget {
  BookingsScreen({super.key});
  final _bookingsController = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        return _bookingsController.selectedBookingTab.value == 100
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  children: [
                    AppButton(
                      height: 32,
                      borderRadius: 30,
                      borderColor: AppColors.blackColor.withOpacity(0.1),
                      backgroundColor: AppColors.whiteColor,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return AppButton(
                            onTap: () {
                              _bookingsController
                                  .updateselectedBookingTab(index);
                            },
                            backgroundColor:
                                _bookingsController.selectedBookingTab.value ==
                                        index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                            borderRadius: 30,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(54)),
                                child: CustomText(
                                    textName: index == 0
                                        ? "Present"
                                        : index == 1
                                            ? "Completed"
                                            : "Cancelled",
                                    textColor: _bookingsController
                                                .selectedBookingTab.value ==
                                            index
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                    fontWeightType: FontWeightType.semiBold,
                                    fontFamily: FontFamily.poppins,
                                    fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    CustomSizedBoxHeight(height: 24),
                    CustomDropdown(
                      dropdownItems: [
                        'Doctor Consultation',
                      ],
                      getItemName: (item) =>
                          item, // Simply returns the item itself
                      getItemId: (item) =>
                          item, // ID same as the item in this case
                      initialValue:
                          'Doctor Consultation', // Optional initial value
                      hintName: 'Doctor Consultation',

                      textColor: Colors.black,
                      onChanged: (selectedValue) {
                        print('Selected: $selectedValue');
                      },
                    ),
                    CustomSizedBoxHeight(height: 26),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(20)),
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
                                        color: AppColors.blackColor
                                            .withOpacity(0.25)),
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
                                          fontWeightType:
                                              FontWeightType.regular,
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
                                          fontWeightType:
                                              FontWeightType.regular,
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
                                          fontWeightType:
                                              FontWeightType.regular,
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
                                          fontWeightType:
                                              FontWeightType.regular,
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
                                          fontWeightType:
                                              FontWeightType.regular,
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
                                          fontWeightType:
                                              FontWeightType.regular,
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
                ),
              );
      }),
    );
  }
}
