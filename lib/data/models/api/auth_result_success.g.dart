// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_result_success;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthResultSuccess> _$authResultSuccessSerializer =
    new _$AuthResultSuccessSerializer();

class _$AuthResultSuccessSerializer
    implements StructuredSerializer<AuthResultSuccess> {
  @override
  final Iterable<Type> types = const [AuthResultSuccess, _$AuthResultSuccess];
  @override
  final String wireName = 'AuthResultSuccess';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthResultSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tokenAuth;
    if (value != null) {
      result
        ..add('token_auth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthResultSuccess deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthResultSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token_auth':
          result.tokenAuth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthResultSuccess extends AuthResultSuccess {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final String? tokenAuth;

  factory _$AuthResultSuccess(
          [void Function(AuthResultSuccessBuilder)? updates]) =>
      (new AuthResultSuccessBuilder()..update(updates)).build();

  _$AuthResultSuccess._({this.success, this.message, this.tokenAuth})
      : super._();

  @override
  AuthResultSuccess rebuild(void Function(AuthResultSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResultSuccessBuilder toBuilder() =>
      new AuthResultSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResultSuccess &&
        success == other.success &&
        message == other.message &&
        tokenAuth == other.tokenAuth;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, success.hashCode), message.hashCode), tokenAuth.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthResultSuccess')
          ..add('success', success)
          ..add('message', message)
          ..add('tokenAuth', tokenAuth))
        .toString();
  }
}

class AuthResultSuccessBuilder
    implements Builder<AuthResultSuccess, AuthResultSuccessBuilder> {
  _$AuthResultSuccess? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _tokenAuth;
  String? get tokenAuth => _$this._tokenAuth;
  set tokenAuth(String? tokenAuth) => _$this._tokenAuth = tokenAuth;

  AuthResultSuccessBuilder();

  AuthResultSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _tokenAuth = $v.tokenAuth;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthResultSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthResultSuccess;
  }

  @override
  void update(void Function(AuthResultSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthResultSuccess build() {
    final _$result = _$v ??
        new _$AuthResultSuccess._(
            success: success, message: message, tokenAuth: tokenAuth);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
