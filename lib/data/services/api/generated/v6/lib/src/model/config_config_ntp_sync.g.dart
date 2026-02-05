// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_ntp_sync.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigNtpSyncCWProxy {
  ConfigConfigNtpSync active(bool? active);

  ConfigConfigNtpSync server(String? server);

  ConfigConfigNtpSync interval(int? interval);

  ConfigConfigNtpSync count(int? count);

  ConfigConfigNtpSync rtc(ConfigConfigNtpSyncRtc? rtc);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpSync(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpSync(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpSync call({
    bool? active,
    String? server,
    int? interval,
    int? count,
    ConfigConfigNtpSyncRtc? rtc,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigNtpSync.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigNtpSync.copyWith.fieldName(...)`
class _$ConfigConfigNtpSyncCWProxyImpl implements _$ConfigConfigNtpSyncCWProxy {
  const _$ConfigConfigNtpSyncCWProxyImpl(this._value);

  final ConfigConfigNtpSync _value;

  @override
  ConfigConfigNtpSync active(bool? active) => this(active: active);

  @override
  ConfigConfigNtpSync server(String? server) => this(server: server);

  @override
  ConfigConfigNtpSync interval(int? interval) => this(interval: interval);

  @override
  ConfigConfigNtpSync count(int? count) => this(count: count);

  @override
  ConfigConfigNtpSync rtc(ConfigConfigNtpSyncRtc? rtc) => this(rtc: rtc);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpSync(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpSync(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpSync call({
    Object? active = const $CopyWithPlaceholder(),
    Object? server = const $CopyWithPlaceholder(),
    Object? interval = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? rtc = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigNtpSync(
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
      server: server == const $CopyWithPlaceholder()
          ? _value.server
          // ignore: cast_nullable_to_non_nullable
          : server as String?,
      interval: interval == const $CopyWithPlaceholder()
          ? _value.interval
          // ignore: cast_nullable_to_non_nullable
          : interval as int?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      rtc: rtc == const $CopyWithPlaceholder()
          ? _value.rtc
          // ignore: cast_nullable_to_non_nullable
          : rtc as ConfigConfigNtpSyncRtc?,
    );
  }
}

extension $ConfigConfigNtpSyncCopyWith on ConfigConfigNtpSync {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigNtpSync.copyWith(...)` or like so:`instanceOfConfigConfigNtpSync.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigNtpSyncCWProxy get copyWith =>
      _$ConfigConfigNtpSyncCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigNtpSync _$ConfigConfigNtpSyncFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfigNtpSync', json, ($checkedConvert) {
      final val = ConfigConfigNtpSync(
        active: $checkedConvert('active', (v) => v as bool?),
        server: $checkedConvert('server', (v) => v as String?),
        interval: $checkedConvert('interval', (v) => (v as num?)?.toInt()),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        rtc: $checkedConvert(
          'rtc',
          (v) => v == null
              ? null
              : ConfigConfigNtpSyncRtc.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConfigConfigNtpSyncToJson(
  ConfigConfigNtpSync instance,
) => <String, dynamic>{
  'active': ?instance.active,
  'server': ?instance.server,
  'interval': ?instance.interval,
  'count': ?instance.count,
  'rtc': ?instance.rtc?.toJson(),
};
