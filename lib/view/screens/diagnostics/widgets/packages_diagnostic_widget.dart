import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
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

class PackagesDiagnosticWidget extends StatefulWidget {
  const PackagesDiagnosticWidget({super.key});

  @override
  State<PackagesDiagnosticWidget> createState() =>
      _PackagesDiagnosticWidgetState();
}

class _PackagesDiagnosticWidgetState extends State<PackagesDiagnosticWidget> {
  final _diagnosticsController = Get.find<DiagnosticsController>();
  final _familyController = Get.find<FamilyController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<PackageModel> diagnosticTestsList =
          _diagnosticsController.isLoadingDiagnosticTests.value
              ? []
              : _diagnosticsController.diagnosticTestResponse.value.packages!;
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
                            hasShadow: true,
                            backgroundColor: AppColors.whiteColor,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  getProportionateScreenHeight(9)),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   height: getProportionateScreenHeight(98),
                                    //   width: getProportionateScreenWidth(133),
                                    //   decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       image: DecorationImage(
                                    //           fit: BoxFit.cover,
                                    //           image: NetworkImage(
                                    //               diagnosticTestsList[index]
                                    //                   .image!))),
                                    // ),
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
                                                            .packageName!,
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
                                                      .tests![0]
                                                      .testName!,
                                              textColor: AppColors.blackColor,
                                              fontWeightType:
                                                  FontWeightType.regular,
                                              fontFamily: FontFamily.inter,
                                              fontSize: 10),
                                          CustomSizedBoxHeight(height: 4),
                                          Wrap(
                                            spacing:
                                                8, // horizontal space between test names
                                            runSpacing:
                                                4, // vertical space between lines
                                            children: diagnosticTestsList[index]
                                                .tests!
                                                .map((test) {
                                              return CustomText(
                                                textName: test.testName ?? "",
                                                textColor: AppColors.blackColor,
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontFamily: FontFamily.inter,
                                                fontSize: 10,
                                              );
                                            }).toList(),
                                          ),
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
                                                            TestModel.fromJson({
                                                      "price":
                                                          diagnosticTestsList[
                                                                  index]
                                                              .price,
                                                      "_id":
                                                          diagnosticTestsList[
                                                                  index]
                                                              .id,
                                                      "offerPrice":
                                                          diagnosticTestsList[
                                                                  index]
                                                              .offerPrice,
                                                      "test_name":
                                                          diagnosticTestsList[
                                                                  index]
                                                              .packageName
                                                    }));

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
                                                          ? AppColors
                                                              .primaryColor
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
                          // Divider(
                          //   color: AppColors.blackColor.withOpacity(0.3),
                          //   height: 0,
                          // )
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
