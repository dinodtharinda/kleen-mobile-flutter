import 'package:get/get_connect/http/src/response/response.dart';
import 'package:kleen/data/api/api_client.dart';
import 'package:kleen/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(
      {required String email, required String password}) async {
    return await apiClient.postData(
      uri: AppConstants.LOGIN_URI,
      body: {"email": email, "password": password},
    );
  }

  Future<bool> saveUserToken(String token, String zoneTopic) async {
    apiClient.token = token;
    apiClient.updateHeader(
        token, sharedPreferences.getString(AppConstants.LANGUAGE_CODE));
    sharedPreferences.setString(AppConstants.ZONE_TOPIC, zoneTopic);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
