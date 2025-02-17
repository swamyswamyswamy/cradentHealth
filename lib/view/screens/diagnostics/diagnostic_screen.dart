import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view/screens/pharmacy/screens/pharmacy_payment_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DiagnosticScreen extends StatelessWidget {
  DiagnosticScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: AppColors.whiteColor, title: "Vijaya Diagnostics"),
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
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(22)),
                child: Column(
                  children: [
                    AppButton(
                      backgroundColor: AppColors.whiteColor,
                      child: Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(9)),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: getProportionateScreenHeight(98),
                                width: getProportionateScreenWidth(133),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL0qLy1fo2Uvhti1TexQM137vp8pwBiwmgaIqvDA3q5W_C2XspyH-3ZspOY2BZdFqGCdI&usqp=CAU"))),
                              ),
                              CustomSizedBoxWidth(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                              textName: "CBP",
                                              textColor: AppColors.blackColor,
                                              fontWeightType:
                                                  FontWeightType.semiBold,
                                              fontFamily: FontFamily.poppins,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    CustomSizedBoxHeight(height: 8),
                                    CustomText(
                                        textName:
                                            "A blood test is a laboratory analysis performed on a blood sample that is usually extracted ",
                                        textColor: AppColors.blackColor,
                                        fontWeightType: FontWeightType.regular,
                                        fontFamily: FontFamily.inter,
                                        fontSize: 10),
                                    CustomSizedBoxHeight(height: 4),
                                    Row(
                                      children: [
                                        CustomText(
                                            textName: "₹ 1500",
                                            textColor: AppColors.blackColor,
                                            fontWeightType:
                                                FontWeightType.regular,
                                            fontFamily: FontFamily.poppins,
                                            fontSize: 18),
                                        Spacer(),
                                        AppButton(
                                          onTap: () {
                                            Get.to(PharmacyPaymentScreen(
                                              entryFrom: "Diagnostics",
                                            ));
                                          },
                                          borderRadius: 5,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                    getProportionateScreenHeight(
                                                        4),
                                                horizontal:
                                                    getProportionateScreenWidth(
                                                        21)),
                                            child: CustomText(
                                                textName: "ADD",
                                                textColor: AppColors.whiteColor,
                                                fontWeightType:
                                                    FontWeightType.semiBold,
                                                fontFamily: FontFamily.inter,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomSizedBoxHeight(height: 20),
                    Divider(
                      color: AppColors.blackColor.withOpacity(0.3),
                      height: 0,
                    )
                  ],
                ),
              );
            },
          ),
        ]),
      )),
    );
  }
}
