import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:agrorice/app/data/providers/interceptors/logging_interceptor.dart';
import 'package:agrorice/app/data/models/user.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 30),
);
const String baseUrl = 'https://apiagrorice.herokuapp.com';

class WebClient {
  Future<User> postRegisterUser(
      String username, String email, String password) async {
    final Response response = await client.post(
      Uri.http(baseUrl, '/api/auth/local/register'),
      body: {
        "username": username,
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }

    throw Exception(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'Houve um erro ao transacionar as informações',
    401: 'Falha de autenticação'
  };
}
