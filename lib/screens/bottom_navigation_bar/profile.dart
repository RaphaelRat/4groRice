import 'package:flutter/material.dart';
import 'package:agrorice/screens/login.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 212, 232, 231),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('lib/assets/images/logo.png'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        ModalRoute.withName('/login'),
                      );
                    },
                    child: const Text('SAIR'),
                  ),
                ],
              ),
              Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Igor Enrick',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 112, 110),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 36, 24, 6),
          child: Text('Nome:'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Igor Enrick',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
          child: Text('Sobrenome'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'de Carvalho',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
          child: Text('Email'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'igorenrickc@icloud.com',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
          child: Text('Senha:'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 6, 24, 48),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
      ],
    );
  }
}
