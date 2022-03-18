import 'dart:convert';

import 'package:agrorice/app/data/models/estimate.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyEmail = 'email';
  static const _keyJwt = 'token';
  static const _keyEstimates = 'estimates';

  static Future setUsername(String username) async => await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async => await _storage.read(key: _keyUsername);

  static Future setEmail(String email) async => await _storage.write(key: _keyEmail, value: email);

  static Future<String?> getEmail() async => await _storage.read(key: _keyEmail);

  static Future setjwt(String jwt) async => await _storage.write(key: _keyJwt, value: jwt);

  static Future<String?> getjwt() async => await _storage.read(key: _keyJwt);

  static Future setEstimates(List<Estimativa> estimates) async {
    final value = json.encode(estimates);

    await _storage.write(key: _keyEstimates, value: value);
  }

  static Future addEstimates(Estimativa estimate) async {
    List<Estimativa>? estimates = await getEstimates();
    estimates?.add(estimate);
    final value = json.encode(estimates);

    await _storage.write(key: _keyEstimates, value: value);
  }

  static Future<List<Estimativa>?> getEstimates() async {
    final value = await _storage.read(key: _keyEstimates);

    final estimaties = List<Map<String, dynamic>>.from(json.decode(value ?? ''));
    List<Estimativa> lista = [];
    for (var estimatie in estimaties) {
      final teste = Estimativa.fromString(estimatie);
      lista.add(teste);
    }

    return value == null ? null : lista;
  }
}
