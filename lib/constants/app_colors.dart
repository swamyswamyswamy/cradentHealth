import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF000B58);
  static const Color secondaryColor = Color(0xFF003161);

  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF); // White

  static const Color greyColor = Color(0xFFD9D9D9);
  static const Color greyColor1 = Color(0xFFB8B8B8);
  static const Color greyColor2 = Color(0xFFF5F5F5);
  static const Color greencolor = Color(0xFF006A67);
  static const Color litegreenColor = Color(0xFFE6F4EA);
  static const Color redColor = Color(0xFFFF5252);
  static const Color seatredColor = Color(0xFFF4ECEC);
  static const Color greyColor3 = Color(0xFFE5EAEF);
  static const Color yellowColor = Color(0xFFFFCC00);
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
