import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/auth/auth_api_model.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/exceptions/api_exception_model.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/network/auth_api.dart';

import '../../util.dart';
import 'keuanganku_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient _mockHttp;
  late AuthApi _authApi;

  setUp(() {
    _mockHttp = MockClient();
    _authApi = AuthApi(_mockHttp);
  });

  group('login', () {
    test('return AuthResultSuccess when username and password is correct.',
        () async {
      when(
        _mockHttp.post(
          defineUri('/auth/login'),
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
      final loginResponse = await _authApi.login(loginData);

      expect(loginResponse, TypeMatcher<AuthResultSuccess>());
      expect(loginResponse?.success, isTrue);
      expect(loginResponse?.message, 'Login successful');
      expect(loginResponse?.tokenAuth,
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkd2NAZHdlYnNpdGUuY29tIiwic3ViIjoiZHdjQGR3ZWJzaXRlLmNvbSIsImV4cCI6MTYzMDU4NTQ4NywidWlkIjoieHh4X19fMCIsIm93bmVyX3V1aWQiOiJ4eHgiLCJjbGllbnRfdXVpZCI6Inh4eCIsImNsaWVudF91cmwiOiJ4eHgiLCJjbGllbnRfc3NvX2VtYWlsIjoieHh4IiwiY2xpZW50X3VzZXJfaWQiOjAsImNsaWVudF91c2VybmFtZSI6Inh4eCIsImNsaWVudF9yb2xlX2NvZGUiOiJ4eHgiLCJjbGllbnRfdHlwZV9yZWdpc3RlciI6Inh4eCIsImNsaWVudF91cmxfYWRtaW4iOiJ4eHgiLCJjbGllbnRfdXJsX2FkbWluX3F1ZXJ5IjoieHh4IiwiY2xpZW50X3NjaG9vbF9pZCI6Inh4eCJ9.UKEv8v1Cwzi-6dCtmIm2M99rWI6vb72YBDMd8DGTuls');

      verify(
        _mockHttp.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      );
    });

    test('throws UnauthorizedException if username or password is incorrect.',
        () async {
      when(
        _mockHttp.post(
          defineUri('/auth/login'),
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

      expect(() async => await _authApi.login(loginData),
          throwsA(TypeMatcher<UnauthorizedException>()));

      verify(
        _mockHttp.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      );
    });

    test(
        'throws UnknownErrorException if returns status code other than 200 and 401.',
        () {
      when(
        _mockHttp.post(
          defineUri('/auth/login'),
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

      expect(() async => await _authApi.login(loginData),
          throwsA(TypeMatcher<UnknownErrorException>()));

      verify(
        _mockHttp.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      );
    });
  });

  group('checkUsername', () {
    test('return AuthCheckResult if username is available.', () async {
      when(
        _mockHttp.get(
          defineUri(
            '/auth/check',
            params: {'username': 'test_username'},
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_check_success'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      final checkUsername = await _authApi.checkUsername('test_username');
      expect(checkUsername, TypeMatcher<AuthCheckResult>());
      expect(checkUsername?.success, isTrue);
      expect(checkUsername?.checkedFields, TypeMatcher<BuiltList<String>>());
      expect(checkUsername?.checkedFields?.length, 1);
      expect(checkUsername?.checkedFields?.first, 'username');
      expect(checkUsername?.message, startsWith('Username is available'));

      verify(_mockHttp.get(any, headers: anyNamed('headers')));
    });

    test('throws an AlreadyInUseException if username already in use.',
        () async {
      when(
        _mockHttp.get(
          defineUri(
            '/auth/check',
            params: {'username': 'test_username'},
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_check_fail'),
          409,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      expect(
        () async => await _authApi.checkUsername('test_username'),
        throwsA(TypeMatcher<AlreadyInUseException>()),
      );

      verify(_mockHttp.get(any, headers: anyNamed('headers')));
    });

    test(
        'throws UnknownErrorException if returns status code other than 200 and 409.',
        () {
      when(
        _mockHttp.get(
          defineUri(
            '/auth/check',
            params: {'username': 'test_username'},
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
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

      expect(() async => await _authApi.checkUsername('test_username'),
          throwsA(TypeMatcher<UnknownErrorException>()));

      verify(_mockHttp.get(any, headers: anyNamed('headers')));
    });
  });

  group('checkEmail', () {
    test('return AuthCheckResult if email is available.', () async {
      when(
        _mockHttp.get(
          defineUri(
            '/auth/check',
            params: {'email': 'test.email@example.com'},
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_check_success2'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      final checkUsername = await _authApi.checkEmail('test.email@example.com');
      expect(checkUsername, TypeMatcher<AuthCheckResult>());
      expect(checkUsername?.success, isTrue);
      expect(checkUsername?.checkedFields, TypeMatcher<BuiltList<String>>());
      expect(checkUsername?.checkedFields?.length, 1);
      expect(checkUsername?.checkedFields?.first, 'email');
      expect(checkUsername?.message, startsWith('Email is available'));

      verify(_mockHttp.get(any, headers: anyNamed('headers')));
    });

    test('throws an AlreadyInUseException if email already in use.', () async {
      when(
        _mockHttp.get(
          defineUri(
            '/auth/check',
            params: {'email': 'test_email@example.com'},
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_check_fail'),
          409,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      expect(
        () async => await _authApi.checkEmail('test_email@example.com'),
        throwsA(TypeMatcher<AlreadyInUseException>()),
      );

      verify(_mockHttp.get(any, headers: anyNamed('headers')));
    });

    test(
        'throws UnknownErrorException if returns status code other than 200 and 409.',
        () {
      when(
        _mockHttp.get(
          defineUri(
            '/auth/check',
            params: {'email': 'test.email@example.com'},
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
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

      expect(() async => await _authApi.checkEmail('test.email@example.com'),
          throwsA(TypeMatcher<UnknownErrorException>()));

      verify(_mockHttp.get(any, headers: anyNamed('headers')));
    });
  });
}
