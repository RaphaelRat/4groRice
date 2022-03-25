import 'dart:convert';

// Modelo do cálculo de estimativa do uso de água

class Estimativa {
  late double hectares;
  late int tempoPlantacao;
  late String regiao;
  late double vazao;
  late int preparacaoSolo;
  late double gastoDeAgua;
  Estimativa({
    required this.hectares,
    required this.tempoPlantacao,
    required this.regiao,
    required this.vazao,
    required this.preparacaoSolo,
    required this.gastoDeAgua,
  });

  Estimativa copyWith({
    double? hectares,
    int? tempoPlantacao,
    String? regiao,
    double? vazao,
    int? preparacaoSolo,
    double? gastoDeAgua,
  }) {
    return Estimativa(
      hectares: hectares ?? this.hectares,
      tempoPlantacao: tempoPlantacao ?? this.tempoPlantacao,
      regiao: regiao ?? this.regiao,
      vazao: vazao ?? this.vazao,
      preparacaoSolo: preparacaoSolo ?? this.preparacaoSolo,
      gastoDeAgua: gastoDeAgua ?? this.gastoDeAgua,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hectares': hectares,
      'tempoPlantacao': tempoPlantacao,
      'regiao': regiao,
      'vazao': vazao,
      'preparacaoSolo': preparacaoSolo,
      'gastoDeAgua': gastoDeAgua,
      'data': DateTime.now(),
    };
  }

  factory Estimativa.fromMap(Map<String, dynamic> map) {
    return Estimativa(
      hectares: double.parse(map['hectares'].toString()),
      tempoPlantacao: int.parse(map['tempoPlantacao'].toString()),
      regiao: map['regiao'].toString(),
      vazao: double.parse(map['vazao'].toString()),
      preparacaoSolo: int.parse(map['preparacaoSolo'].toString()),
      gastoDeAgua: double.parse(map['gastoDeAgua'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Estimativa.fromJson(String source) => Estimativa.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Estimativa(hectares: $hectares, tempoPlantacao: $tempoPlantacao, regiao: $regiao, vazao: $vazao, preparacaoSolo: $preparacaoSolo, gastoDeAgua: $gastoDeAgua)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Estimativa &&
        other.hectares == hectares &&
        other.tempoPlantacao == tempoPlantacao &&
        other.regiao == regiao &&
        other.vazao == vazao &&
        other.preparacaoSolo == preparacaoSolo &&
        other.gastoDeAgua == gastoDeAgua;
  }

  @override
  int get hashCode {
    return hectares.hashCode ^ tempoPlantacao.hashCode ^ regiao.hashCode ^ vazao.hashCode ^ preparacaoSolo.hashCode ^ gastoDeAgua.hashCode;
  }

  //Passar para services
  static double calculaGasto(
      {required String regiao, required double vazao, int preparacaoSolo = 0, required int tempoPlantacao, required double hectares}) {
    double valorInicial = 0;
    double valorFinal = 0;

    switch (regiao) {
      case "Sul":
        valorInicial = 5.5;
        valorFinal = 5.8;
        break;
      case "Rio Grande do Sul":
        valorInicial = 6.7;
        valorFinal = 7.7;
        break;
      case "Trópicos (Estação Seca)":
        valorInicial = 6;
        valorFinal = 7;
        break;
      case "Trópicos (Estação Chuvosa)":
        valorInicial = 4;
        valorFinal = 5;
        break;
    }

    double evapotranspiracao = (valorInicial + valorFinal) / 2;
    double perdaDeAguaPorDia = evapotranspiracao + vazao;
    double gastoDeAguaTotalParaCm2 = perdaDeAguaPorDia * (preparacaoSolo + tempoPlantacao);
    double gastoDeAguaTotal = gastoDeAguaTotalParaCm2 * 10000 * hectares;
    return gastoDeAguaTotal;
  }
}
