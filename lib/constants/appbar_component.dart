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
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      elevation: 4,
      shadowColor: AppColors.blackColor.withOpacity(0.25),
      centerTitle: true,
      title: CustomText(
        textName: title,
        fontSize: 20,
        textAlign: TextAlign.center,
        fontFamily: FontFamily.poppins,
        fontWeightType: FontWeightType.semiBold,
        textColor:
            gradient == null ? AppColors.primaryColor : AppColors.whiteColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
