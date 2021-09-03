import 'dart:io';

import 'package:flutter_aplikasi_catatan_keuangan_app/constants/api_url.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/transaction_result.dart';
import 'package:http/http.dart' as http;

class KeuanganKuAPI {
  final http.Client _http;

  KeuanganKuAPI(this._http);

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