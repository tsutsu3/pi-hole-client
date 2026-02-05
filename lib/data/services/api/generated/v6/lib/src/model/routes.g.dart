// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoutesCWProxy {
  Routes routes(List<RoutesRoutesInner>? routes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Routes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Routes(...).copyWith(id: 12, name: "My name")
  /// ````
  Routes call({List<RoutesRoutesInner>? routes});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoutes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoutes.copyWith.fieldName(...)`
class _$RoutesCWProxyImpl implements _$RoutesCWProxy {
  const _$RoutesCWProxyImpl(this._value);

  final Routes _value;

  @override
  Routes routes(List<RoutesRoutesInner>? routes) => this(routes: routes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Routes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Routes(...).copyWith(id: 12, name: "My name")
  /// ````
  Routes call({Object? routes = const $CopyWithPlaceholder()}) {
    return Routes(
      routes: routes == const $CopyWithPlaceholder()
          ? _value.routes
          // ignore: cast_nullable_to_non_nullable
          : routes as List<RoutesRoutesInner>?,
    );
  }
}

extension $RoutesCopyWith on Routes {
  /// Returns a callable class that can be used as follows: `instanceOfRoutes.copyWith(...)` or like so:`instanceOfRoutes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoutesCWProxy get copyWith => _$RoutesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routes _$RoutesFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Routes',
  json,
  ($checkedConvert) {
    final val = Routes(
      routes: $checkedConvert(
        'routes',
        (v) => (v as List<dynamic>?)
            ?.map((e) => RoutesRoutesInner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$RoutesToJson(Routes instance) => <String, dynamic>{
  'routes': ?instance.routes?.map((e) => e.toJson()).toList(),
};
