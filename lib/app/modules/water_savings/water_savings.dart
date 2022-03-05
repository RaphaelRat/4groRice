import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaterSavingsScreen extends StatelessWidget {
  static const route = '/water_savings';

  const WaterSavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Economia da Água'),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('VOLTAR'),
          ),
        ],
      ),
    );
  }
}