import 'package:agrorice/screens/bottom_navigation_bar/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:agrorice/screens/login.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWidget(context, widget: _appBarWidget(context)),
        Expanded(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 36, 24, 6),
                child: Text('Nome:'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Igor Enrick',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: Text('Sobrenome'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'de Carvalho',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: Text('Email'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'igorenrickc@icloud.com',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: Text('Senha:'),
              ),
              Padding(
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
          ),
        ),
      ],
    );
  }

  Row _appBarWidget(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(''),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
        ),
        Expanded(
          child: TextButton(
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
        ),
      ],
    );
  }
}
