import 'package:cradenthealth/constants/app_button.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_dropdown.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_textfields.dart';
import 'package:cradenthealth/constants/app_toast_msgs.dart';
import 'package:cradenthealth/view_model/api_controllers/family_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddFamilyMembers extends StatelessWidget {
  AddFamilyMembers({super.key});

  final _familyController = Get.find<FamilyController>();
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _familyController.DOB.value = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: Column(
              children: [
                CustomSizedBoxHeight(height: 28),
                Inputfield(
                  fillColor: AppColors.secondaryColor,
                  controller: TextEditingController(
                      text: _familyController.fullName.value),
                  label: "Name",
                  keyboardType: TextInputType.text,
                  hinttext: "",
                  onChanged: (value) {
                    _familyController.fullName.value = value!;
                  },
                ),
                CustomSizedBoxHeight(height: 12),
                Inputfield(
                  fillColor: AppColors.secondaryColor,
                  controller: TextEditingController(
                      text: _familyController.mobileNumber.value),
                  label: "Mobile Number",
                  keyboardType: TextInputType.text,
                  hinttext: "",
                  onChanged: (value) {
                    _familyController.mobileNumber.value = value!;
                  },
                ),
                CustomSizedBoxHeight(height: 12),
                Inputfield(
                  fillColor: AppColors.secondaryColor,
                  controller: TextEditingController(
                      text: _familyController.age.value.toString()),
                  label: "Age",
                  keyboardType: TextInputType.number,
                  hinttext: "",
                  onChanged: (value) {
                    _familyController.age.value = int.parse(value!);
                  },
                ),
                CustomSizedBoxHeight(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        dropdownItems: ["Male", "Female"],
                        getItemName: (item) =>
                            item!, // Simply returns the item itself
                        getItemId: (item) =>
                            item, // ID same as the item in this case
                        // initialValue: 'Narasimha', // Optional initial value
                        hintName: 'Gender',

                        textColor: Colors.black,
                        onChanged: (selectedValue) {
                          _familyController.gender.value = selectedValue!;
                          // _familyController.selectedPatientName.value =
                          //     selectedValue!.fullName!;
                          // _familyController.selectedPatientAge.value =
                          //     selectedValue!.age!;
                          // _familyController.selectedPatientGender.value =
                          //     selectedValue!.gender!;

                          // print(
                          //     'Selected: ${_familyController.selectedPatientName.value}');
                        },
                      ),
                      // child: Inputfield(
                      //   fillColor: AppColors.secondaryColor,
                      //   controller: TextEditingController(
                      //       text: _familyController.gender.value),
                      //   label: "Gender",
                      //   keyboardType: TextInputType.text,
                      //   hinttext: "",
                      //   onChanged: (value) {
                      //     _familyController.gender.value = value!;
                      //   },
                      // ),
                    ),
                    CustomSizedBoxWidth(width: 40),
                    Expanded(
                      child: Inputfield(
                        onTap: _pickDate,
                        readOnly: true,
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(
                            text: _familyController.DOB.value),
                        label: "Date of birth",
                        keyboardType: TextInputType.text,
                        hinttext: "",
                        onChanged: (value) {
                          _familyController.DOB.value = value!;
                        },
                      ),
                    ),
                  ],
                ),
                CustomSizedBoxHeight(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(
                            text: _familyController.height.value.toString()),
                        label: "Height",
                        keyboardType: TextInputType.number,
                        hinttext: "",
                        onChanged: (value) {
                          _familyController.height.value = int.parse(value!);
                        },
                      ),
                    ),
                    CustomSizedBoxWidth(width: 40),
                    Expanded(
                      child: Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(
                            text: _familyController.weight.value.toString()),
                        label: "Weight",
                        keyboardType: TextInputType.number,
                        hinttext: "",
                        onChanged: (value) {
                          _familyController.weight.value = int.parse(value!);
                        },
                      ),
                    ),
                  ],
                ),
                CustomSizedBoxHeight(height: 20),
                Inputfield(
                  fillColor: AppColors.secondaryColor,
                  controller: TextEditingController(
                      text: _familyController.relation.value),
                  label: "Relation",
                  keyboardType: TextInputType.text,
                  hinttext: "",
                  onChanged: (value) {
                    _familyController.relation.value = value!;
                  },
                ),
                CustomSizedBoxHeight(height: 20),
                Inputfield(
                  fillColor: AppColors.secondaryColor,
                  controller: TextEditingController(
                      text: _familyController.eyeSight.value),
                  label: "Eye Sight",
                  keyboardType: TextInputType.text,
                  hinttext: "",
                  onChanged: (value) {
                    _familyController.eyeSight.value = value!;
                  },
                ),
                CustomSizedBoxHeight(height: 12),
                Inputfield(
                  fillColor: AppColors.secondaryColor,
                  controller: TextEditingController(
                      text: _familyController.BMI.value.toString()),
                  label: "BMI (Body mass index)",
                  keyboardType: TextInputType.number,
                  hinttext: "",
                  onChanged: (value) {
                    _familyController.BMI.value = double.parse(value!);
                  },
                ),
                CustomSizedBoxHeight(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(
                            text: _familyController.BP.value),
                        label: "BP",
                        keyboardType: TextInputType.text,
                        hinttext: "",
                        onChanged: (value) {
                          _familyController.BP.value = value!;
                        },
                      ),
                    ),
                    CustomSizedBoxWidth(width: 40),
                    Expanded(
                      child: Inputfield(
                        fillColor: AppColors.secondaryColor,
                        controller: TextEditingController(
                            text: _familyController.sugar.value),
                        label: "Sugar",
                        keyboardType: TextInputType.text,
                        hinttext: "",
                        onChanged: (value) {
                          _familyController.sugar.value = value!;
                        },
                      ),
                    ),
                  ],
                ),
                CustomSizedBoxHeight(height: 26),
                Obx(() {
                  return AppButton(
                    width: double.infinity,
                    height: 44,
                    onTap: () {
                      if (_familyController.isLoadingCreateFamilyMember.value)
                        return;

                      String? errorMessage;

                      if (_familyController.fullName.value == "") {
                        errorMessage = "Please enter your full name.";
                      } else if (_familyController.mobileNumber.value == "") {
                        errorMessage = "Please enter a valid mobile number.";
                      } else if (_familyController.age.value <= 0) {
                        errorMessage = "Please enter a valid age.";
                      } else if (_familyController.gender.value == "") {
                        errorMessage = "Please select a gender.";
                      } else if (_familyController.DOB.value == "") {
                        errorMessage = "Please enter the date of birth.";
                      } else if (_familyController.height.value <= 0) {
                        errorMessage = "Please enter a valid height.";
                      } else if (_familyController.weight.value <= 0) {
                        errorMessage = "Please enter a valid weight.";
                      } else if (_familyController.eyeSight.value == "") {
                        errorMessage = "Please enter eye sight.";
                      } else if (_familyController.BMI.value <= 0) {
                        errorMessage = "Please enter a valid BMI.";
                      } else if (_familyController.BP.value == "") {
                        errorMessage = "Please enter BP.";
                      } else if (_familyController.sugar.value == "") {
                        errorMessage = "Please enter sugar level.";
                      } else if (_familyController.relation.value == "") {
                        errorMessage = "Please select a relation.";
                      }

                      if (errorMessage != null) {
                        AppToastMsgs.failedToast("Error", errorMessage);
                      } else {
                        _familyController.createFamilyMember(
                          fullName: _familyController.fullName.value,
                          mobileNumber: _familyController.mobileNumber.value,
                          age: _familyController.age.value.toString(),
                          gender: _familyController.gender.value,
                          DOB: _familyController.DOB.value,
                          height: _familyController.height.value.toString(),
                          weight: _familyController.weight.value.toString(),
                          eyeSight: _familyController.eyeSight.value,
                          BMI: _familyController.BMI.value.toString(),
                          BP: _familyController.BP.value,
                          sugar: _familyController.sugar.value,
                          relation: _familyController.relation.value,
                        );
                      }
                    },
                    hasShadow: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _familyController.isLoadingCreateFamilyMember.value
                            ? Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : SizedBox(),
                        _familyController.isLoadingCreateFamilyMember.value
                            ? CustomSizedBoxWidth(width: 20)
                            : SizedBox(),
                        CustomText(
                          textName: _familyController
                                  .isLoadingCreateFamilyMember.value
                              ? "Creating Family Member..."
                              : "Save",
                          fontSize: _familyController
                                  .isLoadingCreateFamilyMember.value
                              ? 16
                              : 18,
                          fontFamily: FontFamily.poppins,
                          fontWeightType: _familyController
                                  .isLoadingCreateFamilyMember.value
                              ? FontWeightType.regular
                              : FontWeightType.semiBold,
                          textColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
