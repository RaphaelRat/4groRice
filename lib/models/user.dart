// Modelo da conta do usuário

class User {
  late String id;
  late String email;
  late String name;

  User(
    this.id,
    this.email,
    this.name,
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString() == 'null' ? '' : json['id'],
        email = json['email'].toString() == 'null' ? '' : json['email'],
        name = json['name'].toString() == 'null' ? '' : json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
      };

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name}';
  }
}
