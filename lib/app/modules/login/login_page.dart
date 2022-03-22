import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './login_controller.dart';
import '../register/register.dart';
import '../../global_widgets/responsive_container.dart';

class LoginScreen extends GetView<LoginController> {
  static const route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

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
                          TextFormField(
                            onChanged: controller.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            initialValue: kDebugMode ? 'raphaelrat@hotmail.com' : '',
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            onChanged: controller.validatePassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isObscureText.value,
                            initialValue: kDebugMode ? '123123' : '',
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
                                      onPressed: controller.login,
                                      child: const Text('ENTRAR'),
                                    ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text('Não possui uma conta?'),
                    TextButton(
                      onPressed: () => Get.toNamed(RegisterScreen.route),
                      child: const Text('REGISTRAR'),
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
