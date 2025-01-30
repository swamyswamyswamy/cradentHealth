import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSizedBoxHeight extends StatelessWidget {
  CustomSizedBoxHeight({super.key, required this.height});
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
    );
  }
}

class CustomSizedBoxWidth extends StatelessWidget {
  CustomSizedBoxWidth({super.key, required this.width});
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
    );
  }
}
