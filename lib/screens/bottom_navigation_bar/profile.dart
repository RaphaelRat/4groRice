import 'package:flutter/material.dart';

import './widgets/widgets.dart';
import '../login.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWidget(context, widget: _appBarWidget(context)),
        Expanded(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 36, 24, 6),
                child: Text('Nome:'),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: Text('Senha:'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 6, 24, 48),
                child: TextField(
                  obscureText: isObscureText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                    ),
                  ),
                ),
              )
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
