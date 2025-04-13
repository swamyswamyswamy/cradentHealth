import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/categories_screens.dart';
import 'package:cradenthealth/view/screens/diagnostics/diagnosticslist_screen.dart';
import 'package:cradenthealth/view/screens/drawer_screens/wallet_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/screens/steps/steps_semi_progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 2,
                    spreadRadius: 0,
                    color: AppColors.blackColor.withOpacity(0.25))
              ]),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(28),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              textName: "Good Morning",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.montserrat,
                              fontSize: 20),
                          CustomSizedBoxHeight(height: 2),
                          CustomText(
                              textName: "Varma",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.montserrat,
                              fontSize: 16),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(WalletScreen());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                          ),
                          CustomSizedBoxWidth(width: 7),
                          CustomText(
                              textName: "10,000",
                              textColor: AppColors.blackColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 13),
                        ],
                      ),
                    ),
                    CustomSizedBoxWidth(width: 20),
                    AppButton(
                      height: 42,
                      width: 42,
                      backgroundColor: AppColors.secondaryColor,
                      borderRadius: 3,
                      child: Center(
                        child: Icon(
                          Icons.notifications_on_outlined,
                          size: 24,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomSizedBoxHeight(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBoxHeight(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16)),
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(13),
                              bottom: getProportionateScreenHeight(28),
                              left: getProportionateScreenWidth(15),
                              right: getProportionateScreenWidth(15)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color:
                                        AppColors.blackColor.withOpacity(0.25))
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      textName: "Today",
                                      textColor: AppColors.blackColor,
                                      fontWeightType: FontWeightType.medium,
                                      fontFamily: FontFamily.montserrat,
                                      fontSize: 14),
                                  CustomSizedBoxWidth(width: 5),
                                  Icon(
                                    Icons.expand_more,
                                    color: AppColors.blackColor,
                                  ),
                                  Spacer(),
                                  CustomText(
                                      textName: "View Details >",
                                      textColor: AppColors.blackColor,
                                      fontWeightType: FontWeightType.medium,
                                      fontFamily: FontFamily.montserrat,
                                      fontSize: 9),
                                ],
                              ),
                              CustomSizedBoxHeight(height: 18),
                              SemiCircularProgressIndicator(
                                progress: 0.75, // 75% progress
                                stepCount: 23166,
                                // Steps count),)
                              ),
                              CustomSizedBoxHeight(height: 28)
                            ],
                          )),
                    ),
                    CustomSizedBoxHeight(height: 22),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16)),
                      child: CustomText(
                          textName: "Categories",
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.semiBold,
                          fontFamily: FontFamily.montserrat,
                          fontSize: 16),
                    ),
                    CustomSizedBoxHeight(height: 16),
                    IntrinsicHeight(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: 43,
                                    left: getProportionateScreenWidth(
                                        index != 0 ? 0 : 16),
                                    bottom: getProportionateScreenHeight(10),
                                    top: getProportionateScreenHeight(10)),
                                child: InkWell(
                                  onTap: () {
                                    index == 0
                                        ? Get.to(DiagnosticslistScreen(
                                           
                                          ))
                                        : index == 1
                                            ? Get.to(DiagnosticslistScreen(
                                            
                                              ))
                                            : Get.to(CategoriesScreens());
                                  },
                                  child: Container(
                                    width: getProportionateScreenWidth(81),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              color: AppColors.blackColor
                                                  .withOpacity(0.25))
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenWidth(10),
                                          vertical:
                                              getProportionateScreenHeight(8)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          index == 2
                                              ? SizedBox()
                                              : Image.asset(
                                                  index == 0
                                                      ? AppImages
                                                          .diagnosticsImage
                                                      : AppImages.pharmacyImage,
                                                  height:
                                                      getProportionateScreenHeight(
                                                          60),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          60),
                                                ),
                                          index == 2
                                              ? SizedBox()
                                              : CustomSizedBoxHeight(height: 8),
                                          index == 2
                                              ? CustomText(
                                                  textName: "View\nMore >>",
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.semiBold,
                                                  fontFamily:
                                                      FontFamily.montserrat,
                                                  fontSize: 10)
                                              : CustomText(
                                                  textName: index == 0
                                                      ? "Diagnostics"
                                                      : "Pharmacy",
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.medium,
                                                  fontFamily:
                                                      FontFamily.montserrat,
                                                  fontSize: 8),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          )),
                    ),
                    CustomSizedBoxHeight(height: 41),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              textName: "Recent lookups",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.semiBold,
                              fontFamily: FontFamily.montserrat,
                              fontSize: 16),
                          CustomSizedBoxHeight(height: 16),
                          // RecentLookupsWidget(
                          //   entryFrom: "",
                          // ),
                          CustomSizedBoxHeight(height: 16),
                          CustomText(
                              textName: "Blogs",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.semiBold,
                              fontFamily: FontFamily.montserrat,
                              fontSize: 16),
                          CustomSizedBoxHeight(height: 16),
                          BlogsWidget(),
                          CustomSizedBoxHeight(height: 20),
                        ],
                      ),
                    ),
                    CustomSizedBoxHeight(height: 20)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
