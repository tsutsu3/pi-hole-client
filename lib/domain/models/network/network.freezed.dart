// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Gateways {

 List<Gateway> get gateway; List<NetInterface>? get interfaces; List<Route>? get routes;
/// Create a copy of Gateways
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewaysCopyWith<Gateways> get copyWith => _$GatewaysCopyWithImpl<Gateways>(this as Gateways, _$identity);

  /// Serializes this Gateways to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gateways&&const DeepCollectionEquality().equals(other.gateway, gateway)&&const DeepCollectionEquality().equals(other.interfaces, interfaces)&&const DeepCollectionEquality().equals(other.routes, routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(gateway),const DeepCollectionEquality().hash(interfaces),const DeepCollectionEquality().hash(routes));

@override
String toString() {
  return 'Gateways(gateway: $gateway, interfaces: $interfaces, routes: $routes)';
}


}

/// @nodoc
abstract mixin class $GatewaysCopyWith<$Res>  {
  factory $GatewaysCopyWith(Gateways value, $Res Function(Gateways) _then) = _$GatewaysCopyWithImpl;
@useResult
$Res call({
 List<Gateway> gateway, List<NetInterface>? interfaces, List<Route>? routes
});




}
/// @nodoc
class _$GatewaysCopyWithImpl<$Res>
    implements $GatewaysCopyWith<$Res> {
  _$GatewaysCopyWithImpl(this._self, this._then);

  final Gateways _self;
  final $Res Function(Gateways) _then;

/// Create a copy of Gateways
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gateway = null,Object? interfaces = freezed,Object? routes = freezed,}) {
  return _then(_self.copyWith(
gateway: null == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as List<Gateway>,interfaces: freezed == interfaces ? _self.interfaces : interfaces // ignore: cast_nullable_to_non_nullable
as List<NetInterface>?,routes: freezed == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as List<Route>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Gateways].
extension GatewaysPatterns on Gateways {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gateways value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gateways() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gateways value)  $default,){
final _that = this;
switch (_that) {
case _Gateways():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gateways value)?  $default,){
final _that = this;
switch (_that) {
case _Gateways() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Gateway> gateway,  List<NetInterface>? interfaces,  List<Route>? routes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gateways() when $default != null:
return $default(_that.gateway,_that.interfaces,_that.routes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Gateway> gateway,  List<NetInterface>? interfaces,  List<Route>? routes)  $default,) {final _that = this;
switch (_that) {
case _Gateways():
return $default(_that.gateway,_that.interfaces,_that.routes);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Gateway> gateway,  List<NetInterface>? interfaces,  List<Route>? routes)?  $default,) {final _that = this;
switch (_that) {
case _Gateways() when $default != null:
return $default(_that.gateway,_that.interfaces,_that.routes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Gateways implements Gateways {
  const _Gateways({required final  List<Gateway> gateway, final  List<NetInterface>? interfaces, final  List<Route>? routes}): _gateway = gateway,_interfaces = interfaces,_routes = routes;
  factory _Gateways.fromJson(Map<String, dynamic> json) => _$GatewaysFromJson(json);

 final  List<Gateway> _gateway;
@override List<Gateway> get gateway {
  if (_gateway is EqualUnmodifiableListView) return _gateway;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gateway);
}

 final  List<NetInterface>? _interfaces;
@override List<NetInterface>? get interfaces {
  final value = _interfaces;
  if (value == null) return null;
  if (_interfaces is EqualUnmodifiableListView) return _interfaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Route>? _routes;
@override List<Route>? get routes {
  final value = _routes;
  if (value == null) return null;
  if (_routes is EqualUnmodifiableListView) return _routes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Gateways
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewaysCopyWith<_Gateways> get copyWith => __$GatewaysCopyWithImpl<_Gateways>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewaysToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gateways&&const DeepCollectionEquality().equals(other._gateway, _gateway)&&const DeepCollectionEquality().equals(other._interfaces, _interfaces)&&const DeepCollectionEquality().equals(other._routes, _routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_gateway),const DeepCollectionEquality().hash(_interfaces),const DeepCollectionEquality().hash(_routes));

@override
String toString() {
  return 'Gateways(gateway: $gateway, interfaces: $interfaces, routes: $routes)';
}


}

/// @nodoc
abstract mixin class _$GatewaysCopyWith<$Res> implements $GatewaysCopyWith<$Res> {
  factory _$GatewaysCopyWith(_Gateways value, $Res Function(_Gateways) _then) = __$GatewaysCopyWithImpl;
@override @useResult
$Res call({
 List<Gateway> gateway, List<NetInterface>? interfaces, List<Route>? routes
});




}
/// @nodoc
class __$GatewaysCopyWithImpl<$Res>
    implements _$GatewaysCopyWith<$Res> {
  __$GatewaysCopyWithImpl(this._self, this._then);

  final _Gateways _self;
  final $Res Function(_Gateways) _then;

/// Create a copy of Gateways
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gateway = null,Object? interfaces = freezed,Object? routes = freezed,}) {
  return _then(_Gateways(
gateway: null == gateway ? _self._gateway : gateway // ignore: cast_nullable_to_non_nullable
as List<Gateway>,interfaces: freezed == interfaces ? _self._interfaces : interfaces // ignore: cast_nullable_to_non_nullable
as List<NetInterface>?,routes: freezed == routes ? _self._routes : routes // ignore: cast_nullable_to_non_nullable
as List<Route>?,
  ));
}


}


/// @nodoc
mixin _$Gateway {

 String get family; String get interface; String get address; List<String> get local;
/// Create a copy of Gateway
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayCopyWith<Gateway> get copyWith => _$GatewayCopyWithImpl<Gateway>(this as Gateway, _$identity);

  /// Serializes this Gateway to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gateway&&(identical(other.family, family) || other.family == family)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.local, local));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,family,interface,address,const DeepCollectionEquality().hash(local));

@override
String toString() {
  return 'Gateway(family: $family, interface: $interface, address: $address, local: $local)';
}


}

/// @nodoc
abstract mixin class $GatewayCopyWith<$Res>  {
  factory $GatewayCopyWith(Gateway value, $Res Function(Gateway) _then) = _$GatewayCopyWithImpl;
@useResult
$Res call({
 String family, String interface, String address, List<String> local
});




}
/// @nodoc
class _$GatewayCopyWithImpl<$Res>
    implements $GatewayCopyWith<$Res> {
  _$GatewayCopyWithImpl(this._self, this._then);

  final Gateway _self;
  final $Res Function(Gateway) _then;

/// Create a copy of Gateway
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? family = null,Object? interface = null,Object? address = null,Object? local = null,}) {
  return _then(_self.copyWith(
family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String,interface: null == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Gateway].
extension GatewayPatterns on Gateway {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gateway value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gateway() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gateway value)  $default,){
final _that = this;
switch (_that) {
case _Gateway():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gateway value)?  $default,){
final _that = this;
switch (_that) {
case _Gateway() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String family,  String interface,  String address,  List<String> local)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gateway() when $default != null:
return $default(_that.family,_that.interface,_that.address,_that.local);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String family,  String interface,  String address,  List<String> local)  $default,) {final _that = this;
switch (_that) {
case _Gateway():
return $default(_that.family,_that.interface,_that.address,_that.local);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String family,  String interface,  String address,  List<String> local)?  $default,) {final _that = this;
switch (_that) {
case _Gateway() when $default != null:
return $default(_that.family,_that.interface,_that.address,_that.local);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Gateway implements Gateway {
  const _Gateway({required this.family, required this.interface, required this.address, required final  List<String> local}): _local = local;
  factory _Gateway.fromJson(Map<String, dynamic> json) => _$GatewayFromJson(json);

@override final  String family;
@override final  String interface;
@override final  String address;
 final  List<String> _local;
@override List<String> get local {
  if (_local is EqualUnmodifiableListView) return _local;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_local);
}


/// Create a copy of Gateway
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayCopyWith<_Gateway> get copyWith => __$GatewayCopyWithImpl<_Gateway>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gateway&&(identical(other.family, family) || other.family == family)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._local, _local));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,family,interface,address,const DeepCollectionEquality().hash(_local));

@override
String toString() {
  return 'Gateway(family: $family, interface: $interface, address: $address, local: $local)';
}


}

