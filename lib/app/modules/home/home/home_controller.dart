import 'package:agrorice/app/core/utils/user_secure_storage.dart';
import 'package:agrorice/app/data/models/estimate.dart';
import 'package:agrorice/app/data/providers/web_client/web_client.dart';
import 'package:agrorice/app/modules/estimate_result/estimate_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final solo = false.obs;
  final isObscureText = false.obs;
  final isEstimativasLoading = true.obs;
  final hideCard = false.obs;

  String? nome;
  String? email;
  String? _token;
  List<Estimativa>? estimativas;

  final vazaoController = TextEditingController();
  final tempoPlantacaoController = TextEditingController();
  final hectaresController = TextEditingController();
  final regiaoController = TextEditingController();
  final tempoPreparacaoController = TextEditingController();

  final webClient = WebClient();

  @override
  Future<void> onInit() async {
    refreshField();
    super.onInit();
  }

  void refreshField() async {
    isEstimativasLoading.value = true;
    nome = await UserSecureStorage.getUsername();
    email = await UserSecureStorage.getEmail();
    _token = await UserSecureStorage.getjwt();
    estimativas = await UserSecureStorage.getEstimates();

    hideCard.value = estimativas?.isNotEmpty ?? false;
    isEstimativasLoading.value = false;
  }

  void calcular() async {
    if (vazaoController.text.isEmpty ||
        tempoPlantacaoController.text.isEmpty ||
        hectaresController.text.isEmpty ||
        regiaoController.text.isEmpty ||
        (solo.value && tempoPreparacaoController.text.isEmpty)) {
      Get.defaultDialog(title: 'Erro', middleText: 'Preencha todos os campos!');
      return;
    }
    double hectares;
    int tempoPlantacao;
    String regiao;
    double vazao;
    int preparacaoSolo;
    try {
      hectares = double.parse(hectaresController.text);
      tempoPlantacao = int.parse(tempoPlantacaoController.text);
      regiao = regiaoController.text;
      vazao = double.parse(vazaoController.text);
      preparacaoSolo = solo.value ? int.parse(tempoPreparacaoController.text) : 0;
    } catch (e) {
      Get.defaultDialog(title: 'Erro', middleText: 'Algum campo está inválido!');
      return;
    }

    final gasto = Estimativa.calculaGasto(regiao: regiao, vazao: vazao, tempoPlantacao: tempoPlantacao, hectares: hectares);

    try {
      // final response = await webClient.postLoginUser(emailController.text, senhaController.text);

      webClient.postNovaEstimativa(
        token: _token ?? ' ',
        hectares: hectares,
        tempoPlantacao: tempoPlantacao,
        regiao: regiao,
        vazao: vazao,
        preparacaoSolo: preparacaoSolo,
        gastoDeAgua: gasto,
        volume: 0,
      );
      // await UserSecureStorage.setEstimates(estimates);

    } catch (e) {
      print('\nERRO\n$e');
      Get.defaultDialog(title: 'Erro', middleText: 'Erro ao enviar para o servidor');
      return;
    }

    final estimativa = Estimativa(hectares, tempoPlantacao, regiao, vazao, preparacaoSolo, gasto, 0);
    await UserSecureStorage.addEstimates(estimativa);

    vazaoController.clear();
    tempoPlantacaoController.clear();
    hectaresController.clear();
    regiaoController.clear();
    tempoPreparacaoController.clear();

    refreshField();
    Get.toNamed(EstimateResultScreen.route);
  }
}
