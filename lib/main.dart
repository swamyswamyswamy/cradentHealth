import 'dart:async';

import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_images.dart';
import 'package:cradenthealth/constants/app_mediaquery.dart';
import 'package:cradenthealth/constants/localization/localStrings.dart';
import 'package:cradenthealth/firebaseConfiguration.dart';
import 'package:cradenthealth/localNotifications.dart';
import 'package:cradenthealth/services/dependency_injection.dart';
import 'package:cradenthealth/services/steps_service.dart';
import 'package:cradenthealth/view/screens/app_bottom_navigation.dart';
import 'package:cradenthealth/view/screens/auth/login_screen.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/drawer_screens/drawer_screen.dart';
import 'package:cradenthealth/view/screens/gym_fitness/gym_fitness_plans.dart';
import 'package:cradenthealth/view_model/api_controllers/steps_controller.dart';
import 'package:cradenthealth/view_model/ui_controllers/toke_controller.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // App Lifecycle changes (e.g., paused when in background)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App goes to background
      hitApi();
    }
  }

  // Function to call your API
  Future<void> hitApi() async {
    final _stepsController = Get.find<StepsController>();
    _stepsController.addSteps(steps: _stepsController.steps.toString());
  }

  @override
  Widget build(BuildContext context) {
    AppMediaquery().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      title: 'cradenthealth',
      home: TokenLoader(),
      // builder: EasyLoading.init(),
    );
  }
}

class TokenLoader extends StatefulWidget {
  const TokenLoader({super.key});

  @override
  State<TokenLoader> createState() => _TokenLoaderState();
}

class _TokenLoaderState extends State<TokenLoader> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async {
      _loadTokenAndNavigate();
    });
  }

  Future<void> _loadTokenAndNavigate() async {
    try {
      // Load the token using the TokenController
      String token = await Get.find<TokenController>().loadToken();

      // Navigate based on the token presence
      if (token.isNotEmpty) {
        Future.microtask(() {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AppBottomNavigation()),
          );
        });
      } else {
        Future.microtask(() {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
      }
    } catch (error) {
      // Handle any errors during the token loading process
      // Future.microtask(() {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => ErrorScreen(error: error)),
      //   );
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Image.asset(
          AppImages.appLogo, // Replace with your logo image asset path
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
