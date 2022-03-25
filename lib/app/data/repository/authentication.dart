import 'package:agrorice/app/data/providers/authentication/login.dart' as login_provider;
import 'package:agrorice/app/data/providers/authentication/register.dart' as register_provider;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

class Authentication {
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
