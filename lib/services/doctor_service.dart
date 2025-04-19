import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/doctor_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DoctorService {
  Future<List<DoctorModel>> fetchDoctors() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('${AppBaseUrls.baseUrl}api/admin/getdoctors'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedList = json.decode(responseString) as List;

        print("Doctors fetched: $decodedList");

        return decodedList.map((json) => DoctorModel.fromJson(json)).toList();
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast("Error", decodedMap['message']);
        throw Exception(decodedMap['message']);
      }
    } catch (e) {
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later.");
      print("Error fetching doctors: $e");
      throw Exception("error");
    }
  }
}
