import 'package:firebase_auth/firebase_auth.dart' as fire_auth;

class User {
  String id;
  String name;
  String email;
  String photo;

  User({required this.id, required this.name, required this.email, required this.photo});

  User.fromSnapshot(fire_auth.User currentUser)
      : id = currentUser.uid,
        name = currentUser.displayName ?? 'Sem nome',
        email = currentUser.email!,
        photo = currentUser.photoURL ?? '0';

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "photo": photo,
    };
  }

  @override
  String toString() {
    return 'id: $id, name: $name, email: $email, photo: $photo';
  }
}
