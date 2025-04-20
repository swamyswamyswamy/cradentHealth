import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/models/doctors/doctor_model.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
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
                          textName:
                              _doctorsController.selectedAvailableDate.value ==
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
                                      image: NetworkImage(
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
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: getProportionateScreenWidth(8)),
                              child: AppButton(
                                onTap: () {
                                  _doctorsController
                                      .updateSelectedAvailableDate(index);
                                },
                                width: 53,
                                backgroundColor: _doctorsController
                                            .selectedAvailableDate.value ==
                                        index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                borderColor: AppColors.primaryColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        textName: "Sun",
                                        textColor: _doctorsController
                                                    .selectedAvailableDate
                                                    .value ==
                                                index
                                            ? AppColors.whiteColor
                                            : AppColors.primaryColor,
                                        fontWeightType: FontWeightType.medium,
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 14),
                                    CustomSizedBoxHeight(height: 10),
                                    CustomText(
                                        textName: "1",
                                        textColor: _doctorsController
                                                    .selectedAvailableDate
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
                        child: _doctorsController.selectedtimeSlot.value == 100
                            ? SizedBox()
                            : ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        right: getProportionateScreenWidth(16)),
                                    child: InkWell(
                                      onTap: () {
                                        _doctorsController
                                            .updateSelectedtimeSlot(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: _doctorsController
                                                        .selectedtimeSlot
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
                                                textName: "11:00 am",
                                                textColor: _doctorsController
                                                            .selectedtimeSlot
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
                    AppButton(
                      height: 44,
                      onTap: () {
                        _doctorsController.bookDoctorAppointment(
                            diagnosticId: widget.doctorDetails.id!,
                            patientName: "dfdf",
                            patientRelation: "fdfd",
                            appointmentDate: _doctorsController
                                .selectedAvailableDate
                                .toString(),
                            appointmentTime:
                                _doctorsController.selectedtimeSlot.toString());
                        // Get.to(HomeScreen());
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
