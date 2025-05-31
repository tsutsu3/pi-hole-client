// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Gateway {
  List<GatewayData> get gateway;
  double get took;
  List<InterfaceData>? get interfaces;
  List<RouteData>? get routes;

  /// Create a copy of Gateway
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GatewayCopyWith<Gateway> get copyWith =>
      _$GatewayCopyWithImpl<Gateway>(this as Gateway, _$identity);

  /// Serializes this Gateway to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Gateway &&
            const DeepCollectionEquality().equals(other.gateway, gateway) &&
            (identical(other.took, took) || other.took == took) &&
            const DeepCollectionEquality()
                .equals(other.interfaces, interfaces) &&
            const DeepCollectionEquality().equals(other.routes, routes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gateway),
      took,
      const DeepCollectionEquality().hash(interfaces),
      const DeepCollectionEquality().hash(routes));

  @override
  String toString() {
    return 'Gateway(gateway: $gateway, took: $took, interfaces: $interfaces, routes: $routes)';
  }
}

/// @nodoc
abstract mixin class $GatewayCopyWith<$Res> {
  factory $GatewayCopyWith(Gateway value, $Res Function(Gateway) _then) =
      _$GatewayCopyWithImpl;
  @useResult
  $Res call(
      {List<GatewayData> gateway,
      double took,
      List<InterfaceData>? interfaces,
      List<RouteData>? routes});
}

/// @nodoc
class _$GatewayCopyWithImpl<$Res> implements $GatewayCopyWith<$Res> {
  _$GatewayCopyWithImpl(this._self, this._then);

  final Gateway _self;
  final $Res Function(Gateway) _then;

  /// Create a copy of Gateway
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateway = null,
    Object? took = null,
    Object? interfaces = freezed,
    Object? routes = freezed,
  }) {
    return _then(_self.copyWith(
      gateway: null == gateway
          ? _self.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as List<GatewayData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
      interfaces: freezed == interfaces
          ? _self.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<InterfaceData>?,
      routes: freezed == routes
          ? _self.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Gateway implements Gateway {
  const _Gateway(
      {required final List<GatewayData> gateway,
      required this.took,
      final List<InterfaceData>? interfaces,
      final List<RouteData>? routes})
      : _gateway = gateway,
        _interfaces = interfaces,
        _routes = routes;
  factory _Gateway.fromJson(Map<String, dynamic> json) =>
      _$GatewayFromJson(json);

  final List<GatewayData> _gateway;
  @override
  List<GatewayData> get gateway {
    if (_gateway is EqualUnmodifiableListView) return _gateway;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gateway);
  }

  @override
  final double took;
  final List<InterfaceData>? _interfaces;
  @override
  List<InterfaceData>? get interfaces {
    final value = _interfaces;
    if (value == null) return null;
    if (_interfaces is EqualUnmodifiableListView) return _interfaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RouteData>? _routes;
  @override
  List<RouteData>? get routes {
    final value = _routes;
    if (value == null) return null;
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Gateway
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GatewayCopyWith<_Gateway> get copyWith =>
      __$GatewayCopyWithImpl<_Gateway>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GatewayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Gateway &&
            const DeepCollectionEquality().equals(other._gateway, _gateway) &&
            (identical(other.took, took) || other.took == took) &&
            const DeepCollectionEquality()
                .equals(other._interfaces, _interfaces) &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_gateway),
      took,
      const DeepCollectionEquality().hash(_interfaces),
      const DeepCollectionEquality().hash(_routes));

  @override
  String toString() {
    return 'Gateway(gateway: $gateway, took: $took, interfaces: $interfaces, routes: $routes)';
  }
}

/// @nodoc
abstract mixin class _$GatewayCopyWith<$Res> implements $GatewayCopyWith<$Res> {
  factory _$GatewayCopyWith(_Gateway value, $Res Function(_Gateway) _then) =
      __$GatewayCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<GatewayData> gateway,
      double took,
      List<InterfaceData>? interfaces,
      List<RouteData>? routes});
}

