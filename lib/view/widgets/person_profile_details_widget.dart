import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/doctor_screens/appointment_bottom_sheet.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonProfileDetailsWidget extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String imageUrl;

  const PersonProfileDetailsWidget({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: AppColors.secondaryColor,
      borderRadius: 5,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        child: Row(
          children: [
            Container(
              height: getProportionateScreenHeight(60),
              width: getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
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
                        textName: "Name : ",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12,
                      ),
                      CustomText(
                        textName: name,
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  CustomSizedBoxHeight(height: 5),
                  Row(
                    children: [
                      CustomText(
                        textName: "AGE : ",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12,
                      ),
                      CustomText(
                        textName: age,
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12,
                      ),
                      CustomSizedBoxWidth(width: 8),
                      CustomText(
                        textName: "GENDER : ",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12,
                      ),
                      CustomText(
                        textName: gender,
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.medium,
                        fontFamily: FontFamily.poppins,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