/// @nodoc
abstract mixin class _$GatewayCopyWith<$Res> implements $GatewayCopyWith<$Res> {
  factory _$GatewayCopyWith(_Gateway value, $Res Function(_Gateway) _then) = __$GatewayCopyWithImpl;
@override @useResult
$Res call({
 String family, String interface, String address, List<String> local
});




}
/// @nodoc
class __$GatewayCopyWithImpl<$Res>
    implements _$GatewayCopyWith<$Res> {
  __$GatewayCopyWithImpl(this._self, this._then);

  final _Gateway _self;
  final $Res Function(_Gateway) _then;

/// Create a copy of Gateway
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? family = null,Object? interface = null,Object? address = null,Object? local = null,}) {
  return _then(_Gateway(
family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String,interface: null == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,local: null == local ? _self._local : local // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$NetInterface {

 String get name; String get type; List<String> get flags; String get state; bool get protoDown; String get address; String get broadcast; bool get carrier; InterfaceStats get stats; List<InterfaceAddress> get addresses; int? get index; String? get family; int? get speed; String? get permAddress; String? get ifname; int? get txqlen; int? get linkmode; int? get mtu; int? get minMtu; int? get maxMtu; int? get group; int? get promiscuity; List<int>? get unknown; int? get numTxQueues; int? get numRxQueues; int? get gsoMaxSegs; int? get gsoMaxSize; int? get map; int? get carrierChanges; int? get carrierUpCount; int? get carrierDownCount; String? get linkKind; String? get qdisc; String? get parentDevName; String? get parentDevBusName;
/// Create a copy of NetInterface
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetInterfaceCopyWith<NetInterface> get copyWith => _$NetInterfaceCopyWithImpl<NetInterface>(this as NetInterface, _$identity);

  /// Serializes this NetInterface to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetInterface&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.flags, flags)&&(identical(other.state, state) || other.state == state)&&(identical(other.protoDown, protoDown) || other.protoDown == protoDown)&&(identical(other.address, address) || other.address == address)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.carrier, carrier) || other.carrier == carrier)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&(identical(other.index, index) || other.index == index)&&(identical(other.family, family) || other.family == family)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.permAddress, permAddress) || other.permAddress == permAddress)&&(identical(other.ifname, ifname) || other.ifname == ifname)&&(identical(other.txqlen, txqlen) || other.txqlen == txqlen)&&(identical(other.linkmode, linkmode) || other.linkmode == linkmode)&&(identical(other.mtu, mtu) || other.mtu == mtu)&&(identical(other.minMtu, minMtu) || other.minMtu == minMtu)&&(identical(other.maxMtu, maxMtu) || other.maxMtu == maxMtu)&&(identical(other.group, group) || other.group == group)&&(identical(other.promiscuity, promiscuity) || other.promiscuity == promiscuity)&&const DeepCollectionEquality().equals(other.unknown, unknown)&&(identical(other.numTxQueues, numTxQueues) || other.numTxQueues == numTxQueues)&&(identical(other.numRxQueues, numRxQueues) || other.numRxQueues == numRxQueues)&&(identical(other.gsoMaxSegs, gsoMaxSegs) || other.gsoMaxSegs == gsoMaxSegs)&&(identical(other.gsoMaxSize, gsoMaxSize) || other.gsoMaxSize == gsoMaxSize)&&(identical(other.map, map) || other.map == map)&&(identical(other.carrierChanges, carrierChanges) || other.carrierChanges == carrierChanges)&&(identical(other.carrierUpCount, carrierUpCount) || other.carrierUpCount == carrierUpCount)&&(identical(other.carrierDownCount, carrierDownCount) || other.carrierDownCount == carrierDownCount)&&(identical(other.linkKind, linkKind) || other.linkKind == linkKind)&&(identical(other.qdisc, qdisc) || other.qdisc == qdisc)&&(identical(other.parentDevName, parentDevName) || other.parentDevName == parentDevName)&&(identical(other.parentDevBusName, parentDevBusName) || other.parentDevBusName == parentDevBusName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,type,const DeepCollectionEquality().hash(flags),state,protoDown,address,broadcast,carrier,stats,const DeepCollectionEquality().hash(addresses),index,family,speed,permAddress,ifname,txqlen,linkmode,mtu,minMtu,maxMtu,group,promiscuity,const DeepCollectionEquality().hash(unknown),numTxQueues,numRxQueues,gsoMaxSegs,gsoMaxSize,map,carrierChanges,carrierUpCount,carrierDownCount,linkKind,qdisc,parentDevName,parentDevBusName]);

@override
String toString() {
  return 'NetInterface(name: $name, type: $type, flags: $flags, state: $state, protoDown: $protoDown, address: $address, broadcast: $broadcast, carrier: $carrier, stats: $stats, addresses: $addresses, index: $index, family: $family, speed: $speed, permAddress: $permAddress, ifname: $ifname, txqlen: $txqlen, linkmode: $linkmode, mtu: $mtu, minMtu: $minMtu, maxMtu: $maxMtu, group: $group, promiscuity: $promiscuity, unknown: $unknown, numTxQueues: $numTxQueues, numRxQueues: $numRxQueues, gsoMaxSegs: $gsoMaxSegs, gsoMaxSize: $gsoMaxSize, map: $map, carrierChanges: $carrierChanges, carrierUpCount: $carrierUpCount, carrierDownCount: $carrierDownCount, linkKind: $linkKind, qdisc: $qdisc, parentDevName: $parentDevName, parentDevBusName: $parentDevBusName)';
}


}

/// @nodoc
abstract mixin class $NetInterfaceCopyWith<$Res>  {
  factory $NetInterfaceCopyWith(NetInterface value, $Res Function(NetInterface) _then) = _$NetInterfaceCopyWithImpl;
@useResult
$Res call({
 String name, String type, List<String> flags, String state, bool protoDown, String address, String broadcast, bool carrier, InterfaceStats stats, List<InterfaceAddress> addresses, int? index, String? family, int? speed, String? permAddress, String? ifname, int? txqlen, int? linkmode, int? mtu, int? minMtu, int? maxMtu, int? group, int? promiscuity, List<int>? unknown, int? numTxQueues, int? numRxQueues, int? gsoMaxSegs, int? gsoMaxSize, int? map, int? carrierChanges, int? carrierUpCount, int? carrierDownCount, String? linkKind, String? qdisc, String? parentDevName, String? parentDevBusName
});


$InterfaceStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$NetInterfaceCopyWithImpl<$Res>
    implements $NetInterfaceCopyWith<$Res> {
  _$NetInterfaceCopyWithImpl(this._self, this._then);

  final NetInterface _self;
  final $Res Function(NetInterface) _then;

/// Create a copy of NetInterface
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? flags = null,Object? state = null,Object? protoDown = null,Object? address = null,Object? broadcast = null,Object? carrier = null,Object? stats = null,Object? addresses = null,Object? index = freezed,Object? family = freezed,Object? speed = freezed,Object? permAddress = freezed,Object? ifname = freezed,Object? txqlen = freezed,Object? linkmode = freezed,Object? mtu = freezed,Object? minMtu = freezed,Object? maxMtu = freezed,Object? group = freezed,Object? promiscuity = freezed,Object? unknown = freezed,Object? numTxQueues = freezed,Object? numRxQueues = freezed,Object? gsoMaxSegs = freezed,Object? gsoMaxSize = freezed,Object? map = freezed,Object? carrierChanges = freezed,Object? carrierUpCount = freezed,Object? carrierDownCount = freezed,Object? linkKind = freezed,Object? qdisc = freezed,Object? parentDevName = freezed,Object? parentDevBusName = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,protoDown: null == protoDown ? _self.protoDown : protoDown // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as String,carrier: null == carrier ? _self.carrier : carrier // ignore: cast_nullable_to_non_nullable
as bool,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as InterfaceStats,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<InterfaceAddress>,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,family: freezed == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int?,permAddress: freezed == permAddress ? _self.permAddress : permAddress // ignore: cast_nullable_to_non_nullable
as String?,ifname: freezed == ifname ? _self.ifname : ifname // ignore: cast_nullable_to_non_nullable
as String?,txqlen: freezed == txqlen ? _self.txqlen : txqlen // ignore: cast_nullable_to_non_nullable
as int?,linkmode: freezed == linkmode ? _self.linkmode : linkmode // ignore: cast_nullable_to_non_nullable
as int?,mtu: freezed == mtu ? _self.mtu : mtu // ignore: cast_nullable_to_non_nullable
as int?,minMtu: freezed == minMtu ? _self.minMtu : minMtu // ignore: cast_nullable_to_non_nullable
as int?,maxMtu: freezed == maxMtu ? _self.maxMtu : maxMtu // ignore: cast_nullable_to_non_nullable
as int?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as int?,promiscuity: freezed == promiscuity ? _self.promiscuity : promiscuity // ignore: cast_nullable_to_non_nullable
as int?,unknown: freezed == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as List<int>?,numTxQueues: freezed == numTxQueues ? _self.numTxQueues : numTxQueues // ignore: cast_nullable_to_non_nullable
as int?,numRxQueues: freezed == numRxQueues ? _self.numRxQueues : numRxQueues // ignore: cast_nullable_to_non_nullable
as int?,gsoMaxSegs: freezed == gsoMaxSegs ? _self.gsoMaxSegs : gsoMaxSegs // ignore: cast_nullable_to_non_nullable
as int?,gsoMaxSize: freezed == gsoMaxSize ? _self.gsoMaxSize : gsoMaxSize // ignore: cast_nullable_to_non_nullable
as int?,map: freezed == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as int?,carrierChanges: freezed == carrierChanges ? _self.carrierChanges : carrierChanges // ignore: cast_nullable_to_non_nullable
as int?,carrierUpCount: freezed == carrierUpCount ? _self.carrierUpCount : carrierUpCount // ignore: cast_nullable_to_non_nullable
as int?,carrierDownCount: freezed == carrierDownCount ? _self.carrierDownCount : carrierDownCount // ignore: cast_nullable_to_non_nullable
as int?,linkKind: freezed == linkKind ? _self.linkKind : linkKind // ignore: cast_nullable_to_non_nullable
as String?,qdisc: freezed == qdisc ? _self.qdisc : qdisc // ignore: cast_nullable_to_non_nullable
as String?,parentDevName: freezed == parentDevName ? _self.parentDevName : parentDevName // ignore: cast_nullable_to_non_nullable
as String?,parentDevBusName: freezed == parentDevBusName ? _self.parentDevBusName : parentDevBusName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NetInterface
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterfaceStatsCopyWith<$Res> get stats {
  
  return $InterfaceStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [NetInterface].
extension NetInterfacePatterns on NetInterface {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetInterface value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetInterface() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetInterface value)  $default,){
final _that = this;
switch (_that) {
case _NetInterface():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetInterface value)?  $default,){
final _that = this;
switch (_that) {
case _NetInterface() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  List<String> flags,  String state,  bool protoDown,  String address,  String broadcast,  bool carrier,  InterfaceStats stats,  List<InterfaceAddress> addresses,  int? index,  String? family,  int? speed,  String? permAddress,  String? ifname,  int? txqlen,  int? linkmode,  int? mtu,  int? minMtu,  int? maxMtu,  int? group,  int? promiscuity,  List<int>? unknown,  int? numTxQueues,  int? numRxQueues,  int? gsoMaxSegs,  int? gsoMaxSize,  int? map,  int? carrierChanges,  int? carrierUpCount,  int? carrierDownCount,  String? linkKind,  String? qdisc,  String? parentDevName,  String? parentDevBusName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetInterface() when $default != null:
return $default(_that.name,_that.type,_that.flags,_that.state,_that.protoDown,_that.address,_that.broadcast,_that.carrier,_that.stats,_that.addresses,_that.index,_that.family,_that.speed,_that.permAddress,_that.ifname,_that.txqlen,_that.linkmode,_that.mtu,_that.minMtu,_that.maxMtu,_that.group,_that.promiscuity,_that.unknown,_that.numTxQueues,_that.numRxQueues,_that.gsoMaxSegs,_that.gsoMaxSize,_that.map,_that.carrierChanges,_that.carrierUpCount,_that.carrierDownCount,_that.linkKind,_that.qdisc,_that.parentDevName,_that.parentDevBusName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  List<String> flags,  String state,  bool protoDown,  String address,  String broadcast,  bool carrier,  InterfaceStats stats,  List<InterfaceAddress> addresses,  int? index,  String? family,  int? speed,  String? permAddress,  String? ifname,  int? txqlen,  int? linkmode,  int? mtu,  int? minMtu,  int? maxMtu,  int? group,  int? promiscuity,  List<int>? unknown,  int? numTxQueues,  int? numRxQueues,  int? gsoMaxSegs,  int? gsoMaxSize,  int? map,  int? carrierChanges,  int? carrierUpCount,  int? carrierDownCount,  String? linkKind,  String? qdisc,  String? parentDevName,  String? parentDevBusName)  $default,) {final _that = this;
switch (_that) {
case _NetInterface():
return $default(_that.name,_that.type,_that.flags,_that.state,_that.protoDown,_that.address,_that.broadcast,_that.carrier,_that.stats,_that.addresses,_that.index,_that.family,_that.speed,_that.permAddress,_that.ifname,_that.txqlen,_that.linkmode,_that.mtu,_that.minMtu,_that.maxMtu,_that.group,_that.promiscuity,_that.unknown,_that.numTxQueues,_that.numRxQueues,_that.gsoMaxSegs,_that.gsoMaxSize,_that.map,_that.carrierChanges,_that.carrierUpCount,_that.carrierDownCount,_that.linkKind,_that.qdisc,_that.parentDevName,_that.parentDevBusName);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  List<String> flags,  String state,  bool protoDown,  String address,  String broadcast,  bool carrier,  InterfaceStats stats,  List<InterfaceAddress> addresses,  int? index,  String? family,  int? speed,  String? permAddress,  String? ifname,  int? txqlen,  int? linkmode,  int? mtu,  int? minMtu,  int? maxMtu,  int? group,  int? promiscuity,  List<int>? unknown,  int? numTxQueues,  int? numRxQueues,  int? gsoMaxSegs,  int? gsoMaxSize,  int? map,  int? carrierChanges,  int? carrierUpCount,  int? carrierDownCount,  String? linkKind,  String? qdisc,  String? parentDevName,  String? parentDevBusName)?  $default,) {final _that = this;
switch (_that) {
case _NetInterface() when $default != null:
return $default(_that.name,_that.type,_that.flags,_that.state,_that.protoDown,_that.address,_that.broadcast,_that.carrier,_that.stats,_that.addresses,_that.index,_that.family,_that.speed,_that.permAddress,_that.ifname,_that.txqlen,_that.linkmode,_that.mtu,_that.minMtu,_that.maxMtu,_that.group,_that.promiscuity,_that.unknown,_that.numTxQueues,_that.numRxQueues,_that.gsoMaxSegs,_that.gsoMaxSize,_that.map,_that.carrierChanges,_that.carrierUpCount,_that.carrierDownCount,_that.linkKind,_that.qdisc,_that.parentDevName,_that.parentDevBusName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NetInterface implements NetInterface {
  const _NetInterface({required this.name, required this.type, required final  List<String> flags, required this.state, required this.protoDown, required this.address, required this.broadcast, required this.carrier, required this.stats, required final  List<InterfaceAddress> addresses, this.index, this.family, this.speed, this.permAddress, this.ifname, this.txqlen, this.linkmode, this.mtu, this.minMtu, this.maxMtu, this.group, this.promiscuity, final  List<int>? unknown, this.numTxQueues, this.numRxQueues, this.gsoMaxSegs, this.gsoMaxSize, this.map, this.carrierChanges, this.carrierUpCount, this.carrierDownCount, this.linkKind, this.qdisc, this.parentDevName, this.parentDevBusName}): _flags = flags,_addresses = addresses,_unknown = unknown;
  factory _NetInterface.fromJson(Map<String, dynamic> json) => _$NetInterfaceFromJson(json);

@override final  String name;
@override final  String type;
 final  List<String> _flags;
@override List<String> get flags {
  if (_flags is EqualUnmodifiableListView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flags);
}

@override final  String state;
@override final  bool protoDown;
@override final  String address;
@override final  String broadcast;
@override final  bool carrier;
@override final  InterfaceStats stats;
 final  List<InterfaceAddress> _addresses;
@override List<InterfaceAddress> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

@override final  int? index;
@override final  String? family;
@override final  int? speed;
@override final  String? permAddress;
@override final  String? ifname;
@override final  int? txqlen;
@override final  int? linkmode;
@override final  int? mtu;
@override final  int? minMtu;
@override final  int? maxMtu;
@override final  int? group;
@override final  int? promiscuity;
 final  List<int>? _unknown;
@override List<int>? get unknown {
  final value = _unknown;
  if (value == null) return null;
  if (_unknown is EqualUnmodifiableListView) return _unknown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? numTxQueues;
@override final  int? numRxQueues;
@override final  int? gsoMaxSegs;
@override final  int? gsoMaxSize;
@override final  int? map;
@override final  int? carrierChanges;
@override final  int? carrierUpCount;
@override final  int? carrierDownCount;
@override final  String? linkKind;
@override final  String? qdisc;
@override final  String? parentDevName;
@override final  String? parentDevBusName;

/// Create a copy of NetInterface
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetInterfaceCopyWith<_NetInterface> get copyWith => __$NetInterfaceCopyWithImpl<_NetInterface>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NetInterfaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetInterface&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._flags, _flags)&&(identical(other.state, state) || other.state == state)&&(identical(other.protoDown, protoDown) || other.protoDown == protoDown)&&(identical(other.address, address) || other.address == address)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.carrier, carrier) || other.carrier == carrier)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.index, index) || other.index == index)&&(identical(other.family, family) || other.family == family)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.permAddress, permAddress) || other.permAddress == permAddress)&&(identical(other.ifname, ifname) || other.ifname == ifname)&&(identical(other.txqlen, txqlen) || other.txqlen == txqlen)&&(identical(other.linkmode, linkmode) || other.linkmode == linkmode)&&(identical(other.mtu, mtu) || other.mtu == mtu)&&(identical(other.minMtu, minMtu) || other.minMtu == minMtu)&&(identical(other.maxMtu, maxMtu) || other.maxMtu == maxMtu)&&(identical(other.group, group) || other.group == group)&&(identical(other.promiscuity, promiscuity) || other.promiscuity == promiscuity)&&const DeepCollectionEquality().equals(other._unknown, _unknown)&&(identical(other.numTxQueues, numTxQueues) || other.numTxQueues == numTxQueues)&&(identical(other.numRxQueues, numRxQueues) || other.numRxQueues == numRxQueues)&&(identical(other.gsoMaxSegs, gsoMaxSegs) || other.gsoMaxSegs == gsoMaxSegs)&&(identical(other.gsoMaxSize, gsoMaxSize) || other.gsoMaxSize == gsoMaxSize)&&(identical(other.map, map) || other.map == map)&&(identical(other.carrierChanges, carrierChanges) || other.carrierChanges == carrierChanges)&&(identical(other.carrierUpCount, carrierUpCount) || other.carrierUpCount == carrierUpCount)&&(identical(other.carrierDownCount, carrierDownCount) || other.carrierDownCount == carrierDownCount)&&(identical(other.linkKind, linkKind) || other.linkKind == linkKind)&&(identical(other.qdisc, qdisc) || other.qdisc == qdisc)&&(identical(other.parentDevName, parentDevName) || other.parentDevName == parentDevName)&&(identical(other.parentDevBusName, parentDevBusName) || other.parentDevBusName == parentDevBusName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,type,const DeepCollectionEquality().hash(_flags),state,protoDown,address,broadcast,carrier,stats,const DeepCollectionEquality().hash(_addresses),index,family,speed,permAddress,ifname,txqlen,linkmode,mtu,minMtu,maxMtu,group,promiscuity,const DeepCollectionEquality().hash(_unknown),numTxQueues,numRxQueues,gsoMaxSegs,gsoMaxSize,map,carrierChanges,carrierUpCount,carrierDownCount,linkKind,qdisc,parentDevName,parentDevBusName]);

@override
String toString() {
  return 'NetInterface(name: $name, type: $type, flags: $flags, state: $state, protoDown: $protoDown, address: $address, broadcast: $broadcast, carrier: $carrier, stats: $stats, addresses: $addresses, index: $index, family: $family, speed: $speed, permAddress: $permAddress, ifname: $ifname, txqlen: $txqlen, linkmode: $linkmode, mtu: $mtu, minMtu: $minMtu, maxMtu: $maxMtu, group: $group, promiscuity: $promiscuity, unknown: $unknown, numTxQueues: $numTxQueues, numRxQueues: $numRxQueues, gsoMaxSegs: $gsoMaxSegs, gsoMaxSize: $gsoMaxSize, map: $map, carrierChanges: $carrierChanges, carrierUpCount: $carrierUpCount, carrierDownCount: $carrierDownCount, linkKind: $linkKind, qdisc: $qdisc, parentDevName: $parentDevName, parentDevBusName: $parentDevBusName)';
}


}

/// @nodoc
abstract mixin class _$NetInterfaceCopyWith<$Res> implements $NetInterfaceCopyWith<$Res> {
  factory _$NetInterfaceCopyWith(_NetInterface value, $Res Function(_NetInterface) _then) = __$NetInterfaceCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, List<String> flags, String state, bool protoDown, String address, String broadcast, bool carrier, InterfaceStats stats, List<InterfaceAddress> addresses, int? index, String? family, int? speed, String? permAddress, String? ifname, int? txqlen, int? linkmode, int? mtu, int? minMtu, int? maxMtu, int? group, int? promiscuity, List<int>? unknown, int? numTxQueues, int? numRxQueues, int? gsoMaxSegs, int? gsoMaxSize, int? map, int? carrierChanges, int? carrierUpCount, int? carrierDownCount, String? linkKind, String? qdisc, String? parentDevName, String? parentDevBusName
});


