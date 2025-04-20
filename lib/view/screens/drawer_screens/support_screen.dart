import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/services/support_service.dart';
import 'package:cradenthealth/view/screens/drawer_screens/add_support.dart';
import 'package:cradenthealth/view_model/api_controllers/profile_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/support_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SupportListScreen extends StatefulWidget {
  SupportListScreen({super.key});

  @override
  State<SupportListScreen> createState() => _SupportListScreenState();
}

class _SupportListScreenState extends State<SupportListScreen> {
  final _supportController = Get.put(SupportController(SupportService()));
  final _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    _supportController.fetchSupport();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          _supportController.fetchSupport();
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            // elevation: 10,
            title: CustomText(
              textName: "Support",
              textColor: AppColors.blackColor,
              fontWeightType: FontWeightType.medium,
              fontFamily: FontFamily.montserrat,
              fontSize: 14,
            ),
            actions: [
              // AppButton(
              //   onTap: () {
              //     print(
              //       "printkdfkjfkfkfkfkfkdl${_profileController.userProfileResponse.value.userProfile!.phone}",
              //     );
              //     AppComponents().supportWhatsApp(
              //       phoneNumber:
              //           '+91${_profileController.userProfileResponse.value.userProfile!.whatsapp}',
              //       passMessage:
              //           "Hi i'm ${_profileController.userProfileResponse.value.userProfile!.name}",
              //     );
              //   },
              //   borderRadius: 6,
              //   backgroundColor: AppColors.greyColor2,
              //   child: Padding(
              //     padding: EdgeInsets.all(getProportionateScreenHeight(6)),
              //     child: Row(
              //       children: [
              //         Icon(LineIcons.whatSApp, color: AppColors.greencolor1),
              //         CustomText(
              //           textName: "Contact",
              //           textColor: AppColors.greencolor1,
              //           fontWeightType: FontWeightType.medium,
              //           fontFamily: FontFamily.poppins,
              //           fontSize: 14,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              CustomSizedBoxWidth(width: 16),
            ],
          ),
          body: Obx(() {
            // Use a null-aware operator or check if allLeads is null
            final supportData =
                _supportController.supportsApiResponse.value.issues;
            return _supportController.isLoading.value
                ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16),
                    ),
                    child: Column(
                      children: [
                        CustomSizedBoxHeight(height: 20),
                        ListView.builder(
                          itemCount: supportData!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            DateTime dateTime = DateTime.parse(
                              supportData![index].createdAt!,
                            );
                            DateTime replydateTime = DateTime.parse(
                              supportData![index].updatedAt!,
                            );

                            // Formatting the date
                            String formattedDate = DateFormat(
                              'EEEE, dd MMM yyyy',
                            ).format(dateTime);
                            // Formatting the date
                            String replyformattedDate = DateFormat(
                              'EEEE, dd MMM yyyy',
                            ).format(replydateTime);

                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(13),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(15),
                                  horizontal: getProportionateScreenWidth(15),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.greyColor1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 90,
                                      color: AppColors.greyColor1.withOpacity(
                                        0.3,
                                      ),
                                      child: Image.network(
                                        AppBaseUrls.baseUrl +
                                            supportData![index].file!,
                                      ),
                                    ),
                                    CustomSizedBoxHeight(height: 15),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomText(
                                          textName: "Issue:",
                                          fontSize: 12,
                                          fontFamily: FontFamily.montserrat,
                                          fontWeightType: FontWeightType.medium,
                                          textColor: AppColors.blackColor,
                                        ),
                                        CustomSizedBoxWidth(width: 10),
                                        Expanded(
                                          child: CustomText(
                                            textName: supportData![index].reason!,
                                            fontSize: 12,
                                            fontFamily: FontFamily.montserrat,
                                            fontWeightType:
                                                FontWeightType.regular,
                                            textColor: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomSizedBoxHeight(height: 4),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomText(
                                          textName: "Description:",
                                          fontSize: 12,
                                          fontFamily: FontFamily.montserrat,
                                          fontWeightType: FontWeightType.medium,
                                          textColor: AppColors.blackColor,
                                        ),
                                        CustomSizedBoxWidth(width: 10),
                                        Expanded(
                                          child: CustomText(
                                            textName:
                                                supportData![index].description!,
                                            fontSize: 12,
                                            fontFamily: FontFamily.montserrat,
                                            fontWeightType:
                                                FontWeightType.regular,
                                            textColor: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomSizedBoxHeight(height: 15),
                                    const Divider(
                                      color: AppColors.greyColor1,
                                      height: 0,
                                    ),
                                    CustomSizedBoxHeight(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            textName:
                                                "Status: ${supportData![index].status}",
                                            fontSize: 12,
                                            fontFamily: FontFamily.montserrat,
                                            fontWeightType:
                                                FontWeightType.semiBold,
                                            textColor: AppColors.blackColor,
                                          ),
                                        ),
                                        AppButton(
                                          borderRadius: 8,
                                          backgroundColor: AppColors.whiteColor,
                                          borderColor: AppColors.greyColor1,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  getProportionateScreenWidth(
                                                    10,
                                                  ),
                                              vertical:
                                                  getProportionateScreenHeight(
                                                    5,
                                                  ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.date_range,
                                                  color: AppColors.blackColor,
                                                  size: 20,
                                                ),
                                                CustomSizedBoxWidth(width: 10),
                                                CustomText(
                                                  textName: formattedDate,
                                                  textColor:
                                                      AppColors.blackColor,
                                                  fontWeightType:
                                                      FontWeightType.medium,
                                                  fontFamily:
                                                      FontFamily.montserrat,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    supportData![index].reason == ""
                                        ? SizedBox()
                                        : Column(
                                          children: [
                                            CustomSizedBoxHeight(height: 10),

                                            const Divider(
                                              color: AppColors.greyColor1,
                                              height: 0,
                                            ),
                                            CustomSizedBoxHeight(height: 15),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                  textName: "Reply:",
                                                  fontSize: 12,
                                                  fontFamily:
                                                      FontFamily.montserrat,
                                                  fontWeightType:
                                                      FontWeightType.medium,
                                                  textColor:
                                                      AppColors.blackColor,
                                                ),
                                                CustomSizedBoxWidth(width: 10),
                                                Expanded(
                                                  child: CustomText(
                                                    textName:
                                                        supportData![index]
                                                            .reason!,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        FontFamily.montserrat,
                                                    fontWeightType:
                                                        FontWeightType.regular,
                                                    textColor:
                                                        AppColors.blackColor,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            CustomSizedBoxHeight(height: 4),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                  textName: "Date:",
                                                  fontSize: 12,
                                                  fontFamily:
                                                      FontFamily.montserrat,
                                                  fontWeightType:
                                                      FontWeightType.medium,
                                                  textColor:
                                                      AppColors.blackColor,
                                                ),
                                                CustomSizedBoxWidth(width: 10),
                                                Expanded(
                                                  child: CustomText(
                                                    textName:
                                                        replyformattedDate,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        FontFamily.montserrat,
                                                    fontWeightType:
                                                        FontWeightType.regular,
                                                    textColor:
                                                        AppColors.blackColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                    CustomSizedBoxHeight(height: 8),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
          }),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onTap: () {
                    // Get.snackbar('Logout', 'your successfully logged out',
                    //     colorText: AppColors.whiteColor,
                    //     // backgroundGradient: AppColors().appGradient,
                    //     snackPosition: SnackPosition.TOP);
                    Get.to(AddSupport());
                  },
                  // height: 50,
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: 12,

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16),
                      vertical: getProportionateScreenHeight(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                          size: 25,
                        ),
                        CustomSizedBoxWidth(width: 9),
                        const CustomText(
                          textName: "Raise a ticket",
                          fontSize: 16,
                          fontFamily: FontFamily.poppins,
                          fontWeightType: FontWeightType.medium,
                          textColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}