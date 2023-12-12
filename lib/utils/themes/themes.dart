import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    
   
    scaffoldBackgroundColor: CustomColor.lightColor,
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(color: CustomColor.lightColor),

    //dark mode
    primaryColorLight: CustomColor.lightColor,
    primaryColorDark: CustomColor.darkColor,
  );

  static ThemeData darkTheme = ThemeData.light().copyWith(
    
    scaffoldBackgroundColor: CustomColor.darkColor,
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(color: CustomColor.darkColor),

    //dark mode
    primaryColorLight: CustomColor.darkColor,
    primaryColorDark: CustomColor.lightColor,
  );
}
