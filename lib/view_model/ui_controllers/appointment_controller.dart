import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final selectedAvailableDate = 0.obs; // Observable variable

  // Method to update the selectedAvailableDate field
  void updateSelectedAvailableDate(int value) {
    selectedAvailableDate.value = value;
  }

  final selectedtimeSlot = 0.obs; // Observable variable

  // Method to update the selectedAvailableDate field
  void updateSelectedtimeSlot(int value) {
    selectedtimeSlot.value = value;
  }
}
