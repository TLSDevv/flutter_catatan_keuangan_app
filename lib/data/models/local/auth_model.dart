library auth_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'auth_model.g.dart';

abstract class AuthModel implements Built<AuthModel, AuthModelBuilder> {
  int? get id;
  String? get user;
  String? get email;
  String? get authToken;
  String? get refreshToken;
  int? get createdAt;
  int? get updatedAt;

  AuthModel._();

  factory AuthModel([updates(AuthModelBuilder b)]) = _$AuthModel;

  String toJson() {
    return json.encode(serializers.serializeWith(AuthModel.serializer, this));
  }

  static AuthModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthModel.serializer, json.decode(jsonString));
  }

  static Serializer<AuthModel> get serializer => _$authModelSerializer;
}
