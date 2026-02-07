// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dhcp200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetDhcp200ResponseCWProxy {
  GetDhcp200Response leases(List<LeasesLeasesInner>? leases);

  GetDhcp200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDhcp200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDhcp200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDhcp200Response call({List<LeasesLeasesInner>? leases, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetDhcp200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetDhcp200Response.copyWith.fieldName(...)`
class _$GetDhcp200ResponseCWProxyImpl implements _$GetDhcp200ResponseCWProxy {
  const _$GetDhcp200ResponseCWProxyImpl(this._value);

  final GetDhcp200Response _value;

  @override
  GetDhcp200Response leases(List<LeasesLeasesInner>? leases) =>
      this(leases: leases);

  @override
  GetDhcp200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDhcp200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDhcp200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDhcp200Response call({
    Object? leases = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetDhcp200Response(
      leases: leases == const $CopyWithPlaceholder()
          ? _value.leases
          // ignore: cast_nullable_to_non_nullable
          : leases as List<LeasesLeasesInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetDhcp200ResponseCopyWith on GetDhcp200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetDhcp200Response.copyWith(...)` or like so:`instanceOfGetDhcp200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetDhcp200ResponseCWProxy get copyWith =>
      _$GetDhcp200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDhcp200Response _$GetDhcp200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GetDhcp200Response', json, ($checkedConvert) {
      final val = GetDhcp200Response(
        leases: $checkedConvert(
          'leases',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => LeasesLeasesInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GetDhcp200ResponseToJson(GetDhcp200Response instance) =>
    <String, dynamic>{
      'leases': ?instance.leases?.map((e) => e.toJson()).toList(),
      'took': ?instance.took,
    };
