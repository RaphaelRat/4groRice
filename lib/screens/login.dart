import 'package:flutter/material.dart';
import 'package:agrorice/screens/home.dart';
import 'package:agrorice/screens/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 232, 231),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('lib/assets/images/logo.png'),
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
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            ModalRoute.withName('/home'),
                          );
                        },
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
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
