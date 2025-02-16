import 'dart:math';

import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:flutter/material.dart';

class SemiCircularProgressIndicator extends StatelessWidget {
  final double progress; // Progress value (0.0 to 1.0)
  final int stepCount; // Step count to display

  const SemiCircularProgressIndicator({
    super.key,
    required this.progress,
    required this.stepCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: const Size(200, 100), // Size of the arc
          painter: SemiCirclePainter(progress),
        ),
        Positioned(
          bottom: -20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSizedBoxHeight(height: 26),
              Image.asset(
                AppImages.footImage,
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(40),
              ),
              CustomSizedBoxHeight(height: 3),
              CustomText(
                  textName: "$stepCount",
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
