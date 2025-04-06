import 'package:cradenthealth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoadingLogin = false.obs; // Observable for loading state
  var isLoadingForgot = false.obs; // Observable for loading state
  var isLoadingOtpVerification = false.obs; // Observable for loading state
  var isLoadingRegistration = false.obs; // Observable for loading state
  final AuthService authService;

  AuthController(this.authService);

  loginUser({
    required String phone,
    required String password,
  }) async {
    isLoadingLogin.value = true; // Set loading to false
    try {
      await authService.loginUser(phone: phone, password: password);
      isLoadingLogin.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingLogin.value = false; // Set loading to false
    } finally {
      isLoadingLogin.value = false; // Set loading to false
    }
  }

  forgot({
    required String phone,
  }) async {
    isLoadingForgot.value = true; // Set loading to false
    try {
      await authService.forgot(phone: phone);
      isLoadingForgot.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingForgot.value = false; // Set loading to false
    } finally {
      isLoadingForgot.value = false; // Set loading to false
    }
  }

  // verifyOtp({required String phone, required String otp}) async {
  //   isLoadingOtpVerification.value = true; // Set loading to true
  //   try {
  //     await authService.verifyOtp(phone: phone, otp: otp);
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   } catch (e) {
  //     // Handle error
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   } finally {
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   }
  // }

  registration({
    required String name,
    required String phone,
    required String email,
    required String aadhar,
    required String password,
  }) async {
    isLoadingRegistration.value = true; // Set loading to true
    try {
      await authService.registration(
          name: name,
          phone: phone,
          email: email,
          aadhar: aadhar,
          password: password);
      isLoadingRegistration.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingRegistration.value = false; // Set loading to false
    } finally {
      isLoadingRegistration.value = false; // Set loading to false
    }
  }

  // deleteAccount() async {
  //   isLoadingOtpVerification.value = true; // Set loading to true
  //   try {
  //     await authService.deleteAccount();
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   } catch (e) {
  //     // Handle error
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   } finally {
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   }
  // }

  // logoutAccount() async {
  //   isLoadingOtpVerification.value = true; // Set loading to true
  //   try {
  //     await authService.logoutAccount();
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   } catch (e) {
  //     // Handle error
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   } finally {
  //     isLoadingOtpVerification.value = false; // Set loading to false
  //   }
  // }
}
