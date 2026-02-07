// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_routes200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetRoutes200ResponseCWProxy {
  GetRoutes200Response routes(List<RoutesRoutesInner>? routes);

  GetRoutes200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetRoutes200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetRoutes200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetRoutes200Response call({List<RoutesRoutesInner>? routes, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetRoutes200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetRoutes200Response.copyWith.fieldName(...)`
class _$GetRoutes200ResponseCWProxyImpl
    implements _$GetRoutes200ResponseCWProxy {
  const _$GetRoutes200ResponseCWProxyImpl(this._value);

  final GetRoutes200Response _value;

  @override
  GetRoutes200Response routes(List<RoutesRoutesInner>? routes) =>
      this(routes: routes);

  @override
  GetRoutes200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetRoutes200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetRoutes200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetRoutes200Response call({
    Object? routes = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetRoutes200Response(
      routes: routes == const $CopyWithPlaceholder()
          ? _value.routes
          // ignore: cast_nullable_to_non_nullable
          : routes as List<RoutesRoutesInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetRoutes200ResponseCopyWith on GetRoutes200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetRoutes200Response.copyWith(...)` or like so:`instanceOfGetRoutes200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetRoutes200ResponseCWProxy get copyWith =>
      _$GetRoutes200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoutes200Response _$GetRoutes200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetRoutes200Response', json, ($checkedConvert) {
  final val = GetRoutes200Response(
    routes: $checkedConvert(
      'routes',
      (v) => (v as List<dynamic>?)
          ?.map((e) => RoutesRoutesInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetRoutes200ResponseToJson(
  GetRoutes200Response instance,
) => <String, dynamic>{
  'routes': ?instance.routes?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
