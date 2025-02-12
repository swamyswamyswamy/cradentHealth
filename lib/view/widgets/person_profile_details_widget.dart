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
  const PersonProfileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getProportionateScreenHeight(60),
          width: getProportionateScreenWidth(60),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn9zilY2Yu2hc19pDZFxgWDTUDy5DId7ITqA&s"))),
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
                      fontSize: 12),
                  CustomText(
                      textName: "varma",
                      textColor: AppColors.blackColor,
                      fontWeightType: FontWeightType.medium,
                      fontFamily: FontFamily.poppins,
                      fontSize: 12),
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
                      fontSize: 12),
                  CustomText(
                      textName: "19",
                      textColor: AppColors.blackColor,
                      fontWeightType: FontWeightType.medium,
                      fontFamily: FontFamily.poppins,
                      fontSize: 12),
                  CustomSizedBoxWidth(width: 8),
                  CustomText(
                      textName: "GENDER : ",
                      textColor: AppColors.blackColor,
                      fontWeightType: FontWeightType.medium,
                      fontFamily: FontFamily.poppins,
                      fontSize: 12),
                  CustomText(
                      textName: "Male",
                      textColor: AppColors.blackColor,
                      fontWeightType: FontWeightType.medium,
                      fontFamily: FontFamily.poppins,
                      fontSize: 12),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
