// ignore_for_file: unnecessary_const

import 'package:agrorice/app/data/providers/web_client/web_client.dart';
import 'package:agrorice/app/modules/login/login_page.dart';
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
      body: GestureDetector(
        onTap: Get.focusScope?.unfocus,
        child: SingleChildScrollView(
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
                    child: Obx(
                      () => Column(
                        children: [
                          TextField(
                            onChanged: controller.validateName,
                            decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Nome',
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            onChanged: controller.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            onChanged: controller.validatePassword,
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
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: controller.validatePassword2,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirmar senha',
                            ),
                          ),
                          controller.errorMessage.value.isNotEmpty ? const SizedBox(height: 12) : Container(),
                          controller.errorMessage.value.isNotEmpty
                              ? Text(
                                  controller.errorMessage.value,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(color: Colors.red),
                                )
                              : Container(),
                          const SizedBox(height: 12),
                          controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : controller.isAuth.value
                                  ? const Icon(Icons.done, color: Colors.teal, size: 36)
                                  : ElevatedButton(
                                      onPressed: controller.registrar,
                                      child: const Text('ENTRAR'),
                                    ),
                        ],
                      ),
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
      ),
    );
  }
}
