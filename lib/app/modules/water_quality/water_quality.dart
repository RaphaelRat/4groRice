import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WaterQualityScreen extends StatelessWidget {
  static const route = '/water_quality';

  const WaterQualityScreen({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Índices de Qualidade da Água',
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
                    'pH: mede se uma solução é ácida ou basica.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Oxigênio Dissolvido: águas poluídas, a uma baixa concentração de oxigênio dissolvido, enquanto que as águas limpas apresentam concentrações de oxigênio dissolvido elevadas, o que se torna um parâmetro de fácil acompanhamento da poluição da água.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Turbidez: nível da atenuação de intensidade que um feixe de luz sofre ao atravessá-la.',
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
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 212, 232, 231),
              thickness: 1,
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'É importante o acompanhamento dos indices de qualidade da agua, pois muitos deles podem afetas a qualidade do arroz, além de que podem afetar a qualidade da água que consumida de outras formas pela população. Para realizar o acompanhamento, pode-se realizar testes em laboratórios da região, comprar o equipamentos prontos ou ainda construir um sistema de sensores.',
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 102, 102),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              color: Color.fromARGB(255, 212, 232, 231),
              thickness: 1,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Text(
                'Para saber mais sobre qualidade da água:',
                style: TextStyle(
                  color: Color.fromARGB(153, 0, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () => _launchURL(),
              child: const Text(
                'SABER MAIS',
                style: TextStyle(
                    color: Color.fromARGB(255, 65, 112, 110),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://bityli.com/ToJXF';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
