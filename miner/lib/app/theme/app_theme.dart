import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miner/app/util/app_constant.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData appThemeData = ThemeData(

      primaryColor: AppColors.appColor,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      primaryColorLight: AppColors.appColor,
      focusColor: AppColors.appBackgroundColor,
      colorScheme: const ColorScheme.light(
          secondary: Colors.white,
          primary: Colors.white,
          surface: Colors.white));

  static void statusBarSetup() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
      statusBarColor: AppColors.appColor,
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

  static final appButtonStyle = ElevatedButton.styleFrom(
      padding:
          const EdgeInsets.only(top: 12, bottom: 12, left: 100, right: 100),
      backgroundColor: AppColors.appColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))));


  static final startButtonStyle = ElevatedButton.styleFrom(
      padding:
      const EdgeInsets.only(top: 12, bottom: 12, left: 100, right: 100),
      backgroundColor: Colors.indigo[700],
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))));


  static final stopButtonStyle = ElevatedButton.styleFrom(
      padding:
      const EdgeInsets.only(top: 12, bottom: 12, left: 100, right: 100),
      backgroundColor: Colors.red[700],
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))));

  static final paymentButtonStyle = ElevatedButton.styleFrom(
      padding:
      const EdgeInsets.only(top: 12, bottom: 12, left: 100, right: 100),
      backgroundColor: Colors.teal[700],
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))));
}
