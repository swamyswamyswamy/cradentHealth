import 'dart:async';

import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view/screens/auth/register_screen.dart';
import 'package:cradenthealth/view_model/ui_controllers/otp_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final OtpController otpController = Get.put(OtpController());

  StreamController<ErrorAnimationType>? errorController;
  bool _isChecked = false;
  TextEditingController _otp = TextEditingController();
  final _timerController = Get.find<TimerController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timerController.resetTimer();
  }

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
                  textName: "Verify with OTP",
                  textColor: AppColors.blackColor,
                  fontWeightType: FontWeightType.semiBold,
                  fontFamily: FontFamily.montserrat,
                  fontSize: 30,
                ),
                CustomSizedBoxHeight(height: 7),
                CustomText(
                  textName:
                      "We have sent a 4 digit confirmation code to your Mail",
                  textColor: AppColors.blackColor.withOpacity(0.7),
                  fontWeightType: FontWeightType.regular,
                  fontFamily: FontFamily.montserrat,
                  fontSize: 16,
                ),
                CustomSizedBoxHeight(height: 26),
                PinCodeTextField(
                  appContext: context,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  pastedTextStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  // obscureText: true,
                  // obscuringCharacter: '*',
                  // obscuringWidget: const FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    // if (v!.length < 3) {
                    //   return "validating..";
                    // } else {
                    //   return null;
                    // }
                  },
                  pinTheme: PinTheme(
                    inactiveColor: AppColors.secondaryColor,
                    activeColor: AppColors.secondaryColor,
                    selectedColor: AppColors.secondaryColor,
                    activeFillColor: AppColors.secondaryColor,
                    selectedFillColor: AppColors.secondaryColor,
                    inactiveFillColor: AppColors.secondaryColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    inActiveBoxShadow: [
                      BoxShadow(
                          offset: Offset(4, 4),
                          spreadRadius: 0,
                          blurRadius: 12,
                          color: AppColors.blackColor.withOpacity(0.25))
                    ],
                    activeBoxShadow: [
                      BoxShadow(
                          offset: Offset(4, 4),
                          spreadRadius: 0,
                          blurRadius: 12,
                          color: AppColors.blackColor.withOpacity(0.25))
                    ],
                    fieldWidth: getProportionateScreenWidth(63),
                    fieldHeight: getProportionateScreenHeight(68),
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,

                  errorAnimationController: errorController,
                  autoDisposeControllers: false,
                  controller: _otp,
                  keyboardType: TextInputType.number,
                  // boxShadows: const [
                  //   BoxShadow(
                  //     offset: Offset(0, 1),
                  //     color: Colors.black12,
                  //     blurRadius: 10,
                  //   )
                  // ],
                  onCompleted: (v) async {
                    // EasyLoading.show();
                    debugPrint("Completed : ${v}");
                    // EasyLoading.show(status: 'loading...');
                    // verify_otp();
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    // setState(() {
                    //   // currentText = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                CustomSizedBoxHeight(height: 13),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _timerController.secondsRemaining.value == 00
                          ? const SizedBox()
                          : CustomText(
                              textName:
                                  "Retry in ${_timerController.secondsRemaining.value.toString().padLeft(2, '0')}sec",
                              fontSize: 14,
                              // textAlign: TextAlign.center,
                              fontFamily: FontFamily.montserrat,
                              fontWeightType: FontWeightType.medium,
                              textColor: AppColors.blackColor.withOpacity(0.6),
                            ),
                      InkWell(
                        onTap: () {
                          if (_timerController.secondsRemaining.value == 00) {
                            _timerController.resetTimer();
                            // _authController.loginUser(
                            //     hitIsLoading: false,
                            //     userPhone: _mobileNumber.text);
                          }
                        },
                        child: CustomText(
                          textName: "RESEND",

                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.redColor,
                          // textAlign: TextAlign.center,
                          fontFamily: FontFamily.montserrat,
                          fontWeightType: FontWeightType.medium,
                          textColor:
                              _timerController.secondsRemaining.value == 00
                                  ? AppColors.redColor
                                  : AppColors.redColor.withOpacity(0.3),
                        ),
                      ),
                    ],
                  );
                }),
                CustomSizedBoxHeight(height: 47),
                AppButton(
                  height: 44,
                  onTap: () {
                    Get.to(RegisterScreen());
                  },
                  hasShadow: true,
                  label: "Verify",
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
