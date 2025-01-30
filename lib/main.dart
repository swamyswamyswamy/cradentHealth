import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/localization/localStrings.dart';
import 'package:cradenthealth/firebaseConfiguration.dart';
import 'package:cradenthealth/localNotifications.dart';
import 'package:cradenthealth/services/dependency_injection.dart';
import 'package:cradenthealth/view/screens/login_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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

  // Enable Crashlytics
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  DependencyInjection.init(); // Initialize all dependencies here

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

// class TokenLoader extends StatelessWidget {
//   const TokenLoader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: Get.find<TokenController>().loadToken(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//                 child:
//                     CircularProgressIndicator()), // Consider replacing with a splash screen
//           );
//         } else if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(child: Text("Error loading token: ${snapshot.error}")),
//           ); // More informative error message
//         } else {
//           // Navigate based on token presence
//           if (snapshot.data != null && snapshot.data!.isNotEmpty) {
//             return const AppBottomNavigation(); // Navigate to HomeScreen if token exists
//           } else {
//             return const IntroScreen(); // Navigate to IntroScreen if no token
//           }
//         }
//       },
//     );
//   }
// }