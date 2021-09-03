// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginData extends LoginData {
  @override
  final String username;
  @override
  final String password;

  factory _$LoginData([void Function(LoginDataBuilder)? updates]) =>
      (new LoginDataBuilder()..update(updates)).build();

  _$LoginData._({required this.username, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'LoginData', 'username');
    BuiltValueNullFieldError.checkNotNull(password, 'LoginData', 'password');
  }

  @override
  LoginData rebuild(void Function(LoginDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginDataBuilder toBuilder() => new LoginDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginData &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginData')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class LoginDataBuilder implements Builder<LoginData, LoginDataBuilder> {
  _$LoginData? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  LoginDataBuilder();

  LoginDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginData;
  }

  @override
  void update(void Function(LoginDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginData build() {
    final _$result = _$v ??
        new _$LoginData._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'LoginData', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'LoginData', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
