import 'dart:convert';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Simulated API JSON (normally fetched from network)
  final String mockJson = '''
  {
    "filters": {
      "Department": [
        {"id": "1", "name": "Anesthesiology"},
        {"id": "2", "name": "Cardiology"},
        {"id": "3", "name": "ENT"}
      ],
      "Sort By": [
        {"id": "1", "name": "Relevance"},
        {"id": "2", "name": "Rating"},
        {"id": "3", "name": "Experience"}
      ],
      "Consultation": [
        {"id": "1", "name": "In-Person"},
        {"id": "2", "name": "Video Call"},
        {"id": "3", "name": "Chat"}
      ],
      "Price": [
        {"id": "1", "name": "₹0 - ₹499"},
        {"id": "2", "name": "₹500 - ₹999"},
        {"id": "3", "name": "₹1000+"}
      ]
    }
  }
  ''';

  Map<String, dynamic> filters = {};
  String selectedCategory = 'Department';

  // Selected filter values
  Map<String, String?> selectedValues = {
    'Department': null,
    'Sort By': null,
    'Consultation': null,
    'Price': null,
  };
  final _doctorsController = Get.find<DoctorsController>();
  @override
  void initState() {
    super.initState();
    final decoded = json.decode(mockJson);
    filters = decoded['filters'];
    _doctorsController.fetchDoctorFilterCategories();
  }

  void clearFilters() {
    setState(() {
      selectedValues.updateAll((key, value) => null);
    });
  }

  void applyFilters() {
    // print("Selected Filters:${selectedValues}");
    // print("Selected Filters:${selectedValues['Department']}");
    // selectedValues.forEach((key, value) {
    //   print("$key: $value");
    // });
    Get.back();
    _doctorsController.fetctDoctors(
        categories: selectedValues['Department'] ?? "",
        consultationTypes: selectedValues['Consultation'] ?? "",
        consultation_fee: selectedValues['Price'] ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // final subCategories = _doctorsController
      //     .doctorCategoryFilterResponse.value.department as List<dynamic>;

      return _doctorsController.isLoadingDoctorsFilterCategory.value
          ? CircularProgressIndicator()
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSizedBoxHeight(height: 30),
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side main categories
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: filters.keys.map((category) {
                          final isSelected = category == selectedCategory;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                category,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color:
                                      isSelected ? Colors.blue : Colors.black,
                                  decoration: isSelected
                                      ? TextDecoration.underline
                                      : null,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 24),
                      const VerticalDivider(thickness: 1),
                      const SizedBox(width: 16),

                      // Right side subcategories
                      Expanded(
                        child: Column(
                          children: (selectedCategory == "Department"
                                  ? _doctorsController
                                      .doctorCategoryFilterResponse
                                      .value
                                      .department!
                                  : selectedCategory == "Sort By"
                                      ? _doctorsController
                                          .doctorCategoryFilterResponse
                                          .value
                                          .sortBy!
                                      : selectedCategory == "Consultation"
                                          ? _doctorsController
                                              .doctorCategoryFilterResponse
                                              .value
                                              .consultation!
                                          : _doctorsController
                                              .doctorCategoryFilterResponse
                                              .value
                                              .price!)
                              .map((item) {
                            final name = item.name;
                            return RadioListTile<String>(
                              title: Text(name!),
                              value: name,
                              groupValue: selectedValues[selectedCategory],
                              activeColor: Colors.black,
                              onChanged: (value) {
                                setState(() {
                                  selectedValues[selectedCategory] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: clearFilters,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text("Clear filters X"),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: applyFilters,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                        ),
                        child: const Text("Apply"),
                      ),
                    ],
                  ),
                  CustomSizedBoxHeight(height: 30),
                ],
              ),
            );
    });
  }
}
