import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/view/screens/doctor_screens/appointment_bottom_sheet.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:cradenthealth/view/widgets/person_profile_details_widget.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DiagnosticPaymentScreen extends StatefulWidget {
  String diagnoticName;
  DiagnosticPaymentScreen({super.key, required this.diagnoticName});

  @override
  State<DiagnosticPaymentScreen> createState() =>
      _DiagnosticPaymentScreenState();
}

class _DiagnosticPaymentScreenState extends State<DiagnosticPaymentScreen> {
  final _diagnosticsController = Get.find<DiagnosticsController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor,
          title: widget.diagnoticName,
        ),
        backgroundColor: AppColors.whiteColor,
        body: Obx(() {
          return _diagnosticsController.isLoadingDiagnosticCheckout.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomSizedBoxHeight(height: 18),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: getProportionateScreenWidth(16)),
                      //   child: DoctorProfileDetailsWidget(
                      //     diagnosticModel: DiagnosticModel.fromJson({
                      //       "name": diagnosticCheckoutResponse.name!,
                      //       "image":
                      //           "https://www.bing.com/th/id/OLC.4XjYeFcKcCsYqQ480x360?w=278&h=200&c=8&rs=1&qlt=80&p=0&cdv=1&pid=Local",
                      //       "address":
                      //           "Near I.s. Sadan, Saidabad, Saroornagar, Telangana 500059, India, Hyderabad, Hyderabad 500059",
                      //     }),
                      //     // entryFrom: "Pharmacy",
                      //   ),
                      // ),
                      CustomSizedBoxHeight(height: 24),
                      Divider(
                        color: AppColors.blackColor.withOpacity(0.2),
                        height: 0,
                      ),
                      CustomSizedBoxHeight(height: 22),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(16)),
                        child: AppButton(
                          backgroundColor: AppColors.secondaryColor,
                          borderRadius: 5,
                          child: Padding(
                              padding: EdgeInsets.all(
                                  getProportionateScreenHeight(10)),
                              child: PersonProfileDetailsWidget(
                                name: _diagnosticsController
                                    .diagnosticCheckoutResponse
                                    .value!
                                    .booking!
                                    .patientName!,
                                age: _diagnosticsController
                                    .diagnosticCheckoutResponse
                                    .value!
                                    .booking!
                                    .age!,
                                gender: _diagnosticsController
                                    .diagnosticCheckoutResponse
                                    .value!
                                    .booking!
                                    .gender!,
                                imageUrl: _diagnosticsController
                                    .diagnosticCheckoutResponse
                                    .value!
                                    .booking!
                                    .diagnosticImage!,
                              )),
                        ),
                      ),
                      CustomSizedBoxHeight(height: 45),
                      ListView.builder(
                        itemCount: _diagnosticsController
                            .diagnosticCheckoutResponse
                            .value!
                            .booking!
                            .tests!
                            .length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(16)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(16)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                textName: _diagnosticsController
                                                    .diagnosticCheckoutResponse
                                                    .value!
                                                    .booking!
                                                    .tests![index]
                                                    .testName!,
                                                textColor: AppColors.blackColor,
                                                fontWeightType:
                                                    FontWeightType.medium,
                                                fontFamily: FontFamily.inter,
                                                fontSize: 16),
                                            CustomText(
                                                textName:
                                                    "₹ ${_diagnosticsController.diagnosticCheckoutResponse.value!.booking!.tests![index].offerPrice!}",
                                                textColor: AppColors.blackColor,
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontFamily: FontFamily.inter,
                                                fontSize: 13),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print(
                                              'Test with IDgfgfgf removed successfully.${_diagnosticsController.diagnosticCheckoutResponse.value!.booking!.tests![index].id!}');
                                          _diagnosticsController.deleteTests(
                                              testId: _diagnosticsController
                                                  .diagnosticCheckoutResponse
                                                  .value!
                                                  .booking!
                                                  .tests![index]
                                                  .id!,
                                              bookingId: _diagnosticsController
                                                  .diagnosticCheckoutResponse
                                                  .value!
                                                  .bookingId!);
                                        },
                                        child: Icon(
                                          Icons.delete_outlined,
                                          color: AppColors.redColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                CustomSizedBoxHeight(height: 16),
                                Divider(
                                  color: AppColors.blackColor.withOpacity(0.2),
                                  height: 16,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CustomSizedBoxHeight(height: 22),
                            // AppButton(
                            //   borderRadius: 10,
                            //   borderColor: AppColors.blackColor,
                            //   backgroundColor: AppColors.whiteColor,
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         vertical: getProportionateScreenHeight(8),
                            //         horizontal:
                            //             getProportionateScreenWidth(14)),
                            //     child: Row(
                            //       children: [
                            //         Icon(Icons.discount,
                            //             size: 30, color: AppColors.blackColor),
                            //         Spacer(),
                            //         Icon(
                            //           Icons.navigate_next,
                            //           color: AppColors.blackColor,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            CustomSizedBoxHeight(height: 22),
                            CustomText(
                                textName: "Bill Details",
                                textColor: AppColors.blackColor,
                                fontWeightType: FontWeightType.medium,
                                fontFamily: FontFamily.inter,
                                fontSize: 16),
                            CustomSizedBoxHeight(height: 26),
                            Row(
                              children: [
                                CustomText(
                                    textName: "Service Total",
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.regular,
                                    fontFamily: FontFamily.inter,
                                    fontSize: 14),
                                Spacer(),
                                CustomText(
                                    textName:
                                        "₹ ${_diagnosticsController.diagnosticCheckoutResponse.value!.booking!.total}",
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.medium,
                                    fontFamily: FontFamily.inter,
                                    fontSize: 14),
                              ],
                            ),
                            // CustomSizedBoxHeight(height: 21),
                            // Row(
                            //   children: [
                            //     CustomText(
                            //         textName: "Coupon Discount",
                            //         textColor: AppColors.blackColor,
                            //         fontWeightType: FontWeightType.regular,
                            //         fontFamily: FontFamily.inter,
                            //         fontSize: 14),
                            //     Spacer(),
                            //     CustomText(
                            //         textName: "-₹ 250",
                            //         textColor: AppColors.blackColor,
                            //         fontWeightType: FontWeightType.medium,
                            //         fontFamily: FontFamily.inter,
                            //         fontSize: 14),
                            //   ],
                            // ),
                            CustomSizedBoxHeight(height: 21),
                            Row(
                              children: [
                                CustomText(
                                    textName: "Gst",
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.regular,
                                    fontFamily: FontFamily.inter,
                                    fontSize: 14),
                                Spacer(),
                                CustomText(
                                    textName:
                                        "₹ ${_diagnosticsController.diagnosticCheckoutResponse.value!.booking!.gstOnTests}",
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.medium,
                                    fontFamily: FontFamily.inter,
                                    fontSize: 14),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomSizedBoxHeight(height: 12),
                      Divider(
                        color: AppColors.blackColor.withOpacity(0.1),
                        height: 0,
                      ),
                      CustomSizedBoxHeight(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(16)),
                        child: Row(
                          children: [
                            CustomText(
                                textName: "Subtotal",
                                textColor: AppColors.primaryColor,
                                fontWeightType: FontWeightType.semiBold,
                                fontFamily: FontFamily.inter,
                                fontSize: 14),
                            Spacer(),
                            CustomText(
                                textName:
                                    "₹ ${_diagnosticsController.diagnosticCheckoutResponse.value!.booking!.subtotal}",
                                textColor: AppColors.blackColor,
                                fontWeightType: FontWeightType.medium,
                                fontFamily: FontFamily.inter,
                                fontSize: 14),
                          ],
                        ),
                      ),
                      CustomSizedBoxHeight(height: 18),
                      Divider(
                        color: AppColors.blackColor.withOpacity(0.1),
                        height: 0,
                      ),
                      CustomSizedBoxHeight(height: 44),
                      CustomSizedBoxHeight(height: 15),

                      Obx(() {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: AppButton(
                            width: double.infinity,
                            height: 44,
                            onTap: () {
                              if (_diagnosticsController
                                  .isLoadingDiagnosticBooking.value) {
                                return null;
                              } else {
                                _diagnosticsController.paymentDiagnosticsTests(
                                    bookingId: _diagnosticsController
                                        .diagnosticCheckoutResponse
                                        .value!
                                        .bookingId!);
                              }

                              // Get.to(DashBoardScreen());
                            },
                            hasShadow: true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _diagnosticsController
                                        .isLoadingDiagnosticBooking.value
                                    ? Container(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: AppColors.whiteColor,
                                        ),
                                      )
                                    : SizedBox(),
                                _diagnosticsController
                                        .isLoadingDiagnosticBooking.value
                                    ? CustomSizedBoxWidth(width: 20)
                                    : SizedBox(),
                                CustomText(
                                  textName: _diagnosticsController
                                          .isLoadingDiagnosticBooking.value
                                      ? "isLoading....."
                                      : "Proceed",
                                  fontSize: _diagnosticsController
                                          .isLoadingDiagnosticBooking.value
                                      ? 16
                                      : 18,
                                  // textAlign: TextAlign.center,
                                  fontFamily: FontFamily.poppins,
                                  fontWeightType: _diagnosticsController
                                          .isLoadingDiagnosticBooking.value
                                      ? FontWeightType.regular
                                      : FontWeightType.semiBold,
                                  textColor: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      CustomSizedBoxHeight(height: 30)
                    ],
                  ),
                );
        }));
  }
}
