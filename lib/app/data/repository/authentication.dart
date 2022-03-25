import 'package:agrorice/app/data/providers/authentication/logged.dart' as logged_provider;
import 'package:agrorice/app/data/providers/authentication/login.dart' as login_provider;
import 'package:agrorice/app/data/providers/authentication/register.dart' as register_provider;

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

  static bool isLogged() {
    return logged_provider.isLogged();
  }
}
