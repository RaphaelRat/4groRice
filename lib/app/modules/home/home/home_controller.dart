import 'package:agrorice/app/core/utils/user_secure_storage.dart';
import 'package:agrorice/app/data/models/estimate.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final solo = false.obs;
  final isObscureText = false.obs;
  String? nome;
  String? email;
  String? _token;
  List<Estimativa>? estimativas;
  final isEstimativasLoading = true.obs;

  @override
  Future<void> onInit() async {
    nome = await UserSecureStorage.getUsername();
    email = await UserSecureStorage.getEmail();
    _token = await UserSecureStorage.getjwt();
    estimativas = await UserSecureStorage.getEstimates();
    isEstimativasLoading.value = false;
    super.onInit();
  }
}
