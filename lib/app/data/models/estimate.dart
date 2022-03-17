// Modelo do cálculo de estimativa do uso de água

class Estimativa {
  late double hectares;
  late int tempoPlantacao;
  late String regiao;
  late double vazao;
  late int preparacaoSolo;
  late double gastoDeAgua;
  late double volume;

  Estimativa(this.hectares, this.tempoPlantacao, this.regiao, this.vazao, this.preparacaoSolo, this.gastoDeAgua, this.volume);

  Estimativa.fromJson(Map<String, dynamic> json)
      : hectares = json['Hectares'].toString() == 'null' ? '' : json['Hectares'],
        tempoPlantacao = json['Tempo_de_plantacao'].toString() == 'null' ? '' : json['Tempo_de_plantacao'],
        regiao = json['Regiao'].toString() == 'null' ? '' : json['Regiao'].toString(),
        vazao = json['Vazao'].toString() == 'null' ? '' : json['Vazao'],
        preparacaoSolo = json['Preparacao_do_solo'].toString() == 'null' ? '' : json['Preparacao_do_solo'],
        gastoDeAgua = json['Gasto_de_agua'].toString() == 'null' ? '' : json['Gasto_de_agua'],
        volume = json['Volume'].toString() == 'null' ? '' : json['Volume'];

  Map<String, dynamic> toJson() => {
        'hectares': hectares,
        'tempo_de_plantacao': tempoPlantacao,
        'regiao': regiao,
        'vazao': vazao,
        'preparacao_do_solo': preparacaoSolo,
        'gasto_de_agua': gastoDeAgua,
        'volume': volume,
      };

  @override
  String toString() {
    return 'Estimativa{hectares: $hectares, tempoPlantacao: $tempoPlantacao, regiao: $regiao, vazao: $vazao, preparacaoSolo: $preparacaoSolo, gastoDeAgua: $gastoDeAgua, volume: $volume}';
  }
}
