import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/services/auth_service.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/wallet_controller.dart';
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
    final _userId = await prefs.getString('userId') ?? "";

    await AppTokens().setAccessToken(_token);
    await AppTokens().setuserId(_userId);
    if (_token != "") {
      print("token check${_token}");
      apiInit();
    }
  }

  static void apiInit() async {
    Get.put(DiagnosticService());
    Get.put(DiagnosticsController(Get.find<DiagnosticService>()));
    Get.put(WalletService());
    Get.put(WalletController(Get.find<WalletService>()));
  }

  static resetControllers() {}
}
