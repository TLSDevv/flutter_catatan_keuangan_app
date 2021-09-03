import 'dart:convert';
import 'dart:io';

import 'package:flutter_aplikasi_catatan_keuangan_app/constants/api_url.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/auth/auth_api_model.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/exceptions/api_exception_model.dart';

import 'package:http/http.dart' as http;

class AuthApi {
  final http.Client _http;

  AuthApi(this._http);

  /// Authenticate a user by using username and password.
  ///
  /// Throws an [UnauthorizedException] if username or password isn't match with database.
  ///
  /// Throws an [UnknownErrorException] if server not returns either **200 OK** or **401 Unauthorized**.
  /// For example server returns **500 Internal Server Error**, we will classify this as *unknown error*.
  Future<AuthResultSuccess?> login(LoginData loginData) async {
    final uriEncoded = Uri.https('$BASE_URL', '/auth/login');
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
    final body = <String, String>{
      'username': loginData.username,
      'password': loginData.password
    };
    final response = await _http.post(
      uriEncoded,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return AuthResultSuccess.fromJson(response.body);
    } else if (response.statusCode == 401) {
      final authResultFailed = AuthResultFailed.fromJson(response.body);
      throw UnauthorizedException(authResultFailed?.message ?? 'Unauthorized');
    } else {
      throw UnknownErrorException();
    }
  }

  /// Check if username is already in use.
  ///
  /// Throws an [AlreadyInUseException] if username or password isn't match with database.
  ///
  /// Throws an [UnknownErrorException]
  Future<AuthCheckResult?> checkUsername(String username) async {
    final uriEncoded = Uri.https(
      '$BASE_URL',
      '/auth/check',
      {
        'username': username,
      },
    );
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
    final response = await _http.get(uriEncoded, headers: headers);
    if (response.statusCode == 200) {
      return AuthCheckResult.fromJson(response.body);
    } else if (response.statusCode == 409) {
      final alreadyInUseResponse = AuthCheckResult.fromJson(response.body);
      throw AlreadyInUseException(
          alreadyInUseResponse?.message ?? '$username is already in use');
    } else {
      throw UnknownErrorException();
    }
  }

  /// Check if email is already in use.
  ///
  /// Throws an [UnknownErrorException]
  Future<AuthCheckResult?> checkEmail(String email) async {
    final uriEncoded = Uri.https('$BASE_URL', '/auth/check', {'email': email});
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
    final response = await _http.get(uriEncoded, headers: headers);

    if (response.statusCode == 200) {
      return AuthCheckResult.fromJson(response.body);
    } else if (response.statusCode == 409) {
      final alreadyInUseResponse = AuthCheckResult.fromJson(response.body);
      throw AlreadyInUseException(
          alreadyInUseResponse?.message ?? '$email is already in use');
    } else {
      throw UnknownErrorException();
    }
  }

  /// Register a new user.
  ///
  /// Throws an [UnauthorizedException] if username or password isn't match with database.
  ///
  /// Throws an [UnknownErrorException] if server not returns either **200 OK** or **401 Unauthorized**.
  /// For example server returns **500 Internal Server Error**, we will classify this as *unknown error*.
  Future<AuthResultSuccess?> register(RegisterData registerData) async {
    final urlRaw = '$BASE_URL/auth/register';
    final urlEncoded = Uri.encodeFull(urlRaw);

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    final body = <String, String>{
      'username': registerData.username,
      'email': registerData.email,
      'password': registerData.password
    };
    final response = await _http.post(
      Uri.parse(urlEncoded),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return AuthResultSuccess.fromJson(response.body);
    } else {
      throw new UnknownErrorException();
    }
  }
}
