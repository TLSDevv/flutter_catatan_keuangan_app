import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'keuanganku_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient _mockHttp;

  String fixtures(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  setUp(() {
    _mockHttp = MockClient();
  });

  group('login', () {
    test('return AuthResultSuccess when username and password is correct',
        () async {});

    test('Throws UnauthorizedException if username or password is incorrect',
        () async {});

    test(
        'Throws UnknownErrorException if returns status code other than 200 and 401',
        () {});
  });
}
