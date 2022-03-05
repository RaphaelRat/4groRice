import 'package:flutter/material.dart';

import './widgets/widgets.dart';
import '../login.dart';

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
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 65, 112, 110),
                radius: 33,
                child: CircleAvatar(
                  radius: 31,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('lib/assets/images/igor_picture.jpg'),
                  ),
                ),
              ),
              SizedBox(width: 16),
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
    );
  }
}
