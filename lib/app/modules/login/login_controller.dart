import 'package:agrorice/app/core/utils/user_secure_storage.dart';
import 'package:agrorice/app/data/providers/web_client/web_client.dart';
import 'package:agrorice/app/modules/home/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: kDebugMode ? 'raphael@contato.com' : '');
  final senhaController = TextEditingController(text: kDebugMode ? '123123' : '');

  final isObscureText = true.obs;

  final webClient = WebClient();

  @override
  void onInit() async {
    final token = await UserSecureStorage.getjwt();
    if (token != null) {
      Get.offAllNamed(HomeScreen.route);
    }
    super.onInit();
  }

  void login() async {
    if (emailController.text.isEmpty || senhaController.text.isEmpty) {
      Get.defaultDialog(title: 'Erro', middleText: 'Preencha todos os campos!');
      return;
    }
    try {
      final response = await webClient.postLoginUser(emailController.text, senhaController.text);

      final jwt = response.jwt;
      final username = response.username;
      final email = response.email;
      final estimates = await webClient.getEstimativasUsuario(jwt);
      await UserSecureStorage.setjwt(jwt);
      await UserSecureStorage.setUsername(username);
      await UserSecureStorage.setEmail(email);
      await UserSecureStorage.setEstimates(estimates);
      Get.offAllNamed(HomeScreen.route);
    } catch (e) {
      if (kDebugMode) {
        print('\nERRO\n$e');
      }
      Get.defaultDialog(title: 'Erro', middleText: 'Usuário e/ou senha incorreto(s)!');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}
