import 'package:get/get.dart';
import 'dart:async';

class TimerController extends GetxController {
  var secondsRemaining = 30.obs;
  Timer? _timer;
  @override
  void onInit() {
    startTimer(); // Start the timer when the controller is initialized
    super.onInit();
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel(); // Cancel any existing timer if already running
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  void resetTimer() {
    secondsRemaining.value = 30; // Reset to 30 seconds
    startTimer(); // Restart the timer
  }

  // @override
  // void onClose() {
  //   _timer?.cancel(); // Cancel the timer when the controller is destroyed
  //   super.onClose();
  // }
}
