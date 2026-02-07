// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_devices_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DevicesDevicesInnerCWProxy {
  DevicesDevicesInner id(int? id);

  DevicesDevicesInner hwaddr(String? hwaddr);

  DevicesDevicesInner interface_(String? interface_);

  DevicesDevicesInner firstSeen(int? firstSeen);

  DevicesDevicesInner lastQuery(int? lastQuery);

  DevicesDevicesInner numQueries(int? numQueries);

  DevicesDevicesInner macVendor(String? macVendor);

  DevicesDevicesInner ips(List<DevicesDevicesInnerIpsInner>? ips);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DevicesDevicesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DevicesDevicesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DevicesDevicesInner call({
    int? id,
    String? hwaddr,
    String? interface_,
    int? firstSeen,
    int? lastQuery,
    int? numQueries,
    String? macVendor,
    List<DevicesDevicesInnerIpsInner>? ips,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevicesDevicesInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevicesDevicesInner.copyWith.fieldName(...)`
class _$DevicesDevicesInnerCWProxyImpl implements _$DevicesDevicesInnerCWProxy {
  const _$DevicesDevicesInnerCWProxyImpl(this._value);

  final DevicesDevicesInner _value;

  @override
  DevicesDevicesInner id(int? id) => this(id: id);

  @override
  DevicesDevicesInner hwaddr(String? hwaddr) => this(hwaddr: hwaddr);

  @override
  DevicesDevicesInner interface_(String? interface_) =>
      this(interface_: interface_);

  @override
  DevicesDevicesInner firstSeen(int? firstSeen) => this(firstSeen: firstSeen);

  @override
  DevicesDevicesInner lastQuery(int? lastQuery) => this(lastQuery: lastQuery);

  @override
  DevicesDevicesInner numQueries(int? numQueries) =>
      this(numQueries: numQueries);

  @override
  DevicesDevicesInner macVendor(String? macVendor) =>
      this(macVendor: macVendor);

  @override
  DevicesDevicesInner ips(List<DevicesDevicesInnerIpsInner>? ips) =>
      this(ips: ips);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DevicesDevicesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DevicesDevicesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DevicesDevicesInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? hwaddr = const $CopyWithPlaceholder(),
    Object? interface_ = const $CopyWithPlaceholder(),
    Object? firstSeen = const $CopyWithPlaceholder(),
    Object? lastQuery = const $CopyWithPlaceholder(),
    Object? numQueries = const $CopyWithPlaceholder(),
    Object? macVendor = const $CopyWithPlaceholder(),
    Object? ips = const $CopyWithPlaceholder(),
  }) {
    return DevicesDevicesInner(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      hwaddr: hwaddr == const $CopyWithPlaceholder()
          ? _value.hwaddr
          // ignore: cast_nullable_to_non_nullable
          : hwaddr as String?,
      interface_: interface_ == const $CopyWithPlaceholder()
          ? _value.interface_
          // ignore: cast_nullable_to_non_nullable
          : interface_ as String?,
      firstSeen: firstSeen == const $CopyWithPlaceholder()
          ? _value.firstSeen
          // ignore: cast_nullable_to_non_nullable
          : firstSeen as int?,
      lastQuery: lastQuery == const $CopyWithPlaceholder()
          ? _value.lastQuery
          // ignore: cast_nullable_to_non_nullable
          : lastQuery as int?,
      numQueries: numQueries == const $CopyWithPlaceholder()
          ? _value.numQueries
          // ignore: cast_nullable_to_non_nullable
          : numQueries as int?,
      macVendor: macVendor == const $CopyWithPlaceholder()
          ? _value.macVendor
          // ignore: cast_nullable_to_non_nullable
          : macVendor as String?,
      ips: ips == const $CopyWithPlaceholder()
          ? _value.ips
          // ignore: cast_nullable_to_non_nullable
          : ips as List<DevicesDevicesInnerIpsInner>?,
    );
  }
}

extension $DevicesDevicesInnerCopyWith on DevicesDevicesInner {
  /// Returns a callable class that can be used as follows: `instanceOfDevicesDevicesInner.copyWith(...)` or like so:`instanceOfDevicesDevicesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DevicesDevicesInnerCWProxy get copyWith =>
      _$DevicesDevicesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicesDevicesInner _$DevicesDevicesInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DevicesDevicesInner', json, ($checkedConvert) {
      final val = DevicesDevicesInner(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        hwaddr: $checkedConvert('hwaddr', (v) => v as String?),
        interface_: $checkedConvert('interface', (v) => v as String?),
        firstSeen: $checkedConvert('firstSeen', (v) => (v as num?)?.toInt()),
        lastQuery: $checkedConvert('lastQuery', (v) => (v as num?)?.toInt()),
        numQueries: $checkedConvert('numQueries', (v) => (v as num?)?.toInt()),
        macVendor: $checkedConvert('macVendor', (v) => v as String?),
        ips: $checkedConvert(
          'ips',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => DevicesDevicesInnerIpsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'interface_': 'interface'});

Map<String, dynamic> _$DevicesDevicesInnerToJson(
  DevicesDevicesInner instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'hwaddr': ?instance.hwaddr,
  'interface': ?instance.interface_,
  'firstSeen': ?instance.firstSeen,
  'lastQuery': ?instance.lastQuery,
  'numQueries': ?instance.numQueries,
  'macVendor': ?instance.macVendor,
  'ips': ?instance.ips?.map((e) => e.toJson()).toList(),
};
