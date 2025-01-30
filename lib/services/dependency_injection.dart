import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static void init() async {
    // Get.put(TokenController()); //TokenController
    // Get.put(BottomNavigationController());

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final _token = await prefs.getString('accessToken') ?? "";

    await AppTokens().setAccessToken(_token);
    if (_token != "") {
      print("token check${_token}");
      apiInit();
    }
  }

  static void apiInit() async {}

  static resetControllers() {}
}
