import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view_model/ui_controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(16),
              right: getProportionateScreenWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(child: Image.asset(AppImages.intro1)),
              CustomSizedBoxHeight(height: 39),
              Center(
                child: CustomText(
                  textName: "Welcome Back!",
                  textColor: AppColors.primaryColor,
                  fontWeightType: FontWeightType.semiBold,
                  fontFamily: FontFamily.robotoFlex,
                  fontSize: 24,
                ),
              ),
              CustomSizedBoxHeight(height: 8),
              Center(
                child: CustomText(
                  textName: " Your world of possibilities is just a login away",
                  textColor: AppColors.secondaryColor,
                  fontWeightType: FontWeightType.medium,
                  fontFamily: FontFamily.robotoFlex,
                  fontSize: 14,
                ),
              ),
              CustomSizedBoxHeight(height: 13),
              CustomText(
                textName: "Mobile Number",
                textColor: AppColors.blackColor,
                fontWeightType: FontWeightType.medium,
                fontFamily: FontFamily.montserrat,
                fontSize: 14,
              ),
              CustomSizedBoxHeight(height: 12),
              Inputfield(
                  controller: TextEditingController(),
                  // maxLength: 10,
                  keyboardType: TextInputType.text,
                  hinttext: "Enter Mobile Number"),

              Obx(() {
                return otpController.verifiedOrNot.value
                    ? Column(
                        children: [
                          CustomSizedBoxHeight(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CustomText(
                                textName: "Enter OTP",
                                fontSize: 14,
                                // textAlign: TextAlign.center,
                                fontFamily: FontFamily.poppins,
                                fontWeightType: FontWeightType.medium,
                                textColor: AppColors.blackColor,
                              ),
                              CustomSizedBoxWidth(width: 15)
                            ],
                          ),
                          CustomSizedBoxHeight(height: 16),
                          // OtpTextField(
                          //   keyboardType: TextInputType.number,
                          //   borderRadius: BorderRadius.circular(7),
                          //   fieldWidth: getProportionateScreenWidth(60),
                          //   fieldHeight: getProportionateScreenHeight(48),
                          //   numberOfFields: 5,
                          //   borderColor: AppColors.blackColor,
                          //   focusedBorderColor: AppColors.primaryColor,
                          //   // styles: otpTextStyles,
                          //   showFieldAsBox: true,
                          //   borderWidth: 2.0,
                          //   //runs when a code is typed in
                          //   onCodeChanged: (String code) {
                          //     //handle validation or checks here if necessary
                          //   },
                          //   //runs when every textfield is filled
                          //   onSubmit: (String verificationCode) {},
                          // ),
                          CustomSizedBoxHeight(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const CustomText(
                                textName: "Resend OTP in 00:30s",
                                fontSize: 14,
                                // textAlign: TextAlign.center,
                                fontFamily: FontFamily.poppins,
                                fontWeightType: FontWeightType.medium,
                                textColor: AppColors.primaryColor,
                              ),
                              CustomSizedBoxWidth(width: 15)
                            ],
                          ),
                        ],
                      )
                    : SizedBox();
              }),

              // CustomContainer(
              //   height: 50,
              //   onPressed: () {
              //     Get.to(AppBottomNavigation());
              //   },
              //   buttonName: "Signup",
              // ),
              // CustomButton(
              //   function: () {
              //     gator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const VerificationScreen()));
              //   },
              //   text: 'Submit',
              //   buttonTextColor: AppColors.whiteColor,
              //   borderColor: AppColors.primaryColor,
              //   fontFamily: AppConstants.popinsFonts,
              // ),
              CustomSizedBoxHeight(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    textName:
                        "Check your phone for a verification code shortly",
                    fontSize: 12,
                    // textAlign: TextAlign.center,
                    fontFamily: FontFamily.robotoFlex,
                    fontWeightType: FontWeightType.regular,
                    textColor: AppColors.blackColor,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(DashBoardScreen());
                  //   },
                  //   child: CustomText(
                  //     textName: "Login",
                  //     fontSize: 16,
                  //     decoration: TextDecoration.underline,
                  //     decorationColor: AppColors.primaryColor,
                  //     // textAlign: TextAlign.center,
                  //     fontFamily: FontFamily.montserrat,
                  //     fontWeightType: FontWeightType.medium,
                  //     textColor: AppColors.primaryColor,
                  //   ),
                  // ),
                ],
              ),
              CustomSizedBoxHeight(height: 50),
              CustomSizedBoxHeight(height: getProportionateScreenHeight(35)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: AppButton(
                  height: 44,
                  onTap: () {
                    // Get.to(DashBoardScreen());
                  },
                  hasShadow: true,
                  label: "Login",
                ),
              ),
              CustomSizedBoxHeight(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    textName: "Don’t have an account?",
                    fontSize: 14,
                    // textAlign: TextAlign.center,
                    fontFamily: FontFamily.montserrat,
                    fontWeightType: FontWeightType.semiBold,
                    textColor: AppColors.blackColor,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(RegisterScreen());
                    },
                    child: CustomText(
                      textName: "SignUp",
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.greencolor,
                      // textAlign: TextAlign.center,
                      fontFamily: FontFamily.montserrat,
                      fontWeightType: FontWeightType.medium,
                      textColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelectionWidget extends StatefulWidget {
  const GenderSelectionWidget({super.key});

  @override
  _GenderSelectionWidgetState createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  String? selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Male Option
        GenderOption(
          value: 'Male',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        const SizedBox(width: 16),
        // Female Option
        GenderOption(
          value: 'Female',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        const SizedBox(width: 16),
        // Others Option
        GenderOption(
          value: 'Others',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
      ],
    );
  }
}

class GenderOption extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const GenderOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        // width: getProportionateScreenWidth(94),
        height: getProportionateScreenHeight(40),
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: groupValue == value
                ? AppColors.primaryColor
                : AppColors.greyColor1,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: AppColors.primaryColor),
            CustomText(
              textName: value,
              fontSize: 14,
              // textAlign: TextAlign.center,

              fontFamily: FontFamily.robotoFlex,
              fontWeightType: FontWeightType.medium,
              textColor: AppColors.primaryColor,
            ),
            CustomSizedBoxWidth(
              width: 14,
            )
          ],
        ),
      ),
    );
  }
}
