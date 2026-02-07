// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_webserver_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigWebserverSessionCWProxy {
  ConfigConfigWebserverSession timeout(int? timeout);

  ConfigConfigWebserverSession restore(bool? restore);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverSession(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverSession call({int? timeout, bool? restore});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigWebserverSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigWebserverSession.copyWith.fieldName(...)`
class _$ConfigConfigWebserverSessionCWProxyImpl
    implements _$ConfigConfigWebserverSessionCWProxy {
  const _$ConfigConfigWebserverSessionCWProxyImpl(this._value);

  final ConfigConfigWebserverSession _value;

  @override
  ConfigConfigWebserverSession timeout(int? timeout) => this(timeout: timeout);

  @override
  ConfigConfigWebserverSession restore(bool? restore) => this(restore: restore);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverSession(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverSession call({
    Object? timeout = const $CopyWithPlaceholder(),
    Object? restore = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigWebserverSession(
      timeout: timeout == const $CopyWithPlaceholder()
          ? _value.timeout
          // ignore: cast_nullable_to_non_nullable
          : timeout as int?,
      restore: restore == const $CopyWithPlaceholder()
          ? _value.restore
          // ignore: cast_nullable_to_non_nullable
          : restore as bool?,
    );
  }
}

extension $ConfigConfigWebserverSessionCopyWith
    on ConfigConfigWebserverSession {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigWebserverSession.copyWith(...)` or like so:`instanceOfConfigConfigWebserverSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigWebserverSessionCWProxy get copyWith =>
      _$ConfigConfigWebserverSessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigWebserverSession _$ConfigConfigWebserverSessionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigWebserverSession', json, ($checkedConvert) {
  final val = ConfigConfigWebserverSession(
    timeout: $checkedConvert('timeout', (v) => (v as num?)?.toInt()),
    restore: $checkedConvert('restore', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigWebserverSessionToJson(
  ConfigConfigWebserverSession instance,
) => <String, dynamic>{
  'timeout': ?instance.timeout,
  'restore': ?instance.restore,
};
