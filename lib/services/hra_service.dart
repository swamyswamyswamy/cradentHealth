import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/hra_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/models/support_model.dart';
import 'package:cradenthealth/services/dependency_injection.dart';
import 'package:cradenthealth/view/screens/app_bottom_navigation.dart';
import 'package:cradenthealth/view_model/api_controllers/support_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HraService {
  Future<AssessmentResponse> fetchHraQuestions() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('${AppBaseUrls.baseUrl}api/admin/get-hra'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        print("profile data hra ${decodedMap}");
        // print(decodedMap);
        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return AssessmentResponse.fromJson(decodedMap['data']);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast("Error", decodedMap['message']);
        throw Exception(decodedMap['message']);
      }
    } catch (e) {
      // Handle the case where the server is down
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later.");
      print("Error fetching ride history: $e");
      throw Exception("error");
    }
  }

  Future addHraQuestions({
    required List answers,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/staff/submit-hra/${AppTokens().userId}'));
      request.body = json.encode({"answers": answers});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print("print questins  ${response.statusCode}");
      print("print questins  ${request.body}");
      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        Get.offAll(() => AppBottomNavigation());
        DependencyInjection.apiInit();
        Widget _resultItem({
          required String title,
          required String value,
          Color color = Colors.black,
        }) {
          return Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          );
        }

        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              insetPadding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'HRA Result',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF63183F),
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.emoji_events,
                      color: Colors.amber[700],
                      size: 60,
                    ),
                    SizedBox(height: 16),
                    _resultItem(
                      title: 'Correct Answers',
                      value: '${decodedMap['data'].length}',
                    ),
                    SizedBox(height: 12),
                    _resultItem(
                      title: 'Points Earned',
                      value: '${decodedMap['totalPoints']}',
                      color: Colors.blue,
                    ),
                    SizedBox(height: 12),
                    _resultItem(
                      title: 'Category',
                      value: decodedMap['riskCategory'],
                      color: Colors.red,
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF63183F),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        // AppToastMsgs.successToast("Success", decodedMap['message']);
        // return SupportsApiResponse.fromJson(decodedMap);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast("Error", decodedMap['message']);
        // return SupportsApiResponse.fromJson(decodedMap);
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
