import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home/home.dart';
import '../register/register.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

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
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(),
                        ),
                        onPressed: () => Get.offAllNamed(HomeScreen.route),
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
    );
  }
}
