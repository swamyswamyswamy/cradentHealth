import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view/screens/auth/otp_verification_screen.dart';
import 'package:cradenthealth/view_model/ui_controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final OtpController otpController = Get.put(OtpController());
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(16),
                right: getProportionateScreenWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBoxHeight(height: 70),
                Image.asset(
                  AppImages.loginImage,
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(150),
                ),
                CustomSizedBoxHeight(height: 35),
                CustomText(
                  textName: "Welcome Back!",
                  textColor: AppColors.blackColor,
                  fontWeightType: FontWeightType.semiBold,
                  fontFamily: FontFamily.montserrat,
                  fontSize: 30,
                ),
                CustomSizedBoxHeight(height: 7),
                CustomText(
                  textName: "Please Sign In to Continue",
                  textColor: AppColors.blackColor.withOpacity(0.7),
                  fontWeightType: FontWeightType.regular,
                  fontFamily: FontFamily.montserrat,
                  fontSize: 16,
                ),
                CustomSizedBoxHeight(height: 37),
                Inputfield(
                    fillColor: AppColors.secondaryColor,
                    controller: TextEditingController(),
                    // maxLength: 10,
                    label: "Enter Mobile Number",
                    keyboardType: TextInputType.text,
                    hinttext: ""),
                CustomSizedBoxHeight(height: 16),
                Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        fillColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .primaryColor; // Change this to your preferred color
                            }
                            return AppColors
                                .whiteColor; // Default color when not selected
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            _isChecked = !_isChecked;
                          });
                        }),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "By continuing, you agree to our ",
                          style: GoogleFonts.inter(
                              color: AppColors.blackColor.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: GoogleFonts.inter(
                                  color: AppColors.redColor,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: " and ",
                              style: GoogleFonts.inter(
                                  color: AppColors.blackColor.withOpacity(0.8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.inter(
                                  color: AppColors.redColor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomSizedBoxHeight(height: 50),
                AppButton(
                  height: 44,
                  onTap: () {
                    Get.to(OtpVerificationScreen());
                  },
                  hasShadow: true,
                  label: "Login",
                ),
                CustomSizedBoxHeight(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
