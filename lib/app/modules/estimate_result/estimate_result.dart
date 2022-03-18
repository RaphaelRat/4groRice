import 'package:agrorice/app/data/models/estimate.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../home/home/home.dart';
import '../water_savings/water_savings.dart';
import '../../global_widgets/global_widgets.dart';

class EstimateResultScreen extends StatelessWidget {
  static const route = '/estimate_result';
  final Estimativa? estimativa;

  const EstimateResultScreen({Key? key, this.estimativa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      backgroundColor: const Color.fromARGB(255, 212, 232, 231),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _webAppBar(context),
              appBarWidget(
                context,
                child: const Text(
                  'Aqui está o cálculo do uso de água na sua plantação',
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 112, 110),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _cardBox(),
              fieldsWidget(hasDivider: false, estimativa: estimativa),
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Text(
                  'Conheça maneiras de economizar o uso de água na sua plantação:',
                  style: TextStyle(
                    color: Color.fromARGB(153, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () => Get.toNamed(WaterSavingsScreen.route),
                child: const Text(
                  'COMO ECONOMIZAR',
                  style: TextStyle(color: Color.fromARGB(255, 65, 112, 110), fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 15),
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
                  onTap: () => Get.back(),
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
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 8),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ));
  }

  Widget _cardBox() {
    double gasto = 0;
    if (estimativa?.gastoDeAgua != 0) {
      gasto = estimativa!.gastoDeAgua / 1000;
    }
    return responsiveContainer(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
        padding: const EdgeInsets.fromLTRB(12, 24, 12, 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'Você gastará ${gasto.toStringAsFixed(2)} m³ de água',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 43, 70, 139),
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 67),
              child: Image.asset('assets/images/people_picture.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 26),
              child: Text(
                'Que equivale a quantidade de água que 6 pessoas usam para viver durante um ano',
                style: TextStyle(
                  color: Color.fromARGB(255, 132, 170, 255),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar? _myAppBar(BuildContext context) {
    return MediaQuery.of(context).size.width >= 720
        ? null
        : AppBar(
            backgroundColor: const Color.fromARGB(255, 212, 232, 231),
            elevation: 0,
            leadingWidth: 112,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: GestureDetector(
                onTap: () => Get.back(),
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 8),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          );
  }
}
