// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_interfaces200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetInterfaces200ResponseCWProxy {
  GetInterfaces200Response interfaces(
    List<InterfacesInterfacesInner>? interfaces,
  );

  GetInterfaces200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetInterfaces200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetInterfaces200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetInterfaces200Response call({
    List<InterfacesInterfacesInner>? interfaces,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetInterfaces200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetInterfaces200Response.copyWith.fieldName(...)`
class _$GetInterfaces200ResponseCWProxyImpl
    implements _$GetInterfaces200ResponseCWProxy {
  const _$GetInterfaces200ResponseCWProxyImpl(this._value);

  final GetInterfaces200Response _value;

  @override
  GetInterfaces200Response interfaces(
    List<InterfacesInterfacesInner>? interfaces,
  ) => this(interfaces: interfaces);

  @override
  GetInterfaces200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetInterfaces200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetInterfaces200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetInterfaces200Response call({
    Object? interfaces = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetInterfaces200Response(
      interfaces: interfaces == const $CopyWithPlaceholder()
          ? _value.interfaces
          // ignore: cast_nullable_to_non_nullable
          : interfaces as List<InterfacesInterfacesInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetInterfaces200ResponseCopyWith on GetInterfaces200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetInterfaces200Response.copyWith(...)` or like so:`instanceOfGetInterfaces200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetInterfaces200ResponseCWProxy get copyWith =>
      _$GetInterfaces200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInterfaces200Response _$GetInterfaces200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetInterfaces200Response', json, ($checkedConvert) {
  final val = GetInterfaces200Response(
    interfaces: $checkedConvert(
      'interfaces',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                InterfacesInterfacesInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetInterfaces200ResponseToJson(
  GetInterfaces200Response instance,
) => <String, dynamic>{
  'interfaces': ?instance.interfaces?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
