import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/diagnostics/diagnostic_screen.dart';
import 'package:cradenthealth/view/screens/doctor_screens/consultation_doctors.dart';
import 'package:cradenthealth/view/screens/doctor_screens/doctor_details_screen.dart';
import 'package:cradenthealth/view/screens/pharmacy/screens/pharmacy_screens.dart';
import 'package:cradenthealth/view/widgets/doctor_profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecentLookupsWidget extends StatelessWidget {
  String entryFrom;
  RecentLookupsWidget({super.key, required this.entryFrom});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(12)),
            child: InkWell(
                onTap: () {
                  print("fdfdfdfdfd");
                  entryFrom == "Pharmacy"
                      ? Get.to(PharmacyScreens())
                      : entryFrom == "Opticles"
                          ? Get.to(DoctorDetailsScreen(
                              entryFrom: true,
                            ))
                          : entryFrom == "Diagnostics"
                              ? Get.to(DiagnosticScreen())
                              : Get.to(DoctorDetailsScreen());
                },
                child: DoctorProfileDetailsWidget(
                  entryFrom: entryFrom,
                )));
      },
    );
  }
}
