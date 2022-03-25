import 'package:agrorice/app/data/models/estimate_model.dart';
import 'package:agrorice/app/data/repository/estimate.dart';
import 'package:agrorice/app/modules/estimate_result/estimate_result.dart';
import 'package:agrorice/app/modules/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Plantation controller
  var estimates = [].obs;
  final estimativasStream = getEstimativasStream();
  final isEstimativasLoading = true.obs;

  // Estimation controller
  final vazaoController = TextEditingController();
  final tempoPlantacaoController = TextEditingController();
  final hectaresController = TextEditingController();
  final tempoPreparacaoController = TextEditingController();

  final dropdownValue = 'Sul'.obs;
  final solo = false.obs;

  void alteraRegiao(String regiao) {
    dropdownValue.value = regiao;
  }

  void calcular() async {
    Get.focusScope?.unfocus();

    if (vazaoController.text.isEmpty ||
        tempoPlantacaoController.text.isEmpty ||
        hectaresController.text.isEmpty ||
        dropdownValue.value.isEmpty ||
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
      regiao = dropdownValue.value;
      vazao = double.parse(vazaoController.text);
      preparacaoSolo = solo.value ? int.parse(tempoPreparacaoController.text) : 0;
    } catch (e) {
      Get.defaultDialog(title: 'Erro', middleText: 'Algum campo está inválido!');
      return;
    }

    final gastoDeAgua = Estimativa.calculaGasto(regiao: regiao, vazao: vazao, tempoPlantacao: tempoPlantacao, hectares: hectares);
    Estimativa? estimativa;
    try {
      estimativa = Estimativa(
          hectares: hectares, tempoPlantacao: tempoPlantacao, regiao: regiao, vazao: vazao, preparacaoSolo: preparacaoSolo, gastoDeAgua: gastoDeAgua);
      addEstimativa(estimativa);
    } catch (e) {
      if (kDebugMode) {
        print('\nERRO AO ENVIAR\n$e');
      }
      Get.defaultDialog(title: 'Erro', middleText: 'Erro ao enviar para o servidor');
      return;
    }

    vazaoController.clear();
    tempoPlantacaoController.clear();
    hectaresController.clear();
    tempoPreparacaoController.clear();

    Get.to(() => EstimateResultScreen(estimativa: estimativa));
  }

  // OnInit geral
  @override
  void onInit() async {
    // Plantation - Aqui ele vai atualizar automaticamente a lista. Podendo ser alterada em outra plataforma.
    estimativasStream.listen((result) async {
      estimates.value = await getEstimativas();
      isEstimativasLoading.value = false;
    });

    // Super
    super.onInit();
  }

//outros

  final isObscureText = false.obs;
  String? nome;
  String? email;
  String? _token;
  List<Estimativa>? estimativas;
}
