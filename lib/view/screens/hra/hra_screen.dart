import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view_model/api_controllers/hra_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HraScreen extends StatefulWidget {
  const HraScreen({super.key});

  @override
  State<HraScreen> createState() => _HraScreenState();
}

class _HraScreenState extends State<HraScreen> {
  final _hraController = Get.find<HraController>();

  @override
  void initState() {
    super.initState();
    _hraController.fetchHraQuestions();
  }

  // Map<QuestionId, SelectedAnswer>
  final Map<String, String> selectedAnswers = {};
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
    final List<Map<String, dynamic>> formattedOutput = [];

    final sections = _hraController.assessmentResponse.value.sections!;
    for (var section in sections) {
      final sectionId = section.sectionId!;
      for (var question in section.questions!) {
        final questionId = question.questionId!;
        final selected = selectedAnswers[questionId];
        if (selected != null) {
          formattedOutput.add({
            "sectionId": sectionId,
            "questionId": questionId,
            "selectedAnswer": selected,
          });
        }
      }
    }

    debugPrint("Formatted Answer Array:\n$formattedOutput");

    _hraController.addHraQuestions(answers: formattedOutput);
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
        return _hraController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
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

                      final questionId = question.questionId!;
                      final options = question.options as List<String>;
                      final selected = selectedAnswers[questionId];

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
                                  selectedAnswers[questionId] = value!;
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
            ? const SizedBox()
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
