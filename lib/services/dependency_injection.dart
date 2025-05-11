import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/services/auth_service.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/doctor_service.dart';
import 'package:cradenthealth/services/family_service.dart';
import 'package:cradenthealth/services/hra_service.dart';
import 'package:cradenthealth/services/profile_service.dart';
import 'package:cradenthealth/services/steps_service.dart';
import 'package:cradenthealth/services/support_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:cradenthealth/view_model/api_controllers/diagnostics_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/doctors_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/family_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/hra_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/profile_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/steps_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/support_controller.dart';
import 'package:cradenthealth/view_model/api_controllers/wallet_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/app_bottom_navigation_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/auth_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/imagepicker_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/timer_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/toke_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static void init() async {
    Get.put(TokenController());
    Get.put(BottomNavigationController());
    Get.put(TimerController());
    Get.put(ImagePickerController());

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
    Get.put(ProfileService());
    Get.put(ProfileController(Get.find<ProfileService>()));
    Get.put(FamilyService());
    Get.put(FamilyController(Get.find<FamilyService>()));
    Get.put(DoctorService());
    Get.put(DoctorsController(Get.find<DoctorService>()));
    Get.put(SupportService());
    Get.put(SupportController(Get.find<SupportService>()));
    Get.put(HraService());
    Get.put(HraController(Get.find<HraService>()));
     Get.put(StepsService());
 Get.put(StepsController(Get.find<StepsService>()));
  }

  static resetControllers() {}
}
