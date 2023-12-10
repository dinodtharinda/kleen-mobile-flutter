// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleen/controllers/auth_controller.dart';
import 'package:kleen/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return Center(
            child: authController.isLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailController,
                        ),
                        TextField(
                          controller: passwordController,
                        ),
                        TextButton(
                            onPressed: () {
                              _login(authController, emailController,
                                  passwordController, context);
                            },
                            child: const Text("Login")),
                        TextButton(
                            onPressed: () async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();

                              String? token = sharedPreferences
                                  .getString(AppConstants.TOKEN);
                              print(token ?? "NO TOKEN");
                            },
                            child: const Text("token"))
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
