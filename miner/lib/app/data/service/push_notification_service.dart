import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/app_localizations.dart';
import '../../../main.dart';
import '../../theme/app_colors.dart';
import '../../util/app_constant.dart';

class PushNotificationService {
  static final _firebaseMessaging = FirebaseMessaging.instance;


  static Future init() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );


    await _firebaseMessaging.setAutoInitEnabled(true);
    await _firebaseMessaging.subscribeToTopic(AppConstant.notificationTopic);

  }

  static setNotificationStatus() async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setInt(AppConstant.notification, 1);
  }

  static showDialogNotification({required String title, required String body}) {
    var appLocalization = AppLocalizations.of(navigatorKey.currentContext!);
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text(''),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: AppConstant.smallLeft,
                  right: AppConstant.smallLeft,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: AppColors.appTextSuccessColor,
                    fontSize: AppConstant.fontHeaderSize,
                    fontWeight: AppConstant.fontWeight,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: AppConstant.left,
                  right: AppConstant.right,
                ),
                child: Text(
                  body,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(
                    color: AppColors.appFormLabelColor,
                    fontSize: AppConstant.fontSize,
                    fontWeight: AppConstant.fontWeight,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              color: AppColors.appGrayColor,
              padding: EdgeInsets.only(
                  top: AppConstant.top,
                  bottom: AppConstant.top,
                  left: AppConstant.left,
                  right: AppConstant.right),
              child: Text(appLocalization!.ok),
            ),
          )
        ],
      ),
    );
  }

  static checkForMessages() {}
}
