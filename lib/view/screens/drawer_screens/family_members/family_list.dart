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

class FamilyList extends StatelessWidget {
  FamilyList({super.key});

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
                AppButton(
                  onTap: () {
                    Get.to(AddFamilyMembers());
                  },
                  borderRadius: 5,
                  backgroundColor: AppColors.secondaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: Row(
                      children: [
                        AppButton(
                          width: 48,
                          borderRadius: 3,
                          height: 39,
                          child: Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        CustomSizedBoxWidth(width: 16),
                        CustomText(
                            textName: "Add your family members",
                            textColor: AppColors.primaryColor,
                            fontWeightType: FontWeightType.semiBold,
                            fontFamily: FontFamily.poppins,
                            fontSize: 19),
                      ],
                    ),
                  ),
                ),
                CustomSizedBoxHeight(height: 12),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(20)),
                      child: PersonProfileDetailsWidget(),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
