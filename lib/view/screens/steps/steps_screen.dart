import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/steps/steps_semi_progressbar.dart';
import 'package:flutter/material.dart';

class StepsScreen extends StatelessWidget {
  bool navigateBack;
  StepsScreen({super.key, this.navigateBack = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonVisible: navigateBack,
        backgroundColor: AppColors.whiteColor,
        title: "Activity tracker",
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          CustomSizedBoxHeight(height: 25),
          Center(
            child: SemiCircularProgressIndicator(
              progress: 0.75, // 75% progress
              stepCount: 23166,
              // Steps count),)
            ),
          ),
        ],
      ),
    );
  }
}
