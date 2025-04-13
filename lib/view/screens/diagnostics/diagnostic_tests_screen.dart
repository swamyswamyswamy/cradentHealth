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
import 'package:cradenthealth/view/screens/pharmacy/screens/pharmacy_payment_screen.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DiagnosticTestsScreen extends StatefulWidget {
  String diagnosticId;
  DiagnosticTestsScreen({super.key, required this.diagnosticId});

  @override
  State<DiagnosticTestsScreen> createState() => _DiagnosticTestsScreenState();
}

class _DiagnosticTestsScreenState extends State<DiagnosticTestsScreen> {
  final _diagnosticsController = Get.find<DiagnosticsController>();
  @override
  void initState() {
    super.initState();
    _diagnosticsController.fetchDiagnosticsTests(
        diagnosticId: widget.diagnosticId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor, title: "Vijaya Diagnostics"),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(98),
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
                                                          FontWeightType
                                                              .semiBold,
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
                                                AppButton(
                                                  onTap: () {
                                                    Get.to(
                                                        PharmacyPaymentScreen(
                                                      entryFrom: "Diagnostics",
                                                    ));
                                                  },
                                                  borderRadius: 5,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            getProportionateScreenHeight(
                                                                4),
                                                        horizontal:
                                                            getProportionateScreenWidth(
                                                                21)),
                                                    child: CustomText(
                                                        textName: "ADD",
                                                        textColor: AppColors
                                                            .whiteColor,
                                                        fontWeightType:
                                                            FontWeightType
                                                                .semiBold,
                                                        fontFamily:
                                                            FontFamily.inter,
                                                        fontSize: 10),
                                                  ),
                                                ),
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
      }),
    );
  }
}
