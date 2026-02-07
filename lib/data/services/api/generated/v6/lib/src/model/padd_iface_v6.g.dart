// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_iface_v6.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddIfaceV6CWProxy {
  PaddIfaceV6 addr(String? addr);

  PaddIfaceV6 numAddrs(int? numAddrs);

  PaddIfaceV6 name(String? name);

  PaddIfaceV6 gwAddr(String? gwAddr);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV6(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV6(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV6 call({String? addr, int? numAddrs, String? name, String? gwAddr});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddIfaceV6.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddIfaceV6.copyWith.fieldName(...)`
class _$PaddIfaceV6CWProxyImpl implements _$PaddIfaceV6CWProxy {
  const _$PaddIfaceV6CWProxyImpl(this._value);

  final PaddIfaceV6 _value;

  @override
  PaddIfaceV6 addr(String? addr) => this(addr: addr);

  @override
  PaddIfaceV6 numAddrs(int? numAddrs) => this(numAddrs: numAddrs);

  @override
  PaddIfaceV6 name(String? name) => this(name: name);

  @override
  PaddIfaceV6 gwAddr(String? gwAddr) => this(gwAddr: gwAddr);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV6(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV6(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV6 call({
    Object? addr = const $CopyWithPlaceholder(),
    Object? numAddrs = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? gwAddr = const $CopyWithPlaceholder(),
  }) {
    return PaddIfaceV6(
      addr: addr == const $CopyWithPlaceholder()
          ? _value.addr
          // ignore: cast_nullable_to_non_nullable
          : addr as String?,
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

extension $PaddIfaceV6CopyWith on PaddIfaceV6 {
  /// Returns a callable class that can be used as follows: `instanceOfPaddIfaceV6.copyWith(...)` or like so:`instanceOfPaddIfaceV6.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddIfaceV6CWProxy get copyWith => _$PaddIfaceV6CWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddIfaceV6 _$PaddIfaceV6FromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaddIfaceV6', json, ($checkedConvert) {
      final val = PaddIfaceV6(
        addr: $checkedConvert('addr', (v) => v as String?),
        numAddrs: $checkedConvert('num_addrs', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        gwAddr: $checkedConvert('gw_addr', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'numAddrs': 'num_addrs', 'gwAddr': 'gw_addr'});

Map<String, dynamic> _$PaddIfaceV6ToJson(PaddIfaceV6 instance) =>
    <String, dynamic>{
      'addr': ?instance.addr,
      'num_addrs': ?instance.numAddrs,
      'name': ?instance.name,
      'gw_addr': ?instance.gwAddr,
    };
