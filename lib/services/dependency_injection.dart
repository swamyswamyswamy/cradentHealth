import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/services/auth_service.dart';
import 'package:cradenthealth/view_model/ui_controllers/app_bottom_navigation_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/auth_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/timer_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/toke_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static void init() async {
    Get.put(TokenController());
    Get.put(BottomNavigationController());
    Get.put(TimerController());
    
    Get.put(AuthService());
    Get.put(AuthController(Get.find<AuthService>()));

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
