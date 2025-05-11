import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FilterPage(),
    debugShowCheckedModeBanner: false,
  ));
}

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

  @override
  void initState() {
    super.initState();
    final decoded = json.decode(mockJson);
    filters = decoded['filters'];
  }

  void clearFilters() {
    setState(() {
      selectedValues.updateAll((key, value) => null);
    });
  }

  void applyFilters() {
    print("Selected Filters:");
    selectedValues.forEach((key, value) {
      print("$key: $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    final subCategories = filters[selectedCategory] as List<dynamic>;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected ? Colors.blue : Colors.black,
                              decoration:
                                  isSelected ? TextDecoration.underline : null,
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
                      children: subCategories.map((item) {
                        final name = item['name']!;
                        return RadioListTile<String>(
                          title: Text(name),
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
            ],
          ),
        ),
      ),
    );
  }
}
