import 'package:agrorice/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    child: Column(
                      children: [
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
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.senhaController,
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(),
                          ),
                          onPressed: controller.login,

                          // onPressed: () => Get.offAllNamed(HomeScreen.route),
                          child: const Text('ENTRAR'),
                        ),
                      ],
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
