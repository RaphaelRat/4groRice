import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local_widgets/widgets.dart';
import '../../water_quality/water_quality.dart';
import '../../../global_widgets/responsive_container.dart';

class PlantationSection extends StatelessWidget {
  static const route = '/plantation';

  const PlantationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fields = [
      fieldsWidget(),
      fieldsWidget(hectares: 5, tempoPlantacao: 90, regiao: 'Sul', tempoDuracao: 95, preparacaoSolo: true, gastoDeAgua: 300),
      fieldsWidget(hectares: 65, tempoPlantacao: 120, regiao: 'Norte', tempoDuracao: 150, preparacaoSolo: false, gastoDeAgua: 100),
      fieldsWidget(hectares: 2, tempoPlantacao: 45, regiao: 'Sudeste', tempoDuracao: 32, preparacaoSolo: true, gastoDeAgua: 47),
    ];

    return Column(
      children: [
        appBarWidget(
          context,
          child: const Text(
            'Os últimos cálculos feitos das suas plantações',
            style: TextStyle(
              color: Color.fromARGB(255, 65, 112, 110),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _cardBox(context),
              ..._fields,
            ],
          ),
        ),
      ],
    );
  }

  Widget _cardBox(BuildContext context) {
    return responsiveContainer(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 36, 24, 12),
        padding: const EdgeInsets.fromLTRB(12, 24, 12, 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 65, 112, 110),
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Conheça fatores que influenciam na qualidade da água utilizada em suas plantações.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(WaterQualityScreen.route),
              child: const Text(
                'MAIS SOBRE',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
