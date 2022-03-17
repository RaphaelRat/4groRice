// Modelo da conta do usuário

class Usuario {
  late String id;
  late String username;
  late String email;
  late String jwt;

  Usuario(
    this.id,
    this.username,
    this.email,
    this.jwt,
  );

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'].toString() == 'null' ? '' : json['user']['id'],
        username = json['user']['username'].toString() == 'null'
            ? ''
            : json['user']['username'],
        email = json['user']['email'].toString() == 'null'
            ? ''
            : json['user']['email'],
        jwt = json['jwt'].toString() == 'null' ? '' : json['jwt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': username,
        'email': email,
        'jwt': jwt,
      };

  @override
  String toString() {
    return 'Usuario{id: $id, username: $username, email: $email, jwt: $jwt}';
  }
}
