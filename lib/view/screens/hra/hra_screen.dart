// import 'package:cradenthealth/constants/app_button.dart';
// import 'package:cradenthealth/constants/app_colors.dart';
// import 'package:cradenthealth/constants/app_dropdown.dart';
// import 'package:cradenthealth/constants/app_images.dart';
// import 'package:cradenthealth/constants/app_mediaquery.dart';
// import 'package:cradenthealth/constants/app_sizedbox.dart';
// import 'package:cradenthealth/constants/app_text.dart';
// import 'package:cradenthealth/constants/app_textfields.dart';
// import 'package:cradenthealth/constants/appbar_component.dart';
// import 'package:cradenthealth/view_model/ui_controllers/bookings_controller.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class HraScreen extends StatelessWidget {
//   String title;
//   HraScreen({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar(
//           backgroundColor: AppColors.whiteColor,
//           title: title,
//         ),
//         backgroundColor: AppColors.whiteColor,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenWidth(16)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomSizedBoxHeight(height: 28),
//                 CustomDropdown(
//                   dropdownItems: [
//                     'Narasimha',
//                   ],
//                   getItemName: (item) => item, // Simply returns the item itself
//                   getItemId: (item) => item, // ID same as the item in this case
//                   initialValue: 'Narasimha', // Optional initial value
//                   hintName: 'Narasimha',

//                   textColor: Colors.black,
//                   onChanged: (selectedValue) {
//                     print('Selected: $selectedValue');
//                   },
//                 ),
//                 CustomSizedBoxHeight(height: 24),
//                 CustomText(
//                     textName: "Skin Problem",
//                     textColor: AppColors.blackColor,
//                     fontWeightType: FontWeightType.medium,
//                     fontFamily: FontFamily.poppins,
//                     fontSize: 14),
//                 CustomSizedBoxHeight(height: 19),
//                 Inputfield(
//                     fillColor: AppColors.secondaryColor,
//                     controller: TextEditingController(),
//                     // maxLength: 10,
//                     label: "Name",
//                     keyboardType: TextInputType.text,
//                     hinttext: ""),
//                 CustomSizedBoxHeight(height: 12),
//                 Inputfield(
//                     fillColor: AppColors.secondaryColor,
//                     controller: TextEditingController(),
//                     // maxLength: 10,
//                     label: "Mobile Number",
//                     keyboardType: TextInputType.text,
//                     hinttext: ""),
//                 CustomSizedBoxHeight(height: 58),
//                 AppButton(
//                   height: 44,
//                   onTap: () {
//                     // Get.to(OtpVerificationScreen());
//                   },
//                   hasShadow: true,
//                   label: "Submit",
//                 ),
//                 CustomSizedBoxHeight(height: 30),
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/hra_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HraScreen extends StatefulWidget {
  const HraScreen({super.key});

  @override
  State<HraScreen> createState() => _HraScreenState();
}

class _HraScreenState extends State<HraScreen> {
  // Sample JSON data
  final _hraController = Get.find<HraController>();
  @override
  void initState() {
    super.initState();
    _hraController.fetchHraQuestions();
  }
  // final List<Map<String, dynamic>> sections = [
  //   {
  //     "sectionTitle": "Section 1",
  //     "questions": [
  //       {
  //         "questionText": "What is your favorite color?",
  //         "options": ["Red", "Green", "Blue"]
  //       },
  //       {
  //         "questionText": "What is your favorite fruit?",
  //         "options": ["Apple", "Banana", "Orange"]
  //       }
  //     ]
  //   },
  //   {
  //     "sectionTitle": "Section 2",
  //     "questions": [
  //       {
  //         "questionText": "What is your favorite animal?",
  //         "options": ["Dog", "Cat", "Elephant"]
  //       },
  //       {
  //         "questionText": "What is your favorite sport?",
  //         "options": ["Football", "Cricket", "Basketball"]
  //       }
  //     ]
  //   },
  // ];

  final Map<int, Map<int, String>> selectedAnswers = {};
  int currentSectionIndex = 0;

  void _goToNextSection() {
    if (currentSectionIndex <
        _hraController.assessmentResponse.value.sections!.length - 1) {
      setState(() {
        currentSectionIndex++;
      });
    }
  }

  void _goToPreviousSection() {
    if (currentSectionIndex > 0) {
      setState(() {
        currentSectionIndex--;
      });
    }
  }

  void _showResults() {
    // Convert selectedAnswers to desired array format
    final List<Map<String, dynamic>> formattedOutput = [];

    selectedAnswers.forEach((sectionId, questionsMap) {
      questionsMap.forEach((questionId, answer) {
        formattedOutput.add({
          "sectionId": sectionId,
          "questionId": questionId,
          "selectedAnswer": answer,
        });
      });
    });

    debugPrint("Formatted Answer Array:\n$formattedOutput");

    _hraController.addHraQuestions(answers: formattedOutput);
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: const Text("Selected Answers"),
    //     content: SingleChildScrollView(child: Text(formattedOutput.toString())),
    //     actions: [
    //       TextButton(
    //           onPressed: () => Navigator.pop(context), child: const Text("OK")),
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.whiteColor,
        title: "HRA",
      ),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        // final section = _hraController
        //     .assessmentResponse.value.sections![currentSectionIndex];
        // final questions = _hraController
        //     .assessmentResponse.value.sections![currentSectionIndex].questions! as List;
        return _hraController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Center(
                      child: CustomText(
                          textName: _hraController.assessmentResponse.value
                              .sections![currentSectionIndex].sectionName!,
                          textColor: AppColors.primaryColor,
                          fontWeightType: FontWeightType.semiBold,
                          fontFamily: FontFamily.poppins,
                          fontSize: 18),
                    ),
                    CustomSizedBoxHeight(height: 20),
                    ...List.generate(
                        _hraController
                            .assessmentResponse
                            .value
                            .sections![currentSectionIndex]
                            .questions!
                            .length, (questionIndex) {
                      final question = _hraController
                          .assessmentResponse
                          .value
                          .sections![currentSectionIndex]
                          .questions![questionIndex];
                      final options = question.options as List<String>;
                      final selected =
                          selectedAnswers[currentSectionIndex]?[questionIndex];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.question!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          ...options.map((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selectedAnswers[currentSectionIndex] ??= {};
                                  selectedAnswers[currentSectionIndex]![
                                      questionIndex] = value!;
                                });
                              },
                            );
                          }).toList(),
                          const Divider(),
                        ],
                      );
                    }),
                  ],
                ),
              );
      }),
      bottomNavigationBar: Obx(() {
        return _hraController.isLoading.value
            ? SizedBox()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: currentSectionIndex == 0
                          ? null
                          : _goToPreviousSection,
                      child: const Text("Previous"),
                    ),
                    if (currentSectionIndex <
                        _hraController
                                .assessmentResponse.value.sections!.length -
                            1)
                      ElevatedButton(
                        onPressed: _goToNextSection,
                        child: const Text("Next"),
                      )
                    else
                      ElevatedButton(
                        onPressed: _showResults,
                        child: const Text("Submit"),
                      ),
                  ],
                ),
              );
      }),
    );
  }
}
