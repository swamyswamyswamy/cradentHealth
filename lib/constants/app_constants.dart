import 'package:flutter/material.dart';

class AppConstants {
  static const List drawerNamesMale = [
    'Wallet', // New Entry
    'Transactions', // New Entry
    'Ratings & Reviews', // New Entry
    'Past Sessions', // New Entry
    'Delete Account', // New Entry
  ];

  static const List drawerIconsMale = [
    Icons.account_balance_wallet_outlined, // Wallet
    Icons.swap_horiz_outlined, // Transactions
    Icons.star, // Ratings & Reviews
    Icons.history_outlined, // Past Sessions
    Icons.delete_forever_outlined, // Delete Account
  ];
  static const List drawerNamesFemale = [
    'Earnings', // New Entry
    'Refer & Earn', // New Entry
    'KYC', // New Entry
    'Ratings & Reviews', // New Entry
    'Blocked', // New Entry
    'Bank Details', // New Entry
    'Past Sessions', // Existing Entry
    'Delete Account', // Existing Entry
  ];

  static const List drawerIconsFemale = [
    Icons.attach_money_outlined, // Earnings
    Icons.group_add_outlined, // Refer & Earn
    Icons.verified_outlined, // KYC
    Icons.star, // Ratings & Reviews
    Icons.block_outlined, // Blocked
    Icons.account_balance_outlined, // Bank Details
    Icons.history_outlined, // Past Sessions
    Icons.delete_forever_outlined, // Delete Account
  ];
}
