import 'package:flutter/material.dart';
import 'package:kleen/utils/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.lightColor,
    primaryColor: AppColor.primaryColor,
    appBarTheme: const AppBarTheme(color: AppColor.lightColor)
  );
}
