import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_widget.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookingsScreen extends StatelessWidget {
  bool navigateBack;
  BookingsScreen({super.key, this.navigateBack = true});
  final _bookingsController = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(   isBackButtonVisible:navigateBack ,
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
                  Expanded(child: BookingsWidget()),
                ],
              );
      }),
    );
  }
}
