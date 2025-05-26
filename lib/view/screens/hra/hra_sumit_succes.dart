import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HraResultScreen extends StatelessWidget {
  final Map<String, dynamic> decodedMap;

  const HraResultScreen({super.key, required this.decodedMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: const Color(0xFF63183F),
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: CustomText(
          textName: 'Health Risk Assessment\nResult',
          textColor: AppColors.blackColor,
          textAlign: TextAlign.center,
          fontWeightType: FontWeightType.semiBold,
          fontFamily: FontFamily.montserrat,
          fontSize: 22,
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Icon(
            //   Icons.health_and_safety,
            //   color: Color(0xFFFFC107),
            //   size: 80,
            // ),
            // const SizedBox(height: 24),
            // _resultItem(
            //   title: 'Correct Answers',
            //   value: '${decodedMap['data'].length}',
            // ),
            // const SizedBox(height: 16),
            // _resultItem(
            //   title: 'Points Earned',
            //   value: '${decodedMap['totalPoints']}',
            //   color: Colors.blue,
            // ),
            // const SizedBox(height: 16),
            // _resultItem(
            //   title: 'Category',
            //   value: decodedMap['riskCategory'],
            //   color: Colors.red,
            // ),
            Image.asset(AppImages.hraImageSuccess),

            CustomText(
              textName: decodedMap['riskCategory'],
              textColor: AppColors.blackColor,
              fontWeightType: FontWeightType.semiBold,
              fontFamily: FontFamily.montserrat,
              fontSize: 22,
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.off(
                      AppBottomNavigation()); // or navigate to home/dashboard
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultItem(
      {required String title, required String value, Color? color}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color?.withOpacity(0.1) ?? const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color ?? const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
