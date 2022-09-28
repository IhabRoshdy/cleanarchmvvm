// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, (v) => _then(v as _$_LoginObject));

  @override
  _$_LoginObject get _value => super._value as _$_LoginObject;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_LoginObject(
      username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String username, final String password) =
      _$_LoginObject;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegistrationObject {
  String get userName => throw _privateConstructorUsedError;
  String get countryMobileCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationObjectCopyWith<RegistrationObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationObjectCopyWith<$Res> {
  factory $RegistrationObjectCopyWith(
          RegistrationObject value, $Res Function(RegistrationObject) then) =
      _$RegistrationObjectCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture});
}

/// @nodoc
class _$RegistrationObjectCopyWithImpl<$Res>
    implements $RegistrationObjectCopyWith<$Res> {
  _$RegistrationObjectCopyWithImpl(this._value, this._then);

  final RegistrationObject _value;
  // ignore: unused_field
  final $Res Function(RegistrationObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? countryMobileCode = freezed,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode: countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RegistrationObjectCopyWith<$Res>
    implements $RegistrationObjectCopyWith<$Res> {
  factory _$$_RegistrationObjectCopyWith(_$_RegistrationObject value,
          $Res Function(_$_RegistrationObject) then) =
      __$$_RegistrationObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture});
}

/// @nodoc
class __$$_RegistrationObjectCopyWithImpl<$Res>
    extends _$RegistrationObjectCopyWithImpl<$Res>
    implements _$$_RegistrationObjectCopyWith<$Res> {
  __$$_RegistrationObjectCopyWithImpl(
      _$_RegistrationObject _value, $Res Function(_$_RegistrationObject) _then)
      : super(_value, (v) => _then(v as _$_RegistrationObject));

  @override
  _$_RegistrationObject get _value => super._value as _$_RegistrationObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? countryMobileCode = freezed,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$_RegistrationObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationObject implements _RegistrationObject {
  _$_RegistrationObject(this.userName, this.countryMobileCode,
      this.mobileNumber, this.email, this.password, this.profilePicture);

  @override
  final String userName;
  @override
  final String countryMobileCode;
  @override
  final String mobileNumber;
  @override
  final String email;
  @override
  final String password;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'RegistrationObject(userName: $userName, countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.countryMobileCode, countryMobileCode) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(countryMobileCode),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(profilePicture));

  @JsonKey(ignore: true)
  @override
  _$$_RegistrationObjectCopyWith<_$_RegistrationObject> get copyWith =>
      __$$_RegistrationObjectCopyWithImpl<_$_RegistrationObject>(
          this, _$identity);
}

abstract class _RegistrationObject implements RegistrationObject {
  factory _RegistrationObject(
      final String userName,
      final String countryMobileCode,
      final String mobileNumber,
      final String email,
      final String password,
      final String profilePicture) = _$_RegistrationObject;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get countryMobileCode => throw _privateConstructorUsedError;
  @override
  String get mobileNumber => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get profilePicture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationObjectCopyWith<_$_RegistrationObject> get copyWith =>
      throw _privateConstructorUsedError;
}
