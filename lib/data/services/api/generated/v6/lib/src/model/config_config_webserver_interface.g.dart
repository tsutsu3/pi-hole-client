// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_webserver_interface.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigWebserverInterfaceCWProxy {
  ConfigConfigWebserverInterface boxed(bool? boxed);

  ConfigConfigWebserverInterface theme(String? theme);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverInterface(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverInterface(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverInterface call({bool? boxed, String? theme});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigWebserverInterface.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigWebserverInterface.copyWith.fieldName(...)`
class _$ConfigConfigWebserverInterfaceCWProxyImpl
    implements _$ConfigConfigWebserverInterfaceCWProxy {
  const _$ConfigConfigWebserverInterfaceCWProxyImpl(this._value);

  final ConfigConfigWebserverInterface _value;

  @override
  ConfigConfigWebserverInterface boxed(bool? boxed) => this(boxed: boxed);

  @override
  ConfigConfigWebserverInterface theme(String? theme) => this(theme: theme);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverInterface(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverInterface(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverInterface call({
    Object? boxed = const $CopyWithPlaceholder(),
    Object? theme = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigWebserverInterface(
      boxed: boxed == const $CopyWithPlaceholder()
          ? _value.boxed
          // ignore: cast_nullable_to_non_nullable
          : boxed as bool?,
      theme: theme == const $CopyWithPlaceholder()
          ? _value.theme
          // ignore: cast_nullable_to_non_nullable
          : theme as String?,
    );
  }
}

extension $ConfigConfigWebserverInterfaceCopyWith
    on ConfigConfigWebserverInterface {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigWebserverInterface.copyWith(...)` or like so:`instanceOfConfigConfigWebserverInterface.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigWebserverInterfaceCWProxy get copyWith =>
      _$ConfigConfigWebserverInterfaceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigWebserverInterface _$ConfigConfigWebserverInterfaceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigWebserverInterface', json, ($checkedConvert) {
  final val = ConfigConfigWebserverInterface(
    boxed: $checkedConvert('boxed', (v) => v as bool?),
    theme: $checkedConvert('theme', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigWebserverInterfaceToJson(
  ConfigConfigWebserverInterface instance,
) => <String, dynamic>{'boxed': ?instance.boxed, 'theme': ?instance.theme};
