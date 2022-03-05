import 'package:flutter/material.dart';

import '../../../global_widgets/responsive_container.dart';

Widget fieldsWidget({
  double? hectares,
  int? tempoPlantacao,
  String? regiao,
  int? tempoDuracao,
  bool? preparacaoSolo,
  double? gastoDeAgua,
}) {
  return responsiveContainer(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
      child: Column(
        children: [
          rowOfFields(
            left: columnOfFields(field: 'Hectares', value: '${hectares ?? '?'}'),
            right: columnOfFields(field: 'Tempo de plantação', value: '${tempoPlantacao ?? '?'} Dias'),
          ),
          const SizedBox(height: 22),
          rowOfFields(
            left: columnOfFields(field: 'Região', value: regiao ?? '?'),
            right: columnOfFields(field: 'Tempo de duração', value: '${tempoDuracao ?? '?'} Dias'),
          ),
          const SizedBox(height: 22),
          rowOfFields(
            left: columnOfFields(field: 'Preparação do Solo', value: '${preparacaoSolo ?? '?'}'),
            right: columnOfFields(field: 'Gasto de água', value: '${gastoDeAgua ?? '?'} mil litros', color: const Color.fromARGB(255, 65, 112, 110)),
          ),
          const SizedBox(height: 22),
          const Divider(color: Color.fromARGB(255, 212, 232, 231), thickness: 1),
        ],
      ),
    ),
  );
}

Widget columnOfFields({required String field, required String value, Color? color}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.toUpperCase(),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            letterSpacing: 1.3,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 1.3,
          ),
        ),
      ],
    ),
  );
}

Widget rowOfFields({required Widget left, required Widget right}) {
  return Row(
    children: [left, right],
  );
}
