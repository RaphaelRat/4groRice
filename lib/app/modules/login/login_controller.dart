import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../home/home/home_page.dart';
import '../../data/repository/authentication.dart';

class LoginController extends GetxController {
  String email = kDebugMode ? 'raphaelrat@hotmail.com' : '';
  String password = kDebugMode ? '123123' : '';
  bool isFieldsEmpty = true;

  final isObscureText = true.obs;
  final errorMessage = ''.obs;
  final isLoading = false.obs;
  final isAuth = false.obs;

  void login() async {
    isLoading.value = true;

    _updateErrorMessage();
    if (isFieldsEmpty) {
      return;
    }

    errorMessage.value = await Authentication.login(email: email, senha: password) ?? '';
    isLoading.value = false;

    if (errorMessage.value.isEmpty) {
      isAuth.value = true;
      await Future.delayed(const Duration(seconds: 1));
      Get.offAllNamed(HomeScreen.route);
      isAuth.value = false;
    }
  }

  void validateEmail(String? email) {
    this.email = email?.replaceAll(' ', '') ?? '';
    _updateErrorMessage();
  }

  void validatePassword(String? password) {
    this.password = password ?? '';
    _updateErrorMessage();
  }

  void _updateErrorMessage() {
    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = "Preencha todos os campos!";
      isLoading.value = false;
      isFieldsEmpty = true;
      return;
    }
    isFieldsEmpty = false;
    errorMessage.value = '';
  }
}
