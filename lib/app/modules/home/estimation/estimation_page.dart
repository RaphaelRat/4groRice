import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './estimation_controller.dart';
import '../../estimate_result/estimate_result.dart';
import '../../../global_widgets/global_widgets.dart';

class EstimationPage extends GetView<EstimationController> {
  static const route = '/estimation';

  const EstimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWidget(
          context,
          child: const Text(
            'Calcule o uso da água na sua plantação',
            style: TextStyle(
              color: Color.fromARGB(255, 65, 112, 110),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: responsiveContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 36, 24, 6),
                    child: Text('Vazão da Taipa:'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Vazão',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                    child: Text('Tempo de Plantação (em dias):'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Plantação',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                    child: Text('Hectares:'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hectares',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                    child: Text('Região:'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Região',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Preparação do solo? ${controller.solo.value ? 'Sim' : 'Não'}'),
                          Switch(value: controller.solo.value, onChanged: (value) => controller.solo.value = value),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.solo.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
                                child: Text('Tempo de Preparação (em dias):'),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Preparação',
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(),
                        ),
                        onPressed: () => Get.toNamed(EstimateResultScreen.route),
                        child: const Text('CALCULAR O USO DA ÁGUA'),
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
}
