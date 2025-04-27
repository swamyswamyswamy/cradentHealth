import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/models/familyMember_model.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/diagnostics/diagnostic_tests_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/family_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DiagnosticslistScreen extends StatefulWidget {
  DiagnosticslistScreen({
    super.key,
  });

  @override
  State<DiagnosticslistScreen> createState() => _DiagnosticslistScreenState();
}

class _DiagnosticslistScreenState extends State<DiagnosticslistScreen> {
  final _diagnosticsController = Get.find<DiagnosticsController>();
  final _familyController = Get.find<FamilyController>();
  @override
  void initState() {
    super.initState();
    _diagnosticsController.fetchDiagnostics();
    _familyController.fetchFamilyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor, title: "Diagnostics"),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        return _diagnosticsController.isLoading.value
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
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.location_on_outlined,
                  //       color: AppColors.redColor,
                  //     ),
                  //     CustomSizedBoxWidth(width: 5),
                  //     Expanded(
                  //       child: CustomText(
                  //           textName:
                  //               "Kukatpally, Hyderabad, Housing board colony.....",
                  //           textColor: AppColors.blackColor,
                  //           fontWeightType: FontWeightType.regular,
                  //           fontFamily: FontFamily.poppins,
                  //           fontSize: 13),
                  //     ),
                  //   ],
                  // ),
                  // CustomSizedBoxHeight(height: 16),
                  CustomDropdown<FamilyMember>(
                    dropdownItems: _familyController
                        .familyResponseModel.value.familyMembers!,
                    getItemName: (item) =>
                        item.fullName!, // Simply returns the item itself
                    getItemId: (item) =>
                        item.id!, // ID same as the item in this case
                    // initialValue: 'Narasimha', // Optional initial value
                    hintName: 'Select family member',

                    textColor: Colors.black,
                    onChanged: (selectedValue) {
                      _familyController.selectedPatientName.value =
                          selectedValue!.fullName!;
                      _familyController.selectedPatientAge.value =
                          selectedValue!.age!;
                      _familyController.selectedPatientGender.value =
                          selectedValue!.gender!;

                      print(
                          'Selected: ${_familyController.selectedPatientName.value}');
                    },
                  ),
                  CustomSizedBoxHeight(height: 26),
                  ListView.builder(
                    itemCount: _diagnosticsController
                        .diagnosticResponse.value.diagnostics!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(12)),
                          child: InkWell(
                              onTap: () {
                                Get.to(DiagnosticTestsScreen(
                                  diagnoticName: _diagnosticsController
                                      .diagnosticResponse
                                      .value
                                      .diagnostics![index]
                                      .name!,
                                  diagnosticId: _diagnosticsController
                                      .diagnosticResponse
                                      .value
                                      .diagnostics![index]
                                      .id!,
                                ));
                              },
                              child: DoctorProfileDetailsWidget(
                                
                                diagnosticModel: _diagnosticsController
                                    .diagnosticResponse
                                    .value
                                    .diagnostics![index],
                              )));
                    },
                  )
                ]),
              ));
      }),
    );
  }
}
