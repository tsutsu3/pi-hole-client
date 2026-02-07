// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leases.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeasesCWProxy {
  Leases leases(List<LeasesLeasesInner>? leases);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Leases(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Leases(...).copyWith(id: 12, name: "My name")
  /// ````
  Leases call({List<LeasesLeasesInner>? leases});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeases.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeases.copyWith.fieldName(...)`
class _$LeasesCWProxyImpl implements _$LeasesCWProxy {
  const _$LeasesCWProxyImpl(this._value);

  final Leases _value;

  @override
  Leases leases(List<LeasesLeasesInner>? leases) => this(leases: leases);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Leases(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Leases(...).copyWith(id: 12, name: "My name")
  /// ````
  Leases call({Object? leases = const $CopyWithPlaceholder()}) {
    return Leases(
      leases: leases == const $CopyWithPlaceholder()
          ? _value.leases
          // ignore: cast_nullable_to_non_nullable
          : leases as List<LeasesLeasesInner>?,
    );
  }
}

extension $LeasesCopyWith on Leases {
  /// Returns a callable class that can be used as follows: `instanceOfLeases.copyWith(...)` or like so:`instanceOfLeases.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeasesCWProxy get copyWith => _$LeasesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leases _$LeasesFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Leases',
  json,
  ($checkedConvert) {
    final val = Leases(
      leases: $checkedConvert(
        'leases',
        (v) => (v as List<dynamic>?)
            ?.map((e) => LeasesLeasesInner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$LeasesToJson(Leases instance) => <String, dynamic>{
  'leases': ?instance.leases?.map((e) => e.toJson()).toList(),
};
