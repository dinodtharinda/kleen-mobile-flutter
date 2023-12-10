import 'package:flutter/material.dart';
import 'package:kleen/utils/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.lightColor,
    primaryColor: AppColor.primaryColor,
    appBarTheme: const AppBarTheme(color: AppColor.lightColor),

    //dark mode
    primaryColorLight: AppColor.lightColor,
    primaryColorDark: AppColor.darkColor,
  );

   static ThemeData darkTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.darkColor,
    primaryColor: AppColor.primaryColor,
    appBarTheme: const AppBarTheme(color: AppColor.darkColor),

    //dark mode
    primaryColorLight: AppColor.darkColor,
    primaryColorDark: AppColor.lightColor,
  );
}
