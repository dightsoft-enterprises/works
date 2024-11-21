import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../routes/app_pages.dart';
import '../theme/app_colors.dart';

class AppHelper {

  static String status(status) {
    if (status != null && status == 1) {
      return 'active'.tr;
    }
    return 'expired'.tr;
  }

  static formatDate(String date) {
    return DateTime.parse(date);
  }

  static generateDate() {
    var dateStr = DateTime.now();
    return DateTime.utc(dateStr.year, dateStr.month, dateStr.day, dateStr.hour,
            dateStr.minute, dateStr.second)
        .toIso8601String();
  }

  static String getDateNow() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }


  static yearMonth() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  static todayDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }


  static yesterday() {
    var now = DateTime.now().subtract(Duration(days: 1));
    return now;
  }


  static void statusBarSetup() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.appSecondaryColor,
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static void statusBarSetupTransparent() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static List<DateTime?> defaultDateList() {
    return [
      DateTime.now(),
    ];
  }


  _showDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("notification".tr),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: AppColors.appColor,
                padding: const EdgeInsets.all(5),
                child: Text("ok".tr),
              ),
            ),
          ],
        ));
  }


  _showPass(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.offAndToNamed(Routes.PASS_KEY);
              },
              child: Container(
                color: AppColors.appColor,
                padding: const EdgeInsets.all(5),
                child: Text("continue".tr,),
              ),
            ),
          ],
        ));
  }

   displayPassKey(BuildContext context) {
    _showDialog(context, "provide_valid_passkey".tr);
  }

  displayAccessCode(BuildContext context) {
    _showDialog(context, "provide_secret_key".tr);
  }

   displayActivated(BuildContext context) {
     _showPass(context, "activated".tr);
   }


  static String baseUrl = 'https://www.booktrd.site/api/';


  static String activeUser = "TATAFADA_ACTIVE_USER";

  static String clientCode = "TATAFADA_CODE";
  static String approved = "TATAFADAE_APPROVED";
  static String registrationCode = "TATAFADA_REGISTRATION_CODE";
  static String device = "TATAFADA_DEVICE_REGISTERED";

  static String contact = "TATAFADA_DEVICE_CONTACT";




}
