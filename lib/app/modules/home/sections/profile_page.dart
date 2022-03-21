import 'package:agrorice/app/modules/home/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/global_widgets.dart';

class ProfilePage extends GetView<HomeController> {
  static const route = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWidget(context, child: _appBarWidget(context)),
        Expanded(
          child: SingleChildScrollView(
            child: responsiveContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 36, 24, 6),
                    child: Text('Nome:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextFormField(
                      initialValue: controller.nome ?? 'Usuário sem nome!',
                      enabled: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                    child: Text('Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextFormField(
                      enabled: false,
                      initialValue: controller.email ?? 'Usuário sem email!',
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                    child: Text('Quantidade de cálculos:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextFormField(
                      enabled: false,
                      initialValue: controller.estimativas?.length.toString() ?? 'Sem cálculos registrados!',
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _appBarWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Bem vindo(a) ao seu perfil,\n${controller.nome ?? 'Usuário sem nome'}',
            style: const TextStyle(
              color: Color.fromARGB(255, 65, 112, 110),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: controller.logout,
          child: const Text('SAIR'),
        ),
      ],
    );
  }
}
