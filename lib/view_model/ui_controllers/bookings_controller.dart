import 'package:get/get.dart';

class BookingsController extends GetxController {
  final selectedBookingTab = 0.obs; // Observable variable

  // Method to update the verifiedOrNot field
  void updateselectedBookingTab(int value) {
    selectedBookingTab.value = value; // Update the observable value
  }
}
