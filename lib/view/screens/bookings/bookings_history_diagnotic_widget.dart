import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookingsHistoryDiagnoticWidget extends StatelessWidget {
  BookingsHistoryDiagnoticWidget({super.key});
  final _diagnosticsController = Get.find<DiagnosticsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _diagnosticsController.isLoadingDiagnosticBookingHistory.value
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _diagnosticsController
                        .bookingsHistoryDiagnosticResponseModel
                        .value
                        .bookings!
                        .length,
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
                                    color:
                                        AppColors.blackColor.withOpacity(0.25)),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  textName: _diagnosticsController
                                      .bookingsHistoryDiagnosticResponseModel
                                      .value
                                      .bookings![index]
                                      .diagnosticName!,
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
                                      textName: _diagnosticsController
                                          .bookingsHistoryDiagnosticResponseModel
                                          .value
                                          .bookings![index]
                                          .patientName!,
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
                                      textName: _diagnosticsController
                                          .bookingsHistoryDiagnosticResponseModel
                                          .value
                                          .bookings![index]
                                          .patientAge!,
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
                                      textName: _diagnosticsController
                                          .bookingsHistoryDiagnosticResponseModel
                                          .value
                                          .bookings![index]
                                          .patientGender!,
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
                                      textName: _diagnosticsController
                                          .bookingsHistoryDiagnosticResponseModel
                                          .value
                                          .bookings![index]
                                          .patientName!,
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
                                      textName: _diagnosticsController
                                          .bookingsHistoryDiagnosticResponseModel
                                          .value
                                          .bookings![index]
                                          .patientName!,
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
    });
  }
}
