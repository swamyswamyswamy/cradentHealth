import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/doctor_screens/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecentLookupsWidget extends StatelessWidget {
  const RecentLookupsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(12)),
          child: AppButton(
            backgroundColor: AppColors.secondaryColor,
            onTap: () {
              Get.to(DoctorDetailsScreen());
            },
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(9)),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(81),
                      width: getProportionateScreenWidth(81),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL0qLy1fo2Uvhti1TexQM137vp8pwBiwmgaIqvDA3q5W_C2XspyH-3ZspOY2BZdFqGCdI&usqp=CAU"))),
                    ),
                    CustomSizedBoxWidth(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                    textName: "Dr. Vineeth",
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.semiBold,
                                    fontFamily: FontFamily.poppins,
                                    fontSize: 16),
                              ),
                              CustomText(
                                  textName: "₹ 1500",
                                  textColor: AppColors.redColor,
                                  fontWeightType: FontWeightType.semiBold,
                                  fontFamily: FontFamily.inter,
                                  fontSize: 13),
                            ],
                          ),
                          CustomSizedBoxHeight(height: 4),
                          CustomText(
                              textName: "Cardiology",
                              textColor: AppColors.greyColor2,
                              fontWeightType: FontWeightType.medium,
                              fontFamily: FontFamily.poppins,
                              fontSize: 12),
                          CustomSizedBoxHeight(height: 4),
                          CustomText(
                              textName:
                                  "Neurology (from Greek: νεῦρον (neûron),",
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 8),
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
                                        "Kukatpally, Hyderabad......5Km away",
                                    textColor: AppColors.blackColor,
                                    fontWeightType: FontWeightType.regular,
                                    fontFamily: FontFamily.poppins,
                                    fontSize: 9),
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
          ),
        );
      },
    );
  }
}
