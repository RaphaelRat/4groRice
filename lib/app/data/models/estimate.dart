// Modelo do cálculo de estimativa do uso de água

class Estimativa {
  late double hectares;
  late int tempoPlantacao;
  late String regiao;
  late double vazao;
  late int preparacaoSolo;
  late double gastoDeAgua;
  late double volume;

  Estimativa(this.hectares, this.tempoPlantacao, this.regiao, this.vazao,
      this.preparacaoSolo, this.gastoDeAgua, this.volume);

  Estimativa.fromString(Map<String, dynamic> json)
      : hectares = double.parse(json['hectares'].toString()),
        tempoPlantacao = int.parse(json['tempo_de_plantacao'].toString()),
        regiao = json['regiao'].toString(),
        vazao = double.parse(json['vazao'].toString()),
        preparacaoSolo = int.parse(json['preparacao_do_solo'].toString()),
        gastoDeAgua = double.parse(json['gasto_de_agua'].toString()),
        volume = double.parse(json['volume'].toString());

  Estimativa.fromJson(Map<String, dynamic> json)
      : hectares = json['Hectares'].toString() == 'null'
            ? ''
            : json['Hectares'].toDouble(),
        tempoPlantacao = json['Tempo_de_plantacao'].toString() == 'null'
            ? ''
            : json['Tempo_de_plantacao'],
        regiao = json['Regiao'].toString() == 'null'
            ? ''
            : json['Regiao'].toString(),
        vazao =
            json['Vazao'].toString() == 'null' ? '' : json['Vazao'].toDouble(),
        preparacaoSolo = json['Preparacao_do_solo'].toString() == 'null'
            ? ''
            : json['Preparacao_do_solo'],
        gastoDeAgua = json['Gasto_de_agua'].toString() == 'null'
            ? ''
            : json['Gasto_de_agua'].toDouble(),
        volume = json['Volume'].toString() == 'null'
            ? ''
            : json['Volume'].toDouble();

  Map<String, dynamic> toJson() => {
        'hectares': hectares,
        'tempo_de_plantacao': tempoPlantacao,
        'regiao': regiao,
        'vazao': vazao,
        'preparacao_do_solo': preparacaoSolo,
        'gasto_de_agua': gastoDeAgua,
        'volume': volume,
      };

  static double calculaGasto(
      {required String regiao,
      required double vazao,
      int preparacaoSolo = 0,
      required int tempoPlantacao,
      required double hectares}) {
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
    double gastoDeAguaTotalParaCm2 =
        perdaDeAguaPorDia * (preparacaoSolo + tempoPlantacao);
    double gastoDeAguaTotal = gastoDeAguaTotalParaCm2 * 10000 * hectares;
    return gastoDeAguaTotal;
  }

  @override
  String toString() {
    return 'Estimativa{hectares: $hectares, tempoPlantacao: $tempoPlantacao, regiao: $regiao, vazao: $vazao, preparacaoSolo: $preparacaoSolo, gastoDeAgua: $gastoDeAgua, volume: $volume}';
  }
}
