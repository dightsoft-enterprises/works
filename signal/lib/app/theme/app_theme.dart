
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData appThemeData = ThemeData(
      primaryColor: AppColors.appColor,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          )
      ),

      primaryColorLight: AppColors.appLightColor,
      focusColor: AppColors.appBackgroundColor,
      colorScheme: ColorScheme.light(
        secondary: Colors.white,
        primary: Colors.white,
        surface: Colors.white

      ));



  static appDateRange(context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: AppColors.appBlueColor,
          onPrimary: Colors.white,
          onSurface: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.appColor,
          ),
        ),
      ),
      child: child!,
    );
  }


  static final appButtonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 100, right: 100),
      backgroundColor: AppColors.appColor,
      foregroundColor: Colors.white,

      textStyle: const TextStyle(fontSize: 18),

      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))));
}
