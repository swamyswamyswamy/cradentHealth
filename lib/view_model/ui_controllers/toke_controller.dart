import 'package:cradenthealth/constants/app_tokens.dart';
import 'package:cradenthealth/localNotifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TokenController extends GetxController {
  // final _notificationService = Get.put(NotificationService());
  // final _notificationsController =
  //     Get.put(NotificationsController(Get.find<NotificationService>()));
  Future<String> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // LocalNotification.initialize();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   LocalNotification.showNotification(message);
    //   // _notificationsController.incrementNotificationCount();
    //   print('Handling a  message ${message}');
    // });

    return prefs.getString('accessToken') ?? ''; // Retrieve the token
  }

  fcmtoken() async {
    // Request permission for notifications
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();

    // Check if permission is granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print("User granted permission");
      // AppLoaders.showLoading(
      //     context: context,
      //     note: 'Please wait while we are working on your request.');

      // Retrieve the FCM token
      String? fcmtoken = await FirebaseMessaging.instance.getToken();

      if (fcmtoken != null) {
        // Get.back();
        print("FCM TOKEN : $fcmtoken");

        AppTokens().setFcmToken(fcmtoken);

        // Update the state with the FCM token
      } else {
        print("Failed to get FCM token");
      }
    } else {
      print("User declined or has not accepted permission");
    }
  }

  @override
  void onInit() {
    super.onInit();
    // fcmtoken();
  }
}