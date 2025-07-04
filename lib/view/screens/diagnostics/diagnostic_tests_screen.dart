import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/diagnostics/widgets/packages_diagnostic_widget.dart';
import 'package:cradenthealth/view/screens/diagnostics/widgets/tests_diagnostic_widget.dart';
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

class DiagnosticTestsScreen extends StatefulWidget {
  String diagnosticId;
  String diagnoticName;
  DiagnosticTestsScreen(
      {super.key, required this.diagnosticId, required this.diagnoticName});

  @override
  State<DiagnosticTestsScreen> createState() => _DiagnosticTestsScreenState();
}

class _DiagnosticTestsScreenState extends State<DiagnosticTestsScreen> {
  final _diagnosticsController = Get.find<DiagnosticsController>();
  final _familyController = Get.find<FamilyController>();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _diagnosticsController.diagnosticTestType.value = "tests";
      _diagnosticsController.fetchDiagnosticsTests(
          diagnosticId: widget.diagnosticId);
      _diagnosticsController.selectedDiagnosticTests.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor, title: widget.diagnoticName),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          CustomSizedBoxHeight(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: AppButton(
                      backgroundColor:
                          _diagnosticsController.diagnosticTestType.value ==
                                  "tests"
                              ? AppColors.primaryColor
                              : AppColors.greyColor.withOpacity(0.3),
                      onTap: () {
                        _diagnosticsController.selectedDiagnosticTests.clear();

                        _diagnosticsController.diagnosticTestType.value =
                            "tests";
                      },
                      height: 45,
                      child: Center(
                        child: CustomText(
                            textName: "Tests",
                            textColor: _diagnosticsController
                                        .diagnosticTestType.value ==
                                    "tests"
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                            fontWeightType: FontWeightType.medium,
                            fontFamily: FontFamily.inter,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      backgroundColor:
                          _diagnosticsController.diagnosticTestType.value !=
                                  "tests"
                              ? AppColors.primaryColor
                              : AppColors.greyColor.withOpacity(0.3),
                      onTap: () {
                        _diagnosticsController.selectedDiagnosticTests.clear();

                        _diagnosticsController.diagnosticTestType.value =
                            "packages";
                      },
                      height: 45,
                      child: Center(
                        child: CustomText(
                            textName: "Packages",
                            textColor: _diagnosticsController
                                        .diagnosticTestType.value !=
                                    "tests"
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                            fontWeightType: FontWeightType.medium,
                            fontFamily: FontFamily.inter,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: getProportionateScreenWidth(16)),
          //   child: CustomDropdown(
          //     dropdownItems: ["tests", "packages"],
          //     getItemName: (item) => item, // Simply returns the item itself
          //     getItemId: (item) => item, // ID same as the item in this case
          //     initialValue: 'tests', // Optional initial value
          //     hintName: 'Select tests',

          //     textColor: Colors.black,
          //     onChanged: (selectedValue) {
          //       _diagnosticsController.selectedDiagnosticTests.clear();

          //       _diagnosticsController.diagnosticTestType.value =
          //           selectedValue!;

          //       // _familyController.selectedPatientName.value =
          //       //     selectedValue!.fullName!;
          //       // _familyController.selectedPatientAge.value = selectedValue!.age!;
          //       // _familyController.selectedPatientGender.value =
          //       //     selectedValue!.gender!;

          //       // print('Selected: ${_familyController.selectedPatientName.value}');
          //     },
          //   ),
          // ),
          CustomSizedBoxHeight(height: 20),
          Obx(() {
            return _diagnosticsController.diagnosticTestType.value == "tests"
                ? TestsDiagnosticWidget()
                : PackagesDiagnosticWidget();
          })
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        return _diagnosticsController.selectedDiagnosticTests.isEmpty
            ? SizedBox()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                  height: 72,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            color: AppColors.blackColor.withOpacity(0.25))
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSizedBoxHeight(height: 7),
                                CustomText(
                                    textName: widget.diagnoticName,
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.regular,
                                    fontFamily: FontFamily.inter,
                                    fontSize: 14),
                                CustomSizedBoxHeight(height: 5),
                                CustomText(
                                    textName: _diagnosticsController
                                        .selectedDiagnosticTests
                                        .map((e) => e.testName!)
                                        .join(', '),
                                    textColor:
                                        AppColors.blackColor.withOpacity(0.7),
                                    fontWeightType: FontWeightType.regular,
                                    fontFamily: FontFamily.inter,
                                    fontSize: 10),
                                Row(
                                  children: [
                                    CustomText(
                                        textName: "Actual Price ",
                                        textColor: AppColors.blackColor
                                            .withOpacity(0.7),
                                        fontWeightType: FontWeightType.regular,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 10),
                                    CustomText(
                                        textName:
                                            "₹${_diagnosticsController.selectedDiagnosticTests.fold(0, (sum, item) => sum + int.parse(item.price!)).toString()}  ",
                                        textColor: AppColors.blackColor
                                            .withOpacity(0.7),
                                        fontWeightType: FontWeightType.medium,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 10),
                                    CustomText(
                                        textName: "Discount Price ",
                                        textColor: AppColors.blackColor,
                                        fontWeightType: FontWeightType.regular,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 10),
                                    CustomText(
                                        textName:
                                            "₹${_diagnosticsController.selectedDiagnosticTests.fold(0, (sum, item) => sum + int.parse(item.offerPrice!)).toString()}",
                                        textColor: AppColors.blackColor,
                                        fontWeightType: FontWeightType.medium,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 10),
                                  ],
                                )
                              ],
                            ),
                          ),
                          AppButton(
                            onTap: () {
                              Get.to(DiagnosticPaymentScreen(
                                diagnoticName: widget.diagnoticName,
                              ));
                              _diagnosticsController.fetchDiagnosticsCheckout(
                                  diagnosticId: widget.diagnosticId,
                                  patient_name: _familyController
                                      .selectedPatientAge.value,
                                  gender: _familyController
                                      .selectedPatientGender.value,
                                  age: _familyController
                                      .selectedPatientAge.value,
                                  packageId: _diagnosticsController
                                              .diagnosticTestType.value ==
                                          "tests"
                                      ? ""
                                      : _diagnosticsController
                                          .selectedDiagnosticTests
                                          .map((e) => e.id)
                                          .toList()[0]
                                          .toString(),
                                  tests: _diagnosticsController
                                              .diagnosticTestType.value !=
                                          "tests"
                                      ? []
                                      : _diagnosticsController
                                          .selectedDiagnosticTests
                                          .map((e) => e.id)
                                          .toList());

                              // _diagnosticsController.addDiagnosticTest(
                              //     diagnosticTestsList[index]);
                            },
                            borderRadius: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(14),
                                  horizontal: getProportionateScreenWidth(16)),
                              child: CustomText(
                                  textName:
                                      "₹ ${_diagnosticsController.selectedDiagnosticTests.fold(0, (sum, item) => sum + int.parse(item.offerPrice!)).toString()}  Next ",
                                  textColor: AppColors.whiteColor,
                                  fontWeightType: FontWeightType.semiBold,
                                  fontFamily: FontFamily.inter,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              );
      }),
    );
  }
}
