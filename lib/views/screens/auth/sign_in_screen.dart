// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleen/controllers/auth_controller.dart';

import 'package:kleen/utils/custom/app_custom_widgets.dart';
import 'package:kleen/views/screens/home/home_screen.dart';
import 'package:kleen/views/screens/map/map_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant/app_constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomField(
                    icon: Icons.email,
                    controller: emailController,
                    hint: "Email, username or phone",
                  ),
                  CustomPasswordField(
                    icon: Icons.password,
                    controller: passwordController,
                    hint: "Password",
                  ),
                  CustomButton(
                    title: "SIGN IN",
                    isLoading: authController.isLoading,
                    onTap: () {
                      // _login(authController, emailController,
                      //     passwordController, context);
                      Navigator.push(context, MaterialPageRoute(builder: (c){
                        return  const HomeScreen();
                      }));
                    },
                  ),
                   CustomButton(
                    title: "MAP SCREEN",
                    isLoading: authController.isLoading,
                    onTap: () {
                      // _login(authController, emailController,
                      //     passwordController, context);
                      Navigator.push(context, MaterialPageRoute(builder: (c){
                        return  const MapScreen();
                      }));
                    },
                  ),
                  TextButton(
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();

                        String? token =
                            sharedPreferences.getString(AppConstants.TOKEN);
                        print(token ?? "NO TOKEN");
                      },
                      child: const Text("token")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _login(AuthController authController, TextEditingController emailCtlr,
      TextEditingController passCtlr, BuildContext context) async {
    String _email = emailCtlr.text.trim();
    String _password = passCtlr.text.trim();

    bool _isValid = emailCtlr.text.contains("@");

    if (_email.isEmpty) {
      print('enter_email'.tr);
    } else if (!_isValid) {
      print('invalid_email'.tr);
    } else if (_password.isEmpty) {
      print('enter_password'.tr);
    } else if (_password.length < 6) {
      print('password_should_be'.tr);
    } else {
      print(_email);
      authController.login(_email, _password).then((status) async {
        if (status.isSuccess) {
          print(status.message);
        } else {
          print(status.message);
        }
      });
    }
  }
}
