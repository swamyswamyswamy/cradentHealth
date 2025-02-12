import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF213555);
  static const Color secondaryColor = Color(0xFFF9F9F9);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF); // White
  static const Color redColor = Color(0xFFE71D36); // White
  static const Color pinkColor = Color(0xFF800080); // White
  static const Color blueColor = Color(0xFF265DCC); // White
  static const Color blue1Color = Color(0xFF0F4E91); // White

  static const Color greyColor = Color(0xFFD9D9D9);
  static const Color greyColor1 = Color(0xFF7F7F7F);
  static const Color greyColor2 = Color(0xFF666666);
  final LinearGradient primaryLinearGradient = const LinearGradient(
    colors: [
      primaryColor,
      secondaryColor
    ], // Transition from primary to secondary color
    begin: Alignment.topLeft, // The gradient starts at the top-left corner
    end: Alignment.bottomRight, // The gradient ends at the bottom-right corner
  );
  final LinearGradient primaryLinearGradientDownToTop = const LinearGradient(
    colors: [
      primaryColor,
      secondaryColor
    ], // Transition from primary to secondary color
    begin: Alignment.topCenter, // The gradient starts at the top-left corner
    end: Alignment.bottomCenter, // The gradient ends at the bottom-right corner
  );
  final LinearGradient whiteLinearGradient = const LinearGradient(
    colors: [
      greyColor,
      greyColor
    ], // Transition from primary to secondary color
    begin: Alignment.topLeft, // The gradient starts at the top-left corner
    end: Alignment.bottomRight, // The gradient ends at the bottom-right corner
  );
  final RadialGradient primaryRadialGradient = const RadialGradient(
    colors: [primaryColor, secondaryColor],
    // stops: [0.5, 1.0], // You can adjust the stops as needed
    center: Alignment(0, 0), // Center of the gradient
    radius: 1.5, // Radius of the gradient
  );

  final LinearGradient primaryGradient1 = const LinearGradient(
    colors: [
      secondaryColor,
      primaryColor,
    ], // Transition from primary to secondary color
    begin: Alignment.topLeft, // The gradient starts at the top-left corner
    end: Alignment.bottomRight, // The gradient ends at the bottom-right corner
  );
}