@override $InterfaceStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$NetInterfaceCopyWithImpl<$Res>
    implements _$NetInterfaceCopyWith<$Res> {
  __$NetInterfaceCopyWithImpl(this._self, this._then);

  final _NetInterface _self;
  final $Res Function(_NetInterface) _then;

/// Create a copy of NetInterface
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? flags = null,Object? state = null,Object? protoDown = null,Object? address = null,Object? broadcast = null,Object? carrier = null,Object? stats = null,Object? addresses = null,Object? index = freezed,Object? family = freezed,Object? speed = freezed,Object? permAddress = freezed,Object? ifname = freezed,Object? txqlen = freezed,Object? linkmode = freezed,Object? mtu = freezed,Object? minMtu = freezed,Object? maxMtu = freezed,Object? group = freezed,Object? promiscuity = freezed,Object? unknown = freezed,Object? numTxQueues = freezed,Object? numRxQueues = freezed,Object? gsoMaxSegs = freezed,Object? gsoMaxSize = freezed,Object? map = freezed,Object? carrierChanges = freezed,Object? carrierUpCount = freezed,Object? carrierDownCount = freezed,Object? linkKind = freezed,Object? qdisc = freezed,Object? parentDevName = freezed,Object? parentDevBusName = freezed,}) {
  return _then(_NetInterface(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,protoDown: null == protoDown ? _self.protoDown : protoDown // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as String,carrier: null == carrier ? _self.carrier : carrier // ignore: cast_nullable_to_non_nullable
as bool,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as InterfaceStats,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<InterfaceAddress>,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,family: freezed == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int?,permAddress: freezed == permAddress ? _self.permAddress : permAddress // ignore: cast_nullable_to_non_nullable
as String?,ifname: freezed == ifname ? _self.ifname : ifname // ignore: cast_nullable_to_non_nullable
as String?,txqlen: freezed == txqlen ? _self.txqlen : txqlen // ignore: cast_nullable_to_non_nullable
as int?,linkmode: freezed == linkmode ? _self.linkmode : linkmode // ignore: cast_nullable_to_non_nullable
as int?,mtu: freezed == mtu ? _self.mtu : mtu // ignore: cast_nullable_to_non_nullable
as int?,minMtu: freezed == minMtu ? _self.minMtu : minMtu // ignore: cast_nullable_to_non_nullable
as int?,maxMtu: freezed == maxMtu ? _self.maxMtu : maxMtu // ignore: cast_nullable_to_non_nullable
as int?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as int?,promiscuity: freezed == promiscuity ? _self.promiscuity : promiscuity // ignore: cast_nullable_to_non_nullable
as int?,unknown: freezed == unknown ? _self._unknown : unknown // ignore: cast_nullable_to_non_nullable
as List<int>?,numTxQueues: freezed == numTxQueues ? _self.numTxQueues : numTxQueues // ignore: cast_nullable_to_non_nullable
as int?,numRxQueues: freezed == numRxQueues ? _self.numRxQueues : numRxQueues // ignore: cast_nullable_to_non_nullable
as int?,gsoMaxSegs: freezed == gsoMaxSegs ? _self.gsoMaxSegs : gsoMaxSegs // ignore: cast_nullable_to_non_nullable
as int?,gsoMaxSize: freezed == gsoMaxSize ? _self.gsoMaxSize : gsoMaxSize // ignore: cast_nullable_to_non_nullable
as int?,map: freezed == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as int?,carrierChanges: freezed == carrierChanges ? _self.carrierChanges : carrierChanges // ignore: cast_nullable_to_non_nullable
as int?,carrierUpCount: freezed == carrierUpCount ? _self.carrierUpCount : carrierUpCount // ignore: cast_nullable_to_non_nullable
as int?,carrierDownCount: freezed == carrierDownCount ? _self.carrierDownCount : carrierDownCount // ignore: cast_nullable_to_non_nullable
as int?,linkKind: freezed == linkKind ? _self.linkKind : linkKind // ignore: cast_nullable_to_non_nullable
as String?,qdisc: freezed == qdisc ? _self.qdisc : qdisc // ignore: cast_nullable_to_non_nullable
as String?,parentDevName: freezed == parentDevName ? _self.parentDevName : parentDevName // ignore: cast_nullable_to_non_nullable
as String?,parentDevBusName: freezed == parentDevBusName ? _self.parentDevBusName : parentDevBusName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NetInterface
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterfaceStatsCopyWith<$Res> get stats {
  
  return $InterfaceStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$InterfaceStats {

 ByteValue get rxBytes; ByteValue get txBytes; int get bits; int get rxPackets; int get txPackets; int get rxErrors; int get txErrors; int get rxDropped; int get txDropped; int get multicast; int get collisions; int get rxLengthErrors; int get rxOverErrors; int get rxCrcErrors; int get rxFrameErrors; int get rxFifoErrors; int get rxMissedErrors; int get txAbortedErrors; int get txCarrierErrors; int get txFifoErrors; int get txHeartbeatErrors; int get txWindowErrors; int get rxCompressed; int get txCompressed; int get rxNohandler;
/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterfaceStatsCopyWith<InterfaceStats> get copyWith => _$InterfaceStatsCopyWithImpl<InterfaceStats>(this as InterfaceStats, _$identity);

  /// Serializes this InterfaceStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterfaceStats&&(identical(other.rxBytes, rxBytes) || other.rxBytes == rxBytes)&&(identical(other.txBytes, txBytes) || other.txBytes == txBytes)&&(identical(other.bits, bits) || other.bits == bits)&&(identical(other.rxPackets, rxPackets) || other.rxPackets == rxPackets)&&(identical(other.txPackets, txPackets) || other.txPackets == txPackets)&&(identical(other.rxErrors, rxErrors) || other.rxErrors == rxErrors)&&(identical(other.txErrors, txErrors) || other.txErrors == txErrors)&&(identical(other.rxDropped, rxDropped) || other.rxDropped == rxDropped)&&(identical(other.txDropped, txDropped) || other.txDropped == txDropped)&&(identical(other.multicast, multicast) || other.multicast == multicast)&&(identical(other.collisions, collisions) || other.collisions == collisions)&&(identical(other.rxLengthErrors, rxLengthErrors) || other.rxLengthErrors == rxLengthErrors)&&(identical(other.rxOverErrors, rxOverErrors) || other.rxOverErrors == rxOverErrors)&&(identical(other.rxCrcErrors, rxCrcErrors) || other.rxCrcErrors == rxCrcErrors)&&(identical(other.rxFrameErrors, rxFrameErrors) || other.rxFrameErrors == rxFrameErrors)&&(identical(other.rxFifoErrors, rxFifoErrors) || other.rxFifoErrors == rxFifoErrors)&&(identical(other.rxMissedErrors, rxMissedErrors) || other.rxMissedErrors == rxMissedErrors)&&(identical(other.txAbortedErrors, txAbortedErrors) || other.txAbortedErrors == txAbortedErrors)&&(identical(other.txCarrierErrors, txCarrierErrors) || other.txCarrierErrors == txCarrierErrors)&&(identical(other.txFifoErrors, txFifoErrors) || other.txFifoErrors == txFifoErrors)&&(identical(other.txHeartbeatErrors, txHeartbeatErrors) || other.txHeartbeatErrors == txHeartbeatErrors)&&(identical(other.txWindowErrors, txWindowErrors) || other.txWindowErrors == txWindowErrors)&&(identical(other.rxCompressed, rxCompressed) || other.rxCompressed == rxCompressed)&&(identical(other.txCompressed, txCompressed) || other.txCompressed == txCompressed)&&(identical(other.rxNohandler, rxNohandler) || other.rxNohandler == rxNohandler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rxBytes,txBytes,bits,rxPackets,txPackets,rxErrors,txErrors,rxDropped,txDropped,multicast,collisions,rxLengthErrors,rxOverErrors,rxCrcErrors,rxFrameErrors,rxFifoErrors,rxMissedErrors,txAbortedErrors,txCarrierErrors,txFifoErrors,txHeartbeatErrors,txWindowErrors,rxCompressed,txCompressed,rxNohandler]);

@override
String toString() {
  return 'InterfaceStats(rxBytes: $rxBytes, txBytes: $txBytes, bits: $bits, rxPackets: $rxPackets, txPackets: $txPackets, rxErrors: $rxErrors, txErrors: $txErrors, rxDropped: $rxDropped, txDropped: $txDropped, multicast: $multicast, collisions: $collisions, rxLengthErrors: $rxLengthErrors, rxOverErrors: $rxOverErrors, rxCrcErrors: $rxCrcErrors, rxFrameErrors: $rxFrameErrors, rxFifoErrors: $rxFifoErrors, rxMissedErrors: $rxMissedErrors, txAbortedErrors: $txAbortedErrors, txCarrierErrors: $txCarrierErrors, txFifoErrors: $txFifoErrors, txHeartbeatErrors: $txHeartbeatErrors, txWindowErrors: $txWindowErrors, rxCompressed: $rxCompressed, txCompressed: $txCompressed, rxNohandler: $rxNohandler)';
}


}

/// @nodoc
abstract mixin class $InterfaceStatsCopyWith<$Res>  {
  factory $InterfaceStatsCopyWith(InterfaceStats value, $Res Function(InterfaceStats) _then) = _$InterfaceStatsCopyWithImpl;
@useResult
$Res call({
 ByteValue rxBytes, ByteValue txBytes, int bits, int rxPackets, int txPackets, int rxErrors, int txErrors, int rxDropped, int txDropped, int multicast, int collisions, int rxLengthErrors, int rxOverErrors, int rxCrcErrors, int rxFrameErrors, int rxFifoErrors, int rxMissedErrors, int txAbortedErrors, int txCarrierErrors, int txFifoErrors, int txHeartbeatErrors, int txWindowErrors, int rxCompressed, int txCompressed, int rxNohandler
});


$ByteValueCopyWith<$Res> get rxBytes;$ByteValueCopyWith<$Res> get txBytes;

}
/// @nodoc
class _$InterfaceStatsCopyWithImpl<$Res>
    implements $InterfaceStatsCopyWith<$Res> {
  _$InterfaceStatsCopyWithImpl(this._self, this._then);

  final InterfaceStats _self;
  final $Res Function(InterfaceStats) _then;

/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rxBytes = null,Object? txBytes = null,Object? bits = null,Object? rxPackets = null,Object? txPackets = null,Object? rxErrors = null,Object? txErrors = null,Object? rxDropped = null,Object? txDropped = null,Object? multicast = null,Object? collisions = null,Object? rxLengthErrors = null,Object? rxOverErrors = null,Object? rxCrcErrors = null,Object? rxFrameErrors = null,Object? rxFifoErrors = null,Object? rxMissedErrors = null,Object? txAbortedErrors = null,Object? txCarrierErrors = null,Object? txFifoErrors = null,Object? txHeartbeatErrors = null,Object? txWindowErrors = null,Object? rxCompressed = null,Object? txCompressed = null,Object? rxNohandler = null,}) {
  return _then(_self.copyWith(
rxBytes: null == rxBytes ? _self.rxBytes : rxBytes // ignore: cast_nullable_to_non_nullable
as ByteValue,txBytes: null == txBytes ? _self.txBytes : txBytes // ignore: cast_nullable_to_non_nullable
as ByteValue,bits: null == bits ? _self.bits : bits // ignore: cast_nullable_to_non_nullable
as int,rxPackets: null == rxPackets ? _self.rxPackets : rxPackets // ignore: cast_nullable_to_non_nullable
as int,txPackets: null == txPackets ? _self.txPackets : txPackets // ignore: cast_nullable_to_non_nullable
as int,rxErrors: null == rxErrors ? _self.rxErrors : rxErrors // ignore: cast_nullable_to_non_nullable
as int,txErrors: null == txErrors ? _self.txErrors : txErrors // ignore: cast_nullable_to_non_nullable
as int,rxDropped: null == rxDropped ? _self.rxDropped : rxDropped // ignore: cast_nullable_to_non_nullable
as int,txDropped: null == txDropped ? _self.txDropped : txDropped // ignore: cast_nullable_to_non_nullable
as int,multicast: null == multicast ? _self.multicast : multicast // ignore: cast_nullable_to_non_nullable
as int,collisions: null == collisions ? _self.collisions : collisions // ignore: cast_nullable_to_non_nullable
as int,rxLengthErrors: null == rxLengthErrors ? _self.rxLengthErrors : rxLengthErrors // ignore: cast_nullable_to_non_nullable
as int,rxOverErrors: null == rxOverErrors ? _self.rxOverErrors : rxOverErrors // ignore: cast_nullable_to_non_nullable
as int,rxCrcErrors: null == rxCrcErrors ? _self.rxCrcErrors : rxCrcErrors // ignore: cast_nullable_to_non_nullable
as int,rxFrameErrors: null == rxFrameErrors ? _self.rxFrameErrors : rxFrameErrors // ignore: cast_nullable_to_non_nullable
as int,rxFifoErrors: null == rxFifoErrors ? _self.rxFifoErrors : rxFifoErrors // ignore: cast_nullable_to_non_nullable
as int,rxMissedErrors: null == rxMissedErrors ? _self.rxMissedErrors : rxMissedErrors // ignore: cast_nullable_to_non_nullable
as int,txAbortedErrors: null == txAbortedErrors ? _self.txAbortedErrors : txAbortedErrors // ignore: cast_nullable_to_non_nullable
as int,txCarrierErrors: null == txCarrierErrors ? _self.txCarrierErrors : txCarrierErrors // ignore: cast_nullable_to_non_nullable
as int,txFifoErrors: null == txFifoErrors ? _self.txFifoErrors : txFifoErrors // ignore: cast_nullable_to_non_nullable
as int,txHeartbeatErrors: null == txHeartbeatErrors ? _self.txHeartbeatErrors : txHeartbeatErrors // ignore: cast_nullable_to_non_nullable
as int,txWindowErrors: null == txWindowErrors ? _self.txWindowErrors : txWindowErrors // ignore: cast_nullable_to_non_nullable
as int,rxCompressed: null == rxCompressed ? _self.rxCompressed : rxCompressed // ignore: cast_nullable_to_non_nullable
as int,txCompressed: null == txCompressed ? _self.txCompressed : txCompressed // ignore: cast_nullable_to_non_nullable
as int,rxNohandler: null == rxNohandler ? _self.rxNohandler : rxNohandler // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ByteValueCopyWith<$Res> get rxBytes {
  
  return $ByteValueCopyWith<$Res>(_self.rxBytes, (value) {
    return _then(_self.copyWith(rxBytes: value));
  });
}/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ByteValueCopyWith<$Res> get txBytes {
  
  return $ByteValueCopyWith<$Res>(_self.txBytes, (value) {
    return _then(_self.copyWith(txBytes: value));
  });
}
}


/// Adds pattern-matching-related methods to [InterfaceStats].
extension InterfaceStatsPatterns on InterfaceStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterfaceStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterfaceStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterfaceStats value)  $default,){
final _that = this;
switch (_that) {
case _InterfaceStats():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterfaceStats value)?  $default,){
final _that = this;
switch (_that) {
case _InterfaceStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ByteValue rxBytes,  ByteValue txBytes,  int bits,  int rxPackets,  int txPackets,  int rxErrors,  int txErrors,  int rxDropped,  int txDropped,  int multicast,  int collisions,  int rxLengthErrors,  int rxOverErrors,  int rxCrcErrors,  int rxFrameErrors,  int rxFifoErrors,  int rxMissedErrors,  int txAbortedErrors,  int txCarrierErrors,  int txFifoErrors,  int txHeartbeatErrors,  int txWindowErrors,  int rxCompressed,  int txCompressed,  int rxNohandler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterfaceStats() when $default != null:
return $default(_that.rxBytes,_that.txBytes,_that.bits,_that.rxPackets,_that.txPackets,_that.rxErrors,_that.txErrors,_that.rxDropped,_that.txDropped,_that.multicast,_that.collisions,_that.rxLengthErrors,_that.rxOverErrors,_that.rxCrcErrors,_that.rxFrameErrors,_that.rxFifoErrors,_that.rxMissedErrors,_that.txAbortedErrors,_that.txCarrierErrors,_that.txFifoErrors,_that.txHeartbeatErrors,_that.txWindowErrors,_that.rxCompressed,_that.txCompressed,_that.rxNohandler);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ByteValue rxBytes,  ByteValue txBytes,  int bits,  int rxPackets,  int txPackets,  int rxErrors,  int txErrors,  int rxDropped,  int txDropped,  int multicast,  int collisions,  int rxLengthErrors,  int rxOverErrors,  int rxCrcErrors,  int rxFrameErrors,  int rxFifoErrors,  int rxMissedErrors,  int txAbortedErrors,  int txCarrierErrors,  int txFifoErrors,  int txHeartbeatErrors,  int txWindowErrors,  int rxCompressed,  int txCompressed,  int rxNohandler)  $default,) {final _that = this;
switch (_that) {
case _InterfaceStats():
return $default(_that.rxBytes,_that.txBytes,_that.bits,_that.rxPackets,_that.txPackets,_that.rxErrors,_that.txErrors,_that.rxDropped,_that.txDropped,_that.multicast,_that.collisions,_that.rxLengthErrors,_that.rxOverErrors,_that.rxCrcErrors,_that.rxFrameErrors,_that.rxFifoErrors,_that.rxMissedErrors,_that.txAbortedErrors,_that.txCarrierErrors,_that.txFifoErrors,_that.txHeartbeatErrors,_that.txWindowErrors,_that.rxCompressed,_that.txCompressed,_that.rxNohandler);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ByteValue rxBytes,  ByteValue txBytes,  int bits,  int rxPackets,  int txPackets,  int rxErrors,  int txErrors,  int rxDropped,  int txDropped,  int multicast,  int collisions,  int rxLengthErrors,  int rxOverErrors,  int rxCrcErrors,  int rxFrameErrors,  int rxFifoErrors,  int rxMissedErrors,  int txAbortedErrors,  int txCarrierErrors,  int txFifoErrors,  int txHeartbeatErrors,  int txWindowErrors,  int rxCompressed,  int txCompressed,  int rxNohandler)?  $default,) {final _that = this;
switch (_that) {
case _InterfaceStats() when $default != null:
return $default(_that.rxBytes,_that.txBytes,_that.bits,_that.rxPackets,_that.txPackets,_that.rxErrors,_that.txErrors,_that.rxDropped,_that.txDropped,_that.multicast,_that.collisions,_that.rxLengthErrors,_that.rxOverErrors,_that.rxCrcErrors,_that.rxFrameErrors,_that.rxFifoErrors,_that.rxMissedErrors,_that.txAbortedErrors,_that.txCarrierErrors,_that.txFifoErrors,_that.txHeartbeatErrors,_that.txWindowErrors,_that.rxCompressed,_that.txCompressed,_that.rxNohandler);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterfaceStats implements InterfaceStats {
  const _InterfaceStats({required this.rxBytes, required this.txBytes, required this.bits, required this.rxPackets, required this.txPackets, required this.rxErrors, required this.txErrors, required this.rxDropped, required this.txDropped, required this.multicast, required this.collisions, required this.rxLengthErrors, required this.rxOverErrors, required this.rxCrcErrors, required this.rxFrameErrors, required this.rxFifoErrors, required this.rxMissedErrors, required this.txAbortedErrors, required this.txCarrierErrors, required this.txFifoErrors, required this.txHeartbeatErrors, required this.txWindowErrors, required this.rxCompressed, required this.txCompressed, required this.rxNohandler});
  factory _InterfaceStats.fromJson(Map<String, dynamic> json) => _$InterfaceStatsFromJson(json);

@override final  ByteValue rxBytes;
@override final  ByteValue txBytes;
@override final  int bits;
@override final  int rxPackets;
@override final  int txPackets;
@override final  int rxErrors;
@override final  int txErrors;
@override final  int rxDropped;
@override final  int txDropped;
@override final  int multicast;
@override final  int collisions;
@override final  int rxLengthErrors;
@override final  int rxOverErrors;
@override final  int rxCrcErrors;
@override final  int rxFrameErrors;
@override final  int rxFifoErrors;
@override final  int rxMissedErrors;
@override final  int txAbortedErrors;
@override final  int txCarrierErrors;
@override final  int txFifoErrors;
@override final  int txHeartbeatErrors;
@override final  int txWindowErrors;
@override final  int rxCompressed;
@override final  int txCompressed;
@override final  int rxNohandler;

/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterfaceStatsCopyWith<_InterfaceStats> get copyWith => __$InterfaceStatsCopyWithImpl<_InterfaceStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterfaceStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterfaceStats&&(identical(other.rxBytes, rxBytes) || other.rxBytes == rxBytes)&&(identical(other.txBytes, txBytes) || other.txBytes == txBytes)&&(identical(other.bits, bits) || other.bits == bits)&&(identical(other.rxPackets, rxPackets) || other.rxPackets == rxPackets)&&(identical(other.txPackets, txPackets) || other.txPackets == txPackets)&&(identical(other.rxErrors, rxErrors) || other.rxErrors == rxErrors)&&(identical(other.txErrors, txErrors) || other.txErrors == txErrors)&&(identical(other.rxDropped, rxDropped) || other.rxDropped == rxDropped)&&(identical(other.txDropped, txDropped) || other.txDropped == txDropped)&&(identical(other.multicast, multicast) || other.multicast == multicast)&&(identical(other.collisions, collisions) || other.collisions == collisions)&&(identical(other.rxLengthErrors, rxLengthErrors) || other.rxLengthErrors == rxLengthErrors)&&(identical(other.rxOverErrors, rxOverErrors) || other.rxOverErrors == rxOverErrors)&&(identical(other.rxCrcErrors, rxCrcErrors) || other.rxCrcErrors == rxCrcErrors)&&(identical(other.rxFrameErrors, rxFrameErrors) || other.rxFrameErrors == rxFrameErrors)&&(identical(other.rxFifoErrors, rxFifoErrors) || other.rxFifoErrors == rxFifoErrors)&&(identical(other.rxMissedErrors, rxMissedErrors) || other.rxMissedErrors == rxMissedErrors)&&(identical(other.txAbortedErrors, txAbortedErrors) || other.txAbortedErrors == txAbortedErrors)&&(identical(other.txCarrierErrors, txCarrierErrors) || other.txCarrierErrors == txCarrierErrors)&&(identical(other.txFifoErrors, txFifoErrors) || other.txFifoErrors == txFifoErrors)&&(identical(other.txHeartbeatErrors, txHeartbeatErrors) || other.txHeartbeatErrors == txHeartbeatErrors)&&(identical(other.txWindowErrors, txWindowErrors) || other.txWindowErrors == txWindowErrors)&&(identical(other.rxCompressed, rxCompressed) || other.rxCompressed == rxCompressed)&&(identical(other.txCompressed, txCompressed) || other.txCompressed == txCompressed)&&(identical(other.rxNohandler, rxNohandler) || other.rxNohandler == rxNohandler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rxBytes,txBytes,bits,rxPackets,txPackets,rxErrors,txErrors,rxDropped,txDropped,multicast,collisions,rxLengthErrors,rxOverErrors,rxCrcErrors,rxFrameErrors,rxFifoErrors,rxMissedErrors,txAbortedErrors,txCarrierErrors,txFifoErrors,txHeartbeatErrors,txWindowErrors,rxCompressed,txCompressed,rxNohandler]);

@override
String toString() {
  return 'InterfaceStats(rxBytes: $rxBytes, txBytes: $txBytes, bits: $bits, rxPackets: $rxPackets, txPackets: $txPackets, rxErrors: $rxErrors, txErrors: $txErrors, rxDropped: $rxDropped, txDropped: $txDropped, multicast: $multicast, collisions: $collisions, rxLengthErrors: $rxLengthErrors, rxOverErrors: $rxOverErrors, rxCrcErrors: $rxCrcErrors, rxFrameErrors: $rxFrameErrors, rxFifoErrors: $rxFifoErrors, rxMissedErrors: $rxMissedErrors, txAbortedErrors: $txAbortedErrors, txCarrierErrors: $txCarrierErrors, txFifoErrors: $txFifoErrors, txHeartbeatErrors: $txHeartbeatErrors, txWindowErrors: $txWindowErrors, rxCompressed: $rxCompressed, txCompressed: $txCompressed, rxNohandler: $rxNohandler)';
}


}

/// @nodoc
abstract mixin class _$InterfaceStatsCopyWith<$Res> implements $InterfaceStatsCopyWith<$Res> {
  factory _$InterfaceStatsCopyWith(_InterfaceStats value, $Res Function(_InterfaceStats) _then) = __$InterfaceStatsCopyWithImpl;
@override @useResult
$Res call({
 ByteValue rxBytes, ByteValue txBytes, int bits, int rxPackets, int txPackets, int rxErrors, int txErrors, int rxDropped, int txDropped, int multicast, int collisions, int rxLengthErrors, int rxOverErrors, int rxCrcErrors, int rxFrameErrors, int rxFifoErrors, int rxMissedErrors, int txAbortedErrors, int txCarrierErrors, int txFifoErrors, int txHeartbeatErrors, int txWindowErrors, int rxCompressed, int txCompressed, int rxNohandler
});


@override $ByteValueCopyWith<$Res> get rxBytes;@override $ByteValueCopyWith<$Res> get txBytes;

}
/// @nodoc
class __$InterfaceStatsCopyWithImpl<$Res>
    implements _$InterfaceStatsCopyWith<$Res> {
  __$InterfaceStatsCopyWithImpl(this._self, this._then);

  final _InterfaceStats _self;
  final $Res Function(_InterfaceStats) _then;

/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rxBytes = null,Object? txBytes = null,Object? bits = null,Object? rxPackets = null,Object? txPackets = null,Object? rxErrors = null,Object? txErrors = null,Object? rxDropped = null,Object? txDropped = null,Object? multicast = null,Object? collisions = null,Object? rxLengthErrors = null,Object? rxOverErrors = null,Object? rxCrcErrors = null,Object? rxFrameErrors = null,Object? rxFifoErrors = null,Object? rxMissedErrors = null,Object? txAbortedErrors = null,Object? txCarrierErrors = null,Object? txFifoErrors = null,Object? txHeartbeatErrors = null,Object? txWindowErrors = null,Object? rxCompressed = null,Object? txCompressed = null,Object? rxNohandler = null,}) {
  return _then(_InterfaceStats(
rxBytes: null == rxBytes ? _self.rxBytes : rxBytes // ignore: cast_nullable_to_non_nullable
as ByteValue,txBytes: null == txBytes ? _self.txBytes : txBytes // ignore: cast_nullable_to_non_nullable
as ByteValue,bits: null == bits ? _self.bits : bits // ignore: cast_nullable_to_non_nullable
as int,rxPackets: null == rxPackets ? _self.rxPackets : rxPackets // ignore: cast_nullable_to_non_nullable
as int,txPackets: null == txPackets ? _self.txPackets : txPackets // ignore: cast_nullable_to_non_nullable
as int,rxErrors: null == rxErrors ? _self.rxErrors : rxErrors // ignore: cast_nullable_to_non_nullable
as int,txErrors: null == txErrors ? _self.txErrors : txErrors // ignore: cast_nullable_to_non_nullable
as int,rxDropped: null == rxDropped ? _self.rxDropped : rxDropped // ignore: cast_nullable_to_non_nullable
as int,txDropped: null == txDropped ? _self.txDropped : txDropped // ignore: cast_nullable_to_non_nullable
as int,multicast: null == multicast ? _self.multicast : multicast // ignore: cast_nullable_to_non_nullable
as int,collisions: null == collisions ? _self.collisions : collisions // ignore: cast_nullable_to_non_nullable
as int,rxLengthErrors: null == rxLengthErrors ? _self.rxLengthErrors : rxLengthErrors // ignore: cast_nullable_to_non_nullable
as int,rxOverErrors: null == rxOverErrors ? _self.rxOverErrors : rxOverErrors // ignore: cast_nullable_to_non_nullable
as int,rxCrcErrors: null == rxCrcErrors ? _self.rxCrcErrors : rxCrcErrors // ignore: cast_nullable_to_non_nullable
as int,rxFrameErrors: null == rxFrameErrors ? _self.rxFrameErrors : rxFrameErrors // ignore: cast_nullable_to_non_nullable
as int,rxFifoErrors: null == rxFifoErrors ? _self.rxFifoErrors : rxFifoErrors // ignore: cast_nullable_to_non_nullable
as int,rxMissedErrors: null == rxMissedErrors ? _self.rxMissedErrors : rxMissedErrors // ignore: cast_nullable_to_non_nullable
as int,txAbortedErrors: null == txAbortedErrors ? _self.txAbortedErrors : txAbortedErrors // ignore: cast_nullable_to_non_nullable
as int,txCarrierErrors: null == txCarrierErrors ? _self.txCarrierErrors : txCarrierErrors // ignore: cast_nullable_to_non_nullable
as int,txFifoErrors: null == txFifoErrors ? _self.txFifoErrors : txFifoErrors // ignore: cast_nullable_to_non_nullable
as int,txHeartbeatErrors: null == txHeartbeatErrors ? _self.txHeartbeatErrors : txHeartbeatErrors // ignore: cast_nullable_to_non_nullable
as int,txWindowErrors: null == txWindowErrors ? _self.txWindowErrors : txWindowErrors // ignore: cast_nullable_to_non_nullable
as int,rxCompressed: null == rxCompressed ? _self.rxCompressed : rxCompressed // ignore: cast_nullable_to_non_nullable
as int,txCompressed: null == txCompressed ? _self.txCompressed : txCompressed // ignore: cast_nullable_to_non_nullable
as int,rxNohandler: null == rxNohandler ? _self.rxNohandler : rxNohandler // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ByteValueCopyWith<$Res> get rxBytes {
  
  return $ByteValueCopyWith<$Res>(_self.rxBytes, (value) {
    return _then(_self.copyWith(rxBytes: value));
  });
}/// Create a copy of InterfaceStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ByteValueCopyWith<$Res> get txBytes {
  
  return $ByteValueCopyWith<$Res>(_self.txBytes, (value) {
    return _then(_self.copyWith(txBytes: value));
  });
}
}


/// @nodoc
mixin _$ByteValue {

 double get value; String get unit;
/// Create a copy of ByteValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ByteValueCopyWith<ByteValue> get copyWith => _$ByteValueCopyWithImpl<ByteValue>(this as ByteValue, _$identity);

  /// Serializes this ByteValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ByteValue&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,unit);

@override
String toString() {
  return 'ByteValue(value: $value, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $ByteValueCopyWith<$Res>  {
  factory $ByteValueCopyWith(ByteValue value, $Res Function(ByteValue) _then) = _$ByteValueCopyWithImpl;
@useResult
$Res call({
 double value, String unit
});




}
/// @nodoc
class _$ByteValueCopyWithImpl<$Res>
    implements $ByteValueCopyWith<$Res> {
  _$ByteValueCopyWithImpl(this._self, this._then);

  final ByteValue _self;
  final $Res Function(ByteValue) _then;

/// Create a copy of ByteValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? unit = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ByteValue].
extension ByteValuePatterns on ByteValue {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ByteValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ByteValue() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ByteValue value)  $default,){
final _that = this;
switch (_that) {
case _ByteValue():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ByteValue value)?  $default,){
final _that = this;
switch (_that) {
case _ByteValue() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double value,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ByteValue() when $default != null:
return $default(_that.value,_that.unit);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double value,  String unit)  $default,) {final _that = this;
switch (_that) {
case _ByteValue():
return $default(_that.value,_that.unit);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double value,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _ByteValue() when $default != null:
return $default(_that.value,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ByteValue implements ByteValue {
  const _ByteValue({required this.value, required this.unit});
  factory _ByteValue.fromJson(Map<String, dynamic> json) => _$ByteValueFromJson(json);

@override final  double value;
@override final  String unit;

/// Create a copy of ByteValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ByteValueCopyWith<_ByteValue> get copyWith => __$ByteValueCopyWithImpl<_ByteValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ByteValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ByteValue&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,unit);

@override
String toString() {
  return 'ByteValue(value: $value, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$ByteValueCopyWith<$Res> implements $ByteValueCopyWith<$Res> {
  factory _$ByteValueCopyWith(_ByteValue value, $Res Function(_ByteValue) _then) = __$ByteValueCopyWithImpl;
@override @useResult
$Res call({
 double value, String unit
});




}
/// @nodoc
class __$ByteValueCopyWithImpl<$Res>
    implements _$ByteValueCopyWith<$Res> {
  __$ByteValueCopyWithImpl(this._self, this._then);

  final _ByteValue _self;
  final $Res Function(_ByteValue) _then;

/// Create a copy of ByteValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? unit = null,}) {
  return _then(_ByteValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$InterfaceAddress {

 String get address; String get addressType; int get index; RouteFamily get family; String get scope; List<String> get flags; int get prefixlen; int get prefered; int get valid; double get cstamp; double get tstamp; String? get label; String? get local; String? get localType; String? get broadcast; String? get broadcastType; List<int>? get unknown;
/// Create a copy of InterfaceAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterfaceAddressCopyWith<InterfaceAddress> get copyWith => _$InterfaceAddressCopyWithImpl<InterfaceAddress>(this as InterfaceAddress, _$identity);

  /// Serializes this InterfaceAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterfaceAddress&&(identical(other.address, address) || other.address == address)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.index, index) || other.index == index)&&(identical(other.family, family) || other.family == family)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other.flags, flags)&&(identical(other.prefixlen, prefixlen) || other.prefixlen == prefixlen)&&(identical(other.prefered, prefered) || other.prefered == prefered)&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.cstamp, cstamp) || other.cstamp == cstamp)&&(identical(other.tstamp, tstamp) || other.tstamp == tstamp)&&(identical(other.label, label) || other.label == label)&&(identical(other.local, local) || other.local == local)&&(identical(other.localType, localType) || other.localType == localType)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&const DeepCollectionEquality().equals(other.unknown, unknown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,addressType,index,family,scope,const DeepCollectionEquality().hash(flags),prefixlen,prefered,valid,cstamp,tstamp,label,local,localType,broadcast,broadcastType,const DeepCollectionEquality().hash(unknown));

@override
String toString() {
  return 'InterfaceAddress(address: $address, addressType: $addressType, index: $index, family: $family, scope: $scope, flags: $flags, prefixlen: $prefixlen, prefered: $prefered, valid: $valid, cstamp: $cstamp, tstamp: $tstamp, label: $label, local: $local, localType: $localType, broadcast: $broadcast, broadcastType: $broadcastType, unknown: $unknown)';
}


}

/// @nodoc
abstract mixin class $InterfaceAddressCopyWith<$Res>  {
  factory $InterfaceAddressCopyWith(InterfaceAddress value, $Res Function(InterfaceAddress) _then) = _$InterfaceAddressCopyWithImpl;
@useResult
$Res call({
 String address, String addressType, int index, RouteFamily family, String scope, List<String> flags, int prefixlen, int prefered, int valid, double cstamp, double tstamp, String? label, String? local, String? localType, String? broadcast, String? broadcastType, List<int>? unknown
});




}
/// @nodoc
class _$InterfaceAddressCopyWithImpl<$Res>
    implements $InterfaceAddressCopyWith<$Res> {
  _$InterfaceAddressCopyWithImpl(this._self, this._then);

  final InterfaceAddress _self;
  final $Res Function(InterfaceAddress) _then;

/// Create a copy of InterfaceAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? addressType = null,Object? index = null,Object? family = null,Object? scope = null,Object? flags = null,Object? prefixlen = null,Object? prefered = null,Object? valid = null,Object? cstamp = null,Object? tstamp = null,Object? label = freezed,Object? local = freezed,Object? localType = freezed,Object? broadcast = freezed,Object? broadcastType = freezed,Object? unknown = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as RouteFamily,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,prefixlen: null == prefixlen ? _self.prefixlen : prefixlen // ignore: cast_nullable_to_non_nullable
as int,prefered: null == prefered ? _self.prefered : prefered // ignore: cast_nullable_to_non_nullable
as int,valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as int,cstamp: null == cstamp ? _self.cstamp : cstamp // ignore: cast_nullable_to_non_nullable
as double,tstamp: null == tstamp ? _self.tstamp : tstamp // ignore: cast_nullable_to_non_nullable
as double,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,local: freezed == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String?,localType: freezed == localType ? _self.localType : localType // ignore: cast_nullable_to_non_nullable
as String?,broadcast: freezed == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,unknown: freezed == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [InterfaceAddress].
extension InterfaceAddressPatterns on InterfaceAddress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterfaceAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterfaceAddress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterfaceAddress value)  $default,){
final _that = this;
switch (_that) {
case _InterfaceAddress():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterfaceAddress value)?  $default,){
final _that = this;
switch (_that) {
case _InterfaceAddress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String addressType,  int index,  RouteFamily family,  String scope,  List<String> flags,  int prefixlen,  int prefered,  int valid,  double cstamp,  double tstamp,  String? label,  String? local,  String? localType,  String? broadcast,  String? broadcastType,  List<int>? unknown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterfaceAddress() when $default != null:
return $default(_that.address,_that.addressType,_that.index,_that.family,_that.scope,_that.flags,_that.prefixlen,_that.prefered,_that.valid,_that.cstamp,_that.tstamp,_that.label,_that.local,_that.localType,_that.broadcast,_that.broadcastType,_that.unknown);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String addressType,  int index,  RouteFamily family,  String scope,  List<String> flags,  int prefixlen,  int prefered,  int valid,  double cstamp,  double tstamp,  String? label,  String? local,  String? localType,  String? broadcast,  String? broadcastType,  List<int>? unknown)  $default,) {final _that = this;
switch (_that) {
case _InterfaceAddress():
return $default(_that.address,_that.addressType,_that.index,_that.family,_that.scope,_that.flags,_that.prefixlen,_that.prefered,_that.valid,_that.cstamp,_that.tstamp,_that.label,_that.local,_that.localType,_that.broadcast,_that.broadcastType,_that.unknown);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String addressType,  int index,  RouteFamily family,  String scope,  List<String> flags,  int prefixlen,  int prefered,  int valid,  double cstamp,  double tstamp,  String? label,  String? local,  String? localType,  String? broadcast,  String? broadcastType,  List<int>? unknown)?  $default,) {final _that = this;
switch (_that) {
case _InterfaceAddress() when $default != null:
return $default(_that.address,_that.addressType,_that.index,_that.family,_that.scope,_that.flags,_that.prefixlen,_that.prefered,_that.valid,_that.cstamp,_that.tstamp,_that.label,_that.local,_that.localType,_that.broadcast,_that.broadcastType,_that.unknown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterfaceAddress implements InterfaceAddress {
  const _InterfaceAddress({required this.address, required this.addressType, required this.index, required this.family, required this.scope, required final  List<String> flags, required this.prefixlen, required this.prefered, required this.valid, required this.cstamp, required this.tstamp, this.label, this.local, this.localType, this.broadcast, this.broadcastType, final  List<int>? unknown}): _flags = flags,_unknown = unknown;
  factory _InterfaceAddress.fromJson(Map<String, dynamic> json) => _$InterfaceAddressFromJson(json);

@override final  String address;
@override final  String addressType;
@override final  int index;
@override final  RouteFamily family;
@override final  String scope;
 final  List<String> _flags;
@override List<String> get flags {
  if (_flags is EqualUnmodifiableListView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flags);
}

@override final  int prefixlen;
@override final  int prefered;
@override final  int valid;
@override final  double cstamp;
@override final  double tstamp;
@override final  String? label;
@override final  String? local;
@override final  String? localType;
@override final  String? broadcast;
@override final  String? broadcastType;
 final  List<int>? _unknown;
@override List<int>? get unknown {
  final value = _unknown;
  if (value == null) return null;
  if (_unknown is EqualUnmodifiableListView) return _unknown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of InterfaceAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterfaceAddressCopyWith<_InterfaceAddress> get copyWith => __$InterfaceAddressCopyWithImpl<_InterfaceAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterfaceAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterfaceAddress&&(identical(other.address, address) || other.address == address)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.index, index) || other.index == index)&&(identical(other.family, family) || other.family == family)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other._flags, _flags)&&(identical(other.prefixlen, prefixlen) || other.prefixlen == prefixlen)&&(identical(other.prefered, prefered) || other.prefered == prefered)&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.cstamp, cstamp) || other.cstamp == cstamp)&&(identical(other.tstamp, tstamp) || other.tstamp == tstamp)&&(identical(other.label, label) || other.label == label)&&(identical(other.local, local) || other.local == local)&&(identical(other.localType, localType) || other.localType == localType)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&const DeepCollectionEquality().equals(other._unknown, _unknown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,addressType,index,family,scope,const DeepCollectionEquality().hash(_flags),prefixlen,prefered,valid,cstamp,tstamp,label,local,localType,broadcast,broadcastType,const DeepCollectionEquality().hash(_unknown));

@override
String toString() {
  return 'InterfaceAddress(address: $address, addressType: $addressType, index: $index, family: $family, scope: $scope, flags: $flags, prefixlen: $prefixlen, prefered: $prefered, valid: $valid, cstamp: $cstamp, tstamp: $tstamp, label: $label, local: $local, localType: $localType, broadcast: $broadcast, broadcastType: $broadcastType, unknown: $unknown)';
}


}

/// @nodoc
abstract mixin class _$InterfaceAddressCopyWith<$Res> implements $InterfaceAddressCopyWith<$Res> {
  factory _$InterfaceAddressCopyWith(_InterfaceAddress value, $Res Function(_InterfaceAddress) _then) = __$InterfaceAddressCopyWithImpl;
@override @useResult
$Res call({
 String address, String addressType, int index, RouteFamily family, String scope, List<String> flags, int prefixlen, int prefered, int valid, double cstamp, double tstamp, String? label, String? local, String? localType, String? broadcast, String? broadcastType, List<int>? unknown
});




}
/// @nodoc
class __$InterfaceAddressCopyWithImpl<$Res>
    implements _$InterfaceAddressCopyWith<$Res> {
  __$InterfaceAddressCopyWithImpl(this._self, this._then);

  final _InterfaceAddress _self;
  final $Res Function(_InterfaceAddress) _then;

/// Create a copy of InterfaceAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? addressType = null,Object? index = null,Object? family = null,Object? scope = null,Object? flags = null,Object? prefixlen = null,Object? prefered = null,Object? valid = null,Object? cstamp = null,Object? tstamp = null,Object? label = freezed,Object? local = freezed,Object? localType = freezed,Object? broadcast = freezed,Object? broadcastType = freezed,Object? unknown = freezed,}) {
  return _then(_InterfaceAddress(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as RouteFamily,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,prefixlen: null == prefixlen ? _self.prefixlen : prefixlen // ignore: cast_nullable_to_non_nullable
as int,prefered: null == prefered ? _self.prefered : prefered // ignore: cast_nullable_to_non_nullable
as int,valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as int,cstamp: null == cstamp ? _self.cstamp : cstamp // ignore: cast_nullable_to_non_nullable
as double,tstamp: null == tstamp ? _self.tstamp : tstamp // ignore: cast_nullable_to_non_nullable
as double,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,local: freezed == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String?,localType: freezed == localType ? _self.localType : localType // ignore: cast_nullable_to_non_nullable
as String?,broadcast: freezed == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,unknown: freezed == unknown ? _self._unknown : unknown // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}


/// @nodoc
mixin _$Device {

 int get id; String get hwaddr; String get interface; DateTime get firstSeen; DateTime get lastQuery; int get numQueries; List<DeviceIp> get ips; String? get macVendor;
/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCopyWith<Device> get copyWith => _$DeviceCopyWithImpl<Device>(this as Device, _$identity);

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Device&&(identical(other.id, id) || other.id == id)&&(identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.firstSeen, firstSeen) || other.firstSeen == firstSeen)&&(identical(other.lastQuery, lastQuery) || other.lastQuery == lastQuery)&&(identical(other.numQueries, numQueries) || other.numQueries == numQueries)&&const DeepCollectionEquality().equals(other.ips, ips)&&(identical(other.macVendor, macVendor) || other.macVendor == macVendor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hwaddr,interface,firstSeen,lastQuery,numQueries,const DeepCollectionEquality().hash(ips),macVendor);

@override
String toString() {
  return 'Device(id: $id, hwaddr: $hwaddr, interface: $interface, firstSeen: $firstSeen, lastQuery: $lastQuery, numQueries: $numQueries, ips: $ips, macVendor: $macVendor)';
}


}

/// @nodoc
abstract mixin class $DeviceCopyWith<$Res>  {
  factory $DeviceCopyWith(Device value, $Res Function(Device) _then) = _$DeviceCopyWithImpl;
@useResult
$Res call({
 int id, String hwaddr, String interface, DateTime firstSeen, DateTime lastQuery, int numQueries, List<DeviceIp> ips, String? macVendor
});




}
/// @nodoc
class _$DeviceCopyWithImpl<$Res>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._self, this._then);

  final Device _self;
  final $Res Function(Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hwaddr = null,Object? interface = null,Object? firstSeen = null,Object? lastQuery = null,Object? numQueries = null,Object? ips = null,Object? macVendor = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hwaddr: null == hwaddr ? _self.hwaddr : hwaddr // ignore: cast_nullable_to_non_nullable
as String,interface: null == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as String,firstSeen: null == firstSeen ? _self.firstSeen : firstSeen // ignore: cast_nullable_to_non_nullable
as DateTime,lastQuery: null == lastQuery ? _self.lastQuery : lastQuery // ignore: cast_nullable_to_non_nullable
as DateTime,numQueries: null == numQueries ? _self.numQueries : numQueries // ignore: cast_nullable_to_non_nullable
as int,ips: null == ips ? _self.ips : ips // ignore: cast_nullable_to_non_nullable
as List<DeviceIp>,macVendor: freezed == macVendor ? _self.macVendor : macVendor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Device].
extension DevicePatterns on Device {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Device value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Device value)  $default,){
final _that = this;
switch (_that) {
case _Device():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Device value)?  $default,){
final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String hwaddr,  String interface,  DateTime firstSeen,  DateTime lastQuery,  int numQueries,  List<DeviceIp> ips,  String? macVendor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.hwaddr,_that.interface,_that.firstSeen,_that.lastQuery,_that.numQueries,_that.ips,_that.macVendor);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String hwaddr,  String interface,  DateTime firstSeen,  DateTime lastQuery,  int numQueries,  List<DeviceIp> ips,  String? macVendor)  $default,) {final _that = this;
switch (_that) {
case _Device():
return $default(_that.id,_that.hwaddr,_that.interface,_that.firstSeen,_that.lastQuery,_that.numQueries,_that.ips,_that.macVendor);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String hwaddr,  String interface,  DateTime firstSeen,  DateTime lastQuery,  int numQueries,  List<DeviceIp> ips,  String? macVendor)?  $default,) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.hwaddr,_that.interface,_that.firstSeen,_that.lastQuery,_that.numQueries,_that.ips,_that.macVendor);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Device implements Device {
  const _Device({required this.id, required this.hwaddr, required this.interface, required this.firstSeen, required this.lastQuery, required this.numQueries, required final  List<DeviceIp> ips, this.macVendor}): _ips = ips;
  factory _Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

@override final  int id;
@override final  String hwaddr;
@override final  String interface;
@override final  DateTime firstSeen;
@override final  DateTime lastQuery;
@override final  int numQueries;
 final  List<DeviceIp> _ips;
@override List<DeviceIp> get ips {
  if (_ips is EqualUnmodifiableListView) return _ips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ips);
}

@override final  String? macVendor;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCopyWith<_Device> get copyWith => __$DeviceCopyWithImpl<_Device>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Device&&(identical(other.id, id) || other.id == id)&&(identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.firstSeen, firstSeen) || other.firstSeen == firstSeen)&&(identical(other.lastQuery, lastQuery) || other.lastQuery == lastQuery)&&(identical(other.numQueries, numQueries) || other.numQueries == numQueries)&&const DeepCollectionEquality().equals(other._ips, _ips)&&(identical(other.macVendor, macVendor) || other.macVendor == macVendor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hwaddr,interface,firstSeen,lastQuery,numQueries,const DeepCollectionEquality().hash(_ips),macVendor);

@override
String toString() {
  return 'Device(id: $id, hwaddr: $hwaddr, interface: $interface, firstSeen: $firstSeen, lastQuery: $lastQuery, numQueries: $numQueries, ips: $ips, macVendor: $macVendor)';
}


}

/// @nodoc
abstract mixin class _$DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$DeviceCopyWith(_Device value, $Res Function(_Device) _then) = __$DeviceCopyWithImpl;
@override @useResult
$Res call({
 int id, String hwaddr, String interface, DateTime firstSeen, DateTime lastQuery, int numQueries, List<DeviceIp> ips, String? macVendor
});




}
/// @nodoc
class __$DeviceCopyWithImpl<$Res>
    implements _$DeviceCopyWith<$Res> {
  __$DeviceCopyWithImpl(this._self, this._then);

  final _Device _self;
  final $Res Function(_Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hwaddr = null,Object? interface = null,Object? firstSeen = null,Object? lastQuery = null,Object? numQueries = null,Object? ips = null,Object? macVendor = freezed,}) {
  return _then(_Device(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hwaddr: null == hwaddr ? _self.hwaddr : hwaddr // ignore: cast_nullable_to_non_nullable
as String,interface: null == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as String,firstSeen: null == firstSeen ? _self.firstSeen : firstSeen // ignore: cast_nullable_to_non_nullable
as DateTime,lastQuery: null == lastQuery ? _self.lastQuery : lastQuery // ignore: cast_nullable_to_non_nullable
as DateTime,numQueries: null == numQueries ? _self.numQueries : numQueries // ignore: cast_nullable_to_non_nullable
as int,ips: null == ips ? _self._ips : ips // ignore: cast_nullable_to_non_nullable
as List<DeviceIp>,macVendor: freezed == macVendor ? _self.macVendor : macVendor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DeviceIp {

 String get ip; DateTime get lastSeen; DateTime get nameUpdated; String? get name;
/// Create a copy of DeviceIp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceIpCopyWith<DeviceIp> get copyWith => _$DeviceIpCopyWithImpl<DeviceIp>(this as DeviceIp, _$identity);

  /// Serializes this DeviceIp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceIp&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.nameUpdated, nameUpdated) || other.nameUpdated == nameUpdated)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,lastSeen,nameUpdated,name);

@override
String toString() {
  return 'DeviceIp(ip: $ip, lastSeen: $lastSeen, nameUpdated: $nameUpdated, name: $name)';
}


}

/// @nodoc
abstract mixin class $DeviceIpCopyWith<$Res>  {
  factory $DeviceIpCopyWith(DeviceIp value, $Res Function(DeviceIp) _then) = _$DeviceIpCopyWithImpl;
@useResult
$Res call({
 String ip, DateTime lastSeen, DateTime nameUpdated, String? name
});




}
/// @nodoc
class _$DeviceIpCopyWithImpl<$Res>
    implements $DeviceIpCopyWith<$Res> {
  _$DeviceIpCopyWithImpl(this._self, this._then);

  final DeviceIp _self;
  final $Res Function(DeviceIp) _then;

/// Create a copy of DeviceIp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ip = null,Object? lastSeen = null,Object? nameUpdated = null,Object? name = freezed,}) {
  return _then(_self.copyWith(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,nameUpdated: null == nameUpdated ? _self.nameUpdated : nameUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceIp].
extension DeviceIpPatterns on DeviceIp {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceIp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceIp() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceIp value)  $default,){
final _that = this;
switch (_that) {
case _DeviceIp():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceIp value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceIp() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ip,  DateTime lastSeen,  DateTime nameUpdated,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceIp() when $default != null:
return $default(_that.ip,_that.lastSeen,_that.nameUpdated,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ip,  DateTime lastSeen,  DateTime nameUpdated,  String? name)  $default,) {final _that = this;
switch (_that) {
case _DeviceIp():
return $default(_that.ip,_that.lastSeen,_that.nameUpdated,_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ip,  DateTime lastSeen,  DateTime nameUpdated,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _DeviceIp() when $default != null:
return $default(_that.ip,_that.lastSeen,_that.nameUpdated,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceIp implements DeviceIp {
  const _DeviceIp({required this.ip, required this.lastSeen, required this.nameUpdated, this.name});
  factory _DeviceIp.fromJson(Map<String, dynamic> json) => _$DeviceIpFromJson(json);

@override final  String ip;
@override final  DateTime lastSeen;
@override final  DateTime nameUpdated;
@override final  String? name;

/// Create a copy of DeviceIp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceIpCopyWith<_DeviceIp> get copyWith => __$DeviceIpCopyWithImpl<_DeviceIp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceIpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceIp&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.nameUpdated, nameUpdated) || other.nameUpdated == nameUpdated)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,lastSeen,nameUpdated,name);

@override
String toString() {
  return 'DeviceIp(ip: $ip, lastSeen: $lastSeen, nameUpdated: $nameUpdated, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DeviceIpCopyWith<$Res> implements $DeviceIpCopyWith<$Res> {
  factory _$DeviceIpCopyWith(_DeviceIp value, $Res Function(_DeviceIp) _then) = __$DeviceIpCopyWithImpl;
@override @useResult
$Res call({
 String ip, DateTime lastSeen, DateTime nameUpdated, String? name
});




}
/// @nodoc
class __$DeviceIpCopyWithImpl<$Res>
    implements _$DeviceIpCopyWith<$Res> {
  __$DeviceIpCopyWithImpl(this._self, this._then);

  final _DeviceIp _self;
  final $Res Function(_DeviceIp) _then;

/// Create a copy of DeviceIp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? lastSeen = null,Object? nameUpdated = null,Object? name = freezed,}) {
  return _then(_DeviceIp(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,nameUpdated: null == nameUpdated ? _self.nameUpdated : nameUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Route {

 int get table; RouteFamily get family; String get protocol; String get scope; String get type; List<String> get flags; String get dst; int? get iflags; String? get gateway; String? get oif; String? get iif; String? get src; String? get prefsrc; int? get priority; int? get pref; double? get cstamp; double? get tstamp; int? get expires; int? get error; int? get used;
/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteCopyWith<Route> get copyWith => _$RouteCopyWithImpl<Route>(this as Route, _$identity);

  /// Serializes this Route to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Route&&(identical(other.table, table) || other.table == table)&&(identical(other.family, family) || other.family == family)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.flags, flags)&&(identical(other.dst, dst) || other.dst == dst)&&(identical(other.iflags, iflags) || other.iflags == iflags)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.oif, oif) || other.oif == oif)&&(identical(other.iif, iif) || other.iif == iif)&&(identical(other.src, src) || other.src == src)&&(identical(other.prefsrc, prefsrc) || other.prefsrc == prefsrc)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.pref, pref) || other.pref == pref)&&(identical(other.cstamp, cstamp) || other.cstamp == cstamp)&&(identical(other.tstamp, tstamp) || other.tstamp == tstamp)&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.error, error) || other.error == error)&&(identical(other.used, used) || other.used == used));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,table,family,protocol,scope,type,const DeepCollectionEquality().hash(flags),dst,iflags,gateway,oif,iif,src,prefsrc,priority,pref,cstamp,tstamp,expires,error,used]);

@override
String toString() {
  return 'Route(table: $table, family: $family, protocol: $protocol, scope: $scope, type: $type, flags: $flags, dst: $dst, iflags: $iflags, gateway: $gateway, oif: $oif, iif: $iif, src: $src, prefsrc: $prefsrc, priority: $priority, pref: $pref, cstamp: $cstamp, tstamp: $tstamp, expires: $expires, error: $error, used: $used)';
}


}

/// @nodoc
abstract mixin class $RouteCopyWith<$Res>  {
  factory $RouteCopyWith(Route value, $Res Function(Route) _then) = _$RouteCopyWithImpl;
@useResult
$Res call({
 int table, RouteFamily family, String protocol, String scope, String type, List<String> flags, String dst, int? iflags, String? gateway, String? oif, String? iif, String? src, String? prefsrc, int? priority, int? pref, double? cstamp, double? tstamp, int? expires, int? error, int? used
});




}
/// @nodoc
class _$RouteCopyWithImpl<$Res>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._self, this._then);

  final Route _self;
  final $Res Function(Route) _then;

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = null,Object? family = null,Object? protocol = null,Object? scope = null,Object? type = null,Object? flags = null,Object? dst = null,Object? iflags = freezed,Object? gateway = freezed,Object? oif = freezed,Object? iif = freezed,Object? src = freezed,Object? prefsrc = freezed,Object? priority = freezed,Object? pref = freezed,Object? cstamp = freezed,Object? tstamp = freezed,Object? expires = freezed,Object? error = freezed,Object? used = freezed,}) {
  return _then(_self.copyWith(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as int,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as RouteFamily,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,dst: null == dst ? _self.dst : dst // ignore: cast_nullable_to_non_nullable
as String,iflags: freezed == iflags ? _self.iflags : iflags // ignore: cast_nullable_to_non_nullable
as int?,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,oif: freezed == oif ? _self.oif : oif // ignore: cast_nullable_to_non_nullable
as String?,iif: freezed == iif ? _self.iif : iif // ignore: cast_nullable_to_non_nullable
as String?,src: freezed == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String?,prefsrc: freezed == prefsrc ? _self.prefsrc : prefsrc // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,pref: freezed == pref ? _self.pref : pref // ignore: cast_nullable_to_non_nullable
as int?,cstamp: freezed == cstamp ? _self.cstamp : cstamp // ignore: cast_nullable_to_non_nullable
as double?,tstamp: freezed == tstamp ? _self.tstamp : tstamp // ignore: cast_nullable_to_non_nullable
as double?,expires: freezed == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as int?,used: freezed == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Route].
extension RoutePatterns on Route {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Route value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Route value)  $default,){
final _that = this;
switch (_that) {
case _Route():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Route value)?  $default,){
final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int table,  RouteFamily family,  String protocol,  String scope,  String type,  List<String> flags,  String dst,  int? iflags,  String? gateway,  String? oif,  String? iif,  String? src,  String? prefsrc,  int? priority,  int? pref,  double? cstamp,  double? tstamp,  int? expires,  int? error,  int? used)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that.table,_that.family,_that.protocol,_that.scope,_that.type,_that.flags,_that.dst,_that.iflags,_that.gateway,_that.oif,_that.iif,_that.src,_that.prefsrc,_that.priority,_that.pref,_that.cstamp,_that.tstamp,_that.expires,_that.error,_that.used);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int table,  RouteFamily family,  String protocol,  String scope,  String type,  List<String> flags,  String dst,  int? iflags,  String? gateway,  String? oif,  String? iif,  String? src,  String? prefsrc,  int? priority,  int? pref,  double? cstamp,  double? tstamp,  int? expires,  int? error,  int? used)  $default,) {final _that = this;
switch (_that) {
case _Route():
return $default(_that.table,_that.family,_that.protocol,_that.scope,_that.type,_that.flags,_that.dst,_that.iflags,_that.gateway,_that.oif,_that.iif,_that.src,_that.prefsrc,_that.priority,_that.pref,_that.cstamp,_that.tstamp,_that.expires,_that.error,_that.used);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int table,  RouteFamily family,  String protocol,  String scope,  String type,  List<String> flags,  String dst,  int? iflags,  String? gateway,  String? oif,  String? iif,  String? src,  String? prefsrc,  int? priority,  int? pref,  double? cstamp,  double? tstamp,  int? expires,  int? error,  int? used)?  $default,) {final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that.table,_that.family,_that.protocol,_that.scope,_that.type,_that.flags,_that.dst,_that.iflags,_that.gateway,_that.oif,_that.iif,_that.src,_that.prefsrc,_that.priority,_that.pref,_that.cstamp,_that.tstamp,_that.expires,_that.error,_that.used);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Route implements Route {
  const _Route({required this.table, required this.family, required this.protocol, required this.scope, required this.type, required final  List<String> flags, required this.dst, this.iflags, this.gateway, this.oif, this.iif, this.src, this.prefsrc, this.priority, this.pref, this.cstamp, this.tstamp, this.expires, this.error, this.used}): _flags = flags;
  factory _Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

@override final  int table;
@override final  RouteFamily family;
@override final  String protocol;
@override final  String scope;
@override final  String type;
 final  List<String> _flags;
@override List<String> get flags {
  if (_flags is EqualUnmodifiableListView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flags);
}

@override final  String dst;
@override final  int? iflags;
@override final  String? gateway;
@override final  String? oif;
@override final  String? iif;
@override final  String? src;
@override final  String? prefsrc;
@override final  int? priority;
@override final  int? pref;
@override final  double? cstamp;
@override final  double? tstamp;
@override final  int? expires;
@override final  int? error;
@override final  int? used;

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteCopyWith<_Route> get copyWith => __$RouteCopyWithImpl<_Route>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Route&&(identical(other.table, table) || other.table == table)&&(identical(other.family, family) || other.family == family)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._flags, _flags)&&(identical(other.dst, dst) || other.dst == dst)&&(identical(other.iflags, iflags) || other.iflags == iflags)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.oif, oif) || other.oif == oif)&&(identical(other.iif, iif) || other.iif == iif)&&(identical(other.src, src) || other.src == src)&&(identical(other.prefsrc, prefsrc) || other.prefsrc == prefsrc)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.pref, pref) || other.pref == pref)&&(identical(other.cstamp, cstamp) || other.cstamp == cstamp)&&(identical(other.tstamp, tstamp) || other.tstamp == tstamp)&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.error, error) || other.error == error)&&(identical(other.used, used) || other.used == used));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,table,family,protocol,scope,type,const DeepCollectionEquality().hash(_flags),dst,iflags,gateway,oif,iif,src,prefsrc,priority,pref,cstamp,tstamp,expires,error,used]);

