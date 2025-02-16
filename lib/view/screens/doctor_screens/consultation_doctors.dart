import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConsultationDoctors extends StatelessWidget {
  String title;
  ConsultationDoctors({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(backgroundColor: AppColors.whiteColor, title: title),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: Column(children: [
          CustomSizedBoxHeight(height: 24),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.redColor,
              ),
              CustomSizedBoxWidth(width: 5),
              Expanded(
                child: CustomText(
                    textName:
                        "Kukatpally, Hyderabad, Housing board colony.....",
                    textColor: AppColors.blackColor,
                    fontWeightType: FontWeightType.regular,
                    fontFamily: FontFamily.poppins,
                    fontSize: 13),
              ),
            ],
          ),
          CustomSizedBoxHeight(height: 16),
          CustomDropdown(
            dropdownItems: [
              'Narasimha',
            ],
            getItemName: (item) => item, // Simply returns the item itself
            getItemId: (item) => item, // ID same as the item in this case
            initialValue: 'Narasimha', // Optional initial value
            hintName: 'Narasimha',

            textColor: Colors.black,
            onChanged: (selectedValue) {
              print('Selected: $selectedValue');
            },
          ),
          CustomSizedBoxHeight(height: 26),
          RecentLookupsWidget(
            entryFrom: title,
          )
        ]),
      )),
    );
  }
}
