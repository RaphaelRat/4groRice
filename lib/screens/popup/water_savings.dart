import 'package:flutter/material.dart';

class WaterSavingsScreen extends StatelessWidget {
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('VOLTAR'),
          ),
        ],
      ),
    );
  }
}
