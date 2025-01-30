import 'package:cradenthealth/localNotifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language_Screen extends StatefulWidget {
  const Language_Screen({super.key});

  @override
  State<Language_Screen> createState() => _Language_ScreenState();
}

class _Language_ScreenState extends State<Language_Screen> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': const Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
  ];

  void fcm() async {
    String? fcmtoken = await FirebaseMessaging.instance.getToken();

    print(
        "<-------------------- FCM TOKEN : $fcmtoken ----------------------------->");
  }

  @override
  void initState() {
    super.initState();
    // requestPermissions();
    fcm();
    LocalNotification.initialize();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotification.showNotification(message);
    });
  }

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Your Language'),
            content: SizedBox(
              width: 300,
              height: 500,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title'.tr),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello'.tr,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'message'.tr,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'subscribe'.tr,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  buildLanguageDialog(context);
                },
                child: Text(
                  'changelang'.tr,
                  style: const TextStyle(fontFamily: "IntS"),
                )),
          ],
        ));
  }
}
