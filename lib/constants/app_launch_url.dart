// url_launcher_helper.dart
import 'package:url_launcher/url_launcher.dart';

class AppLaunchUrl {
  static Future<void> launchWebUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
