import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(

    scaffoldBackgroundColor: CustomColor.lightColor,
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(color: CustomColor.lightColor),

    //dark mode
    primaryColorLight: CustomColor.lightColor,
    primaryColorDark: CustomColor.backColor,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(

    scaffoldBackgroundColor: CustomColor.backColor,
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(color: CustomColor.backColor),
    //dark mode
    primaryColorLight: CustomColor.backColor,
    primaryColorDark: CustomColor.lightColor,
  );
}
