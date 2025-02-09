import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/categories_screens.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: CustomText(
                    textName: "Categories",
                    textColor: AppColors.blackColor,
                    fontWeightType: FontWeightType.semiBold,
                    fontFamily: FontFamily.montserrat,
                    fontSize: 16),
              ),
              CustomSizedBoxHeight(height: 16),
              IntrinsicHeight(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: 43,
                              left: getProportionateScreenWidth(
                                  index != 0 ? 0 : 16),
                              bottom: getProportionateScreenHeight(10),
                              top: getProportionateScreenHeight(10)),
                          child: InkWell(
                            onTap: () {
                              Get.to(CategoriesScreens());
                            },
                            child: Container(
                              width: getProportionateScreenWidth(81),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        color: AppColors.blackColor
                                            .withOpacity(0.25))
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(10),
                                    vertical: getProportionateScreenHeight(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    index == 2
                                        ? SizedBox()
                                        : Image.asset(
                                            AppImages.forgotImage,
                                            height:
                                                getProportionateScreenHeight(
                                                    60),
                                            width:
                                                getProportionateScreenWidth(60),
                                          ),
                                    index == 2
                                        ? SizedBox()
                                        : CustomSizedBoxHeight(height: 8),
                                    index == 2
                                        ? CustomText(
                                            textName: "View\nMore >>",
                                            textColor: AppColors.blackColor,
                                            fontWeightType:
                                                FontWeightType.semiBold,
                                            fontFamily: FontFamily.montserrat,
                                            fontSize: 10)
                                        : CustomText(
                                            textName: "Diagnostics",
                                            textColor: AppColors.blackColor,
                                            fontWeightType:
                                                FontWeightType.medium,
                                            fontFamily: FontFamily.montserrat,
                                            fontSize: 8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    )),
              ),
              CustomSizedBoxHeight(height: 41),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        textName: "Recent lookups",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.montserrat,
                        fontSize: 16),
                    CustomSizedBoxHeight(height: 16),
                    RecentLookupsWidget(),
                    CustomSizedBoxHeight(height: 16),
                    CustomText(
                        textName: "Blogs",
                        textColor: AppColors.blackColor,
                        fontWeightType: FontWeightType.semiBold,
                        fontFamily: FontFamily.montserrat,
                        fontSize: 16),
                    CustomSizedBoxHeight(height: 16),
                    BlogsWidget(),
                    CustomSizedBoxHeight(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
