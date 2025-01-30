import 'package:cradenthealth/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Your CustomText class and other enums/extensions go here

class CustomGradientText extends StatelessWidget {
  final String textName; // Text to display
  final double fontSize; // Font size
  final FontFamily fontFamily; // Selected font family
  final FontWeightType fontWeightType; // Selected font weight
  final LinearGradient gradient; // LinearGradient for the text
  final TextAlign textAlign; // Text alignment
  final int? maxLines; // Maximum lines for the text
  final TextOverflow overFlow; // Overflow behavior
  final TextDecoration decoration; // Text decoration
  final Color? decorationColor; // Color for the decoration

  const CustomGradientText({
    super.key,
    required this.textName,
    required this.gradient,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.fontSize = 20,
    this.overFlow = TextOverflow.clip,
    this.fontFamily = FontFamily.montserrat,
    this.fontWeightType = FontWeightType.bold,
    this.decoration = TextDecoration.none,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      child: CustomText(
        textName: textName,
        maxLines: maxLines,
        textAlign: textAlign,
        textColor: Colors.white, // Set to transparent to use gradient
        fontSize: fontSize,
        overFlow: overFlow,
        fontFamily: fontFamily,
        fontWeightType: fontWeightType,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
