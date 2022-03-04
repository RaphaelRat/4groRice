import 'package:agrorice/screens/bottom_navigation_bar/widgets/appbar_widget.dart';
import 'package:agrorice/screens/popup/water_quality.dart';
import 'package:flutter/material.dart';

class PlantationSection extends StatelessWidget {
  const PlantationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWidget(
          context,
          widget: const Text(
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
              Container(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WaterQualityScreen(),
                          ),
                        );
                      },
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
            ],
          ),
        ),
      ],
    );
  }
}
