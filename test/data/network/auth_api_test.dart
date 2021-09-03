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

      final loginResponse = await _authApi.login(
        user: 'test_user',
        pass: '12345',
      );

      expect(loginResponse, TypeMatcher<AuthResultSuccess>());
      expect(loginResponse?.success, isTrue);
      expect(loginResponse?.message, equals('Login successful'));
      expect(
        loginResponse?.authToken,
        startsWith('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'),
      );
      expect(
        loginResponse?.refreshToken,
        startsWith('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'),
      );

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

      expect(
          () async => await _authApi.login(
                user: 'test_user',
                pass: '12345',
              ),
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

      expect(
          () async => await _authApi.login(
                user: 'test_user',
                pass: '12345',
              ),
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
      expect(checkUsername?.checkedFields?.first, equals('email'));
      expect(checkUsername?.message, equals('Email is available.'));

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

  group('register', () {
    test('return AuthResultSuccess if successfuly registered.', () async {
      when(
        _mockHttp.post(
          defineUri('/auth/register'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
            <String, String>{
              'username': 'test_user',
              'email': 'test@example.com',
              'password': '12345',
            },
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth_register_success_response'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
        ),
      );

      final registerResponse = await _authApi.register(
        user: 'test_user',
        email: 'test@example.com',
        pass: '12345',
      );

      expect(registerResponse, TypeMatcher<AuthResultSuccess>());
      expect(registerResponse?.success, isTrue);
      expect(registerResponse?.message, equals('Register successful.'));
      expect(
        registerResponse?.authToken,
        startsWith('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'),
      );
      expect(
        registerResponse?.refreshToken,
        startsWith('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'),
      );

      verify(
        _mockHttp.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      );
    });

    test('throws UnknownErrorException if returns status code other than 200',
        () {
      when(
        _mockHttp.post(
          defineUri('/auth/register'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
            <String, String>{
              'username': 'test_user',
              'email': 'test@example.com',
              'password': '12345',
            },
          ),
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

      expect(
          () async => await _authApi.register(
                user: 'test_user',
                email: 'test@example.com',
                pass: '12345',
              ),
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
}
