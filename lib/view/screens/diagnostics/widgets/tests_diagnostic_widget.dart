import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/screens/diagnostics/diagnostic_payment_screen.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/family_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class TestsDiagnosticWidget extends StatefulWidget {
  const TestsDiagnosticWidget({super.key});

  @override
  State<TestsDiagnosticWidget> createState() => _TestsDiagnosticWidgetState();
}

class _TestsDiagnosticWidgetState extends State<TestsDiagnosticWidget> {
  final _diagnosticsController = Get.find<DiagnosticsController>();
  final _familyController = Get.find<FamilyController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final diagnosticTestsList =
          _diagnosticsController.isLoadingDiagnosticTests.value
              ? []
              : _diagnosticsController.diagnosticTestResponse.value.tests!;
      return _diagnosticsController.isLoadingDiagnosticTests.value
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : SingleChildScrollView(
              child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Column(children: [
                CustomSizedBoxHeight(height: 24),
                ListView.builder(
                  itemCount: diagnosticTestsList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(22)),
                      child: Column(
                        children: [
                          AppButton(
                            backgroundColor: AppColors.whiteColor,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  getProportionateScreenHeight(9)),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: getProportionateScreenHeight(98),
                                      width: getProportionateScreenWidth(133),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  diagnosticTestsList[index]
                                                      .image!))),
                                    ),
                                    CustomSizedBoxWidth(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                    textName:
                                                        diagnosticTestsList[
                                                                index]
                                                            .testName!,
                                                    textColor:
                                                        AppColors.blackColor,
                                                    fontWeightType:
                                                        FontWeightType.semiBold,
                                                    fontFamily:
                                                        FontFamily.poppins,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          CustomSizedBoxHeight(height: 8),
                                          CustomText(
                                              textName:
                                                  diagnosticTestsList[index]
                                                      .description!,
                                              textColor: AppColors.blackColor,
                                              fontWeightType:
                                                  FontWeightType.regular,
                                              fontFamily: FontFamily.inter,
                                              fontSize: 10),
                                          CustomSizedBoxHeight(height: 4),
                                          Row(
                                            children: [
                                              CustomText(
                                                  textName:
                                                      "₹ ${diagnosticTestsList[index].price!}",
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.regular,
                                                  fontFamily:
                                                      FontFamily.poppins,
                                                  fontSize: 18),
                                              Spacer(),
                                              Obx(() {
                                                return AppButton(
                                                  onTap: () {
                                                    _diagnosticsController
                                                        .addDiagnosticTest(
                                                            diagnosticTestsList[
                                                                index]);
                                                    // Get.to(
                                                    //     DiagnosticPaymentScreen(
                                                    //   entryFrom: "Diagnostics",
                                                    // ));
                                                  },
                                                  borderRadius: 5,
                                                  backgroundColor:
                                                      (_diagnosticsController
                                                              .selectedDiagnosticTests
                                                              .any((e) =>
                                                                  e.id ==
                                                                  diagnosticTestsList[
                                                                          index]
                                                                      .id))
                                                          ? AppColors.redColor
                                                          : AppColors
                                                              .primaryColor,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            getProportionateScreenHeight(
                                                                4),
                                                        horizontal:
                                                            getProportionateScreenWidth(
                                                                21)),
                                                    child: CustomText(
                                                        textName: (_diagnosticsController
                                                                .selectedDiagnosticTests
                                                                .any((e) =>
                                                                    e.id ==
                                                                    diagnosticTestsList[
                                                                            index]
                                                                        .id))
                                                            ? "Remove"
                                                            : "ADD",
                                                        textColor: AppColors
                                                            .whiteColor,
                                                        fontWeightType:
                                                            FontWeightType
                                                                .semiBold,
                                                        fontFamily:
                                                            FontFamily.inter,
                                                        fontSize: 10),
                                                  ),
                                                );
                                              }),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomSizedBoxHeight(height: 20),
                          Divider(
                            color: AppColors.blackColor.withOpacity(0.3),
                            height: 0,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ]),
            ));
    });
  }
}
