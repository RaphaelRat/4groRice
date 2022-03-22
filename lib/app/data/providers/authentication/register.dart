import 'package:agrorice/app/data/models/user_model.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';

Future<user.User> register({required String email, required String senha, required String nome}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha);
    userCredential.user?.updateDisplayName(nome);
    userCredential.user?.reload();

    final currentUser = userCredential.user!;

    return user.User.fromSnapshot(currentUser);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw 'Senha muito fraca.';
    } else if (e.code == 'email-already-in-use') {
      throw 'Já existe uma conta com esse email.';
    } else if (e.code == 'invalid-email') {
      throw 'Email inválido.';
    }
    throw 'Erro inexperado, tente novamente';
  } catch (e) {
    throw 'Erro inexperado, tente novamente';
  }
}
