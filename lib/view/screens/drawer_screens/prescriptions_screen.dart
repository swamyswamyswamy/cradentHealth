import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_launch_url.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionsScreen extends StatefulWidget {
  PrescriptionsScreen({super.key});

  @override
  State<PrescriptionsScreen> createState() => _PrescriptionsScreenState();
}

class _PrescriptionsScreenState extends State<PrescriptionsScreen> {
  final _doctorsController = Get.find<DoctorsController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // _diagnosticsController.fetchDiagnosticHistory();
      _doctorsController.fetchDoctorsPrescriptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _doctorsController.fetchDoctorsPrescriptions();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor,
          title: "Prescriptions",
        ),
        backgroundColor: AppColors.whiteColor,
        body: Obx(() {
          return _doctorsController.isLoadingDoctorsBookingHistory.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    CustomSizedBoxHeight(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _doctorsController
                            .prescriptionDoctorsResponseModel
                            .value
                            .appointments!
                            .length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(20),
                                right: getProportionateScreenWidth(16),
                                left: getProportionateScreenWidth(16)),
                            child: InkWell(
                              onTap: () {
                                // print(
                                //     "pdf urllls ${_doctorsController.prescriptionDoctorsResponseModel.value.appointments![index].prescriptionPdfUrl!}");
                                AppLaunchUrl.launchWebUrl(AppBaseUrls.baseUrl
                                        .substring(
                                            0, AppBaseUrls.baseUrl.length - 1) +
                                    _doctorsController
                                        .prescriptionDoctorsResponseModel
                                        .value
                                        .appointments![index]
                                        .prescriptionPdfUrl!);
                              },
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
                                    Row(
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(90),
                                          width:
                                              getProportionateScreenWidth(90),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor)),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                getProportionateScreenHeight(
                                                    5)),
                                            child: Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      90),
                                              width:
                                                  getProportionateScreenWidth(
                                                      90),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(AppBaseUrls
                                                              .baseUrl
                                                              .substring(
                                                                  0,
                                                                  AppBaseUrls
                                                                          .baseUrl
                                                                          .length -
                                                                      1) +
                                                          _doctorsController
                                                              .prescriptionDoctorsResponseModel
                                                              .value
                                                              .appointments![
                                                                  index]
                                                              .doctor!
                                                              .image!))),
                                            ),
                                          ),
                                        ),
                                        CustomSizedBoxWidth(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      "${_doctorsController.prescriptionDoctorsResponseModel.value.appointments![index].doctor!.name!} ",
                                                  style: GoogleFonts.poppins(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "( ${_doctorsController.prescriptionDoctorsResponseModel.value.appointments![index].doctor!.qualification!} )",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: AppColors
                                                                  .blackColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              CustomText(
                                                  textName: _doctorsController
                                                      .prescriptionDoctorsResponseModel
                                                      .value
                                                      .appointments![index]
                                                      .doctor!
                                                      .specialization!,
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.regular,
                                                  fontFamily:
                                                      FontFamily.poppins,
                                                  fontSize: 16),
                                              CustomSizedBoxHeight(height: 4),
                                              CustomText(
                                                  textName:
                                                      "₹ ${_doctorsController.prescriptionDoctorsResponseModel.value.appointments![index].doctor!.consultationFee!}",
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.semiBold,
                                                  fontFamily:
                                                      FontFamily.poppins,
                                                  fontSize: 18),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomSizedBoxHeight(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
