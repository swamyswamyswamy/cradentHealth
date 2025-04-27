import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/booking_history_diagnostic.dart';
import 'package:cradenthealth/models/diagnostics/diagnostic_checkout_model.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DiagnosticService {
  Future<DiagnosticResponse> fetchDiagnostics() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('${AppBaseUrls.baseUrl}api/admin/alldiagnostics'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        // print(decodedMap);
        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return DiagnosticResponse.fromJson(decodedMap);
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

  Future<DiagnosticTestResponse> fetchDiagnosticsTests(
      {required String diagnosticId}) async {
    try {
      var request = http.Request('GET',
          Uri.parse('${AppBaseUrls.baseUrl}api/admin/alltest/${diagnosticId}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return DiagnosticTestResponse.fromJson(decodedMap);
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

  Future<DiagnosticCheckoutResponse> fetchDiagnosticsCheckout({
    required String diagnosticId,
    required List tests,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('${AppBaseUrls.baseUrl}api/booking/book-appointment'));
      request.body = json.encode({
        "staffId": AppTokens().userId,
        "patient_name": "John Doe",
        "diagnosticId": diagnosticId,
        "tests": tests,
        "appointment_date": "2025-04-15T09:00:00Z",
        "gender": "Male",
        "age": 30
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print("print the body checkout${request.body}");
      // var request = http.Request('GET',
      //     Uri.parse('${AppBaseUrls.baseUrl}api/admin/alltest/${diagnosticId}'));

      // http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return DiagnosticCheckoutResponse.fromJson(decodedMap);
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

  Future removeDiagnosticsTests(
      {required String bookingId, required String testId}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'PATCH',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/booking/remvoe-test/${AppTokens().userId}'));
      request.body = json.encode({"bookingId": bookingId, "testId": testId});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        AppToastMsgs.successToast("Success", decodedMap['message']);
        // return DiagnosticTestResponse.fromJson(decodedMap);
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

  Future bookDiagnosticsTests({required String bookingId}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'PATCH',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/booking/payment/${bookingId}/${AppTokens().userId}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        AppToastMsgs.successToast("Success", decodedMap['message']);
        // return DiagnosticTestResponse.fromJson(decodedMap);
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

  Future<DiagnosticCheckoutResponse> bookDoctorAppointment({
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
        Uri.parse(
            '${AppBaseUrls.baseUrl}api/staff/bookappoint/${AppTokens().userId}/$diagnosticId'),
      );

      request.body = json.encode({
        "appointment_date": appointmentDate,
        "appointment_time": appointmentTime,
        "patient_name": patientName,
        "patient_relation": patientRelation
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        return DiagnosticCheckoutResponse.fromJson(decodedMap);
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

  Future<BookingsHistoryDiagnosticResponseModel>
      fetchDiagnosticHistory() async {
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              '${AppBaseUrls.baseUrl}api/staff/getalldiagbookings/${AppTokens().userId}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        print("print the diagnotics booking history${decodedMap}");
        // AppToastMsgs.successToast("Success", decodedMap['message']);
        return BookingsHistoryDiagnosticResponseModel.fromJson(decodedMap);
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
