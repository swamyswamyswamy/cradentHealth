import 'dart:convert';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WalletService {
    Future<WalletResponse> fetcthWallet() async {
      try {
        var request = http.Request(
            'GET',
            // Uri.parse(
            //     '${AppBaseUrls.baseUrl}api/staff/wallet/${AppTokens().userId}'));
            Uri.parse(
                '${AppBaseUrls.baseUrl}api/staff/wallet/67f7614ed43c1818f3943c5a'));

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          var responseString = await response.stream.bytesToString();
          final decodedMap = json.decode(responseString);
          print("dfjdfkdkdfdfd${decodedMap}");
          // print(decodedMap);
          // AppToastMsgs.successToast("Success", decodedMap['message']);
          return WalletResponse.fromJson(decodedMap);
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