/// @nodoc
class __$GatewayCopyWithImpl<$Res> implements _$GatewayCopyWith<$Res> {
  __$GatewayCopyWithImpl(this._self, this._then);

  final _Gateway _self;
  final $Res Function(_Gateway) _then;

  /// Create a copy of Gateway
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gateway = null,
    Object? took = null,
    Object? interfaces = freezed,
    Object? routes = freezed,
  }) {
    return _then(_Gateway(
      gateway: null == gateway
          ? _self._gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as List<GatewayData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
      interfaces: freezed == interfaces
          ? _self._interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<InterfaceData>?,
      routes: freezed == routes
          ? _self._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteData>?,
    ));
  }
}

/// @nodoc
mixin _$GatewayData {
  String get family;
  String get interface;
  String get address;
  List<String> get local;

  /// Create a copy of GatewayData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GatewayDataCopyWith<GatewayData> get copyWith =>
      _$GatewayDataCopyWithImpl<GatewayData>(this as GatewayData, _$identity);

  /// Serializes this GatewayData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GatewayData &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.interface, interface) ||
                other.interface == interface) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.local, local));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, family, interface, address,
      const DeepCollectionEquality().hash(local));

  @override
  String toString() {
    return 'GatewayData(family: $family, interface: $interface, address: $address, local: $local)';
  }
}

/// @nodoc
abstract mixin class $GatewayDataCopyWith<$Res> {
  factory $GatewayDataCopyWith(
          GatewayData value, $Res Function(GatewayData) _then) =
      _$GatewayDataCopyWithImpl;
  @useResult
  $Res call(
      {String family, String interface, String address, List<String> local});
}

/// @nodoc
class _$GatewayDataCopyWithImpl<$Res> implements $GatewayDataCopyWith<$Res> {
  _$GatewayDataCopyWithImpl(this._self, this._then);

  final GatewayData _self;
  final $Res Function(GatewayData) _then;

  /// Create a copy of GatewayData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? family = null,
    Object? interface = null,
    Object? address = null,
    Object? local = null,
  }) {
    return _then(_self.copyWith(
      family: null == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      interface: null == interface
          ? _self.interface
          : interface // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      local: null == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GatewayData implements GatewayData {
  const _GatewayData(
      {required this.family,
      required this.interface,
      required this.address,
      required final List<String> local})
      : _local = local;
  factory _GatewayData.fromJson(Map<String, dynamic> json) =>
      _$GatewayDataFromJson(json);

  @override
  final String family;
  @override
  final String interface;
  @override
  final String address;
  final List<String> _local;
  @override
  List<String> get local {
    if (_local is EqualUnmodifiableListView) return _local;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_local);
  }

  /// Create a copy of GatewayData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GatewayDataCopyWith<_GatewayData> get copyWith =>
      __$GatewayDataCopyWithImpl<_GatewayData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GatewayDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GatewayData &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.interface, interface) ||
                other.interface == interface) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._local, _local));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, family, interface, address,
      const DeepCollectionEquality().hash(_local));

  @override
  String toString() {
    return 'GatewayData(family: $family, interface: $interface, address: $address, local: $local)';
  }
}

/// @nodoc
abstract mixin class _$GatewayDataCopyWith<$Res>
    implements $GatewayDataCopyWith<$Res> {
  factory _$GatewayDataCopyWith(
          _GatewayData value, $Res Function(_GatewayData) _then) =
      __$GatewayDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String family, String interface, String address, List<String> local});
}

/// @nodoc
class __$GatewayDataCopyWithImpl<$Res> implements _$GatewayDataCopyWith<$Res> {
  __$GatewayDataCopyWithImpl(this._self, this._then);

  final _GatewayData _self;
  final $Res Function(_GatewayData) _then;

  /// Create a copy of GatewayData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? family = null,
    Object? interface = null,
    Object? address = null,
    Object? local = null,
  }) {
    return _then(_GatewayData(
      family: null == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      interface: null == interface
          ? _self.interface
          : interface // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      local: null == local
          ? _self._local
          : local // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
