import 'dart:convert';
import 'dart:io';

import 'package:flutter_aplikasi_catatan_keuangan_app/constants/api_url.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/auth_result_failed.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/auth_result_success.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/login_data.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/transaction_result.dart';
import 'package:http/http.dart' as http;

class KeuanganKuAPI {
  final http.Client _http;

  KeuanganKuAPI(this._http);

  /// @route : /auth/login
  /// @description : Authenticate the user
  Future<AuthResultSuccess?> login(LoginData loginData) async {
    final urlRaw = '$BASE_URL/auth/login';
    final urlEncoded = Uri.encodeFull(urlRaw);

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    final body = <String, String>{
      'username': loginData.username ?? '',
      'password': loginData.password ?? ''
    };
    final response = await _http.post(
      Uri.parse(urlEncoded),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return AuthResultSuccess.fromJson(response.body);
    } else if (response.statusCode == 401) {
      final authResultFailed = AuthResultFailed.fromJson(response.body);
      throw new UnauthorizedException(
          authResultFailed?.message ?? 'Unauthorized');
    } else {
      throw new UnknownErrorException();
    }
  }

  /// @route : /auth/register
  /// @description : Register a new user
  Future<AuthResultSuccess?> register() async {}

  /// @route : /user/transactions
  /// @description : Get user transactions
  Future<TransactionResult?> getTransactions(
      {int page = 1, int offset = 0}) async {
    final token = '';
    final urlRaw = '$BASE_URL/user/transactions?page=$page&offset=$offset';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await _http.get(Uri.parse(urlEncoded),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    if (response.statusCode == 200) {}
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}

class UnknownErrorException implements Exception {
  final String message = 'Unknown error';
}
