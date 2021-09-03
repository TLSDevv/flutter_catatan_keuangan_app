import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/auth/auth_api_model.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/network/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<String?> login({
    required String user,
    required String pass,
  }) async {
    final loginResult = await _authApi.login(user: user, pass: pass);

    // Todo: save user, email, auth_token, refresh_token

    // return token;
  }

  Future<String?> register({
    required String user,
    required String email,
    required String pass,
  }) async {
    final registerResult = await _authApi.register(
      user: user,
      email: email,
      pass: pass,
    );

    // Todo : save user, email, refresh_token
  }
}
