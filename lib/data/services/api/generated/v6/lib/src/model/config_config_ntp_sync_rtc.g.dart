// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_ntp_sync_rtc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigNtpSyncRtcCWProxy {
  ConfigConfigNtpSyncRtc set_(bool? set_);

  ConfigConfigNtpSyncRtc device(String? device);

  ConfigConfigNtpSyncRtc utc(bool? utc);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpSyncRtc(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpSyncRtc(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpSyncRtc call({bool? set_, String? device, bool? utc});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigNtpSyncRtc.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigNtpSyncRtc.copyWith.fieldName(...)`
class _$ConfigConfigNtpSyncRtcCWProxyImpl
    implements _$ConfigConfigNtpSyncRtcCWProxy {
  const _$ConfigConfigNtpSyncRtcCWProxyImpl(this._value);

  final ConfigConfigNtpSyncRtc _value;

  @override
  ConfigConfigNtpSyncRtc set_(bool? set_) => this(set_: set_);

  @override
  ConfigConfigNtpSyncRtc device(String? device) => this(device: device);

  @override
  ConfigConfigNtpSyncRtc utc(bool? utc) => this(utc: utc);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpSyncRtc(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpSyncRtc(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpSyncRtc call({
    Object? set_ = const $CopyWithPlaceholder(),
    Object? device = const $CopyWithPlaceholder(),
    Object? utc = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigNtpSyncRtc(
      set_: set_ == const $CopyWithPlaceholder()
          ? _value.set_
          // ignore: cast_nullable_to_non_nullable
          : set_ as bool?,
      device: device == const $CopyWithPlaceholder()
          ? _value.device
          // ignore: cast_nullable_to_non_nullable
          : device as String?,
      utc: utc == const $CopyWithPlaceholder()
          ? _value.utc
          // ignore: cast_nullable_to_non_nullable
          : utc as bool?,
    );
  }
}

extension $ConfigConfigNtpSyncRtcCopyWith on ConfigConfigNtpSyncRtc {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigNtpSyncRtc.copyWith(...)` or like so:`instanceOfConfigConfigNtpSyncRtc.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigNtpSyncRtcCWProxy get copyWith =>
      _$ConfigConfigNtpSyncRtcCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigNtpSyncRtc _$ConfigConfigNtpSyncRtcFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigNtpSyncRtc', json, ($checkedConvert) {
  final val = ConfigConfigNtpSyncRtc(
    set_: $checkedConvert('set', (v) => v as bool?),
    device: $checkedConvert('device', (v) => v as String?),
    utc: $checkedConvert('utc', (v) => v as bool?),
  );
  return val;
}, fieldKeyMap: const {'set_': 'set'});

Map<String, dynamic> _$ConfigConfigNtpSyncRtcToJson(
  ConfigConfigNtpSyncRtc instance,
) => <String, dynamic>{
  'set': ?instance.set_,
  'device': ?instance.device,
  'utc': ?instance.utc,
};
