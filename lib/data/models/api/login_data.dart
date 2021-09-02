library login_data;

import 'package:built_value/built_value.dart';

part 'login_data.g.dart';

abstract class LoginData implements Built<LoginData, LoginDataBuilder> {
  String? get username;
  String? get password;

  LoginData._();

  factory LoginData([updates(LoginDataBuilder b)]) = _$LoginData;
}
