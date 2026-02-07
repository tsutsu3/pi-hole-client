// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordCWProxy {
  Password password(String? password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Password(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Password(...).copyWith(id: 12, name: "My name")
  /// ````
  Password call({String? password});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPassword.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPassword.copyWith.fieldName(...)`
class _$PasswordCWProxyImpl implements _$PasswordCWProxy {
  const _$PasswordCWProxyImpl(this._value);

  final Password _value;

  @override
  Password password(String? password) => this(password: password);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Password(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Password(...).copyWith(id: 12, name: "My name")
  /// ````
  Password call({Object? password = const $CopyWithPlaceholder()}) {
    return Password(
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
    );
  }
}

extension $PasswordCopyWith on Password {
  /// Returns a callable class that can be used as follows: `instanceOfPassword.copyWith(...)` or like so:`instanceOfPassword.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PasswordCWProxy get copyWith => _$PasswordCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Password _$PasswordFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Password', json, ($checkedConvert) {
      final val = Password(
        password: $checkedConvert('password', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
  'password': ?instance.password,
};
