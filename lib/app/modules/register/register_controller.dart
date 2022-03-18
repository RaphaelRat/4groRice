import 'package:agrorice/app/core/utils/user_secure_storage.dart';
import 'package:agrorice/app/data/providers/web_client/web_client.dart';
import 'package:agrorice/app/modules/home/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senha1Controller = TextEditingController();
  final senha2Controller = TextEditingController();

  final webClient = WebClient();

  final isObscureText = true.obs;

  void registrar() async {
    if (emailController.text.isEmpty || senha1Controller.text.isEmpty || senha2Controller.text.isEmpty || nomeController.text.isEmpty) {
      Get.defaultDialog(title: 'Erro', middleText: 'Preencha todos os campos!');
      return;
    } else if (senha1Controller.text != senha2Controller.text) {
      Get.defaultDialog(title: 'Erro', middleText: 'As senhas não são iguais!');
      return;
    }
    try {
      final response = await webClient.postRegisterUser(nomeController.text, emailController.text, senha1Controller.text);

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
      Get.defaultDialog(title: 'Erro', middleText: 'Email já existente, tente logar!');
    }
  }
}
