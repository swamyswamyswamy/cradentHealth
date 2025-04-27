import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/doctors/bookAppointment_model.dart';
import 'package:cradenthealth/models/doctors/booking_history_doctors_model.dart';
import 'package:cradenthealth/models/doctors/doctor_model.dart';
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

  Future<AppointmentModel> bookDoctorAppointment({
    required String diagnosticId,
    required String patientName,
    required String patientRelation,
    required String appointmentDate, // Format: yyyy-MM-dd
    required String appointmentTime, // Format: HH:mm
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var request = http.Request(
        'POST',
        Uri.parse('${AppBaseUrls.baseUrl}api/staff/bookappoint'),
      );

      request.body = json.encode({
        "doctorId": diagnosticId,
        "staffId": AppTokens().userId,
        "appointment_date": appointmentDate,
        "appointment_time": appointmentTime,
        "patient_name": patientName,
        "patient_relation": patientRelation
      });

      request.headers.addAll(headers);

      print("print the bod of the appointment ${request.body}");
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast(
            "Error", decodedMap['message'] ?? 'Unknown error');
        return AppointmentModel.fromJson(decodedMap);
      } else {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        AppToastMsgs.failedToast(
            "Error", decodedMap['message'] ?? 'Unknown error');
        throw Exception(decodedMap['message'] ?? 'Unknown error');
      }
    } catch (e) {
      AppToastMsgs.failedToast("Server Error",
          "Failed to connect to the server. Please try again later. $e");
      print("Error during diagnostics checkout: $e");
      throw Exception("error");
    }
  }

  Future<BookingHistoryDoctorsResponseModel>
      fetchDoctorsBookingHistory() async {
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/staff/getdoctorappointment/${AppTokens().userId}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        print("print the diagnotics booking historydfdffdf${decodedMap}");
        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return BookingHistoryDoctorsResponseModel.fromJson(decodedMap);
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
}
