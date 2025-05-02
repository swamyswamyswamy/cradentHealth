import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/models/doctors/doctor_model.dart';
import 'package:cradenthealth/view/screens/doctor_screens/doctor_payment_screen.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/family_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentBottomSheet extends StatefulWidget {
  DoctorModel doctorDetails;
  AppointmentBottomSheet({super.key, required this.doctorDetails});

  @override
  State<AppointmentBottomSheet> createState() => _AppointmentBottomSheetState();
}

class _AppointmentBottomSheetState extends State<AppointmentBottomSheet> {
  final _doctorsController = Get.find<DoctorsController>();
  final _familyController = Get.find<FamilyController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _doctorsController.selectedAvailableDate.value =
          widget.doctorDetails.schedule![0].date!;
      _doctorsController.selectedtimeSlot.value = widget
          .doctorDetails
          .schedule![_doctorsController.selectedAvailableDateIndex.value]
          .timeSlots![0]
          .time!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBoxHeight(height: 35),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                          textName: _doctorsController
                                      .selectedAvailableDateIndex.value ==
                                  100
                              ? ""
                              : "Book  your Appointment",
                          textColor: AppColors.primaryColor,
                          fontWeightType: FontWeightType.bold,
                          fontFamily: FontFamily.poppins,
                          fontSize: 20),
                    ),
                    CustomSizedBoxHeight(height: 18),
                    Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(90),
                          width: getProportionateScreenWidth(90),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: AppColors.primaryColor)),
                          child: Padding(
                            padding:
                                EdgeInsets.all(getProportionateScreenHeight(5)),
                            child: Container(
                              height: getProportionateScreenHeight(90),
                              width: getProportionateScreenWidth(90),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(AppBaseUrls.baseUrl
                                              .substring(
                                                  0,
                                                  AppBaseUrls.baseUrl.length -
                                                      1) +
                                          widget.doctorDetails.image!))),
                            ),
                          ),
                        ),
                        CustomSizedBoxWidth(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "${widget.doctorDetails.name!} ",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                  children: [
                                    TextSpan(
                                      text:
                                          "( ${widget.doctorDetails.qualification!} )",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.blackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              CustomText(
                                  textName:
                                      widget.doctorDetails.specialization!,
                                  textColor: AppColors.blackColor,
                                  fontWeightType: FontWeightType.regular,
                                  fontFamily: FontFamily.poppins,
                                  fontSize: 16),
                              CustomSizedBoxHeight(height: 4),
                              CustomText(
                                  textName:
                                      "₹ ${widget.doctorDetails.consultationFee!}",
                                  textColor: AppColors.blackColor,
                                  fontWeightType: FontWeightType.semiBold,
                                  fontFamily: FontFamily.poppins,
                                  fontSize: 18),
                            ],
                          ),
                        )
                      ],
                    ),
                    CustomSizedBoxHeight(height: 11),
                    Divider(
                      color: AppColors.blackColor.withOpacity(0.1),
                      height: 0,
                    ),
                    CustomSizedBoxHeight(height: 18),
                    CustomText(
                        textName: "Available Consultation",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.poppins,
                        fontSize: 18),
                    CustomSizedBoxHeight(height: 18),
                    AppButton(
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 12,
                      height: 60,
                      width: 60,
                      child: Center(
                        child: Image.asset(
                          AppImages.hospitalImage,
                          height: getProportionateScreenHeight(36),
                          width: getProportionateScreenWidth(36),
                        ),
                      ),
                    ),
                    CustomSizedBoxHeight(height: 22),
                    CustomText(
                        textName: "Available Dates",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.poppins,
                        fontSize: 18),
                    CustomSizedBoxHeight(height: 18),
                    Container(
                      height: 92,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                color: AppColors.blackColor.withOpacity(0.25))
                          ],
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(12)),
                        child: ListView.builder(
                          itemCount: widget.doctorDetails.schedule!.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: getProportionateScreenWidth(8)),
                              child: AppButton(
                                onTap: () {
                                  _doctorsController
                                      .selectedAvailableDateIndex.value = index;
                                  _doctorsController
                                          .selectedAvailableDate.value =
                                      widget
                                          .doctorDetails.schedule![index].date!;
                                },
                                width: 53,
                                backgroundColor: _doctorsController
                                            .selectedAvailableDateIndex.value ==
                                        index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                borderColor: AppColors.primaryColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        textName: (widget.doctorDetails
                                                .schedule![index].day!
                                                .substring(0, 3)
                                                .toLowerCase()[0]
                                                .toUpperCase() +
                                            widget.doctorDetails
                                                .schedule![index].day!
                                                .substring(1, 3)
                                                .toLowerCase()),
                                        textColor: _doctorsController
                                                    .selectedAvailableDateIndex
                                                    .value ==
                                                index
                                            ? AppColors.whiteColor
                                            : AppColors.primaryColor,
                                        fontWeightType: FontWeightType.medium,
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 14),
                                    CustomSizedBoxHeight(height: 10),
                                    CustomText(
                                        textName: widget.doctorDetails
                                            .schedule![index].date!
                                            .split("-")[1],
                                        textColor: _doctorsController
                                                    .selectedAvailableDateIndex
                                                    .value ==
                                                index
                                            ? AppColors.whiteColor
                                            : AppColors.primaryColor,
                                        fontWeightType: FontWeightType.medium,
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 14),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    CustomSizedBoxHeight(height: 20),
                    CustomText(
                        textName: "Available time slots",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.poppins,
                        fontSize: 18),
                    CustomSizedBoxHeight(height: 18),
                    Container(
                      height: 51,
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10)),
                        child: _doctorsController.selectedtimeSlotIndex.value ==
                                100
                            ? SizedBox()
                            : ListView.builder(
                                itemCount: widget
                                    .doctorDetails
                                    .schedule![_doctorsController
                                        .selectedAvailableDateIndex.value]
                                    .timeSlots!
                                    .length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        right: getProportionateScreenWidth(16)),
                                    child: InkWell(
                                      onTap: () {
                                        _doctorsController.selectedtimeSlotIndex
                                            .value = index;
                                        _doctorsController
                                                .selectedtimeSlot.value =
                                            widget
                                                .doctorDetails
                                                .schedule![_doctorsController
                                                    .selectedAvailableDateIndex
                                                    .value]
                                                .timeSlots![index]
                                                .time!;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: _doctorsController
                                                        .selectedtimeSlotIndex
                                                        .value ==
                                                    index
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 2),
                                                  blurRadius: 8,
                                                  spreadRadius: 0,
                                                  color: AppColors.blackColor
                                                      .withOpacity(0.15))
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  getProportionateScreenWidth(
                                                      5)),
                                          child: Center(
                                            child: CustomText(
                                                textName: widget
                                                    .doctorDetails
                                                    .schedule![_doctorsController
                                                        .selectedAvailableDateIndex
                                                        .value]
                                                    .timeSlots![index]
                                                    .time!,
                                                textColor: _doctorsController
                                                            .selectedtimeSlotIndex
                                                            .value ==
                                                        index
                                                    ? AppColors.whiteColor
                                                    : AppColors.primaryColor,
                                                fontWeightType:
                                                    FontWeightType.medium,
                                                fontFamily: FontFamily.poppins,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                    CustomSizedBoxHeight(height: 20),
                    // AppButton(
                    //   width: double.infinity,
                    //   height: 44,
                    //   onTap: () {
                    //     if (_doctorsController
                    //         .isLoadingBookDoctorAppointment.value) return null;
                    //     _doctorsController.bookDoctorAppointment(
                    //         diagnosticId: widget.doctorDetails.id!,
                    //         patientName:
                    //             _familyController.selectedPatientAge.value,
                    //         patientRelation:
                    //             _familyController.selectedPatientGender.value,
                    //         appointmentDate: _doctorsController
                    //             .selectedAvailableDateIndex
                    //             .toString(),
                    //         appointmentTime: _doctorsController
                    //             .selectedtimeSlotIndex
                    //             .toString());
                    //   },
                    //   hasShadow: true,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       !_doctorsController
                    //               .isLoadingBookDoctorAppointment.value
                    //           ? SizedBox()
                    //           : Container(
                    //               height: 20,
                    //               width: 20,
                    //               child: CircularProgressIndicator(
                    //                 color: AppColors.whiteColor,
                    //               ),
                    //             ),
                    //       !_doctorsController
                    //               .isLoadingBookDoctorAppointment.value
                    //           ? SizedBox()
                    //           : CustomSizedBoxWidth(width: 20),
                    //       CustomText(
                    //         textName: _doctorsController
                    //                 .isLoadingBookDoctorAppointment.value
                    //             ? "isLoading....."
                    //             : "Book Now",
                    //         fontSize: 16,
                    //         // textAlign: TextAlign.center,
                    //         fontFamily: FontFamily.robotoFlex,
                    //         fontWeightType: _doctorsController
                    //                 .isLoadingBookDoctorAppointment.value
                    //             ? FontWeightType.regular
                    //             : FontWeightType.semiBold,
                    //         textColor: AppColors.whiteColor,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    AppButton(
                      height: 44,
                      onTap: () {
                        _doctorsController.bookDoctorAppointment(
                            diagnosticId: widget.doctorDetails.id!,
                            patientName:
                                _familyController.selectedPatientAge.value,
                            patientRelation:
                                _familyController.selectedPatientGender.value,
                            appointmentDate: _doctorsController
                                .selectedAvailableDateIndex
                                .toString(),
                            appointmentTime: _doctorsController
                                .selectedtimeSlotIndex
                                .toString());
                        Get.to(DoctorPaymentScreen());
                      },
                      hasShadow: true,
                      label: "Book Now",
                    ),
                    CustomSizedBoxHeight(height: 20)
                  ],
                ),
              )
            ],
          );
        }));
  }
}
