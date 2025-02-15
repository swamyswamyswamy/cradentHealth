import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view/screens/drawer_screens/family_members/add_family_members.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_fitness_plan_details.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_plan_widget.dart';
import 'package:cradenthealth/view/widgets/person_profile_details_widget.dart';
import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GymFitnessPlans extends StatelessWidget {
  GymFitnessPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 22),
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
              CustomSizedBoxHeight(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(12)),
                      child: InkWell(
                        onTap: (){
                          Get.to(GymFitnessPlanDetails());
                        },
                        child: GymPlanWidget() ),
                    );
                  },
                ),
              ),
              CustomSizedBoxHeight(height: 26),
            ],
          ),
        ));
  }
}
