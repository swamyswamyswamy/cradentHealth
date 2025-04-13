import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/auth/login_screen.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/drawer_screens/family_members/add_family_members.dart';
import 'package:cradenthealth/view/screens/drawer_screens/family_members/family_list.dart';
import 'package:cradenthealth/view/screens/drawer_screens/prescriptions_screen.dart';
import 'package:cradenthealth/view/screens/drawer_screens/profile_screen.dart';
import 'package:cradenthealth/view/screens/drawer_screens/wallet_screen.dart';
import 'package:cradenthealth/view/screens/pharmacy/screens/pharmacy_screens.dart';
import 'package:cradenthealth/view_model/api_controllers/profile_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  bool navigateBack;
  DrawerScreen({super.key, this.navigateBack = true});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final _profileController = Get.find<ProfileController>();
  @override
  void initState() {
    super.initState();
    _profileController.fetctProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          isBackButtonVisible: widget.navigateBack,
          backgroundColor: AppColors.whiteColor,
          title: "Menu",
        ),
        backgroundColor: AppColors.whiteColor,
        body: Obx(() {
          return _profileController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomSizedBoxHeight(height: 30),
                      InkWell(
                        onTap: () {
                          Get.to(Get.to(ProfileScreen()));
                        },
                        child: Stack(
                          children: [
                            AppButton(
                              height: 70,
                              width: 70,
                              borderColor:
                                  AppColors.blackColor.withOpacity(0.1),
                              backgroundColor: AppColors.whiteColor,
                              borderRadius: 18,
                              child: Padding(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenHeight(4)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: _profileController
                                                        .profileModelResponse
                                                        .value
                                                        .staff!
                                                        .profileImage ==
                                                    null
                                                ? NetworkImage("")
                                                : NetworkImage(
                                                    _profileController
                                                        .profileModelResponse
                                                        .value
                                                        .staff!
                                                        .profileImage!))),
                                  )),
                            ),
                            // Positioned(
                            //   bottom: -5,
                            //   right: -15,
                            //   child: Container(
                            //     height: getProportionateScreenHeight(30),
                            //     width: getProportionateScreenWidth(30),
                            //     decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: AppColors.whiteColor),
                            //     child: Padding(
                            //       padding: EdgeInsets.all(
                            //           getProportionateScreenHeight(2)),
                            //       child: Container(
                            //         height: getProportionateScreenHeight(30),
                            //         width: getProportionateScreenWidth(30),
                            //         decoration: BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             color: AppColors.blueColor),
                            //         child: Center(
                            //             child: Icon(
                            //           Icons.edit,
                            //           color: AppColors.whiteColor,
                            //           size: 15,
                            //         )),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                          alignment: Alignment.bottomRight,
                          clipBehavior: Clip.none,
                        ),
                      ),
                      CustomSizedBoxHeight(height: 8),
                      CustomText(
                          textName: _profileController
                              .profileModelResponse.value.staff!.name!,
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.medium,
                          fontFamily: FontFamily.inter,
                          fontSize: 16),
                      CustomSizedBoxHeight(height: 6),
                      CustomText(
                          textName: _profileController
                              .profileModelResponse.value.staff!.email!,
                          textColor: AppColors.blackColor.withOpacity(0.6),
                          fontWeightType: FontWeightType.regular,
                          fontFamily: FontFamily.inter,
                          fontSize: 12),
                      CustomSizedBoxHeight(height: 6),
                      CustomText(
                          textName: _profileController
                              .profileModelResponse.value.staff!.contactNumber!,
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
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenWidth(28)),
                              child: InkWell(
                                onTap: () {
                                  index == 0
                                      ? Get.to(WalletScreen())
                                      : index == 1
                                          ? Get.to(BookingsScreen())
                                          : index == 2
                                              ? Get.to(PrescriptionsScreen())
                                              : index == 3
                                                  ? Get.to(FamilyList())
                                                  : Get.to(
                                                      PrescriptionsScreen());
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppButton(
                                      height: 42,
                                      width: 42,
                                      backgroundColor: AppColors.secondaryColor,
                                      borderRadius: 3,
                                      child: Center(
                                        child: Icon(
                                          index == 0
                                              ? Icons.account_balance_wallet
                                              : index == 1
                                                  ? Icons.book_online
                                                  : index == 2
                                                      ? Icons.medical_services
                                                      : index == 3
                                                          ? Icons
                                                              .family_restroom
                                                          : Icons.settings,
                                          size: 24,
                                          color: index == 0
                                              ? AppColors.primaryColor
                                              : index == 1
                                                  ? AppColors.pinkColor
                                                  : index == 2
                                                      ? AppColors.redColor
                                                      : index == 3
                                                          ? AppColors
                                                              .primaryColor
                                                          : AppColors
                                                              .blackColor,
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
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.medium,
                                                  fontFamily: FontFamily.inter,
                                                  fontSize: 14),
                                              Spacer(),
                                              Icon(Icons.navigate_next)
                                            ],
                                          ),
                                          CustomSizedBoxHeight(height: 13),
                                          Divider(
                                            color: AppColors.blackColor
                                                .withOpacity(0.2),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      CustomSizedBoxHeight(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenHeight(16)),
                        child: AppButton(
                          height: 44,
                          backgroundColor: AppColors.redColor,
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          hasShadow: true,
                          label: "Logout",
                        ),
                      ),
                      CustomSizedBoxHeight(height: 40),
                    ],
                  ),
                );
        }));
  }
}
