import 'package:agrorice/app/data/repository/authentication.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  String email = '';
  String password = '';
  String password2 = '';
  String name = '';
  bool isFieldsEmpty = true;

  final isObscureText = true.obs;
  final errorMessage = ''.obs;
  final isLoading = false.obs;
  final isAuth = false.obs;

  void registrar() async {
    isLoading.value = true;

    _updateErrorMessage();
    if (isFieldsEmpty) {
      return;
    }

    errorMessage.value = await Authentication.register(email: email, senha: password, nome: name) ?? '';
    isLoading.value = false;

    if (errorMessage.value.isEmpty) {
      isAuth.value = true;
      await Future.delayed(const Duration(seconds: 1));
      // Navigate to Home
      isAuth.value = false;
    }
  }

  void validateEmail(String? email) {
    this.email = email?.replaceAll(' ', '') ?? '';
    _updateErrorMessage();
  }

  void validatePassword(String? password) {
    this.password = password ?? '';
    _updateErrorMessage();
  }

  void validatePassword2(String? password2) {
    this.password2 = password2 ?? '';
    _updateErrorMessage();
  }

  void validateName(String? name) {
    this.name = name ?? '';
    _updateErrorMessage();
  }

  void _updateErrorMessage() {
    if (email.isEmpty || password.isEmpty || password2.isEmpty || name.isEmpty) {
      errorMessage.value = "Preencha todos os campos!";
      isLoading.value = false;
      isFieldsEmpty = true;
      return;
    }
    isFieldsEmpty = false;
    errorMessage.value = '';
  }

  // try {
  //   final response = await webClient.postRegisterUser(nomeController.text, emailController.text, senha1Controller.text);

  //   final jwt = response.jwt;
  //   final username = response.username;
  //   final email = response.email;
  //   final estimates = await webClient.getEstimativasUsuario(jwt);
  //   await UserSecureStorage.setjwt(jwt);
  //   await UserSecureStorage.setUsername(username);
  //   await UserSecureStorage.setEmail(email);
  //   await UserSecureStorage.setEstimates(estimates);
  //   Get.offAllNamed(HomeScreen.route);
  // } catch (e) {
  //   Get.defaultDialog(title: 'Erro', middleText: 'Email já existente, tente logar!');
  // }
}
