// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kleen/helper/get_initialize.dart';
import 'package:kleen/themes/themes.dart';
import 'package:kleen/views/screens/auth/sign_in_screen.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
 await  getInitialize();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const SignInScreen(),
    ),
  );
}

