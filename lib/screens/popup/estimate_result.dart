import 'package:flutter/material.dart';

import 'package:agrorice/screens/popup/water_savings.dart';

class EstimateResultScreen extends StatelessWidget {
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('VOLTAR'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WaterSavingsScreen(),
                ),
              );
            },
            child: const Text('COMO ECONOMIZAR'),
          ),
        ],
      ),
    );
  }
}
