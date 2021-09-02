// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_result_failed;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthResultFailed> _$authResultFailedSerializer =
    new _$AuthResultFailedSerializer();

class _$AuthResultFailedSerializer
    implements StructuredSerializer<AuthResultFailed> {
  @override
  final Iterable<Type> types = const [AuthResultFailed, _$AuthResultFailed];
  @override
  final String wireName = 'AuthResultFailed';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthResultFailed object,
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
    return result;
  }

  @override
  AuthResultFailed deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthResultFailedBuilder();

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
      }
    }

    return result.build();
  }
}

class _$AuthResultFailed extends AuthResultFailed {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$AuthResultFailed(
          [void Function(AuthResultFailedBuilder)? updates]) =>
      (new AuthResultFailedBuilder()..update(updates)).build();

  _$AuthResultFailed._({this.success, this.message}) : super._();

  @override
  AuthResultFailed rebuild(void Function(AuthResultFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResultFailedBuilder toBuilder() =>
      new AuthResultFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResultFailed &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthResultFailed')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class AuthResultFailedBuilder
    implements Builder<AuthResultFailed, AuthResultFailedBuilder> {
  _$AuthResultFailed? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthResultFailedBuilder();

  AuthResultFailedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthResultFailed other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthResultFailed;
  }

  @override
  void update(void Function(AuthResultFailedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthResultFailed build() {
    final _$result =
        _$v ?? new _$AuthResultFailed._(success: success, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
