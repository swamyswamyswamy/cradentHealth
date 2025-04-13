import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_fitness_plans.dart';
import 'package:cradenthealth/view/screens/hra/hra_screen.dart';
import 'package:cradenthealth/view/screens/opticles/lenskart_specs_screen.dart';
import 'package:cradenthealth/view/screens/pharmacy/screens/pharmacy_payment_screen.dart';
import 'package:cradenthealth/view_model/api_controllers/wallet_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WalletScreen extends StatefulWidget {
  bool navigateBack;
  WalletScreen({super.key, this.navigateBack = true});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _walletController = Get.find<WalletController>();
  @override
  void initState() {
    super.initState();
    _walletController.fetcthWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonVisible: widget.navigateBack,
        backgroundColor: AppColors.whiteColor,
        title: "Wallet",
      ),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        final transactionHistory = _walletController.isLoading.value
            ? []
            : _walletController.walletResponse.value.transactionHistory;
        return _walletController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBoxHeight(height: 35),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(13)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.walletImage,
                                height: getProportionateScreenHeight(138),
                                width: getProportionateScreenWidth(214),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        textName:
                                            "₹${_walletController.walletResponse.value.walletBalance}",
                                        textColor: AppColors.primaryColor,
                                        fontWeightType: FontWeightType.bold,
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 20),
                                    // CustomText(
                                    //     textName: "No wallet amount available",
                                    //     textColor: AppColors.blackColor,
                                    //     fontWeightType: FontWeightType.regular,
                                    //     fontFamily: FontFamily.poppins,
                                    //     fontSize: 13),
                                    // CustomSizedBoxHeight(height: 4),
                                    // AppButton(
                                    //   height: 24,
                                    //   width: 88,
                                    //   borderRadius: 3,
                                    //   child: Center(
                                    //     child: CustomText(
                                    //         textName: "Add Amount",
                                    //         textColor: AppColors.whiteColor,
                                    //         fontWeightType:
                                    //             FontWeightType.regular,
                                    //         fontFamily: FontFamily.inter,
                                    //         fontSize: 10),
                                    //   ),
                                    // )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    CustomSizedBoxHeight(height: 22),
                    CustomText(
                        textName: "Details",
                        textColor: AppColors.primaryColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.poppins,
                        fontSize: 20),
                    CustomSizedBoxHeight(height: 15),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: transactionHistory!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // String formattedDate = formatDate(_walletController
                          //     .wallerResponse
                          //     .value
                          //     .userwallet[index]
                          //     .logCreatedDate!);
                          return Column(
                            children: [
                              InkWell(
                                // onTap: () {
                                //   Get.to(DriverViewDetails());
                                // },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        AppButton(
                                          height: 36,
                                          width: 36,
                                          borderRadius: 5,
                                          backgroundColor: AppColors.whiteColor,
                                          borderColor: AppColors.blackColor
                                              .withOpacity(0.1),
                                          child: Icon(
                                            Icons.north_east,
                                            color: transactionHistory[index]
                                                        .type ==
                                                    "debit"
                                                ? AppColors.redColor
                                                : AppColors.primaryColor,
                                          ),
                                        ),
                                        CustomSizedBoxHeight(height: 7),
                                        CustomText(
                                          textName:
                                              transactionHistory[index].timeAgo,
                                          textColor: AppColors.blackColor,
                                          fontWeightType:
                                              FontWeightType.regular,
                                          fontFamily: FontFamily.inter,
                                          fontSize: 8,
                                        ),
                                      ],
                                    ),
                                    CustomSizedBoxWidth(width: 21),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            textName: transactionHistory[index]
                                                .description,
                                            textColor: AppColors.blackColor,
                                            fontWeightType:
                                                FontWeightType.medium,
                                            fontFamily: FontFamily.inter,
                                            fontSize: 14,
                                          ),
                                          // CustomSizedBoxHeight(height: 2),
                                          // CustomText(
                                          //   textName: "referal id : #123456",
                                          //   // "Your way request to Downtown has been confirmed",
                                          //   textColor: AppColors.blackColor
                                          //       .withOpacity(0.8),
                                          //   fontWeightType:
                                          //       FontWeightType.regular,
                                          //   fontFamily: FontFamily.inter,
                                          //   fontSize: 11,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          textName:
                                              "₹${transactionHistory[index].amount}",
                                          textColor: AppColors.blackColor,
                                          fontWeightType: FontWeightType.medium,
                                          fontFamily: FontFamily.inter,
                                          fontSize: 14,
                                        ),
                                        CustomSizedBoxHeight(height: 2),
                                        CustomText(
                                          textName:
                                              transactionHistory[index].type,
                                          // "Your way request to Downtown has been confirmed",
                                          textColor: AppColors.blackColor
                                              .withOpacity(0.8),
                                          fontWeightType:
                                              FontWeightType.regular,
                                          fontFamily: FontFamily.inter,
                                          fontSize: 11,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              CustomSizedBoxHeight(height: 5),
                              Divider(
                                color: AppColors.greyColor, // Line color
                                thickness: 1, // Thicker line
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
