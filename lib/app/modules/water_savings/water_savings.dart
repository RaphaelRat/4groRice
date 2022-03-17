import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_widgets.dart';
import '../estimate_result/estimate_result.dart';

class WaterSavingsScreen extends StatelessWidget {
  static const route = '/water_savings';

  const WaterSavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: responsiveContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _webAppBar(context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width >= 720 ? 120 : 67),
                child: Image.asset('assets/images/water_savings.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 48, left: 48, bottom: 24),
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
      ),
    );
  }

  AppBar? _myAppBar(BuildContext context) {
    return MediaQuery.of(context).size.width >= 720
        ? null
        : AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            leadingWidth: 112,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: GestureDetector(
                onTap: () => Get.previousRoute == EstimateResultScreen.route ? Get.back() : Get.offAndToNamed(EstimateResultScreen.route),
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Color.fromARGB(255, 65, 112, 110),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Voltar',
                      style: TextStyle(color: Color.fromARGB(255, 65, 112, 110), fontWeight: FontWeight.w500, letterSpacing: 1.1),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget _webAppBar(BuildContext context) {
    return MediaQuery.of(context).size.width < 720
        ? Container()
        : responsiveContainer(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: GestureDetector(
                  onTap: () => Get.previousRoute == EstimateResultScreen.route ? Get.back() : Get.offAndToNamed(EstimateResultScreen.route),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color.fromARGB(255, 65, 112, 110),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Voltar',
                        style: TextStyle(color: Color.fromARGB(255, 65, 112, 110), fontWeight: FontWeight.w500, letterSpacing: 1.1),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ));
  }
}
