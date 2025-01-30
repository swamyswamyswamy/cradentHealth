import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Enum for defining Google Fonts used in the CustomText widget
enum FontFamily {
  playfairDisplay, // Playfair Display font
  montserrat, // Montserrat font
  poppins, // Poppins font
  robotoSerif, // Roboto Serif font
  abeezee, // ABeeZee font
  robotoFlex // Roboto Flex font
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
        return 'ABeeZee'; // Return name for ABeeZee font
      case FontFamily.robotoFlex:
        return 'RobotoFlex'; // Return name for Roboto Flex font
      default:
        return 'Montserrat'; // Default font
    }
  }
}

// Enum for different font weights used in the CustomText widget
enum FontWeightType {
  regular, // Changed from 'normal' to 'regular'
  medium,
  semiBold,
  bold,
  extraBold
}

// Extension to get font weights from FontWeightType enum
extension FontWeightTypeExtension on FontWeightType {
  FontWeight get fontWeight {
    switch (this) {
      case FontWeightType.regular: // Return regular font weight
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
        return FontWeight.w400; // Default to regular
    }
  }
}

/// A customizable text widget that supports different Google Fonts and styles.
class CustomText extends StatelessWidget {
  final String textName; // Text to display
  final TextAlign textAlign; // Text alignment
  final Color textColor; // Text color
  final double fontSize; // Font size
  final TextOverflow overFlow; // Overflow behavior
  final FontFamily fontFamily; // Selected font family
  final FontWeightType fontWeightType; // Selected font weight
  final int? maxLines; // Maximum lines for the text
  final TextDecoration
      decoration; // Text decoration (underline, strikethrough, etc.)
  final Color? decorationColor; // Color for the decoration

  const CustomText({
    super.key,
    required this.textName,
    this.maxLines,
    this.textAlign = TextAlign.start, // Default alignment is start
    this.textColor = const Color(0xFF000000), // Default black color
    this.fontSize = 20, // Default font size
    this.overFlow = TextOverflow.clip, // Default overflow behavior
    this.fontFamily =
        FontFamily.montserrat, // Default font family is Montserrat
    this.fontWeightType = FontWeightType.bold, // Default to bold
    this.decoration = TextDecoration.none, // Default to no decoration
    this.decorationColor, // Optional decoration color
  });

  @override
  Widget build(BuildContext context) {
    // Define text style based on the selected font family and other properties
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
      case FontFamily.abeezee: // Handle ABeeZee font
        textStyle = GoogleFonts.aBeeZee(
          fontWeight: fontWeightType.fontWeight,
          color: textColor,
          fontSize: getProportionateScreenHeight(fontSize),
          decoration: decoration,
          decorationColor: decorationColor,
        );
        break;
      case FontFamily.robotoFlex: // Handle Roboto Flex font
        textStyle = GoogleFonts.robotoFlex(
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
      textName, // Display the text
      maxLines: maxLines, // Limit the number of lines
      textAlign: textAlign, // Set text alignment
      overflow: overFlow, // Set overflow behavior
      style: textStyle, // Apply text style
    );
  }
}
