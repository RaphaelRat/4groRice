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
  final solo = false.obs;
  final isObscureText = false.obs;

  String? nome;
  String? email;
  String? _token;
  List<Estimativa>? estimativas;

  final vazaoController = TextEditingController();
  final tempoPlantacaoController = TextEditingController();
  final hectaresController = TextEditingController();
  final tempoPreparacaoController = TextEditingController();

  final dropdownValue = 'Sul'.obs;

  void alteraRegiao(String regiao) {
    dropdownValue.value = regiao;
  }
}
