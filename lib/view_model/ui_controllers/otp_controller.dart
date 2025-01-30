import 'package:get/get.dart';

class OtpController extends GetxController {
  final verifiedOrNot = false.obs; // Observable variable
  final otp = ''.obs;

  // Method to update the verifiedOrNot field
  void updateVerifyField(bool value) {
    verifiedOrNot.value = value; // Update the observable value
  }
}
