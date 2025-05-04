import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/view/screens/doctor_screens/doctor_details_screen.dart';
import 'package:cradenthealth/view/screens/home/widgets/recent_lookups_widget.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogsWidget extends StatefulWidget {
  BlogsWidget({super.key});

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  final _doctorsController = Get.find<DoctorsController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _doctorsController.fetchDoctorsBlogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _doctorsController.isLoadingDoctorsBlogs.value
          ? SizedBox()
          : IntrinsicHeight(
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      _doctorsController.blogResponse.value.blogs!.length,
                      (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: InkWell(
                        onTap: () {
                          Get.to(DoctorDetailsScreen(
                            blogDetails: true,
                            doctorDetails: _doctorsController
                                .blogResponse.value.blogs![index].doctor!,
                          ));
                        },
                        child: Stack(
                          children: [
                            AppButton(
                              width: 308,
                              borderColor:
                                  AppColors.primaryColor.withOpacity(0.2),
                              backgroundColor: AppColors.whiteColor,
                              borderRadius: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 139,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(AppBaseUrls
                                                        .baseUrl
                                                        .substring(
                                                            0,
                                                            AppBaseUrls.baseUrl
                                                                    .length -
                                                                1) +
                                                    _doctorsController
                                                        .blogResponse
                                                        .value
                                                        .blogs![index]
                                                        .doctor!
                                                        .image!)),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                10)),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  color: AppColors.whiteColor),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        getProportionateScreenWidth(
                                                            3),
                                                    vertical:
                                                        getProportionateScreenHeight(
                                                            3)),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .person_outline_rounded,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              15),
                                                    ),
                                                    CustomSizedBoxWidth(
                                                        width: 5),
                                                    CustomText(
                                                        textName:
                                                            _doctorsController
                                                                .blogResponse
                                                                .value
                                                                .blogs![index]
                                                                .doctor!
                                                                .name!,
                                                        textColor: AppColors
                                                            .blackColor,
                                                        fontWeightType:
                                                            FontWeightType
                                                                .regular,
                                                        fontFamily:
                                                            FontFamily.poppins,
                                                        fontSize: 9),
                                                    CustomSizedBoxWidth(
                                                        width: 3),
                                                    Container(
                                                      height: 15,
                                                      width: 1,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                    CustomSizedBoxWidth(
                                                        width: 5),
                                                    Icon(
                                                      Icons.date_range_outlined,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              15),
                                                    ),
                                                    CustomSizedBoxWidth(
                                                        width: 5),
                                                    CustomText(
                                                        textName:
                                                            _doctorsController
                                                                .blogResponse
                                                                .value
                                                                .blogs![index]
                                                                .createdAt!,
                                                        textColor: AppColors
                                                            .blackColor,
                                                        fontWeightType:
                                                            FontWeightType
                                                                .regular,
                                                        fontFamily:
                                                            FontFamily.poppins,
                                                        fontSize: 9),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                    alignment: Alignment.bottomLeft,
                                  ),
                                  CustomSizedBoxHeight(height: 11),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenWidth(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            textName: _doctorsController
                                                .blogResponse
                                                .value
                                                .blogs![index]
                                                .title!,
                                            textColor: AppColors.primaryColor,
                                            fontWeightType:
                                                FontWeightType.semiBold,
                                            fontFamily: FontFamily.poppins,
                                            fontSize: 15),
                                        CustomSizedBoxHeight(height: 2),
                                        CustomText(
                                            textName: _doctorsController
                                                .blogResponse
                                                .value
                                                .blogs![index]
                                                .description!,
                                            textColor: AppColors.blackColor
                                                .withOpacity(0.6),
                                            fontWeightType:
                                                FontWeightType.regular,
                                            fontFamily: FontFamily.poppins,
                                            fontSize: 12),
                                        CustomSizedBoxHeight(height: 20)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.only(
                            //           topLeft: Radius.circular(10),
                            //           bottomRight: Radius.circular(10)),
                            //       color: AppColors.primaryColor),
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: getProportionateScreenWidth(4),
                            //         vertical: getProportionateScreenHeight(8)),
                            //     child: CustomText(
                            //         textName: "Read more >>",
                            //         textColor: AppColors.whiteColor,
                            //         fontWeightType: FontWeightType.medium,
                            //         fontFamily: FontFamily.poppins,
                            //         fontSize: 12),
                            //   ),
                            // )
                          ],
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                    );
                  }),
                  // children: [
                  //
                  // ],
                ),
              ),
            );
    });
  }
}
