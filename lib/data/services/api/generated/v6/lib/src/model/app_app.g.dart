// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_app.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppAppCWProxy {
  AppApp password(String? password);

  AppApp hash(String? hash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppApp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppApp(...).copyWith(id: 12, name: "My name")
  /// ````
  AppApp call({String? password, String? hash});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppApp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppApp.copyWith.fieldName(...)`
class _$AppAppCWProxyImpl implements _$AppAppCWProxy {
  const _$AppAppCWProxyImpl(this._value);

  final AppApp _value;

  @override
  AppApp password(String? password) => this(password: password);

  @override
  AppApp hash(String? hash) => this(hash: hash);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppApp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppApp(...).copyWith(id: 12, name: "My name")
  /// ````
  AppApp call({
    Object? password = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
  }) {
    return AppApp(
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      hash: hash == const $CopyWithPlaceholder()
          ? _value.hash
          // ignore: cast_nullable_to_non_nullable
          : hash as String?,
    );
  }
}

extension $AppAppCopyWith on AppApp {
  /// Returns a callable class that can be used as follows: `instanceOfAppApp.copyWith(...)` or like so:`instanceOfAppApp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppAppCWProxy get copyWith => _$AppAppCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppApp _$AppAppFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppApp', json, ($checkedConvert) {
      final val = AppApp(
        password: $checkedConvert('password', (v) => v as String?),
        hash: $checkedConvert('hash', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AppAppToJson(AppApp instance) => <String, dynamic>{
  'password': ?instance.password,
  'hash': ?instance.hash,
};
