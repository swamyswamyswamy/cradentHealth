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
import 'package:cradenthealth/view/screens/diagnostics/diagnostic_tests_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DoctorsListScreen extends StatefulWidget {
  DoctorsListScreen({
    super.key,
  });

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final _doctorsController = Get.find<DoctorsController>();
  @override
  void initState() {
    super.initState();
    _doctorsController.fetctDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor, title: "Diagnostics"),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        return _doctorsController.isLoading.value
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
                  // CustomDropdown(
                  //   dropdownItems: [
                  //     'Narasimha',
                  //   ],
                  //   getItemName: (item) => item, // Simply returns the item itself
                  //   getItemId: (item) => item, // ID same as the item in this case
                  //   initialValue: 'Narasimha', // Optional initial value
                  //   hintName: 'Narasimha',

                  //   textColor: Colors.black,
                  //   onChanged: (selectedValue) {
                  //     print('Selected: $selectedValue');
                  //   },
                  // ),
                  // CustomSizedBoxHeight(height: 26),
                  ListView.builder(
                    itemCount: _doctorsController.doctorModel.value.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(12)),
                          child: InkWell(
                              onTap: () {
                                // Get.to(DiagnosticTestsScreen(
                                //   diagnosticId: _diagnosticsController
                                //       .diagnosticResponse
                                //       .value
                                //       .diagnostics![index]
                                //       .id!,
                                // ));
                              },
                              child: AppButton(
                                backgroundColor: AppColors.secondaryColor,
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
                                              getProportionateScreenHeight(81),
                                          width:
                                              getProportionateScreenWidth(81),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      diagnosticModel.image!))),
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
                                                            diagnosticModel
                                                                .name!,
                                                        textColor: AppColors
                                                            .blackColor,
                                                        fontWeightType:
                                                            FontWeightType
                                                                .semiBold,
                                                        fontFamily:
                                                            FontFamily.poppins,
                                                        fontSize: 16),
                                                  ),
                                                  CustomText(
                                                      textName: "₹ 1500",
                                                      textColor:
                                                          AppColors.redColor,
                                                      fontWeightType:
                                                          FontWeightType
                                                              .semiBold,
                                                      fontFamily:
                                                          FontFamily.inter,
                                                      fontSize: 13),
                                                ],
                                              ),
                                              CustomSizedBoxHeight(height: 4),
                                              CustomText(
                                                  textName:
                                                      diagnosticModel.name!,
                                                  textColor:
                                                      AppColors.greyColor2,
                                                  fontWeightType:
                                                      FontWeightType.medium,
                                                  fontFamily:
                                                      FontFamily.poppins,
                                                  fontSize: 12),
                                              // CustomSizedBoxHeight(height: 4),
                                              // CustomText(
                                              //     textName: "Neurology (from Greek: νεῦρον (neûron),",
                                              //     textColor: AppColors.blackColor,
                                              //     fontWeightType: FontWeightType.regular,
                                              //     fontFamily: FontFamily.poppins,
                                              //     fontSize: 8),
                                              CustomSizedBoxHeight(height: 4),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: AppColors.redColor,
                                                  ),
                                                  CustomSizedBoxWidth(width: 5),
                                                  Expanded(
                                                    child: CustomText(
                                                        textName:
                                                            diagnosticModel
                                                                .address!,
                                                        textColor: AppColors
                                                            .blackColor,
                                                        fontWeightType:
                                                            FontWeightType
                                                                .regular,
                                                        fontFamily:
                                                            FontFamily.poppins,
                                                        fontSize: 9),
                                                  ),
                                                  Image.asset(
                                                    AppImages.directionImage,
                                                    height:
                                                        getProportionateScreenHeight(
                                                            20),
                                                    width:
                                                        getProportionateScreenWidth(
                                                            20),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )));
                    },
                  )
                ]),
              ));
      }),
    );
  }
}
