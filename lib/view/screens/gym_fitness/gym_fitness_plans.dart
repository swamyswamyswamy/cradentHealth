import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/view/screens/drawer_screens/family_members/add_family_members.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
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
                CustomSizedBoxHeight(height: 12),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                      textName: "100\$",
                                      textColor: AppColors.primaryColor,
                                      fontWeightType: FontWeightType.semiBold,
                                      fontFamily: FontFamily.poppins,
                                      fontSize: 20),
                                  CustomSizedBoxWidth(width: 11)
                                ],
                              ),
                              CustomSizedBoxHeight(height: 20),
                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            getProportionateScreenHeight(20)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(
                                              getProportionateScreenHeight(2)),
                                          height:
                                              getProportionateScreenHeight(20),
                                          width:
                                              getProportionateScreenWidth(20),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.primaryColor),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Container(
                                            height:
                                                getProportionateScreenHeight(
                                                    20),
                                            width:
                                                getProportionateScreenWidth(20),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor),
                                            child: Icon(
                                              Icons.done,
                                              color: AppColors.whiteColor,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                        CustomSizedBoxWidth(width: 14),
                                        Expanded(
                                          child: CustomText(
                                              textName:
                                                  "High World Limit for  Questions & answers",
                                              textColor: AppColors.primaryColor,
                                              fontWeightType:
                                                  FontWeightType.regular,
                                              fontFamily: FontFamily.poppins,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                CustomSizedBoxHeight(height: 26),
              ],
            ),
          ),
        ));
  }
}
