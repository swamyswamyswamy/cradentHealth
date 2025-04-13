import 'dart:convert';

import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/view/screens/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future loginUser({
    required String phone,
    required String password,
  }) async {
    SharedPreferences accessTokenInstance =
        await SharedPreferences.getInstance();
    SharedPreferences userIdInstance = await SharedPreferences.getInstance();
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('${AppBaseUrls.baseUrl}api/staff/login-staff'));
      request.body = json.encode({"email": phone, "password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        await accessTokenInstance.setString("accessToken", decodedMap['token']);
        await userIdInstance.setString("userId", decodedMap['staff']['_id']);
        await AppTokens().setAccessToken(decodedMap['token']);
        await AppTokens().setuserId(decodedMap['staff']['_id']);

        Get.offAll(() => AppBottomNavigation());
        AppToastMsgs.successToast("Success", decodedMap['message']);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        AppToastMsgs.failedToast("Error", decodedMap['error']);
      }
    } catch (e) {
      // Handle the case where the server is down
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later.");
      print("Error fetching ride history: $e");
      throw Exception("error");
    }
  }

  Future forgot({
    required String phone,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST', Uri.parse('${AppBaseUrls.baseUrl}forgot_password'));
      request.body = json.encode({"phone": phone});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        // await accessTokenInstance.setString("accessToken", decodedMap['token']);
        // await AppTokens().setAccessToken(decodedMap['token']);

        // Get.to(CreateNewPasswordScreen());
        AppToastMsgs.successToast("Success", decodedMap['message']);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        AppToastMsgs.failedToast("Error", decodedMap['error']);
      }
    } catch (e) {
      // Handle the case where the server is down
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later.");
      print("Error fetching ride history: $e");
      throw Exception("error");
    }
  }

  Future registration({
    required String name,
    required String phone,
    required String email,
    required String aadhar,
    required String password,
  }) async {
    SharedPreferences accessTokenInstance =
        await SharedPreferences.getInstance();
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var request =
          http.Request('POST', Uri.parse('${AppBaseUrls.baseUrl}register'));
      request.body = json.encode({
        "name": name,
        "phone": phone,
        "mail": email,
        "aadhar": aadhar,
        "password": password,
        "confirmPassword": password
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        // await accessTokenInstance.setString("accessToken", decodedMap['token']);
        // await AppTokens().setAccessToken(decodedMap['token']);

        // Get.offAll(() => AppBottomNavBar());
        // DependencyInjection.apiInit();
        AppToastMsgs.successToast("Success", decodedMap['message']);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        AppToastMsgs.failedToast("Error", decodedMap['error']);
      }
    } catch (e) {
      // Handle the case where the server is down
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later.");
      print("Error fetching ride history: $e");
      throw Exception("error");
    }
  }
}
