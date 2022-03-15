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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 65, 112, 110),
                  ),
                  onPressed: () => Get.back(),
                ),
                const Text(
                  'VOLTAR',
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 112, 110),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 67),
              child: Image.asset('assets/images/water_savings.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: const [
                  Text(
                    'Pequenos atos que fazem a diferença:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 112, 110),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '1. Realizar bom nivelamento do solo antes da plantação.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '2. Solos bem nivelados podem utilizar menores alturas de lâmina.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '3. Fazer inspeções diárias das taipas e canos que fazem a distribuição para os tanques, em buscas de vazamento.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '4. Se possível fazer cisternas para evitar que todo o recurso hídrico da plantação venha diretamente dos rios.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
