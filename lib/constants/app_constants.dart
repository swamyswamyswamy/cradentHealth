import 'package:cradenthealth/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  // Drawer Names
  static const List drawerNames = [
    'Wallet',
    'Bookings',
    'Prescription',
    'Family Members',
    'Support',
  ];

// Drawer Icons
  static const List drawerIcons = [
    Icons.account_balance_wallet_outlined, // Wallet
    Icons.calendar_today_outlined, // Bookings
    Icons.description_outlined, // Prescription
    Icons.group_outlined, // Family Members
    Icons.support_agent_outlined, // Support
  ];

  static const List<Color> randomColors = [
    AppColors.primaryColor,
    AppColors.pinkColor,
    AppColors.redColor,
    AppColors.blackColor,
    Colors.blueAccent,
    Colors.orange,
    Colors.teal,
  ];
}
