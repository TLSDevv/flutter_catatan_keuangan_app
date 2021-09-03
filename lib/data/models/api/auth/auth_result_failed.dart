library auth_result_failed;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'auth_result_failed.g.dart';

abstract class AuthResultFailed
    implements Built<AuthResultFailed, AuthResultFailedBuilder> {
  bool? get success;
  String? get message;

  AuthResultFailed._();

  factory AuthResultFailed([updates(AuthResultFailedBuilder b)]) =
      _$AuthResultFailed;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AuthResultFailed.serializer, this));
  }

  static AuthResultFailed? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthResultFailed.serializer, json.decode(jsonString));
  }

  static Serializer<AuthResultFailed> get serializer =>
      _$authResultFailedSerializer;
}
