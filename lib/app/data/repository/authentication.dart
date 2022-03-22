import 'package:agrorice/app/data/providers/authentication/login.dart' as login_provider;
import 'package:agrorice/app/data/providers/authentication/register.dart' as register_provider;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

class Authentication {
  // Future<void> login2({required String email, required String senha}) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);

  //     Get.defaultDialog(
  //         title: 'FOI!', middleText: 'Nome:${userCredential.user!.displayName.toString()}\nEmail: ${userCredential.user!.email.toString()}');
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Get.defaultDialog(title: "Erro", middleText: 'Nenhum usuário encontrado com esse e-mail.');
  //     } else if (e.code == 'wrong-password') {
  //       Get.defaultDialog(title: "Erro", middleText: 'Senha incorreta.');
  //     }
  //   } catch (e) {
  //     Get.defaultDialog(title: 'Internal Erro', middleText: 'Erro interno, tente novamente em instantes');
  //   }
  // }

  static Future<String?> register({required String email, required String senha, required String nome}) async {
    try {
      await register_provider.register(email: email, senha: senha, nome: nome);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  static Future<String?> login({required String email, required String senha}) async {
    try {
      await login_provider.login(email: email, senha: senha);
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}
