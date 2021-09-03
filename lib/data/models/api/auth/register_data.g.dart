// GENERATED CODE - DO NOT MODIFY BY HAND

part of register_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterData extends RegisterData {
  @override
  final String username;
  @override
  final String email;
  @override
  final String password;

  factory _$RegisterData([void Function(RegisterDataBuilder)? updates]) =>
      (new RegisterDataBuilder()..update(updates)).build();

  _$RegisterData._(
      {required this.username, required this.email, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'RegisterData', 'username');
    BuiltValueNullFieldError.checkNotNull(email, 'RegisterData', 'email');
    BuiltValueNullFieldError.checkNotNull(password, 'RegisterData', 'password');
  }

  @override
  RegisterData rebuild(void Function(RegisterDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterDataBuilder toBuilder() => new RegisterDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterData &&
        username == other.username &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, username.hashCode), email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterData')
          ..add('username', username)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class RegisterDataBuilder
    implements Builder<RegisterData, RegisterDataBuilder> {
  _$RegisterData? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  RegisterDataBuilder();

  RegisterDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterData;
  }

  @override
  void update(void Function(RegisterDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterData build() {
    final _$result = _$v ??
        new _$RegisterData._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'RegisterData', 'username'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'RegisterData', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'RegisterData', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
