// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthModel> _$authModelSerializer = new _$AuthModelSerializer();

class _$AuthModelSerializer implements StructuredSerializer<AuthModel> {
  @override
  final Iterable<Type> types = const [AuthModel, _$AuthModel];
  @override
  final String wireName = 'AuthModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.authToken;
    if (value != null) {
      result
        ..add('authToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refreshToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AuthModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'authToken':
          result.authToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refreshToken':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthModel extends AuthModel {
  @override
  final int? id;
  @override
  final String? user;
  @override
  final String? email;
  @override
  final String? authToken;
  @override
  final String? refreshToken;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  factory _$AuthModel([void Function(AuthModelBuilder)? updates]) =>
      (new AuthModelBuilder()..update(updates)).build();

  _$AuthModel._(
      {this.id,
      this.user,
      this.email,
      this.authToken,
      this.refreshToken,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  AuthModel rebuild(void Function(AuthModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthModelBuilder toBuilder() => new AuthModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthModel &&
        id == other.id &&
        user == other.user &&
        email == other.email &&
        authToken == other.authToken &&
        refreshToken == other.refreshToken &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), user.hashCode),
                        email.hashCode),
                    authToken.hashCode),
                refreshToken.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthModel')
          ..add('id', id)
          ..add('user', user)
          ..add('email', email)
          ..add('authToken', authToken)
          ..add('refreshToken', refreshToken)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AuthModelBuilder implements Builder<AuthModel, AuthModelBuilder> {
  _$AuthModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _authToken;
  String? get authToken => _$this._authToken;
  set authToken(String? authToken) => _$this._authToken = authToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  int? _updatedAt;
  int? get updatedAt => _$this._updatedAt;
  set updatedAt(int? updatedAt) => _$this._updatedAt = updatedAt;

  AuthModelBuilder();

  AuthModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user = $v.user;
      _email = $v.email;
      _authToken = $v.authToken;
      _refreshToken = $v.refreshToken;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthModel;
  }

  @override
  void update(void Function(AuthModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthModel build() {
    final _$result = _$v ??
        new _$AuthModel._(
            id: id,
            user: user,
            email: email,
            authToken: authToken,
            refreshToken: refreshToken,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
