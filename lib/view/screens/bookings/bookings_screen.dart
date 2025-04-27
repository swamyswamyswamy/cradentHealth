import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/booking_history_doctors_widget.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_history_diagnotic_widget.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookingsScreen extends StatefulWidget {
  bool navigateBack;
  BookingsScreen({super.key, this.navigateBack = true});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final _bookingsController = Get.put(BookingsController());
  final _doctorsController = Get.find<DoctorsController>();
  final _diagnosticsController = Get.find<DiagnosticsController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // _diagnosticsController.fetchDiagnosticHistory();
      _doctorsController.fetchDoctorsBookingHistory();
    });
  }

  String historyType = "Doctor Consultation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonVisible: widget.navigateBack,
        backgroundColor: AppColors.whiteColor,
        title: "My bookings",
      ),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        return _bookingsController.selectedBookingTab.value == 100
            ? SizedBox()
            : Column(
                children: [
                  CustomSizedBoxHeight(height: 21),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16)),
                    child: AppButton(
                      height: 32,
                      borderRadius: 30,
                      borderColor: AppColors.blackColor.withOpacity(0.1),
                      backgroundColor: AppColors.whiteColor,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return AppButton(
                            onTap: () {
                              _bookingsController
                                  .updateselectedBookingTab(index);
                            },
                            backgroundColor:
                                _bookingsController.selectedBookingTab.value ==
                                        index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                            borderRadius: 30,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(54)),
                                child: CustomText(
                                    textName: index == 0
                                        ? "Present"
                                        : index == 1
                                            ? "Completed"
                                            : "Cancelled",
                                    textColor: _bookingsController
                                                .selectedBookingTab.value ==
                                            index
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                    fontWeightType: FontWeightType.semiBold,
                                    fontFamily: FontFamily.poppins,
                                    fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  CustomSizedBoxHeight(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16)),
                    child: CustomDropdown(
                      dropdownItems: [
                        'Doctor Consultation',
                        'Diagnostic',
                      ],
                      getItemName: (item) =>
                          item, // Simply returns the item itself
                      getItemId: (item) =>
                          item, // ID same as the item in this case
                      initialValue:
                          'Doctor Consultation', // Optional initial value
                      hintName: 'Doctor Consultation',

                      textColor: Colors.black,
                      onChanged: (selectedValue) {
                        print('Selected: $selectedValue');
                        setState(() {
                          historyType = selectedValue!;
                          if (historyType == "Doctor Consultation") {
                            _doctorsController.fetchDoctorsBookingHistory();
                          } else {
                            _diagnosticsController.fetchDiagnosticHistory();
                          }
                        });
                      },
                    ),
                  ),
                  CustomSizedBoxHeight(height: 26),
                  Expanded(
                      child: historyType != "Doctor Consultation"
                          ? BookingsHistoryDiagnoticWidget()
                          : BookingHistoryDoctorsWidget()),
                ],
              );
      }),
    );
  }
}
