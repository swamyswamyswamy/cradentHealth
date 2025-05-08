import 'dart:async';
import 'dart:math';

import 'package:cradenthealth/constants/app_animations.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pedometer/pedometer.dart';

class SemiCircularProgressIndicator extends StatefulWidget {
  final double progress; // Progress value (0.0 to 1.0)
  final int stepCount; // Step count to display

  const SemiCircularProgressIndicator({
    super.key,
    required this.progress,
    required this.stepCount,
  });

  static const double _stepLength = 0.000762;
  @override
  State<SemiCircularProgressIndicator> createState() =>
      _SemiCircularProgressIndicatorState();
}

class _SemiCircularProgressIndicatorState
    extends State<SemiCircularProgressIndicator> {
  int _steps = 0;

  final int _dailyGoal = 1000;

  double _distance = 0.0;
  // Distance in kilometers
  late Stream<StepCount> _stepCountStream;

  DateTime? _startTime;

  late Timer _timer;

  String _timeSpent = "0:00:00";

  // Average step length in km
  @override
  void initState() {
    super.initState();
    _initializePedometer();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _walkingDetectionTimer?.cancel();
    super.dispose();
  }

  bool _isWalking = false;
  Timer? _walkingDetectionTimer;
  void _initializePedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onStepCountError);
    _startTime = DateTime.now();
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
      _distance = _steps *
          SemiCircularProgressIndicator._stepLength; // Calculate distance in km

      _isWalking = true;

      // Reset walking detection timer
      _walkingDetectionTimer?.cancel();
      _walkingDetectionTimer = Timer(Duration(seconds: 5), () {
        // If no new steps in 5 seconds, consider user stopped walking
        setState(() {
          _isWalking = false;
        });
      });
    });
  }

  void _onStepCountError(error) {
    print("Pedometer Error: $error");
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        final duration = DateTime.now().difference(_startTime!);
        _timeSpent = _formatDuration(duration);
      });
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  double get _progress => (_steps / _dailyGoal).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: const Size(200, 100), // Size of the arc
          painter: SemiCirclePainter(_progress),
        ),
        Positioned(
          bottom: -20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSizedBoxHeight(height: 26),
              Lottie.asset(AppAnimations.stepAnimation,
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(40),
                  animate: _isWalking ? true : false),
              CustomSizedBoxHeight(height: 3),
              CustomText(
                  textName: "${_steps}",
                  textColor: AppColors.blackColor,
                  fontWeightType: FontWeightType.medium,
                  fontFamily: FontFamily.montserrat,
                  fontSize: 13),
              CustomText(
                  textName: "Steps ",
                  textColor: AppColors.blackColor.withOpacity(0.6),
                  fontWeightType: FontWeightType.medium,
                  fontFamily: FontFamily.montserrat,
                  fontSize: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      textName: "Start",
                      textColor: AppColors.blackColor.withOpacity(0.6),
                      fontWeightType: FontWeightType.medium,
                      fontFamily: FontFamily.montserrat,
                      fontSize: 11),
                  CustomSizedBoxWidth(width: 160),
                  CustomText(
                      textName: "Target",
                      textColor: AppColors.blackColor.withOpacity(0.6),
                      fontWeightType: FontWeightType.medium,
                      fontFamily: FontFamily.montserrat,
                      fontSize: 11),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  final double progress;

  SemiCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = AppColors.greyColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    canvas.drawArc(rect, pi, pi, false, backgroundPaint);
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
