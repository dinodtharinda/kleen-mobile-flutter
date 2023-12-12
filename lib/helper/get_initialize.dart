 import 'package:get/get.dart';
import 'package:kleen/data/api/api_client.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../data/repository/auth_repo.dart';
import '../utils/constant/app_constants.dart';

Future<void> getInitialize() async {

    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => ApiClient(
        appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
    Get.lazyPut(
        () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
    Get.lazyPut(() => AuthController(authRepo: Get.find()));


  }