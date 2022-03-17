import 'package:agrorice/app/data/providers/web_client/web_client.dart';
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
      await webClient.postRegisterUser(nomeController.text, emailController.text, senha1Controller.text);
    } catch (e) {
      Get.defaultDialog(title: 'Erro', middleText: 'Email já existente, tente logar!');
    }
  }
}
