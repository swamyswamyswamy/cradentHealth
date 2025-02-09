import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final _bookingsController = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            Stack(
              children: [
                AppButton(
                  height: 70,
                  width: 70,
                  borderColor: AppColors.blackColor.withOpacity(0.1),
                  backgroundColor: AppColors.whiteColor,
                  borderRadius: 18,
                  child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(4)),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg"))),
                      )),
                ),
                Positioned(
                  bottom: -5,
                  right: -15,
                  child: Container(
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.whiteColor),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                      child: Container(
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenWidth(30),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.blueColor),
                        child: Center(
                            child: Icon(
                          Icons.edit,
                          color: AppColors.whiteColor,
                          size: 15,
                        )),
                      ),
                    ),
                  ),
                )
              ],
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
            ),
            CustomSizedBoxHeight(height: 8),
            CustomText(
                textName: "Narasimha varma",
                textColor: AppColors.blackColor,
                fontWeightType: FontWeightType.medium,
                fontFamily: FontFamily.inter,
                fontSize: 16),
            CustomSizedBoxHeight(height: 6),
            CustomText(
                textName: "Narasimhavarma123@gmail.com",
                textColor: AppColors.blackColor.withOpacity(0.6),
                fontWeightType: FontWeightType.regular,
                fontFamily: FontFamily.inter,
                fontSize: 12),
            CustomSizedBoxHeight(height: 6),
            CustomText(
                textName: "9898989898",
                textColor: AppColors.blackColor.withOpacity(0.6),
                fontWeightType: FontWeightType.regular,
                fontFamily: FontFamily.inter,
                fontSize: 12),
            CustomSizedBoxHeight(height: 9),
            Container(
              color: AppColors.secondaryColor,
              height: getProportionateScreenHeight(3),
            ),
            CustomSizedBoxHeight(height: 34),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenWidth(28)),
                    child: Row(
                      children: [
                        AppButton(
                          height: 42,
                          width: 42,
                          backgroundColor: AppColors.secondaryColor,
                          borderRadius: 3,
                          child: Center(
                            child: Image.asset(
                              AppImages.forgotImage,
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(30),
                            ),
                          ),
                        ),
                        CustomSizedBoxWidth(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      textName: index == 0
                                          ? "Wallet"
                                          : index == 1
                                              ? "Bookings"
                                              : index == 2
                                                  ? "Prescription"
                                                  : index == 3
                                                      ? "Family Members"
                                                      : "Settings",
                                      textColor: AppColors.blackColor,
                                      fontWeightType: FontWeightType.medium,
                                      fontFamily: FontFamily.inter,
                                      fontSize: 14),
                                  Spacer(),
                                  Icon(Icons.navigate_next)
                                ],
                              ),
                              CustomSizedBoxHeight(height: 13),
                              Divider(
                                color: AppColors.blackColor.withOpacity(0.2),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
