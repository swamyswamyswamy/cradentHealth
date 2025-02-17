import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/pharmacy/screens/pharmacy_payment_screen.dart';
import 'package:cradenthealth/view_model/ui_controllers/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PharmacyScreens extends StatelessWidget {
  PharmacyScreens({super.key});
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.whiteColor,
        title: "Apollo Pharmacy",
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: Column(
            children: [
              CustomSizedBoxHeight(height: 20),
              Container(
                height: 159, // Adjust height as needed

                child: PageView.builder(
                  controller: _homeController.pageController,
                  itemCount: 3, // Number of pages
                  onPageChanged: _homeController.onPageChanged,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://img.freepik.com/free-vector/pharmaceutical-medicine-healthcare-template-vector-presentation_53876-117796.jpg",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10), // Space between carousel and indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width:
                          _homeController.currentPage.value == index ? 18 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _homeController.currentPage.value == index
                            ? AppColors.primaryColor
                            : AppColors.whiteColor, // Use desired color
                      ),
                    ),
                  );
                }),
              ),
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
              Column(
                children: List.generate(8, (rowIndex) {
                  return Row(
                    children: List.generate(2, (colIndex) {
                      final index = (rowIndex * 2) + colIndex;
                      if (index < 8) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenHeight(
                                    colIndex != 1 ? 0 : 16),
                                right: getProportionateScreenHeight(
                                    colIndex == 1 ? 0 : 16),
                                bottom: getProportionateScreenWidth(26)),
                            child: Container(
                              // height: 70,\
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                // boxShadow: [
                                //   BoxShadow(
                                //       offset: Offset(2, 2),
                                //       blurRadius: 4,
                                //       spreadRadius: 0,
                                //       color:
                                //           AppColors.blackColor.withOpacity(0.25))
                                // ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(121),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://www.shutterstock.com/image-photo/variety-medicines-drugsmedicine-healthcare-concept-260nw-2505906047.jpg")),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  CustomSizedBoxHeight(height: 12),
                                  CustomText(
                                      textName: "Paracetamol 650",
                                      textColor: AppColors.blackColor,
                                      fontWeightType: FontWeightType.regular,
                                      fontFamily: FontFamily.inter,
                                      fontSize: 11),
                                  CustomSizedBoxHeight(height: 5),
                                  Row(
                                    children: [
                                      CustomText(
                                          textName: "₹ 1500",
                                          textColor: AppColors.blackColor
                                              .withOpacity(0.6),
                                          fontWeightType: FontWeightType.medium,
                                          fontFamily: FontFamily.inter,
                                          fontSize: 7),
                                      CustomSizedBoxWidth(width: 6),
                                      CustomText(
                                          textName: "₹ 1500",
                                          textColor: AppColors.blue1Color,
                                          fontWeightType:
                                              FontWeightType.semiBold,
                                          fontFamily: FontFamily.inter,
                                          fontSize: 10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AppButton(
                                        onTap: () {
                                          Get.to(PharmacyPaymentScreen(
                                            entryFrom: "Pharmacy",
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
                            ),
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
