import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/doctor_screens/appointment_bottom_sheet.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:cradenthealth/view/widgets/person_profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PharmacyPaymentScreen extends StatelessWidget {
  const PharmacyPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          title: CustomText(
              textName: "Book A Consultation",
              textColor: AppColors.blackColor,
              fontWeightType: FontWeightType.semiBold,
              fontFamily: FontFamily.montserrat,
              fontSize: 18),
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 18),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: DoctorProfileDetailsWidget(),
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
              CustomSizedBoxHeight(height: 22),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: AppButton(
                  height: 44,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext) {
                          return AppointmentBottomSheet();
                        });
                    // Get.to(HomeScreen());
                  },
                  hasShadow: true,
                  label: "Book Now",
                ),
              ),
            ],
          ),
        ));
  }
}
