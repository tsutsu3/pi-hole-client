// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interfaces_interfaces_inner_stats.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InterfacesInterfacesInnerStatsCWProxy {
  InterfacesInterfacesInnerStats rxBytes(
    InterfacesInterfacesInnerStatsRxBytes? rxBytes,
  );

  InterfacesInterfacesInnerStats txBytes(
    InterfacesInterfacesInnerStatsTxBytes? txBytes,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterfacesInterfacesInnerStats(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterfacesInterfacesInnerStats(...).copyWith(id: 12, name: "My name")
  /// ````
  InterfacesInterfacesInnerStats call({
    InterfacesInterfacesInnerStatsRxBytes? rxBytes,
    InterfacesInterfacesInnerStatsTxBytes? txBytes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInterfacesInterfacesInnerStats.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInterfacesInterfacesInnerStats.copyWith.fieldName(...)`
class _$InterfacesInterfacesInnerStatsCWProxyImpl
    implements _$InterfacesInterfacesInnerStatsCWProxy {
  const _$InterfacesInterfacesInnerStatsCWProxyImpl(this._value);

  final InterfacesInterfacesInnerStats _value;

  @override
  InterfacesInterfacesInnerStats rxBytes(
    InterfacesInterfacesInnerStatsRxBytes? rxBytes,
  ) => this(rxBytes: rxBytes);

  @override
  InterfacesInterfacesInnerStats txBytes(
    InterfacesInterfacesInnerStatsTxBytes? txBytes,
  ) => this(txBytes: txBytes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterfacesInterfacesInnerStats(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterfacesInterfacesInnerStats(...).copyWith(id: 12, name: "My name")
  /// ````
  InterfacesInterfacesInnerStats call({
    Object? rxBytes = const $CopyWithPlaceholder(),
    Object? txBytes = const $CopyWithPlaceholder(),
  }) {
    return InterfacesInterfacesInnerStats(
      rxBytes: rxBytes == const $CopyWithPlaceholder()
          ? _value.rxBytes
          // ignore: cast_nullable_to_non_nullable
          : rxBytes as InterfacesInterfacesInnerStatsRxBytes?,
      txBytes: txBytes == const $CopyWithPlaceholder()
          ? _value.txBytes
          // ignore: cast_nullable_to_non_nullable
          : txBytes as InterfacesInterfacesInnerStatsTxBytes?,
    );
  }
}

extension $InterfacesInterfacesInnerStatsCopyWith
    on InterfacesInterfacesInnerStats {
  /// Returns a callable class that can be used as follows: `instanceOfInterfacesInterfacesInnerStats.copyWith(...)` or like so:`instanceOfInterfacesInterfacesInnerStats.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InterfacesInterfacesInnerStatsCWProxy get copyWith =>
      _$InterfacesInterfacesInnerStatsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterfacesInterfacesInnerStats _$InterfacesInterfacesInnerStatsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'InterfacesInterfacesInnerStats',
  json,
  ($checkedConvert) {
    final val = InterfacesInterfacesInnerStats(
      rxBytes: $checkedConvert(
        'rx_bytes',
        (v) => v == null
            ? null
            : InterfacesInterfacesInnerStatsRxBytes.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      txBytes: $checkedConvert(
        'tx_bytes',
        (v) => v == null
            ? null
            : InterfacesInterfacesInnerStatsTxBytes.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'rxBytes': 'rx_bytes', 'txBytes': 'tx_bytes'},
);

Map<String, dynamic> _$InterfacesInterfacesInnerStatsToJson(
  InterfacesInterfacesInnerStats instance,
) => <String, dynamic>{
  'rx_bytes': ?instance.rxBytes?.toJson(),
  'tx_bytes': ?instance.txBytes?.toJson(),
};
