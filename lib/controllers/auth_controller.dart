// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:kleen/data/repository/auth_repo.dart';

import '../data/model/response/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email: email,password: password);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['data']['token'], "test");
      // await authRepo.updateToken();
      responseModel = ResponseModel(true, 'successful');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
