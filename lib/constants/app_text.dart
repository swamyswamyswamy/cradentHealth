import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Enum for defining Google Fonts used in the CustomText widget
enum FontFamily {
  playfairDisplay,
  montserrat,
  poppins,
  robotoSerif,
  abeezee,
  robotoFlex,
  inter // Added Inter font
}

// Extension to get font names from FontFamily enum
extension FontFamilyExtension on FontFamily {
  String get name {
    switch (this) {
      case FontFamily.playfairDisplay:
        return 'PlayfairDisplay';
      case FontFamily.montserrat:
        return 'Montserrat';
      case FontFamily.poppins:
        return 'Poppins';
      case FontFamily.robotoSerif:
        return 'RobotoSerif';
      case FontFamily.abeezee:
        return 'ABeeZee';
      case FontFamily.robotoFlex:
        return 'RobotoFlex';
      case FontFamily.inter:
        return 'Inter'; // Return name for Inter font
      default:
        return 'Montserrat';
    }
  }
}

// Enum for different font weights used in the CustomText widget
enum FontWeightType {
  regular,
  medium,
  semiBold,
  bold,
  extraBold
}

// Extension to get font weights from FontWeightType enum
extension FontWeightTypeExtension on FontWeightType {
  FontWeight get fontWeight {
    switch (this) {
      case FontWeightType.regular:
        return FontWeight.w400;
      case FontWeightType.medium:
        return FontWeight.w500;
      case FontWeightType.semiBold:
        return FontWeight.w600;
      case FontWeightType.bold:
        return FontWeight.w700;
      case FontWeightType.extraBold:
        return FontWeight.w800;
      default:
        return FontWeight.w400;
    }
  }
}

/// A customizable text widget that supports different Google Fonts and styles.
class CustomText extends StatelessWidget {
  final String textName;
  final TextAlign textAlign;
  final Color textColor;
  final double fontSize;
  final TextOverflow overFlow;
  final FontFamily fontFamily;
  final FontWeightType fontWeightType;
  final int? maxLines;
  final TextDecoration decoration;
  final Color? decorationColor;

  const CustomText({
    super.key,
    required this.textName,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.textColor = const Color(0xFF000000),
    this.fontSize = 20,
    this.overFlow = TextOverflow.clip,
    this.fontFamily = FontFamily.montserrat,
    this.fontWeightType = FontWeightType.bold,
    this.decoration = TextDecoration.none,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (fontFamily) {
      case FontFamily.playfairDisplay:
        textStyle = GoogleFonts.playfairDisplay(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.poppins:
        textStyle = GoogleFonts.poppins(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.robotoSerif:
        textStyle = GoogleFonts.robotoSerif(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.abeezee:
        textStyle = GoogleFonts.aBeeZee(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.robotoFlex:
        textStyle = GoogleFonts.robotoFlex(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.inter:
        textStyle = GoogleFonts.inter(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.montserrat:
      default:
        textStyle = GoogleFonts.montserrat(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
    }

    return Text(
      textName,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overFlow,
      style: textStyle,
    );
  }
}
