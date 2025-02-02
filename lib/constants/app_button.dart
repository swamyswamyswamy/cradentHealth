import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap; // Nullable callback for button tap
  final Color? backgroundColor; // Button background color
  final double? borderRadius; // Corner radius
  final Color? textColor; // Text color
  final Color? borderColor; // Border color
  final double? height; // Button height
  final double? width; // Button width
  final String? label; // Button text
  final bool? hasShadow; // Shadow option
  final bool? hasBounceEffect; // Bounce effect option
  final double? fontSize; // Font size for the button text
  final Widget? child; // Custom child widget for the button
  final Gradient? gradient; // Gradient for the button background

  const AppButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.hasShadow,
    this.hasBounceEffect,
    this.textColor,
    this.height,
    this.width,
    this.label,
    this.fontSize,
    this.child,
    this.gradient, // New parameter for gradient
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height == null ? null : getProportionateScreenHeight(height!),
        width: width,
        decoration: BoxDecoration(
          gradient: gradient, // Use gradient if provided
          color: gradient == null
              ? (backgroundColor ?? AppColors.primaryColor)
              : null, // Fallback to default color if gradient is null
          boxShadow: (hasShadow ?? false)
              ? [
                  BoxShadow(
                    offset: Offset(-2, 4),
                    blurRadius: 6,
                    color: AppColors.primaryColor.withOpacity(0.5),
                  )
                ]
              : null,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.circular(10), // Default radius if null
        ),
        child: child ??
            Center(
              child: CustomText(
                textName: label ?? "", // Fallback to empty text
                textColor: textColor ??
                    AppColors.whiteColor, // Fallback to white color
                fontWeightType: FontWeightType.semiBold,
                fontFamily: FontFamily.inter,
                fontSize: fontSize ?? 14, // Default font size if null
              ),
            ),
      ),
    );
  }
}
