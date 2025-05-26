import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/hra/hra_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HealthAssessmentIntroScreen extends StatelessWidget {
  const HealthAssessmentIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Welcome to Your \nHealth Risk Assessment!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1FBBA6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "This quick check-in is your personal snapshot of well-being—simple, informative, and designed to spark small changes that add up over time.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Everyone’s health journey is unique. Underlying conditions, lifestyle, and how your body responds all play a part. Use these insights as a guide to take one healthy step at a time.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "By answering a few questions about your lifestyle, activity levels, sleep, nutrition, and general well-being, you'll gain insights that can help guide healthier choices.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Why Take This Assessment?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                          "✅ Identify lifestyle factors that may affect your health",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 6),
                      Text(
                          "✅ Discover areas where small changes can make a big difference",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 6),
                      Text(
                          "✅ Empower yourself with knowledge to take control of your well-being",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 24),
                      Text(
                        "Note: This is not a medical diagnosis. It’s an educational tool to highlight areas where a few tweaks—like tweaking your sleep routine or adding a short walk—can make a big difference.",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1FBBA6),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.to(HraScreen());
                    // Navigate to the next step
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
