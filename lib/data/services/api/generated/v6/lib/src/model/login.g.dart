// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginCWProxy {
  Login httpsPort(int? httpsPort);

  Login dns(bool? dns);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Login(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Login(...).copyWith(id: 12, name: "My name")
  /// ````
  Login call({int? httpsPort, bool? dns});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLogin.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLogin.copyWith.fieldName(...)`
class _$LoginCWProxyImpl implements _$LoginCWProxy {
  const _$LoginCWProxyImpl(this._value);

  final Login _value;

  @override
  Login httpsPort(int? httpsPort) => this(httpsPort: httpsPort);

  @override
  Login dns(bool? dns) => this(dns: dns);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Login(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Login(...).copyWith(id: 12, name: "My name")
  /// ````
  Login call({
    Object? httpsPort = const $CopyWithPlaceholder(),
    Object? dns = const $CopyWithPlaceholder(),
  }) {
    return Login(
      httpsPort: httpsPort == const $CopyWithPlaceholder()
          ? _value.httpsPort
          // ignore: cast_nullable_to_non_nullable
          : httpsPort as int?,
      dns: dns == const $CopyWithPlaceholder()
          ? _value.dns
          // ignore: cast_nullable_to_non_nullable
          : dns as bool?,
    );
  }
}

extension $LoginCopyWith on Login {
  /// Returns a callable class that can be used as follows: `instanceOfLogin.copyWith(...)` or like so:`instanceOfLogin.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginCWProxy get copyWith => _$LoginCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Login', json, ($checkedConvert) {
      final val = Login(
        httpsPort: $checkedConvert('https_port', (v) => (v as num?)?.toInt()),
        dns: $checkedConvert('dns', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'httpsPort': 'https_port'});

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'https_port': ?instance.httpsPort,
  'dns': ?instance.dns,
};
