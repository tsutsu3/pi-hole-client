// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_reply.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsReplyCWProxy {
  ConfigConfigDnsReply host(ConfigConfigDnsReplyHost? host);

  ConfigConfigDnsReply blocking(ConfigConfigDnsReplyHost? blocking);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsReply(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsReply(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsReply call({
    ConfigConfigDnsReplyHost? host,
    ConfigConfigDnsReplyHost? blocking,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsReply.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsReply.copyWith.fieldName(...)`
class _$ConfigConfigDnsReplyCWProxyImpl
    implements _$ConfigConfigDnsReplyCWProxy {
  const _$ConfigConfigDnsReplyCWProxyImpl(this._value);

  final ConfigConfigDnsReply _value;

  @override
  ConfigConfigDnsReply host(ConfigConfigDnsReplyHost? host) => this(host: host);

  @override
  ConfigConfigDnsReply blocking(ConfigConfigDnsReplyHost? blocking) =>
      this(blocking: blocking);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsReply(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsReply(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsReply call({
    Object? host = const $CopyWithPlaceholder(),
    Object? blocking = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsReply(
      host: host == const $CopyWithPlaceholder()
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as ConfigConfigDnsReplyHost?,
      blocking: blocking == const $CopyWithPlaceholder()
          ? _value.blocking
          // ignore: cast_nullable_to_non_nullable
          : blocking as ConfigConfigDnsReplyHost?,
    );
  }
}

extension $ConfigConfigDnsReplyCopyWith on ConfigConfigDnsReply {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsReply.copyWith(...)` or like so:`instanceOfConfigConfigDnsReply.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsReplyCWProxy get copyWith =>
      _$ConfigConfigDnsReplyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsReply _$ConfigConfigDnsReplyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsReply', json, ($checkedConvert) {
  final val = ConfigConfigDnsReply(
    host: $checkedConvert(
      'host',
      (v) => v == null
          ? null
          : ConfigConfigDnsReplyHost.fromJson(v as Map<String, dynamic>),
    ),
    blocking: $checkedConvert(
      'blocking',
      (v) => v == null
          ? null
          : ConfigConfigDnsReplyHost.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDnsReplyToJson(
  ConfigConfigDnsReply instance,
) => <String, dynamic>{
  'host': ?instance.host?.toJson(),
  'blocking': ?instance.blocking?.toJson(),
};
