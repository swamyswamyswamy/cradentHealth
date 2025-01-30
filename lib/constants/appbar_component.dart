import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool isBackButtonVisible;
  final bool isWallet;
  final Color? backgroundColor; // Button background color
  final Gradient? gradient; // Gradient for the button background
  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.gradient, // New parameter for gradient
    required this.title,
    this.height = 50, // Default height if not provided
    this.isBackButtonVisible = true,
    this.isWallet = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: height,
      gradient: gradient, // Use gradient if provided
      backgroundColor: gradient == null
          ? (backgroundColor ?? AppColors.primaryColor)
          : null, // Fallback to default color if gradient is null
      width: double.infinity,
      child: Row(
        children: [
          CustomSizedBoxWidth(width: 12),
          isBackButtonVisible
              ? IconButton(
                  onPressed: () {
                    Get.back(); // Navigate back
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: gradient == null
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    size: 25,
                  ),
                )
              : const SizedBox(),
          CustomSizedBoxWidth(width: 12),
          CustomText(
            textName: title,
            fontSize: 16,
            textAlign: TextAlign.center,
            fontFamily: FontFamily.abeezee,
            fontWeightType: FontWeightType.semiBold,
            textColor: gradient == null
                ? AppColors.primaryColor
                : AppColors.whiteColor,
          ),
          Spacer(),
          CustomSizedBoxWidth(width: 16)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
