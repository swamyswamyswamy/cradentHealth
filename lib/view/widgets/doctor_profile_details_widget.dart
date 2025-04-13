import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/view/screens/doctor_screens/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoctorProfileDetailsWidget extends StatelessWidget {
  // String entryFrom;
  DiagnosticModel diagnosticModel;
  DoctorProfileDetailsWidget({super.key, required this.diagnosticModel});
  // DoctorProfileDetailsWidget({super.key, required this.entryFrom});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: AppColors.secondaryColor,
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
                        image: NetworkImage(diagnosticModel.image!))),
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
                              textName: diagnosticModel.name!,
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
                        textName: diagnosticModel.name!,
                        textColor: AppColors.greyColor2,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12),
                    // CustomSizedBoxHeight(height: 4),
                    // CustomText(
                    //     textName: "Neurology (from Greek: νεῦρον (neûron),",
                    //     textColor: AppColors.blackColor,
                    //     fontWeightType: FontWeightType.regular,
                    //     fontFamily: FontFamily.poppins,
                    //     fontSize: 8),
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
                              textName: diagnosticModel.address!,
                              textColor: AppColors.blackColor,
                              fontWeightType: FontWeightType.regular,
                              fontFamily: FontFamily.poppins,
                              fontSize: 9),
                        ),
                        Image.asset(
                          AppImages.directionImage,
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(20),
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
    );
  }
}
