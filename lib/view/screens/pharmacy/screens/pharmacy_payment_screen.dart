import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/doctor_screens/appointment_bottom_sheet.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:cradenthealth/view/widgets/person_profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PharmacyPaymentScreen extends StatelessWidget {
  String entryFrom;
  PharmacyPaymentScreen({super.key, required this.entryFrom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor,
          title: entryFrom == "Pharmacy"
              ? "Apollo Pharmacy"
              : "Vijaya Diagnostics",
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 18),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: DoctorProfileDetailsWidget(
                  entryFrom: "Pharmacy",
                ),
              ),
              CustomSizedBoxHeight(height: 24),
              Divider(
                color: AppColors.blackColor.withOpacity(0.2),
                height: 0,
              ),
              CustomSizedBoxHeight(height: 22),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: AppButton(
                  backgroundColor: AppColors.secondaryColor,
                  borderRadius: 5,
                  child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                      child: PersonProfileDetailsWidget()),
                ),
              ),
              CustomSizedBoxHeight(height: 45),
              ListView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(16)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        textName: "Blood Test",
                                        textColor: AppColors.blackColor,
                                        fontWeightType: FontWeightType.medium,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 16),
                                    CustomText(
                                        textName: "₹ 1495",
                                        textColor: AppColors.blackColor,
                                        fontWeightType: FontWeightType.regular,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 13),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.delete_outlined,
                                color: AppColors.redColor,
                              )
                            ],
                          ),
                        ),
                        CustomSizedBoxHeight(height: 16),
                        Divider(
                          color: AppColors.blackColor.withOpacity(0.2),
                          height: 16,
                        )
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBoxHeight(height: 22),
                    AppButton(
                      borderRadius: 10,
                      borderColor: AppColors.blackColor,
                      backgroundColor: AppColors.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(8),
                            horizontal: getProportionateScreenWidth(14)),
                        child: Row(
                          children: [
                            Icon(Icons.discount,
                                size: 30, color: AppColors.blackColor),
                            Spacer(),
                            Icon(
                              Icons.navigate_next,
                              color: AppColors.blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    CustomSizedBoxHeight(height: 22),
                    CustomText(
                        textName: "Bill Details",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.inter,
                        fontSize: 16),
                    CustomSizedBoxHeight(height: 26),
                    Row(
                      children: [
                        CustomText(
                            textName: "Service Total",
                            textColor: AppColors.blackColor,
                            fontWeightType: FontWeightType.regular,
                            fontFamily: FontFamily.inter,
                            fontSize: 14),
                        Spacer(),
                        CustomText(
                            textName: "₹ 1500",
                            textColor: AppColors.blackColor,
                            fontWeightType: FontWeightType.medium,
                            fontFamily: FontFamily.inter,
                            fontSize: 14),
                      ],
                    ),
                    CustomSizedBoxHeight(height: 21),
                    Row(
                      children: [
                        CustomText(
                            textName: "Coupon Discount",
                            textColor: AppColors.blackColor,
                            fontWeightType: FontWeightType.regular,
                            fontFamily: FontFamily.inter,
                            fontSize: 14),
                        Spacer(),
                        CustomText(
                            textName: "-₹ 250",
                            textColor: AppColors.blackColor,
                            fontWeightType: FontWeightType.medium,
                            fontFamily: FontFamily.inter,
                            fontSize: 14),
                      ],
                    ),
                    CustomSizedBoxHeight(height: 21),
                    Row(
                      children: [
                        CustomText(
                            textName: "Gst",
                            textColor: AppColors.blackColor,
                            fontWeightType: FontWeightType.regular,
                            fontFamily: FontFamily.inter,
                            fontSize: 14),
                        Spacer(),
                        CustomText(
                            textName: "₹ 2",
                            textColor: AppColors.blackColor,
                            fontWeightType: FontWeightType.medium,
                            fontFamily: FontFamily.inter,
                            fontSize: 14),
                      ],
                    ),
                  ],
                ),
              ),
              CustomSizedBoxHeight(height: 12),
              Divider(
                color: AppColors.blackColor.withOpacity(0.1),
                height: 0,
              ),
              CustomSizedBoxHeight(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Row(
                  children: [
                    CustomText(
                        textName: "Subtotal",
                        textColor: AppColors.primaryColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.inter,
                        fontSize: 14),
                    Spacer(),
                    CustomText(
                        textName: "₹ 1500",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.inter,
                        fontSize: 14),
                  ],
                ),
              ),
              CustomSizedBoxHeight(height: 18),
              Divider(
                color: AppColors.blackColor.withOpacity(0.1),
                height: 0,
              ),
              CustomSizedBoxHeight(height: 44),
              CustomSizedBoxHeight(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: AppButton(
                  height: 44,
                  onTap: () {
                    // showModalBottomSheet(
                    //     context: context,
                    //     isScrollControlled: true,
                    //     builder: (BuildContext) {
                    //       return AppointmentBottomSheet();
                    //     });
                    // Get.to(HomeScreen());
                  },
                  hasShadow: true,
                  label: "Proceed",
                ),
              ),
              CustomSizedBoxHeight(height: 30)
            ],
          ),
        ));
  }
}
