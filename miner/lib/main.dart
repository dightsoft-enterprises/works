import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:miner/app/modules/splash/splash_screen_view.dart';
import 'package:miner/app/util/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/service/app_service_binding.dart';
import 'app/data/service/push_notification_service.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    await PushNotificationService.setNotificationStatus();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceBinding.initServices();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotificationService.init();


 // final fcmToken = await FirebaseMessaging.instance.getToken(); print(fcmToken);

  // Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  // on background notification tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      Get.toNamed(Routes.NOTIFICATION);
    }
  });

// to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

    if (message.notification != null) {
      await PushNotificationService.setNotificationStatus();
      PushNotificationService.showDialogNotification(
          title: message.notification!.title!,
          body: message.notification!.body!);
    }
  });

  runApp(
    GetMaterialApp(
        home: const SplashScreenView(),
        title: "Application",
        // initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale('en', 'US'),
        locale: Get.deviceLocale,
        theme: AppTheme.appThemeData,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppConstant.supportedLocales,
        localeListResolutionCallback: (locales, appSupportedLocales) {
          for (Locale locale in locales!) {
            // if device language is supported by the app,
            // just return it to set it as current app language
            if (appSupportedLocales.contains(locale)) {
              return locale;
            }
          }

          // if device language is not supported by the app,
          // the app will set it to english but return this to set to Bahasa instead
          return AppConstant.supportedLocales.first;
        },
        navigatorKey: navigatorKey,
        onReady: PushNotificationService.checkForMessages()),
  );
}
