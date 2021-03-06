import 'package:agrorice/app/data/models/estimate_model.dart';
import 'package:flutter/material.dart';

import 'responsive_container.dart';

Widget fieldsWidget({
  Estimativa? estimativa,
  bool hasDivider = true,
}) {
  final hectares = estimativa?.hectares;
  final tempoPlantacao = estimativa?.tempoPlantacao;
  final regiao = estimativa?.regiao;
  final vazao = estimativa?.vazao;
  final preparacaoSolo = estimativa?.preparacaoSolo;
  double? gastoDeAgua = estimativa?.gastoDeAgua;
  if (gastoDeAgua != null) {
    gastoDeAgua /= 1000;
  }
  return responsiveContainer(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
      child: Column(
        children: [
          rowOfFields(
            left: columnOfFields(field: 'Hectares', value: '${hectares ?? '?'}'),
            right: columnOfFields(field: 'Tempo de plantação', value: '${tempoPlantacao ?? '?'} Dias'),
          ),
          const SizedBox(height: 22),
          rowOfFields(
            left: columnOfFields(field: 'Região', value: regiao ?? '?'),
            right: columnOfFields(field: 'Vazão', value: '${vazao ?? '?'} Litros'),
          ),
          const SizedBox(height: 22),
          rowOfFields(
            left: columnOfFields(field: 'Preparação do Solo', value: preparacaoSolo != 0 ? '${tempoPlantacao ?? '?'} Dias' : 'Não'),
            right: columnOfFields(
                field: 'Gasto de água', value: '${gastoDeAgua?.toStringAsFixed(2) ?? '?'} m³', color: const Color.fromARGB(255, 65, 112, 110)),
          ),
          const SizedBox(height: 22),
          hasDivider ? const Divider(color: Color.fromARGB(255, 212, 232, 231), thickness: 1) : Container(),
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
