import 'package:agrorice/app/data/models/user_model.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';

class User {
  final userFirebase = FirebaseAuth.instance.currentUser!;

  user_model.User getUser() {
    return user_model.User.fromSnapshot(userFirebase);
  }
}
