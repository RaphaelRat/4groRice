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

  void login() async {
    if (emailController.text.isEmpty || senhaController.text.isEmpty) {
      Get.defaultDialog(title: 'Erro', middleText: 'Preencha todos os campos!');
      return;
    }
    try {
      final response = await webClient.postLoginUser(emailController.text, senhaController.text);

      print('\Usuário : $response');
      Get.offAllNamed(HomeScreen.route);
    } catch (e) {
      print('\nERRO\n$e');
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
