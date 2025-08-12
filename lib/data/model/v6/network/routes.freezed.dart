// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Routes {

 List<RouteData> get routes; double get took;
/// Create a copy of Routes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutesCopyWith<Routes> get copyWith => _$RoutesCopyWithImpl<Routes>(this as Routes, _$identity);

  /// Serializes this Routes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Routes&&const DeepCollectionEquality().equals(other.routes, routes)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(routes),took);

@override
String toString() {
  return 'Routes(routes: $routes, took: $took)';
}


}

/// @nodoc
abstract mixin class $RoutesCopyWith<$Res>  {
  factory $RoutesCopyWith(Routes value, $Res Function(Routes) _then) = _$RoutesCopyWithImpl;
@useResult
$Res call({
 List<RouteData> routes, double took
});




}
/// @nodoc
class _$RoutesCopyWithImpl<$Res>
    implements $RoutesCopyWith<$Res> {
  _$RoutesCopyWithImpl(this._self, this._then);

  final Routes _self;
  final $Res Function(Routes) _then;

/// Create a copy of Routes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routes = null,Object? took = null,}) {
  return _then(_self.copyWith(
routes: null == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as List<RouteData>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Routes].
extension RoutesPatterns on Routes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Routes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Routes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Routes value)  $default,){
final _that = this;
switch (_that) {
case _Routes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Routes value)?  $default,){
final _that = this;
switch (_that) {
case _Routes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RouteData> routes,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Routes() when $default != null:
return $default(_that.routes,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RouteData> routes,  double took)  $default,) {final _that = this;
switch (_that) {
case _Routes():
return $default(_that.routes,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RouteData> routes,  double took)?  $default,) {final _that = this;
switch (_that) {
case _Routes() when $default != null:
return $default(_that.routes,_that.took);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Routes implements Routes {
  const _Routes({required final  List<RouteData> routes, required this.took}): _routes = routes;
  factory _Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);

 final  List<RouteData> _routes;
@override List<RouteData> get routes {
  if (_routes is EqualUnmodifiableListView) return _routes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routes);
}

@override final  double took;

/// Create a copy of Routes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutesCopyWith<_Routes> get copyWith => __$RoutesCopyWithImpl<_Routes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Routes&&const DeepCollectionEquality().equals(other._routes, _routes)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_routes),took);

@override
String toString() {
  return 'Routes(routes: $routes, took: $took)';
}


}

/// @nodoc
abstract mixin class _$RoutesCopyWith<$Res> implements $RoutesCopyWith<$Res> {
  factory _$RoutesCopyWith(_Routes value, $Res Function(_Routes) _then) = __$RoutesCopyWithImpl;
@override @useResult
$Res call({
 List<RouteData> routes, double took
});




}
/// @nodoc
class __$RoutesCopyWithImpl<$Res>
    implements _$RoutesCopyWith<$Res> {
  __$RoutesCopyWithImpl(this._self, this._then);

  final _Routes _self;
  final $Res Function(_Routes) _then;

/// Create a copy of Routes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routes = null,Object? took = null,}) {
  return _then(_Routes(
routes: null == routes ? _self._routes : routes // ignore: cast_nullable_to_non_nullable
as List<RouteData>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RouteData {

 int get table; RouteFamily get family; String get protocol; String get scope; String get type; List<String> get flags; String get dst; int? get iflags; String? get gateway; String? get oif; String? get iif; String? get src; String? get prefsrc; int? get priority; int? get pref; double? get cstamp; double? get tstamp; int? get expires; int? get error; int? get used;
/// Create a copy of RouteData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDataCopyWith<RouteData> get copyWith => _$RouteDataCopyWithImpl<RouteData>(this as RouteData, _$identity);

  /// Serializes this RouteData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteData&&(identical(other.table, table) || other.table == table)&&(identical(other.family, family) || other.family == family)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.flags, flags)&&(identical(other.dst, dst) || other.dst == dst)&&(identical(other.iflags, iflags) || other.iflags == iflags)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.oif, oif) || other.oif == oif)&&(identical(other.iif, iif) || other.iif == iif)&&(identical(other.src, src) || other.src == src)&&(identical(other.prefsrc, prefsrc) || other.prefsrc == prefsrc)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.pref, pref) || other.pref == pref)&&(identical(other.cstamp, cstamp) || other.cstamp == cstamp)&&(identical(other.tstamp, tstamp) || other.tstamp == tstamp)&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.error, error) || other.error == error)&&(identical(other.used, used) || other.used == used));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,table,family,protocol,scope,type,const DeepCollectionEquality().hash(flags),dst,iflags,gateway,oif,iif,src,prefsrc,priority,pref,cstamp,tstamp,expires,error,used]);

@override
String toString() {
  return 'RouteData(table: $table, family: $family, protocol: $protocol, scope: $scope, type: $type, flags: $flags, dst: $dst, iflags: $iflags, gateway: $gateway, oif: $oif, iif: $iif, src: $src, prefsrc: $prefsrc, priority: $priority, pref: $pref, cstamp: $cstamp, tstamp: $tstamp, expires: $expires, error: $error, used: $used)';
}


}

/// @nodoc
abstract mixin class $RouteDataCopyWith<$Res>  {
  factory $RouteDataCopyWith(RouteData value, $Res Function(RouteData) _then) = _$RouteDataCopyWithImpl;
@useResult
$Res call({
 int table, RouteFamily family, String protocol, String scope, String type, List<String> flags, String dst, int? iflags, String? gateway, String? oif, String? iif, String? src, String? prefsrc, int? priority, int? pref, double? cstamp, double? tstamp, int? expires, int? error, int? used
});




}
/// @nodoc
class _$RouteDataCopyWithImpl<$Res>
    implements $RouteDataCopyWith<$Res> {
  _$RouteDataCopyWithImpl(this._self, this._then);

  final RouteData _self;
  final $Res Function(RouteData) _then;

/// Create a copy of RouteData
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


/// Adds pattern-matching-related methods to [RouteData].
extension RouteDataPatterns on RouteData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteData value)  $default,){
final _that = this;
switch (_that) {
case _RouteData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteData value)?  $default,){
final _that = this;
switch (_that) {
case _RouteData() when $default != null:
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
case _RouteData() when $default != null:
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
case _RouteData():
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
case _RouteData() when $default != null:
return $default(_that.table,_that.family,_that.protocol,_that.scope,_that.type,_that.flags,_that.dst,_that.iflags,_that.gateway,_that.oif,_that.iif,_that.src,_that.prefsrc,_that.priority,_that.pref,_that.cstamp,_that.tstamp,_that.expires,_that.error,_that.used);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteData implements RouteData {
  const _RouteData({required this.table, required this.family, required this.protocol, required this.scope, required this.type, required final  List<String> flags, required this.dst, this.iflags, this.gateway, this.oif, this.iif, this.src, this.prefsrc, this.priority, this.pref, this.cstamp, this.tstamp, this.expires, this.error, this.used}): _flags = flags;
  factory _RouteData.fromJson(Map<String, dynamic> json) => _$RouteDataFromJson(json);

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

/// Create a copy of RouteData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDataCopyWith<_RouteData> get copyWith => __$RouteDataCopyWithImpl<_RouteData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteData&&(identical(other.table, table) || other.table == table)&&(identical(other.family, family) || other.family == family)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._flags, _flags)&&(identical(other.dst, dst) || other.dst == dst)&&(identical(other.iflags, iflags) || other.iflags == iflags)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.oif, oif) || other.oif == oif)&&(identical(other.iif, iif) || other.iif == iif)&&(identical(other.src, src) || other.src == src)&&(identical(other.prefsrc, prefsrc) || other.prefsrc == prefsrc)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.pref, pref) || other.pref == pref)&&(identical(other.cstamp, cstamp) || other.cstamp == cstamp)&&(identical(other.tstamp, tstamp) || other.tstamp == tstamp)&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.error, error) || other.error == error)&&(identical(other.used, used) || other.used == used));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,table,family,protocol,scope,type,const DeepCollectionEquality().hash(_flags),dst,iflags,gateway,oif,iif,src,prefsrc,priority,pref,cstamp,tstamp,expires,error,used]);

@override
String toString() {
  return 'RouteData(table: $table, family: $family, protocol: $protocol, scope: $scope, type: $type, flags: $flags, dst: $dst, iflags: $iflags, gateway: $gateway, oif: $oif, iif: $iif, src: $src, prefsrc: $prefsrc, priority: $priority, pref: $pref, cstamp: $cstamp, tstamp: $tstamp, expires: $expires, error: $error, used: $used)';
}


}

/// @nodoc
abstract mixin class _$RouteDataCopyWith<$Res> implements $RouteDataCopyWith<$Res> {
  factory _$RouteDataCopyWith(_RouteData value, $Res Function(_RouteData) _then) = __$RouteDataCopyWithImpl;
@override @useResult
$Res call({
 int table, RouteFamily family, String protocol, String scope, String type, List<String> flags, String dst, int? iflags, String? gateway, String? oif, String? iif, String? src, String? prefsrc, int? priority, int? pref, double? cstamp, double? tstamp, int? expires, int? error, int? used
});




}
/// @nodoc
class __$RouteDataCopyWithImpl<$Res>
    implements _$RouteDataCopyWith<$Res> {
  __$RouteDataCopyWithImpl(this._self, this._then);

  final _RouteData _self;
  final $Res Function(_RouteData) _then;

/// Create a copy of RouteData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? family = null,Object? protocol = null,Object? scope = null,Object? type = null,Object? flags = null,Object? dst = null,Object? iflags = freezed,Object? gateway = freezed,Object? oif = freezed,Object? iif = freezed,Object? src = freezed,Object? prefsrc = freezed,Object? priority = freezed,Object? pref = freezed,Object? cstamp = freezed,Object? tstamp = freezed,Object? expires = freezed,Object? error = freezed,Object? used = freezed,}) {
  return _then(_RouteData(
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
