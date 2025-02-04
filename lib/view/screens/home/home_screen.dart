import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/home/widgets/blogs_widget.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
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
            ],
          ),
        ),
      ),
    );
  }
}
