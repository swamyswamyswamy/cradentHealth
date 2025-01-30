import 'package:intl/intl.dart';

class AppUtilities {
  static String formatDate(String date) {
    // Parse the date string into DateTime
    DateTime parsedDate = DateTime.parse(date);

    // Format the date to 'MMM dd' format
    return DateFormat('MMM dd').format(parsedDate);
  }

  static String getCurrentTime() {
    // Get the current time
    DateTime now = DateTime.now();

    // Format the time as "HH:mm" (24-hour format)
    String formattedTime = DateFormat('HH:mm:ss').format(now);

    return formattedTime;
  }
}
