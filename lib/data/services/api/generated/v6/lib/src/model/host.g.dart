// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostCWProxy {
  Host host(HostHost? host);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Host(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Host(...).copyWith(id: 12, name: "My name")
  /// ````
  Host call({HostHost? host});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHost.copyWith.fieldName(...)`
class _$HostCWProxyImpl implements _$HostCWProxy {
  const _$HostCWProxyImpl(this._value);

  final Host _value;

  @override
  Host host(HostHost? host) => this(host: host);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Host(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Host(...).copyWith(id: 12, name: "My name")
  /// ````
  Host call({Object? host = const $CopyWithPlaceholder()}) {
    return Host(
      host: host == const $CopyWithPlaceholder()
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as HostHost?,
    );
  }
}

extension $HostCopyWith on Host {
  /// Returns a callable class that can be used as follows: `instanceOfHost.copyWith(...)` or like so:`instanceOfHost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostCWProxy get copyWith => _$HostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Host _$HostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Host', json, ($checkedConvert) {
      final val = Host(
        host: $checkedConvert(
          'host',
          (v) =>
              v == null ? null : HostHost.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HostToJson(Host instance) => <String, dynamic>{
  'host': ?instance.host?.toJson(),
};
