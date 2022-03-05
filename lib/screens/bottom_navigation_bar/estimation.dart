import 'package:flutter/material.dart';

import './widgets/widgets.dart';
import '../popup/estimate_result.dart';
import '../../utils/utils.dart';

class EstimationSection extends StatefulWidget {
  const EstimationSection({Key? key}) : super(key: key);

  @override
  State<EstimationSection> createState() => _EstimationSectionState();
}

class _EstimationSectionState extends State<EstimationSection> {
  bool solo = true;
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
                    child: Text('Quantidade de hectares da sua plantação:'),
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
                    child: Text('Tempo de plantação (em dias):'),
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
                    child: Text('Tempo de duração (em dias):'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Duração',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Preparação do solo? ${solo ? 'Sim' : 'Não'}'),
                        Switch(
                            value: solo,
                            onChanged: (value) {
                              setState(() {
                                solo = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EstimateResultScreen(),
                            ),
                          );
                        },
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
