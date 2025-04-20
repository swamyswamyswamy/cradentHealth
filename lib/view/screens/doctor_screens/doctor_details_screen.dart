import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/models/doctors/doctor_model.dart';
import 'package:cradenthealth/view/screens/doctor_screens/appointment_bottom_sheet.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DoctorModel doctorDetails;
  DoctorDetailsScreen({super.key, required this.doctorDetails});

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
            Container(
              height: getProportionateScreenHeight(250),
              width: double.infinity,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      // fit: BoxFit.cover,
                      image: NetworkImage(doctorDetails.image!))),
            ),
            CustomSizedBoxHeight(height: 7),
            CustomSizedBoxWidth(width: 14),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: "${doctorDetails.name} ",
                            style: GoogleFonts.poppins(
                                color: AppColors.blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                text: "( ${doctorDetails.qualification} )",
                                style: GoogleFonts.poppins(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomText(
                          textName: "₹ ${doctorDetails.consultationFee}",
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.semiBold,
                          fontFamily: FontFamily.poppins,
                          fontSize: 18),
                    ],
                  ),
                  CustomText(
                      textName: doctorDetails.specialization!,
                      textColor: AppColors.greyColor2,
                      fontWeightType: FontWeightType.regular,
                      fontFamily: FontFamily.poppins,
                      fontSize: 15),
                ],
              ),
            ),
            CustomSizedBoxHeight(height: 8),
            Container(
              height: 6,
              color: AppColors.secondaryColor,
            ),
            CustomSizedBoxHeight(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.redColor,
                      ),
                      CustomSizedBoxWidth(width: 10),
                      CustomText(
                          textName: doctorDetails.address!,
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.regular,
                          fontFamily: FontFamily.poppins,
                          fontSize: 13),
                    ],
                  ),
                  CustomSizedBoxHeight(height: 19),
                  CustomText(
                      textName: doctorDetails.address!,
                      textColor: AppColors.blackColor,
                      fontWeightType: FontWeightType.regular,
                      fontFamily: FontFamily.poppins,
                      fontSize: 12),
                  CustomSizedBoxHeight(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: getProportionateScreenHeight(30),
            right: getProportionateScreenWidth(16),
            left: getProportionateScreenWidth(16)),
        child: AppButton(
          height: 44,
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext) {
                  return AppointmentBottomSheet(
                    doctorDetails: doctorDetails,
                  );
                });
            // Get.to(HomeScreen());
          },
          hasShadow: true,
          label: "Book Now",
        ),
      ),
    );
  }
}
