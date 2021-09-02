library register_data;

import 'package:built_value/built_value.dart';

part 'register_data.g.dart';

abstract class RegisterData
    implements Built<RegisterData, RegisterDataBuilder> {
  String? get username;
  String? get email;
  String? get password;

  RegisterData._();

  factory RegisterData([updates(RegisterDataBuilder b)]) = _$RegisterData;
}
