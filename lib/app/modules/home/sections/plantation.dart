import 'package:agrorice/app/modules/home/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../water_quality/water_quality.dart';
import '../../../global_widgets/global_widgets.dart';

class PlantationSection extends GetView<HomeController> {
  static const route = '/plantation';

  const PlantationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Obx(() => controller.hideCard.value ? Container() : _cardBox(context)),
        Obx(
          () => controller.isEstimativasLoading.value
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: controller.estimativas?.length ?? 0,
                    itemBuilder: (context, index) {
                      return index + 1 == (controller.estimativas?.length)
                          ? Column(
                              children: [
                                _cardBox(context),
                                const SizedBox(height: 8),
                                fieldsWidget(
                                  estimativa: controller.estimativas?.elementAt(index),
                                  hasDivider: 0 == index ? false : true,
                                ),
                              ],
                            )
                          : fieldsWidget(
                              estimativa: controller.estimativas?.elementAt(index),
                              hasDivider: 0 == index ? false : true,
                            );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  Widget _cardBox(BuildContext context) {
    return responsiveContainer(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 22, 24, 11),
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
