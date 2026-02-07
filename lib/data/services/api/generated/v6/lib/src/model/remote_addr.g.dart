// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_addr.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RemoteAddrCWProxy {
  RemoteAddr remoteAddr(String? remoteAddr);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RemoteAddr(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RemoteAddr(...).copyWith(id: 12, name: "My name")
  /// ````
  RemoteAddr call({String? remoteAddr});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRemoteAddr.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRemoteAddr.copyWith.fieldName(...)`
class _$RemoteAddrCWProxyImpl implements _$RemoteAddrCWProxy {
  const _$RemoteAddrCWProxyImpl(this._value);

  final RemoteAddr _value;

  @override
  RemoteAddr remoteAddr(String? remoteAddr) => this(remoteAddr: remoteAddr);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RemoteAddr(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RemoteAddr(...).copyWith(id: 12, name: "My name")
  /// ````
  RemoteAddr call({Object? remoteAddr = const $CopyWithPlaceholder()}) {
    return RemoteAddr(
      remoteAddr: remoteAddr == const $CopyWithPlaceholder()
          ? _value.remoteAddr
          // ignore: cast_nullable_to_non_nullable
          : remoteAddr as String?,
    );
  }
}

extension $RemoteAddrCopyWith on RemoteAddr {
  /// Returns a callable class that can be used as follows: `instanceOfRemoteAddr.copyWith(...)` or like so:`instanceOfRemoteAddr.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RemoteAddrCWProxy get copyWith => _$RemoteAddrCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAddr _$RemoteAddrFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RemoteAddr', json, ($checkedConvert) {
      final val = RemoteAddr(
        remoteAddr: $checkedConvert('remote_addr', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'remoteAddr': 'remote_addr'});

Map<String, dynamic> _$RemoteAddrToJson(RemoteAddr instance) =>
    <String, dynamic>{'remote_addr': ?instance.remoteAddr};
