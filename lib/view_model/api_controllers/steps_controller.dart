import 'dart:async';

import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/models/steps_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/profile_service.dart';
import 'package:cradenthealth/services/steps_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class StepsController extends GetxController {
  var stepSummaryResponse = StepSummaryResponse().obs;

  final StepsService stepsService;

  var isLoading = false.obs; // Observable for loading state

  StepsController(this.stepsService);

  final int dailyGoal = 1000;
  static const double stepLength = 0.000762; // In km

  var steps = 0.obs;
  var distance = 0.0.obs;
  var timeSpent = "00:00:00".obs;
  var isWalking = false.obs;

  late Stream<StepCount> _stepCountStream;
  DateTime? _startTime;
  Timer? _timer;
  Timer? _walkingDetectionTimer;

  @override
  void onInit() {
    super.onInit();
    _initializePedometer();
    _startTimer();
  }

  void _initializePedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onStepCountError);
    _startTime = DateTime.now();
  }

  void _onStepCount(StepCount event) {
    steps.value = event.steps;
    distance.value = steps.value * stepLength;
    isWalking.value = true;

    _walkingDetectionTimer?.cancel();
    _walkingDetectionTimer = Timer(Duration(seconds: 5), () {
      isWalking.value = false;
    });
  }

  void _onStepCountError(error) {
    print("Pedometer Error: $error");
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      final duration = DateTime.now().difference(_startTime!);
      timeSpent.value = _formatDuration(duration);
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  double get progress => (steps.value / dailyGoal).clamp(0.0, 1.0);

  @override
  void onClose() {
    _timer?.cancel();
    _walkingDetectionTimer?.cancel();
    super.onClose();
  }

  void addSteps({required String steps}) async {
    try {
      isLoading.value = true; // Set loading to false
      await stepsService.addSteps(steps: steps);
      isLoading.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading to false
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  void fetchStepsData() async {
    try {
      isLoading.value = true; // Set loading to false
      stepSummaryResponse.value = await stepsService.fetchStepsData();
      isLoading.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading to false
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}
