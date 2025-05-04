import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/hra_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/models/support_model.dart';
import 'package:cradenthealth/view_model/api_controllers/support_controller.dart';
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

  Future addSupport({
    required String title,
    required String description,
    required String image,
  }) async {
    try {
      final SupportController supportController = Get.find<SupportController>();
      var headers = {'Authorization': 'Bearer ${AppTokens().accessToken}'};
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/staff/submitissue/${AppTokens().userId}'));
      request.fields.addAll({'reason': title, 'description': description});
      image == ""
          ? null
          : request.files.add(await http.MultipartFile.fromPath('file', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        supportController.fetchSupport();
        Get.back();
        AppToastMsgs.successToast("Success", decodedMap['message']);
        return SupportsApiResponse.fromJson(decodedMap);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast("Error", decodedMap['message']);
        return SupportsApiResponse.fromJson(decodedMap);
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
