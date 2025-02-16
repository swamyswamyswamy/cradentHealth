import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/localization/localStrings.dart';
import 'package:cradenthealth/firebaseConfiguration.dart';
import 'package:cradenthealth/localNotifications.dart';
import 'package:cradenthealth/services/dependency_injection.dart';
import 'package:cradenthealth/view/screens/app_bottom_navigation.dart';
import 'package:cradenthealth/view/screens/auth/login_screen.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/drawer_screens/drawer_screen.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_fitness_plans.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  LocalNotification.showNotification(message);
  print('Handling a  message ${message.messageId}');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  DependencyInjection.init(); // Initialize all dependencies here
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor, // Change this to your desired color
      statusBarIconBrightness: Brightness.light, // Light or dark icons
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppMediaquery().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      title: 'HeloMate',
      home: LoginScreen(),
      // builder: EasyLoading.init(),
    );
  }
}
