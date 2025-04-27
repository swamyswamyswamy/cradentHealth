import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/familyMember_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/view_model/api_controllers/family_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FamilyService {
  Future createFamilyMember({
    required String fullName,
    required String mobileNumber,
    required String age,
    required String gender,
    required String DOB,
    required String height,
    required String weight,
    required String eyeSight,
    required String BMI,
    required String BP,
    required String sugar,
    required String relation,
  }) async {
    final _familyController = Get.find<FamilyController>();
    try {
      var headers = {'Content-Type': 'application/json'};

      var request = http.Request(
        'POST',
        Uri.parse(
            '${AppBaseUrls.baseUrl}api/staff/create-family/${AppTokens().userId}'),
      );

      request.body = json.encode({
        "fullName": fullName,
        "mobileNumber": mobileNumber,
        "age": age,
        "gender": gender,
        "DOB": DOB,
        "height": height,
        "weight": weight,
        "eyeSight": eyeSight,
        "BMI": BMI,
        "BP": BP,
        "sugar": sugar,
        "relation": relation,
      });
      request.headers.addAll(headers);

      print("crateing the family memaberes${request.body}");
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        Get.back();
        _familyController.fetchFamilyList(); // print(decodedMap);
        AppToastMsgs.successToast("Success", decodedMap['message']);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast("Error", decodedMap['message']);
        throw Exception(decodedMap['message']);
      }
    } catch (e) {
      // Handle the case where the server is down
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later.$e");
      print("Error fetching ride history: $e");
      throw Exception("error");
    }
  }

  Future<FamilyResponseModel> fetchFamilyList() async {
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/staff/getallfamily/${AppTokens().userId}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        // print("dfjdfkdkdfdfd${decodedMap}");
        // print(decodedMap);
        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return FamilyResponseModel.fromJson(decodedMap);
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
}
