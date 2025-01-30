import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToastMsgs {
  // Method to show a success toast
  static void successToast(String title, String message) {
    // Close any existing Snackbar
    if (Get.isSnackbarOpen) {
      Get.back(); // This will close the currently open Snackbar
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green, // Success color
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  // Method to show a failure toast
  static void failedToast(String title, String message) {
    // Close any existing Snackbar
    if (Get.isSnackbarOpen) {
      Get.back(); // This will close the currently open Snackbar
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red, // Failure color
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }
}
