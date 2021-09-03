library auth_result_success;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'auth_result_success.g.dart';

abstract class AuthResultSuccess
    implements Built<AuthResultSuccess, AuthResultSuccessBuilder> {
  bool? get success;
  String? get message;
  @BuiltValueField(wireName: 'auth_token')
  String? get authToken;
  @BuiltValueField(wireName: 'refresh_token')
  String? get refreshToken;

  AuthResultSuccess._();

  factory AuthResultSuccess([updates(AuthResultSuccessBuilder b)]) =
      _$AuthResultSuccess;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AuthResultSuccess.serializer, this));
  }

  static AuthResultSuccess? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthResultSuccess.serializer, json.decode(jsonString));
  }

  static Serializer<AuthResultSuccess> get serializer =>
      _$authResultSuccessSerializer;
}
