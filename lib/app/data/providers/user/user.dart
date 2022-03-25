import 'package:agrorice/app/data/models/user_model.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';

user_model.User getUser() {
  return user_model.User.fromSnapshot(FirebaseAuth.instance.currentUser!);
}
