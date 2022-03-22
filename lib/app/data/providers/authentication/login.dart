import 'package:agrorice/app/data/models/user_model.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';

Future<user.User> login({required String email, required String senha}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
    final currentUser = userCredential.user!;

    return user.User.fromSnapshot(currentUser);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw 'Nenhum usuário encontrado com esse e-mail';
    } else if (e.code == 'wrong-password') {
      throw 'Senha incorreta';
    } else if (e.code == 'invalid-email') {
      throw 'E-mail inválido';
    } else if (e.code == 'too-many-requests') {
      throw 'Muitas tentativas, tente novamente mais tarde';
    }
    throw 'Erro inexperado, tente novamente';
  } catch (e) {
    throw 'Erro inexperado, tente novamente';
  }
}
