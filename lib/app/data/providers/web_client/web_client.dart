import 'dart:convert';
import 'package:agrorice/app/data/models/estimate.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:agrorice/app/data/providers/interceptors/logging_interceptor.dart';
import 'package:agrorice/app/data/models/user.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 30),
);
const String baseUrl = 'apiagrorice.herokuapp.com';

class WebClient {
  Future<Usuario> postRegisterUser(String username, String email, String password) async {
    final Response response = await client.post(
      Uri.https(baseUrl, '/api/auth/local/register'),
      body: {
        "username": username,
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }

    throw Exception(_getMessage(response.statusCode));
  }

  Future<Usuario> postLoginUser(String username, String password) async {
    final Response response = await client.post(
      Uri.https(baseUrl, '/api/auth/local'),
      body: {
        "identifier": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }

    throw Exception(_getMessage(response.statusCode));
  }

  Future<Estimativa> postNovaEstimativa({
    required String token,
    required double hectares,
    required int tempoPlantacao,
    required String regiao,
    required double vazao,
    required int preparacaoSolo,
    required double gastoDeAgua,
    required double volume,
  }) async {
    final Response response = await client.post(
      Uri.https(baseUrl, '/api/up-dado/conta'),
      body: jsonEncode(
        {
          "regiao": regiao,
          "preparacao_do_solo": preparacaoSolo,
          "tempo_de_plantacao": tempoPlantacao,
          "vazao": vazao,
          "gasto_de_agua": gastoDeAgua,
          "volume": volume,
          "hectares": hectares
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return Estimativa(hectares, tempoPlantacao, regiao, vazao, preparacaoSolo, gastoDeAgua, volume);
    }

    throw Exception(_getMessage(response.statusCode));
  }

  Future<List<Estimativa>> getEstimativasUsuario(String token) async {
    final Response response = await client.get(
      Uri.https(baseUrl, '/api/test/find-dado'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      if (response.body.toString() == '') {
        return [];
      }

      return List<Estimativa>.from(jsonDecode(utf8.decode(response.bodyBytes)).map((e) => Estimativa.fromJson(e)));
    }

    throw Exception(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {400: 'Houve um erro ao transacionar as informações', 401: 'Falha de autenticação'};
}
