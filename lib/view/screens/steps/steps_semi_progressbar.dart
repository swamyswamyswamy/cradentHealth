import 'dart:async';
import 'dart:math';

import 'package:cradenthealth/view_model/api_controllers/steps_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pedometer/pedometer.dart';

// Replace with your own constants
import 'package:cradenthealth/constants/app_animations.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';

class SemiCircularProgressIndicator extends StatelessWidget {
  SemiCircularProgressIndicator({super.key});

  final _stepsController = Get.find<StepsController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Obx(() => CustomPaint(
              size: const Size(200, 100),
              painter: SemiCirclePainter(_stepsController.progress),
            )),
        Positioned(
          bottom: -20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSizedBoxHeight(height: 26),
              Obx(() => Lottie.asset(
                    AppAnimations.stepAnimation,
                    height: getProportionateScreenHeight(60),
                    width: getProportionateScreenWidth(60),
                    animate: _stepsController.isWalking.value,
                  )),
              CustomSizedBoxHeight(height: 3),
              Obx(() => CustomText(
                    textName: "${_stepsController.steps.value}",
                    textColor: AppColors.blackColor,
                    fontWeightType: FontWeightType.medium,
                    fontFamily: FontFamily.montserrat,
                    fontSize: 13,
                  )),
              CustomText(
                textName: "Steps ",
                textColor: AppColors.blackColor.withOpacity(0.6),
                fontWeightType: FontWeightType.medium,
                fontFamily: FontFamily.montserrat,
                fontSize: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textName: "Start",
                    textColor: AppColors.blackColor.withOpacity(0.6),
                    fontWeightType: FontWeightType.medium,
                    fontFamily: FontFamily.montserrat,
                    fontSize: 11,
                  ),
                  CustomSizedBoxWidth(width: 160),
                  CustomText(
                    textName: "Target",
                    textColor: AppColors.blackColor.withOpacity(0.6),
                    fontWeightType: FontWeightType.medium,
                    fontFamily: FontFamily.montserrat,
                    fontSize: 11,
                  ),
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

    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    canvas.drawArc(rect, pi, pi, false, backgroundPaint);
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
