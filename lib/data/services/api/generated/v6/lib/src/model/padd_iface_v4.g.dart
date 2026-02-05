// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_iface_v4.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddIfaceV4CWProxy {
  PaddIfaceV4 addr(String? addr);

  PaddIfaceV4 rxBytes(PaddIfaceV4RxBytes? rxBytes);

  PaddIfaceV4 txBytes(PaddIfaceV4TxBytes? txBytes);

  PaddIfaceV4 numAddrs(int? numAddrs);

  PaddIfaceV4 name(String? name);

  PaddIfaceV4 gwAddr(String? gwAddr);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV4(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV4(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV4 call({
    String? addr,
    PaddIfaceV4RxBytes? rxBytes,
    PaddIfaceV4TxBytes? txBytes,
    int? numAddrs,
    String? name,
    String? gwAddr,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddIfaceV4.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddIfaceV4.copyWith.fieldName(...)`
class _$PaddIfaceV4CWProxyImpl implements _$PaddIfaceV4CWProxy {
  const _$PaddIfaceV4CWProxyImpl(this._value);

  final PaddIfaceV4 _value;

  @override
  PaddIfaceV4 addr(String? addr) => this(addr: addr);

  @override
  PaddIfaceV4 rxBytes(PaddIfaceV4RxBytes? rxBytes) => this(rxBytes: rxBytes);

  @override
  PaddIfaceV4 txBytes(PaddIfaceV4TxBytes? txBytes) => this(txBytes: txBytes);

  @override
  PaddIfaceV4 numAddrs(int? numAddrs) => this(numAddrs: numAddrs);

  @override
  PaddIfaceV4 name(String? name) => this(name: name);

  @override
  PaddIfaceV4 gwAddr(String? gwAddr) => this(gwAddr: gwAddr);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV4(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV4(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV4 call({
    Object? addr = const $CopyWithPlaceholder(),
    Object? rxBytes = const $CopyWithPlaceholder(),
    Object? txBytes = const $CopyWithPlaceholder(),
    Object? numAddrs = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? gwAddr = const $CopyWithPlaceholder(),
  }) {
    return PaddIfaceV4(
      addr: addr == const $CopyWithPlaceholder()
          ? _value.addr
          // ignore: cast_nullable_to_non_nullable
          : addr as String?,
      rxBytes: rxBytes == const $CopyWithPlaceholder()
          ? _value.rxBytes
          // ignore: cast_nullable_to_non_nullable
          : rxBytes as PaddIfaceV4RxBytes?,
      txBytes: txBytes == const $CopyWithPlaceholder()
          ? _value.txBytes
          // ignore: cast_nullable_to_non_nullable
          : txBytes as PaddIfaceV4TxBytes?,
      numAddrs: numAddrs == const $CopyWithPlaceholder()
          ? _value.numAddrs
          // ignore: cast_nullable_to_non_nullable
          : numAddrs as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      gwAddr: gwAddr == const $CopyWithPlaceholder()
          ? _value.gwAddr
          // ignore: cast_nullable_to_non_nullable
          : gwAddr as String?,
    );
  }
}

extension $PaddIfaceV4CopyWith on PaddIfaceV4 {
  /// Returns a callable class that can be used as follows: `instanceOfPaddIfaceV4.copyWith(...)` or like so:`instanceOfPaddIfaceV4.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddIfaceV4CWProxy get copyWith => _$PaddIfaceV4CWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddIfaceV4 _$PaddIfaceV4FromJson(Map<String, dynamic> json) => $checkedCreate(
  'PaddIfaceV4',
  json,
  ($checkedConvert) {
    final val = PaddIfaceV4(
      addr: $checkedConvert('addr', (v) => v as String?),
      rxBytes: $checkedConvert(
        'rx_bytes',
        (v) => v == null
            ? null
            : PaddIfaceV4RxBytes.fromJson(v as Map<String, dynamic>),
      ),
      txBytes: $checkedConvert(
        'tx_bytes',
        (v) => v == null
            ? null
            : PaddIfaceV4TxBytes.fromJson(v as Map<String, dynamic>),
      ),
      numAddrs: $checkedConvert('num_addrs', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      gwAddr: $checkedConvert('gw_addr', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'rxBytes': 'rx_bytes',
    'txBytes': 'tx_bytes',
    'numAddrs': 'num_addrs',
    'gwAddr': 'gw_addr',
  },
);

Map<String, dynamic> _$PaddIfaceV4ToJson(PaddIfaceV4 instance) =>
    <String, dynamic>{
      'addr': ?instance.addr,
      'rx_bytes': ?instance.rxBytes?.toJson(),
      'tx_bytes': ?instance.txBytes?.toJson(),
      'num_addrs': ?instance.numAddrs,
      'name': ?instance.name,
      'gw_addr': ?instance.gwAddr,
    };
