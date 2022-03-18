import 'package:agrorice/app/data/providers/web_client/web_client.dart';
import 'package:agrorice/app/modules/login/login.dart';
import 'package:agrorice/app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/responsive_container.dart';

class RegisterScreen extends GetView<RegisterController> {
  static const route = '/register';
  RegisterScreen({Key? key}) : super(key: key);

  final webClient = WebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 232, 231),
      body: SingleChildScrollView(
        child: responsiveContainer(
          minHeight: MediaQuery.of(context).size.height,
          maxWidth: 420,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              Card(
                margin: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 48, 18, 18),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.nomeController,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => TextField(
                          controller: controller.senha1Controller,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isObscureText.value,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscureText.value ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () => controller.isObscureText.value = !controller.isObscureText.value,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.senha2Controller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirmar senha',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(),
                        ),
                        onPressed: controller.registrar,
                        // () async {
                        // webClient.postNovaEstimativa(
                        //   token:
                        //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjQ3NTUzNjMzLCJleHAiOjE2NTAxNDU2MzN9.jPoTGSW620bsaN17589oTQeMiWUQK0h_8zoV3mGCHYw',
                        //   hectares: 15.8,
                        //   tempoPlantacao: 15,
                        //   regiao: 'Norte',
                        //   vazao: 123.321,
                        //   preparacaoSolo: 22,
                        //   gastoDeAgua: 321.123,
                        //   volume: 444.555,
                        // );
                        // webClient.postRegisterUser('Raphael Teste2', 'raphael2@contato.com', '123123');
                        // webClient.postLoginUser('raphael2@contato.com', '123123');
                        // final lista = await webClient.getEstimativasUsuario(
                        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjQ3NTUzNjMzLCJleHAiOjE2NTAxNDU2MzN9.jPoTGSW620bsaN17589oTQeMiWUQK0h_8zoV3mGCHYw");
                        // print(lista.elementAt(0).regiao);
                        // },
                        child: const Text('REGISTRAR'),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const Text('Já possui uma conta?'),
                  TextButton(
                    onPressed: () => Get.offAllNamed(LoginScreen.route),
                    child: const Text('FAZER LOGIN'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
