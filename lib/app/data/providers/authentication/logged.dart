import 'package:firebase_auth/firebase_auth.dart';

bool isLogged() {
  final a = FirebaseAuth.instance.currentUser;

  if (a?.uid == null) {
    return false;
  }
  return true;
}
