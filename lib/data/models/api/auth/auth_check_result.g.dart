// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_check_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthCheckResult> _$authCheckResultSerializer =
    new _$AuthCheckResultSerializer();

class _$AuthCheckResultSerializer
    implements StructuredSerializer<AuthCheckResult> {
  @override
  final Iterable<Type> types = const [AuthCheckResult, _$AuthCheckResult];
  @override
  final String wireName = 'AuthCheckResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthCheckResult object,
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
    value = object.checkedFields;
    if (value != null) {
      result
        ..add('checked_fields')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  AuthCheckResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthCheckResultBuilder();

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
        case 'checked_fields':
          result.checkedFields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$AuthCheckResult extends AuthCheckResult {
  @override
  final bool? success;
  @override
  final BuiltList<String>? checkedFields;
  @override
  final String? message;

  factory _$AuthCheckResult([void Function(AuthCheckResultBuilder)? updates]) =>
      (new AuthCheckResultBuilder()..update(updates)).build();

  _$AuthCheckResult._({this.success, this.checkedFields, this.message})
      : super._();

  @override
  AuthCheckResult rebuild(void Function(AuthCheckResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthCheckResultBuilder toBuilder() =>
      new AuthCheckResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthCheckResult &&
        success == other.success &&
        checkedFields == other.checkedFields &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, success.hashCode), checkedFields.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthCheckResult')
          ..add('success', success)
          ..add('checkedFields', checkedFields)
          ..add('message', message))
        .toString();
  }
}

class AuthCheckResultBuilder
    implements Builder<AuthCheckResult, AuthCheckResultBuilder> {
  _$AuthCheckResult? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<String>? _checkedFields;
  ListBuilder<String> get checkedFields =>
      _$this._checkedFields ??= new ListBuilder<String>();
  set checkedFields(ListBuilder<String>? checkedFields) =>
      _$this._checkedFields = checkedFields;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthCheckResultBuilder();

  AuthCheckResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _checkedFields = $v.checkedFields?.toBuilder();
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthCheckResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthCheckResult;
  }

  @override
  void update(void Function(AuthCheckResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthCheckResult build() {
    _$AuthCheckResult _$result;
    try {
      _$result = _$v ??
          new _$AuthCheckResult._(
              success: success,
              checkedFields: _checkedFields?.build(),
              message: message);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'checkedFields';
        _checkedFields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthCheckResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
