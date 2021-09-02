import 'dart:convert';
import 'dart:io';

import 'package:flutter_aplikasi_catatan_keuangan_app/constants/api_url.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/auth_result_success.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/login_data.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/network/keuanganku_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'keuanganku_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient _mockHttp;
  late KeuanganKuAPI _keuanganKuAPI;

  String fixtures(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  setUp(() {
    _mockHttp = MockClient();
    _keuanganKuAPI = KeuanganKuAPI(_mockHttp);
  });

  group('login', () {
    test('return AuthResultSuccess when username and password is correct',
        () async {
      when(
        _mockHttp.post(
          Uri.parse(Uri.encodeFull('$BASE_URL/auth/login')),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            'username': 'test_user',
            'password': '12345',
          }),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_login_success_response'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      final loginData = LoginData((b) => b
        ..username = 'test_user'
        ..password = '12345');
      final loginResponse = await _keuanganKuAPI.login(loginData);

      expect(loginResponse, TypeMatcher<AuthResultSuccess>());
      expect(loginResponse?.success, isTrue);
      expect(loginResponse?.message, 'Login successful');
      expect(loginResponse?.tokenAuth,
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkd2NAZHdlYnNpdGUuY29tIiwic3ViIjoiZHdjQGR3ZWJzaXRlLmNvbSIsImV4cCI6MTYzMDU4NTQ4NywidWlkIjoieHh4X19fMCIsIm93bmVyX3V1aWQiOiJ4eHgiLCJjbGllbnRfdXVpZCI6Inh4eCIsImNsaWVudF91cmwiOiJ4eHgiLCJjbGllbnRfc3NvX2VtYWlsIjoieHh4IiwiY2xpZW50X3VzZXJfaWQiOjAsImNsaWVudF91c2VybmFtZSI6Inh4eCIsImNsaWVudF9yb2xlX2NvZGUiOiJ4eHgiLCJjbGllbnRfdHlwZV9yZWdpc3RlciI6Inh4eCIsImNsaWVudF91cmxfYWRtaW4iOiJ4eHgiLCJjbGllbnRfdXJsX2FkbWluX3F1ZXJ5IjoieHh4IiwiY2xpZW50X3NjaG9vbF9pZCI6Inh4eCJ9.UKEv8v1Cwzi-6dCtmIm2M99rWI6vb72YBDMd8DGTuls');
    });

    test('Throws UnauthorizedException if username or password is incorrect',
        () async {
      when(
        _mockHttp.post(
          Uri.parse(Uri.encodeFull('$BASE_URL/auth/login')),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            'username': 'test_user',
            'password': '12345',
          }),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_login_failed_response'),
          401,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      final loginData = LoginData((b) => b
        ..username = 'test_user'
        ..password = '12345');

      expect(() async => await _keuanganKuAPI.login(loginData),
          throwsA(TypeMatcher<UnauthorizedException>()));
    });

    test(
        'Throws UnknownErrorException if returns status code other than 200 and 401',
        () {
      when(
        _mockHttp.post(
          Uri.parse(Uri.encodeFull('$BASE_URL/auth/login')),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            'username': 'test_user',
            'password': '12345',
          }),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('internal_server_error'),
          500,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      final loginData = LoginData((b) => b
        ..username = 'test_user'
        ..password = '12345');

      expect(() async => await _keuanganKuAPI.login(loginData),
          throwsA(TypeMatcher<UnknownErrorException>()));
    });
  });
}
