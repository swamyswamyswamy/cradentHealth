import 'dart:io';

import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cradenthealth/constants/app_base_urls.dart';
import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/services/support_service.dart';
import 'package:cradenthealth/view/screens/drawer_screens/add_support.dart';
import 'package:cradenthealth/view_model/api_controllers/profile_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/support_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddSupport extends StatefulWidget {
  const AddSupport({super.key});

  @override
  State<AddSupport> createState() => _AddSupportState();
}

class _AddSupportState extends State<AddSupport> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  //_upload_image
  File? _upload_image;

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() {
        _upload_image = imageTemporary;
      });
    } on PlatformException {
      print("Exception occured");
    }
  }

  //_upload_image
  String titleD = 'Reason';

  var titleDs = [
    'Reason',
    'Payment Issue',
    'Account Issues',
    'Billing and Payments',
    'Technical Support',
    'Subscription or Service Information',
    'Complaints and Feedback',
    'Cancellation and Returns',
    'General Inquiries',
    'Security Concerns'
  ];

  final _supportController = Get.find<SupportController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          // elevation: 10,
          title: CustomText(
            textName: "Support",
            textColor: AppColors.blackColor,
            fontWeightType: FontWeightType.medium,
            fontFamily: FontFamily.montserrat,
            fontSize: 14,
          ),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBoxHeight(height: 20),
                  const CustomText(
                    textName: "Issue Name",
                    textColor: AppColors.blackColor,
                    fontWeightType: FontWeightType.semiBold,
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                  ),
                  CustomSizedBoxHeight(height: 8),
                  Inputfield(
                    hinttext: "",
                    controller: _titleController,
                  ),
                  CustomSizedBoxHeight(height: 12),
                  const CustomText(
                    textName: "Description",
                    textColor: AppColors.blackColor,
                    fontWeightType: FontWeightType.semiBold,
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                  ),
                  CustomSizedBoxHeight(height: 8),
                  Inputfield(
                    hinttext: "",
                    controller: _descriptionController,
                  ),
                  CustomSizedBoxHeight(height: 20),
                  InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: _upload_image == null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                                height: 46,
                                width: 135,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.blackColor
                                              .withOpacity(.1),
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: AppColors.blackColor
                                              .withOpacity(.05),
                                          offset: const Offset(-1, -1),
                                          blurRadius: 0,
                                          spreadRadius: 0)
                                    ],
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Upload",
                                      style: TextStyle(
                                          fontFamily: "IntR",
                                          color: AppColors.blackColor,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // Text(
                                    //   "Image",
                                    //   style: TextStyle(
                                    //       fontFamily: "IntR",
                                    //       color: black,
                                    //       fontSize: 13),
                                    // ),
                                    Icon(
                                      Icons.upload,
                                      color: AppColors.redColor,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      // fit: BoxFit.fill,
                                      image: FileImage(
                                _upload_image!,
                              ))),
                            ),
                          ),
                  ),
                  CustomSizedBoxHeight(height: 20),
                  AppButton(
                    width: double.infinity,
                    height: 44,
                    onTap: () {
                      if (_supportController.isLoadingAddSupport.value)
                        return null;
                      final fields = {
                        "Title": _titleController.text,
                        "Description": _descriptionController.text,
                      };

                      // Check for empty fields
                      for (var entry in fields.entries) {
                        if (entry.value.isEmpty) {
                          AppToastMsgs.failedToast("Validation Error",
                              "Please fill out the ${entry.key} field.");
                          return;
                        }
                      }

                      // Check for image upload separately
                      if (_upload_image == null) {
                        AppToastMsgs.failedToast("Validation Error",
                            "Please upload the issue image");
                        return;
                      }

                      // Only call the API if all checks are passed
                      _supportController.addSupport(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        image: _upload_image!.path,
                      );

                      // Get.to(DashBoardScreen());
                    },
                    hasShadow: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !_supportController.isLoadingAddSupport.value
                            ? SizedBox()
                            : Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                        !_supportController.isLoadingAddSupport.value
                            ? SizedBox()
                            : CustomSizedBoxWidth(width: 20),
                        CustomText(
                          textName: _supportController.isLoadingAddSupport.value
                              ? "isLoading....."
                              : "Submit",
                          fontSize: 16,
                          // textAlign: TextAlign.center,
                          fontFamily: FontFamily.robotoFlex,
                          fontWeightType:
                              _supportController.isLoadingAddSupport.value
                                  ? FontWeightType.regular
                                  : FontWeightType.semiBold,
                          textColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                  CustomSizedBoxHeight(height: 20)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
