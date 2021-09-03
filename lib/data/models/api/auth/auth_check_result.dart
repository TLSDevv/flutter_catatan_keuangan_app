library auth_check_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'auth_check_result.g.dart';

abstract class AuthCheckResult
    implements Built<AuthCheckResult, AuthCheckResultBuilder> {
  bool? get success;
  @BuiltValueField(wireName: 'checked_fields')
  BuiltList<String>? get checkedFields;
  String? get message;

  AuthCheckResult._();

  factory AuthCheckResult([updates(AuthCheckResultBuilder b)]) =
      _$AuthCheckResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AuthCheckResult.serializer, this));
  }

  static AuthCheckResult? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthCheckResult.serializer, json.decode(jsonString));
  }

  static Serializer<AuthCheckResult> get serializer =>
      _$authCheckResultSerializer;
}