@override
String toString() {
  return 'Route(table: $table, family: $family, protocol: $protocol, scope: $scope, type: $type, flags: $flags, dst: $dst, iflags: $iflags, gateway: $gateway, oif: $oif, iif: $iif, src: $src, prefsrc: $prefsrc, priority: $priority, pref: $pref, cstamp: $cstamp, tstamp: $tstamp, expires: $expires, error: $error, used: $used)';
}


}

/// @nodoc
abstract mixin class _$RouteCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$RouteCopyWith(_Route value, $Res Function(_Route) _then) = __$RouteCopyWithImpl;
@override @useResult
$Res call({
 int table, RouteFamily family, String protocol, String scope, String type, List<String> flags, String dst, int? iflags, String? gateway, String? oif, String? iif, String? src, String? prefsrc, int? priority, int? pref, double? cstamp, double? tstamp, int? expires, int? error, int? used
});




}
/// @nodoc
class __$RouteCopyWithImpl<$Res>
    implements _$RouteCopyWith<$Res> {
  __$RouteCopyWithImpl(this._self, this._then);

  final _Route _self;
  final $Res Function(_Route) _then;

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? family = null,Object? protocol = null,Object? scope = null,Object? type = null,Object? flags = null,Object? dst = null,Object? iflags = freezed,Object? gateway = freezed,Object? oif = freezed,Object? iif = freezed,Object? src = freezed,Object? prefsrc = freezed,Object? priority = freezed,Object? pref = freezed,Object? cstamp = freezed,Object? tstamp = freezed,Object? expires = freezed,Object? error = freezed,Object? used = freezed,}) {
  return _then(_Route(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as int,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as RouteFamily,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,dst: null == dst ? _self.dst : dst // ignore: cast_nullable_to_non_nullable
as String,iflags: freezed == iflags ? _self.iflags : iflags // ignore: cast_nullable_to_non_nullable
as int?,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,oif: freezed == oif ? _self.oif : oif // ignore: cast_nullable_to_non_nullable
as String?,iif: freezed == iif ? _self.iif : iif // ignore: cast_nullable_to_non_nullable
as String?,src: freezed == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String?,prefsrc: freezed == prefsrc ? _self.prefsrc : prefsrc // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,pref: freezed == pref ? _self.pref : pref // ignore: cast_nullable_to_non_nullable
as int?,cstamp: freezed == cstamp ? _self.cstamp : cstamp // ignore: cast_nullable_to_non_nullable
as double?,tstamp: freezed == tstamp ? _self.tstamp : tstamp // ignore: cast_nullable_to_non_nullable
as double?,expires: freezed == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as int?,used: freezed == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
