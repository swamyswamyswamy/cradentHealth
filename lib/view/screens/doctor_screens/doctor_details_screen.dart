import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/doctor_screens/appointment_bottom_sheet.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsScreen extends StatelessWidget {
  bool entryFrom;
  DoctorDetailsScreen({super.key, this.entryFrom = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: CustomText(
            textName: entryFrom ? "N Shade Eye Ware" : "Book A Consultation",
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
                      fit: BoxFit.cover,
                      image: NetworkImage(entryFrom
                          ? "https://media.istockphoto.com/id/160136810/photo/eyeglasses-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=NBiS2jW0MsOIzviDdikgXWHNRcBHw1fwVjIWkYJ6CpU="
                          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL0qLy1fo2Uvhti1TexQM137vp8pwBiwmgaIqvDA3q5W_C2XspyH-3ZspOY2BZdFqGCdI&usqp=CAU"))),
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
                            text: entryFrom
                                ? "N Shade Eye Ware"
                                : "Dr. Vineeth, ",
                            style: GoogleFonts.poppins(
                                color: AppColors.blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                text: entryFrom ? "" : "( MBBS )",
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
                          textName: "₹ 1500",
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.semiBold,
                          fontFamily: FontFamily.poppins,
                          fontSize: 18),
                    ],
                  ),
                  CustomText(
                      textName: "Neurology specialist",
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
                          textName: "Kukatpally, Hyderabad......5Km away",
                          textColor: AppColors.blackColor,
                          fontWeightType: FontWeightType.regular,
                          fontFamily: FontFamily.poppins,
                          fontSize: 13),
                    ],
                  ),
                  CustomSizedBoxHeight(height: 19),
                  CustomText(
                      textName:
                          "Neurology (from Greek: νεῦρον (neûron), and the suffix -logia, is the branch of medicine dealing with the diagnosis and treatment of all categoriesof conditions and disease involving the nervous system,which comprises the brain, the spinal cord and theperipheral nerves.[1] Neurological practice relies heavilyon the field of neuroscience, the scientific study of thenervous system and disease involving the nervous system,which comprises the brain, the spinal cord and theperipheral nerves.[1] Neurological practice relies heavilyon the field of neuroscience, the scientific study of thenervous system .",
                      textColor: AppColors.blackColor,
                      fontWeightType: FontWeightType.regular,
                      fontFamily: FontFamily.poppins,
                      fontSize: 12),
                  CustomSizedBoxHeight(height: 15),
                  AppButton(
                    height: 44,
                    onTap: () {
                      entryFrom
                          ? null
                          : showModalBottomSheet(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
