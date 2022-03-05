import 'package:flutter/material.dart';

import 'package:agrorice/screens/popup/water_savings.dart';
import 'package:get/get.dart';

class EstimateResultScreen extends StatelessWidget {
  static const route = '/estimate_result';
  const EstimateResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Resultado Cálculo da Água'),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('VOLTAR'),
          ),
          TextButton(
            onPressed: () => Get.toNamed(WaterSavingsScreen.route),
            child: const Text('COMO ECONOMIZAR'),
          ),
        ],
      ),
    );
  }
}
