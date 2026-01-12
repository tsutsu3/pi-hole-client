// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'padd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Padd {

@JsonKey(name: 'active_clients') int get activeClients;@JsonKey(name: 'gravity_size') int get gravitySize; String get blocking; PaddQueries get queries; PaddCache get cache; PaddIface get iface;@JsonKey(name: 'node_name') String get nodeName; PaddConfig get config;@JsonKey(name: '%cpu') double get cpuPercent;@JsonKey(name: '%mem') double get memPercent; int get pid; PaddSensors get sensors; PaddSystem get system; VersionData get version; double get took;@JsonKey(name: 'recent_blocked') String? get recentBlocked;@JsonKey(name: 'top_domain') String? get topDomain;@JsonKey(name: 'top_blocked') String? get topBlocked;@JsonKey(name: 'top_client') String? get topClient;@JsonKey(name: 'host_model') String? get hostModel;
/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddCopyWith<Padd> get copyWith => _$PaddCopyWithImpl<Padd>(this as Padd, _$identity);

  /// Serializes this Padd to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Padd&&(identical(other.activeClients, activeClients) || other.activeClients == activeClients)&&(identical(other.gravitySize, gravitySize) || other.gravitySize == gravitySize)&&(identical(other.blocking, blocking) || other.blocking == blocking)&&(identical(other.queries, queries) || other.queries == queries)&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.iface, iface) || other.iface == iface)&&(identical(other.nodeName, nodeName) || other.nodeName == nodeName)&&(identical(other.config, config) || other.config == config)&&(identical(other.cpuPercent, cpuPercent) || other.cpuPercent == cpuPercent)&&(identical(other.memPercent, memPercent) || other.memPercent == memPercent)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.sensors, sensors) || other.sensors == sensors)&&(identical(other.system, system) || other.system == system)&&(identical(other.version, version) || other.version == version)&&(identical(other.took, took) || other.took == took)&&(identical(other.recentBlocked, recentBlocked) || other.recentBlocked == recentBlocked)&&(identical(other.topDomain, topDomain) || other.topDomain == topDomain)&&(identical(other.topBlocked, topBlocked) || other.topBlocked == topBlocked)&&(identical(other.topClient, topClient) || other.topClient == topClient)&&(identical(other.hostModel, hostModel) || other.hostModel == hostModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,activeClients,gravitySize,blocking,queries,cache,iface,nodeName,config,cpuPercent,memPercent,pid,sensors,system,version,took,recentBlocked,topDomain,topBlocked,topClient,hostModel]);

@override
String toString() {
  return 'Padd(activeClients: $activeClients, gravitySize: $gravitySize, blocking: $blocking, queries: $queries, cache: $cache, iface: $iface, nodeName: $nodeName, config: $config, cpuPercent: $cpuPercent, memPercent: $memPercent, pid: $pid, sensors: $sensors, system: $system, version: $version, took: $took, recentBlocked: $recentBlocked, topDomain: $topDomain, topBlocked: $topBlocked, topClient: $topClient, hostModel: $hostModel)';
}


}

/// @nodoc
abstract mixin class $PaddCopyWith<$Res>  {
  factory $PaddCopyWith(Padd value, $Res Function(Padd) _then) = _$PaddCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'active_clients') int activeClients,@JsonKey(name: 'gravity_size') int gravitySize, String blocking, PaddQueries queries, PaddCache cache, PaddIface iface,@JsonKey(name: 'node_name') String nodeName, PaddConfig config,@JsonKey(name: '%cpu') double cpuPercent,@JsonKey(name: '%mem') double memPercent, int pid, PaddSensors sensors, PaddSystem system, VersionData version, double took,@JsonKey(name: 'recent_blocked') String? recentBlocked,@JsonKey(name: 'top_domain') String? topDomain,@JsonKey(name: 'top_blocked') String? topBlocked,@JsonKey(name: 'top_client') String? topClient,@JsonKey(name: 'host_model') String? hostModel
});


$PaddQueriesCopyWith<$Res> get queries;$PaddCacheCopyWith<$Res> get cache;$PaddIfaceCopyWith<$Res> get iface;$PaddConfigCopyWith<$Res> get config;$PaddSensorsCopyWith<$Res> get sensors;$PaddSystemCopyWith<$Res> get system;$VersionDataCopyWith<$Res> get version;

}
/// @nodoc
class _$PaddCopyWithImpl<$Res>
    implements $PaddCopyWith<$Res> {
  _$PaddCopyWithImpl(this._self, this._then);

  final Padd _self;
  final $Res Function(Padd) _then;

/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeClients = null,Object? gravitySize = null,Object? blocking = null,Object? queries = null,Object? cache = null,Object? iface = null,Object? nodeName = null,Object? config = null,Object? cpuPercent = null,Object? memPercent = null,Object? pid = null,Object? sensors = null,Object? system = null,Object? version = null,Object? took = null,Object? recentBlocked = freezed,Object? topDomain = freezed,Object? topBlocked = freezed,Object? topClient = freezed,Object? hostModel = freezed,}) {
  return _then(_self.copyWith(
activeClients: null == activeClients ? _self.activeClients : activeClients // ignore: cast_nullable_to_non_nullable
as int,gravitySize: null == gravitySize ? _self.gravitySize : gravitySize // ignore: cast_nullable_to_non_nullable
as int,blocking: null == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as String,queries: null == queries ? _self.queries : queries // ignore: cast_nullable_to_non_nullable
as PaddQueries,cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as PaddCache,iface: null == iface ? _self.iface : iface // ignore: cast_nullable_to_non_nullable
as PaddIface,nodeName: null == nodeName ? _self.nodeName : nodeName // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as PaddConfig,cpuPercent: null == cpuPercent ? _self.cpuPercent : cpuPercent // ignore: cast_nullable_to_non_nullable
as double,memPercent: null == memPercent ? _self.memPercent : memPercent // ignore: cast_nullable_to_non_nullable
as double,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,sensors: null == sensors ? _self.sensors : sensors // ignore: cast_nullable_to_non_nullable
as PaddSensors,system: null == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as PaddSystem,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as VersionData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,recentBlocked: freezed == recentBlocked ? _self.recentBlocked : recentBlocked // ignore: cast_nullable_to_non_nullable
as String?,topDomain: freezed == topDomain ? _self.topDomain : topDomain // ignore: cast_nullable_to_non_nullable
as String?,topBlocked: freezed == topBlocked ? _self.topBlocked : topBlocked // ignore: cast_nullable_to_non_nullable
as String?,topClient: freezed == topClient ? _self.topClient : topClient // ignore: cast_nullable_to_non_nullable
as String?,hostModel: freezed == hostModel ? _self.hostModel : hostModel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddQueriesCopyWith<$Res> get queries {
  
  return $PaddQueriesCopyWith<$Res>(_self.queries, (value) {
    return _then(_self.copyWith(queries: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddCacheCopyWith<$Res> get cache {
  
  return $PaddCacheCopyWith<$Res>(_self.cache, (value) {
    return _then(_self.copyWith(cache: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceCopyWith<$Res> get iface {
  
  return $PaddIfaceCopyWith<$Res>(_self.iface, (value) {
    return _then(_self.copyWith(iface: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddConfigCopyWith<$Res> get config {
  
  return $PaddConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSensorsCopyWith<$Res> get sensors {
  
  return $PaddSensorsCopyWith<$Res>(_self.sensors, (value) {
    return _then(_self.copyWith(sensors: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemCopyWith<$Res> get system {
  
  return $PaddSystemCopyWith<$Res>(_self.system, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDataCopyWith<$Res> get version {
  
  return $VersionDataCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// Adds pattern-matching-related methods to [Padd].
extension PaddPatterns on Padd {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Padd value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Padd() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Padd value)  $default,){
final _that = this;
switch (_that) {
case _Padd():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Padd value)?  $default,){
final _that = this;
switch (_that) {
case _Padd() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'active_clients')  int activeClients, @JsonKey(name: 'gravity_size')  int gravitySize,  String blocking,  PaddQueries queries,  PaddCache cache,  PaddIface iface, @JsonKey(name: 'node_name')  String nodeName,  PaddConfig config, @JsonKey(name: '%cpu')  double cpuPercent, @JsonKey(name: '%mem')  double memPercent,  int pid,  PaddSensors sensors,  PaddSystem system,  VersionData version,  double took, @JsonKey(name: 'recent_blocked')  String? recentBlocked, @JsonKey(name: 'top_domain')  String? topDomain, @JsonKey(name: 'top_blocked')  String? topBlocked, @JsonKey(name: 'top_client')  String? topClient, @JsonKey(name: 'host_model')  String? hostModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Padd() when $default != null:
return $default(_that.activeClients,_that.gravitySize,_that.blocking,_that.queries,_that.cache,_that.iface,_that.nodeName,_that.config,_that.cpuPercent,_that.memPercent,_that.pid,_that.sensors,_that.system,_that.version,_that.took,_that.recentBlocked,_that.topDomain,_that.topBlocked,_that.topClient,_that.hostModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'active_clients')  int activeClients, @JsonKey(name: 'gravity_size')  int gravitySize,  String blocking,  PaddQueries queries,  PaddCache cache,  PaddIface iface, @JsonKey(name: 'node_name')  String nodeName,  PaddConfig config, @JsonKey(name: '%cpu')  double cpuPercent, @JsonKey(name: '%mem')  double memPercent,  int pid,  PaddSensors sensors,  PaddSystem system,  VersionData version,  double took, @JsonKey(name: 'recent_blocked')  String? recentBlocked, @JsonKey(name: 'top_domain')  String? topDomain, @JsonKey(name: 'top_blocked')  String? topBlocked, @JsonKey(name: 'top_client')  String? topClient, @JsonKey(name: 'host_model')  String? hostModel)  $default,) {final _that = this;
switch (_that) {
case _Padd():
return $default(_that.activeClients,_that.gravitySize,_that.blocking,_that.queries,_that.cache,_that.iface,_that.nodeName,_that.config,_that.cpuPercent,_that.memPercent,_that.pid,_that.sensors,_that.system,_that.version,_that.took,_that.recentBlocked,_that.topDomain,_that.topBlocked,_that.topClient,_that.hostModel);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'active_clients')  int activeClients, @JsonKey(name: 'gravity_size')  int gravitySize,  String blocking,  PaddQueries queries,  PaddCache cache,  PaddIface iface, @JsonKey(name: 'node_name')  String nodeName,  PaddConfig config, @JsonKey(name: '%cpu')  double cpuPercent, @JsonKey(name: '%mem')  double memPercent,  int pid,  PaddSensors sensors,  PaddSystem system,  VersionData version,  double took, @JsonKey(name: 'recent_blocked')  String? recentBlocked, @JsonKey(name: 'top_domain')  String? topDomain, @JsonKey(name: 'top_blocked')  String? topBlocked, @JsonKey(name: 'top_client')  String? topClient, @JsonKey(name: 'host_model')  String? hostModel)?  $default,) {final _that = this;
switch (_that) {
case _Padd() when $default != null:
return $default(_that.activeClients,_that.gravitySize,_that.blocking,_that.queries,_that.cache,_that.iface,_that.nodeName,_that.config,_that.cpuPercent,_that.memPercent,_that.pid,_that.sensors,_that.system,_that.version,_that.took,_that.recentBlocked,_that.topDomain,_that.topBlocked,_that.topClient,_that.hostModel);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Padd implements Padd {
  const _Padd({@JsonKey(name: 'active_clients') required this.activeClients, @JsonKey(name: 'gravity_size') required this.gravitySize, required this.blocking, required this.queries, required this.cache, required this.iface, @JsonKey(name: 'node_name') required this.nodeName, required this.config, @JsonKey(name: '%cpu') required this.cpuPercent, @JsonKey(name: '%mem') required this.memPercent, required this.pid, required this.sensors, required this.system, required this.version, required this.took, @JsonKey(name: 'recent_blocked') this.recentBlocked, @JsonKey(name: 'top_domain') this.topDomain, @JsonKey(name: 'top_blocked') this.topBlocked, @JsonKey(name: 'top_client') this.topClient, @JsonKey(name: 'host_model') this.hostModel});
  factory _Padd.fromJson(Map<String, dynamic> json) => _$PaddFromJson(json);

@override@JsonKey(name: 'active_clients') final  int activeClients;
@override@JsonKey(name: 'gravity_size') final  int gravitySize;
@override final  String blocking;
@override final  PaddQueries queries;
@override final  PaddCache cache;
@override final  PaddIface iface;
@override@JsonKey(name: 'node_name') final  String nodeName;
@override final  PaddConfig config;
@override@JsonKey(name: '%cpu') final  double cpuPercent;
@override@JsonKey(name: '%mem') final  double memPercent;
@override final  int pid;
@override final  PaddSensors sensors;
@override final  PaddSystem system;
@override final  VersionData version;
@override final  double took;
@override@JsonKey(name: 'recent_blocked') final  String? recentBlocked;
@override@JsonKey(name: 'top_domain') final  String? topDomain;
@override@JsonKey(name: 'top_blocked') final  String? topBlocked;
@override@JsonKey(name: 'top_client') final  String? topClient;
@override@JsonKey(name: 'host_model') final  String? hostModel;

/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddCopyWith<_Padd> get copyWith => __$PaddCopyWithImpl<_Padd>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Padd&&(identical(other.activeClients, activeClients) || other.activeClients == activeClients)&&(identical(other.gravitySize, gravitySize) || other.gravitySize == gravitySize)&&(identical(other.blocking, blocking) || other.blocking == blocking)&&(identical(other.queries, queries) || other.queries == queries)&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.iface, iface) || other.iface == iface)&&(identical(other.nodeName, nodeName) || other.nodeName == nodeName)&&(identical(other.config, config) || other.config == config)&&(identical(other.cpuPercent, cpuPercent) || other.cpuPercent == cpuPercent)&&(identical(other.memPercent, memPercent) || other.memPercent == memPercent)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.sensors, sensors) || other.sensors == sensors)&&(identical(other.system, system) || other.system == system)&&(identical(other.version, version) || other.version == version)&&(identical(other.took, took) || other.took == took)&&(identical(other.recentBlocked, recentBlocked) || other.recentBlocked == recentBlocked)&&(identical(other.topDomain, topDomain) || other.topDomain == topDomain)&&(identical(other.topBlocked, topBlocked) || other.topBlocked == topBlocked)&&(identical(other.topClient, topClient) || other.topClient == topClient)&&(identical(other.hostModel, hostModel) || other.hostModel == hostModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,activeClients,gravitySize,blocking,queries,cache,iface,nodeName,config,cpuPercent,memPercent,pid,sensors,system,version,took,recentBlocked,topDomain,topBlocked,topClient,hostModel]);

@override
String toString() {
  return 'Padd(activeClients: $activeClients, gravitySize: $gravitySize, blocking: $blocking, queries: $queries, cache: $cache, iface: $iface, nodeName: $nodeName, config: $config, cpuPercent: $cpuPercent, memPercent: $memPercent, pid: $pid, sensors: $sensors, system: $system, version: $version, took: $took, recentBlocked: $recentBlocked, topDomain: $topDomain, topBlocked: $topBlocked, topClient: $topClient, hostModel: $hostModel)';
}


}

/// @nodoc
abstract mixin class _$PaddCopyWith<$Res> implements $PaddCopyWith<$Res> {
  factory _$PaddCopyWith(_Padd value, $Res Function(_Padd) _then) = __$PaddCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'active_clients') int activeClients,@JsonKey(name: 'gravity_size') int gravitySize, String blocking, PaddQueries queries, PaddCache cache, PaddIface iface,@JsonKey(name: 'node_name') String nodeName, PaddConfig config,@JsonKey(name: '%cpu') double cpuPercent,@JsonKey(name: '%mem') double memPercent, int pid, PaddSensors sensors, PaddSystem system, VersionData version, double took,@JsonKey(name: 'recent_blocked') String? recentBlocked,@JsonKey(name: 'top_domain') String? topDomain,@JsonKey(name: 'top_blocked') String? topBlocked,@JsonKey(name: 'top_client') String? topClient,@JsonKey(name: 'host_model') String? hostModel
});


@override $PaddQueriesCopyWith<$Res> get queries;@override $PaddCacheCopyWith<$Res> get cache;@override $PaddIfaceCopyWith<$Res> get iface;@override $PaddConfigCopyWith<$Res> get config;@override $PaddSensorsCopyWith<$Res> get sensors;@override $PaddSystemCopyWith<$Res> get system;@override $VersionDataCopyWith<$Res> get version;

}
/// @nodoc
class __$PaddCopyWithImpl<$Res>
    implements _$PaddCopyWith<$Res> {
  __$PaddCopyWithImpl(this._self, this._then);

  final _Padd _self;
  final $Res Function(_Padd) _then;

/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeClients = null,Object? gravitySize = null,Object? blocking = null,Object? queries = null,Object? cache = null,Object? iface = null,Object? nodeName = null,Object? config = null,Object? cpuPercent = null,Object? memPercent = null,Object? pid = null,Object? sensors = null,Object? system = null,Object? version = null,Object? took = null,Object? recentBlocked = freezed,Object? topDomain = freezed,Object? topBlocked = freezed,Object? topClient = freezed,Object? hostModel = freezed,}) {
  return _then(_Padd(
activeClients: null == activeClients ? _self.activeClients : activeClients // ignore: cast_nullable_to_non_nullable
as int,gravitySize: null == gravitySize ? _self.gravitySize : gravitySize // ignore: cast_nullable_to_non_nullable
as int,blocking: null == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as String,queries: null == queries ? _self.queries : queries // ignore: cast_nullable_to_non_nullable
as PaddQueries,cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as PaddCache,iface: null == iface ? _self.iface : iface // ignore: cast_nullable_to_non_nullable
as PaddIface,nodeName: null == nodeName ? _self.nodeName : nodeName // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as PaddConfig,cpuPercent: null == cpuPercent ? _self.cpuPercent : cpuPercent // ignore: cast_nullable_to_non_nullable
as double,memPercent: null == memPercent ? _self.memPercent : memPercent // ignore: cast_nullable_to_non_nullable
as double,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,sensors: null == sensors ? _self.sensors : sensors // ignore: cast_nullable_to_non_nullable
as PaddSensors,system: null == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as PaddSystem,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as VersionData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,recentBlocked: freezed == recentBlocked ? _self.recentBlocked : recentBlocked // ignore: cast_nullable_to_non_nullable
as String?,topDomain: freezed == topDomain ? _self.topDomain : topDomain // ignore: cast_nullable_to_non_nullable
as String?,topBlocked: freezed == topBlocked ? _self.topBlocked : topBlocked // ignore: cast_nullable_to_non_nullable
as String?,topClient: freezed == topClient ? _self.topClient : topClient // ignore: cast_nullable_to_non_nullable
as String?,hostModel: freezed == hostModel ? _self.hostModel : hostModel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddQueriesCopyWith<$Res> get queries {
  
  return $PaddQueriesCopyWith<$Res>(_self.queries, (value) {
    return _then(_self.copyWith(queries: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddCacheCopyWith<$Res> get cache {
  
  return $PaddCacheCopyWith<$Res>(_self.cache, (value) {
    return _then(_self.copyWith(cache: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceCopyWith<$Res> get iface {
  
  return $PaddIfaceCopyWith<$Res>(_self.iface, (value) {
    return _then(_self.copyWith(iface: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddConfigCopyWith<$Res> get config {
  
  return $PaddConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSensorsCopyWith<$Res> get sensors {
  
  return $PaddSensorsCopyWith<$Res>(_self.sensors, (value) {
    return _then(_self.copyWith(sensors: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemCopyWith<$Res> get system {
  
  return $PaddSystemCopyWith<$Res>(_self.system, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of Padd
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDataCopyWith<$Res> get version {
  
  return $VersionDataCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// @nodoc
mixin _$PaddQueries {

 int get total; int get blocked;@JsonKey(name: 'percent_blocked') double get percentBlocked;
/// Create a copy of PaddQueries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddQueriesCopyWith<PaddQueries> get copyWith => _$PaddQueriesCopyWithImpl<PaddQueries>(this as PaddQueries, _$identity);

  /// Serializes this PaddQueries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddQueries&&(identical(other.total, total) || other.total == total)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.percentBlocked, percentBlocked) || other.percentBlocked == percentBlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,blocked,percentBlocked);

@override
String toString() {
  return 'PaddQueries(total: $total, blocked: $blocked, percentBlocked: $percentBlocked)';
}


}

/// @nodoc
abstract mixin class $PaddQueriesCopyWith<$Res>  {
  factory $PaddQueriesCopyWith(PaddQueries value, $Res Function(PaddQueries) _then) = _$PaddQueriesCopyWithImpl;
@useResult
$Res call({
 int total, int blocked,@JsonKey(name: 'percent_blocked') double percentBlocked
});




}
/// @nodoc
class _$PaddQueriesCopyWithImpl<$Res>
    implements $PaddQueriesCopyWith<$Res> {
  _$PaddQueriesCopyWithImpl(this._self, this._then);

  final PaddQueries _self;
  final $Res Function(PaddQueries) _then;

/// Create a copy of PaddQueries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? blocked = null,Object? percentBlocked = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as int,percentBlocked: null == percentBlocked ? _self.percentBlocked : percentBlocked // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddQueries].
extension PaddQueriesPatterns on PaddQueries {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddQueries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddQueries() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddQueries value)  $default,){
final _that = this;
switch (_that) {
case _PaddQueries():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddQueries value)?  $default,){
final _that = this;
switch (_that) {
case _PaddQueries() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int blocked, @JsonKey(name: 'percent_blocked')  double percentBlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddQueries() when $default != null:
return $default(_that.total,_that.blocked,_that.percentBlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int blocked, @JsonKey(name: 'percent_blocked')  double percentBlocked)  $default,) {final _that = this;
switch (_that) {
case _PaddQueries():
return $default(_that.total,_that.blocked,_that.percentBlocked);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int blocked, @JsonKey(name: 'percent_blocked')  double percentBlocked)?  $default,) {final _that = this;
switch (_that) {
case _PaddQueries() when $default != null:
return $default(_that.total,_that.blocked,_that.percentBlocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddQueries implements PaddQueries {
  const _PaddQueries({required this.total, required this.blocked, @JsonKey(name: 'percent_blocked') required this.percentBlocked});
  factory _PaddQueries.fromJson(Map<String, dynamic> json) => _$PaddQueriesFromJson(json);

@override final  int total;
@override final  int blocked;
@override@JsonKey(name: 'percent_blocked') final  double percentBlocked;

/// Create a copy of PaddQueries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddQueriesCopyWith<_PaddQueries> get copyWith => __$PaddQueriesCopyWithImpl<_PaddQueries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddQueriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddQueries&&(identical(other.total, total) || other.total == total)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.percentBlocked, percentBlocked) || other.percentBlocked == percentBlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,blocked,percentBlocked);

@override
String toString() {
  return 'PaddQueries(total: $total, blocked: $blocked, percentBlocked: $percentBlocked)';
}


}

/// @nodoc
abstract mixin class _$PaddQueriesCopyWith<$Res> implements $PaddQueriesCopyWith<$Res> {
  factory _$PaddQueriesCopyWith(_PaddQueries value, $Res Function(_PaddQueries) _then) = __$PaddQueriesCopyWithImpl;
@override @useResult
$Res call({
 int total, int blocked,@JsonKey(name: 'percent_blocked') double percentBlocked
});




}
/// @nodoc
class __$PaddQueriesCopyWithImpl<$Res>
    implements _$PaddQueriesCopyWith<$Res> {
  __$PaddQueriesCopyWithImpl(this._self, this._then);

  final _PaddQueries _self;
  final $Res Function(_PaddQueries) _then;

/// Create a copy of PaddQueries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? blocked = null,Object? percentBlocked = null,}) {
  return _then(_PaddQueries(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as int,percentBlocked: null == percentBlocked ? _self.percentBlocked : percentBlocked // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PaddCache {

 int get size; int get inserted; int get evicted;
/// Create a copy of PaddCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddCacheCopyWith<PaddCache> get copyWith => _$PaddCacheCopyWithImpl<PaddCache>(this as PaddCache, _$identity);

  /// Serializes this PaddCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddCache&&(identical(other.size, size) || other.size == size)&&(identical(other.inserted, inserted) || other.inserted == inserted)&&(identical(other.evicted, evicted) || other.evicted == evicted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,inserted,evicted);

@override
String toString() {
  return 'PaddCache(size: $size, inserted: $inserted, evicted: $evicted)';
}


}

/// @nodoc
abstract mixin class $PaddCacheCopyWith<$Res>  {
  factory $PaddCacheCopyWith(PaddCache value, $Res Function(PaddCache) _then) = _$PaddCacheCopyWithImpl;
@useResult
$Res call({
 int size, int inserted, int evicted
});




}
/// @nodoc
class _$PaddCacheCopyWithImpl<$Res>
    implements $PaddCacheCopyWith<$Res> {
  _$PaddCacheCopyWithImpl(this._self, this._then);

  final PaddCache _self;
  final $Res Function(PaddCache) _then;

/// Create a copy of PaddCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? inserted = null,Object? evicted = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,inserted: null == inserted ? _self.inserted : inserted // ignore: cast_nullable_to_non_nullable
as int,evicted: null == evicted ? _self.evicted : evicted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddCache].
extension PaddCachePatterns on PaddCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddCache value)  $default,){
final _that = this;
switch (_that) {
case _PaddCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddCache value)?  $default,){
final _that = this;
switch (_that) {
case _PaddCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size,  int inserted,  int evicted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddCache() when $default != null:
return $default(_that.size,_that.inserted,_that.evicted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size,  int inserted,  int evicted)  $default,) {final _that = this;
switch (_that) {
case _PaddCache():
return $default(_that.size,_that.inserted,_that.evicted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size,  int inserted,  int evicted)?  $default,) {final _that = this;
switch (_that) {
case _PaddCache() when $default != null:
return $default(_that.size,_that.inserted,_that.evicted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddCache implements PaddCache {
  const _PaddCache({required this.size, required this.inserted, required this.evicted});
  factory _PaddCache.fromJson(Map<String, dynamic> json) => _$PaddCacheFromJson(json);

@override final  int size;
@override final  int inserted;
@override final  int evicted;

/// Create a copy of PaddCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddCacheCopyWith<_PaddCache> get copyWith => __$PaddCacheCopyWithImpl<_PaddCache>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddCacheToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddCache&&(identical(other.size, size) || other.size == size)&&(identical(other.inserted, inserted) || other.inserted == inserted)&&(identical(other.evicted, evicted) || other.evicted == evicted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,inserted,evicted);

@override
String toString() {
  return 'PaddCache(size: $size, inserted: $inserted, evicted: $evicted)';
}


}

/// @nodoc
abstract mixin class _$PaddCacheCopyWith<$Res> implements $PaddCacheCopyWith<$Res> {
  factory _$PaddCacheCopyWith(_PaddCache value, $Res Function(_PaddCache) _then) = __$PaddCacheCopyWithImpl;
@override @useResult
$Res call({
 int size, int inserted, int evicted
});




}
/// @nodoc
class __$PaddCacheCopyWithImpl<$Res>
    implements _$PaddCacheCopyWith<$Res> {
  __$PaddCacheCopyWithImpl(this._self, this._then);

  final _PaddCache _self;
  final $Res Function(_PaddCache) _then;

/// Create a copy of PaddCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? inserted = null,Object? evicted = null,}) {
  return _then(_PaddCache(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,inserted: null == inserted ? _self.inserted : inserted // ignore: cast_nullable_to_non_nullable
as int,evicted: null == evicted ? _self.evicted : evicted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaddIface {

 PaddIfaceV4 get v4; PaddIfaceV6 get v6;
/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddIfaceCopyWith<PaddIface> get copyWith => _$PaddIfaceCopyWithImpl<PaddIface>(this as PaddIface, _$identity);

  /// Serializes this PaddIface to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddIface&&(identical(other.v4, v4) || other.v4 == v4)&&(identical(other.v6, v6) || other.v6 == v6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,v4,v6);

@override
String toString() {
  return 'PaddIface(v4: $v4, v6: $v6)';
}


}

/// @nodoc
abstract mixin class $PaddIfaceCopyWith<$Res>  {
  factory $PaddIfaceCopyWith(PaddIface value, $Res Function(PaddIface) _then) = _$PaddIfaceCopyWithImpl;
@useResult
$Res call({
 PaddIfaceV4 v4, PaddIfaceV6 v6
});


$PaddIfaceV4CopyWith<$Res> get v4;$PaddIfaceV6CopyWith<$Res> get v6;

}
/// @nodoc
class _$PaddIfaceCopyWithImpl<$Res>
    implements $PaddIfaceCopyWith<$Res> {
  _$PaddIfaceCopyWithImpl(this._self, this._then);

  final PaddIface _self;
  final $Res Function(PaddIface) _then;

/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? v4 = null,Object? v6 = null,}) {
  return _then(_self.copyWith(
v4: null == v4 ? _self.v4 : v4 // ignore: cast_nullable_to_non_nullable
as PaddIfaceV4,v6: null == v6 ? _self.v6 : v6 // ignore: cast_nullable_to_non_nullable
as PaddIfaceV6,
  ));
}
/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceV4CopyWith<$Res> get v4 {
  
  return $PaddIfaceV4CopyWith<$Res>(_self.v4, (value) {
    return _then(_self.copyWith(v4: value));
  });
}/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceV6CopyWith<$Res> get v6 {
  
  return $PaddIfaceV6CopyWith<$Res>(_self.v6, (value) {
    return _then(_self.copyWith(v6: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaddIface].
extension PaddIfacePatterns on PaddIface {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddIface value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddIface() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddIface value)  $default,){
final _that = this;
switch (_that) {
case _PaddIface():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddIface value)?  $default,){
final _that = this;
switch (_that) {
case _PaddIface() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaddIfaceV4 v4,  PaddIfaceV6 v6)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddIface() when $default != null:
return $default(_that.v4,_that.v6);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaddIfaceV4 v4,  PaddIfaceV6 v6)  $default,) {final _that = this;
switch (_that) {
case _PaddIface():
return $default(_that.v4,_that.v6);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaddIfaceV4 v4,  PaddIfaceV6 v6)?  $default,) {final _that = this;
switch (_that) {
case _PaddIface() when $default != null:
return $default(_that.v4,_that.v6);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PaddIface implements PaddIface {
  const _PaddIface({required this.v4, required this.v6});
  factory _PaddIface.fromJson(Map<String, dynamic> json) => _$PaddIfaceFromJson(json);

@override final  PaddIfaceV4 v4;
@override final  PaddIfaceV6 v6;

/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddIfaceCopyWith<_PaddIface> get copyWith => __$PaddIfaceCopyWithImpl<_PaddIface>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddIfaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddIface&&(identical(other.v4, v4) || other.v4 == v4)&&(identical(other.v6, v6) || other.v6 == v6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,v4,v6);

@override
String toString() {
  return 'PaddIface(v4: $v4, v6: $v6)';
}


}

/// @nodoc
abstract mixin class _$PaddIfaceCopyWith<$Res> implements $PaddIfaceCopyWith<$Res> {
  factory _$PaddIfaceCopyWith(_PaddIface value, $Res Function(_PaddIface) _then) = __$PaddIfaceCopyWithImpl;
@override @useResult
$Res call({
 PaddIfaceV4 v4, PaddIfaceV6 v6
});


@override $PaddIfaceV4CopyWith<$Res> get v4;@override $PaddIfaceV6CopyWith<$Res> get v6;

}
/// @nodoc
class __$PaddIfaceCopyWithImpl<$Res>
    implements _$PaddIfaceCopyWith<$Res> {
  __$PaddIfaceCopyWithImpl(this._self, this._then);

  final _PaddIface _self;
  final $Res Function(_PaddIface) _then;

/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? v4 = null,Object? v6 = null,}) {
  return _then(_PaddIface(
v4: null == v4 ? _self.v4 : v4 // ignore: cast_nullable_to_non_nullable
as PaddIfaceV4,v6: null == v6 ? _self.v6 : v6 // ignore: cast_nullable_to_non_nullable
as PaddIfaceV6,
  ));
}

/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceV4CopyWith<$Res> get v4 {
  
  return $PaddIfaceV4CopyWith<$Res>(_self.v4, (value) {
    return _then(_self.copyWith(v4: value));
  });
}/// Create a copy of PaddIface
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceV6CopyWith<$Res> get v6 {
  
  return $PaddIfaceV6CopyWith<$Res>(_self.v6, (value) {
    return _then(_self.copyWith(v6: value));
  });
}
}


/// @nodoc
mixin _$PaddIfaceV4 {

@JsonKey(name: 'rx_bytes') PaddIfaceBytes get rxBytes;@JsonKey(name: 'tx_bytes') PaddIfaceBytes get txBytes;@JsonKey(name: 'num_addrs') int get numAddrs; String get name; String? get addr;@JsonKey(name: 'gw_addr') String? get gwAddr;
/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddIfaceV4CopyWith<PaddIfaceV4> get copyWith => _$PaddIfaceV4CopyWithImpl<PaddIfaceV4>(this as PaddIfaceV4, _$identity);

  /// Serializes this PaddIfaceV4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddIfaceV4&&(identical(other.rxBytes, rxBytes) || other.rxBytes == rxBytes)&&(identical(other.txBytes, txBytes) || other.txBytes == txBytes)&&(identical(other.numAddrs, numAddrs) || other.numAddrs == numAddrs)&&(identical(other.name, name) || other.name == name)&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.gwAddr, gwAddr) || other.gwAddr == gwAddr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rxBytes,txBytes,numAddrs,name,addr,gwAddr);

@override
String toString() {
  return 'PaddIfaceV4(rxBytes: $rxBytes, txBytes: $txBytes, numAddrs: $numAddrs, name: $name, addr: $addr, gwAddr: $gwAddr)';
}


}

/// @nodoc
abstract mixin class $PaddIfaceV4CopyWith<$Res>  {
  factory $PaddIfaceV4CopyWith(PaddIfaceV4 value, $Res Function(PaddIfaceV4) _then) = _$PaddIfaceV4CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rx_bytes') PaddIfaceBytes rxBytes,@JsonKey(name: 'tx_bytes') PaddIfaceBytes txBytes,@JsonKey(name: 'num_addrs') int numAddrs, String name, String? addr,@JsonKey(name: 'gw_addr') String? gwAddr
});


$PaddIfaceBytesCopyWith<$Res> get rxBytes;$PaddIfaceBytesCopyWith<$Res> get txBytes;

}
/// @nodoc
class _$PaddIfaceV4CopyWithImpl<$Res>
    implements $PaddIfaceV4CopyWith<$Res> {
  _$PaddIfaceV4CopyWithImpl(this._self, this._then);

  final PaddIfaceV4 _self;
  final $Res Function(PaddIfaceV4) _then;

/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rxBytes = null,Object? txBytes = null,Object? numAddrs = null,Object? name = null,Object? addr = freezed,Object? gwAddr = freezed,}) {
  return _then(_self.copyWith(
rxBytes: null == rxBytes ? _self.rxBytes : rxBytes // ignore: cast_nullable_to_non_nullable
as PaddIfaceBytes,txBytes: null == txBytes ? _self.txBytes : txBytes // ignore: cast_nullable_to_non_nullable
as PaddIfaceBytes,numAddrs: null == numAddrs ? _self.numAddrs : numAddrs // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,gwAddr: freezed == gwAddr ? _self.gwAddr : gwAddr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceBytesCopyWith<$Res> get rxBytes {
  
  return $PaddIfaceBytesCopyWith<$Res>(_self.rxBytes, (value) {
    return _then(_self.copyWith(rxBytes: value));
  });
}/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceBytesCopyWith<$Res> get txBytes {
  
  return $PaddIfaceBytesCopyWith<$Res>(_self.txBytes, (value) {
    return _then(_self.copyWith(txBytes: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaddIfaceV4].
extension PaddIfaceV4Patterns on PaddIfaceV4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddIfaceV4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddIfaceV4() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddIfaceV4 value)  $default,){
final _that = this;
switch (_that) {
case _PaddIfaceV4():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddIfaceV4 value)?  $default,){
final _that = this;
switch (_that) {
case _PaddIfaceV4() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rx_bytes')  PaddIfaceBytes rxBytes, @JsonKey(name: 'tx_bytes')  PaddIfaceBytes txBytes, @JsonKey(name: 'num_addrs')  int numAddrs,  String name,  String? addr, @JsonKey(name: 'gw_addr')  String? gwAddr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddIfaceV4() when $default != null:
return $default(_that.rxBytes,_that.txBytes,_that.numAddrs,_that.name,_that.addr,_that.gwAddr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rx_bytes')  PaddIfaceBytes rxBytes, @JsonKey(name: 'tx_bytes')  PaddIfaceBytes txBytes, @JsonKey(name: 'num_addrs')  int numAddrs,  String name,  String? addr, @JsonKey(name: 'gw_addr')  String? gwAddr)  $default,) {final _that = this;
switch (_that) {
case _PaddIfaceV4():
return $default(_that.rxBytes,_that.txBytes,_that.numAddrs,_that.name,_that.addr,_that.gwAddr);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rx_bytes')  PaddIfaceBytes rxBytes, @JsonKey(name: 'tx_bytes')  PaddIfaceBytes txBytes, @JsonKey(name: 'num_addrs')  int numAddrs,  String name,  String? addr, @JsonKey(name: 'gw_addr')  String? gwAddr)?  $default,) {final _that = this;
switch (_that) {
case _PaddIfaceV4() when $default != null:
return $default(_that.rxBytes,_that.txBytes,_that.numAddrs,_that.name,_that.addr,_that.gwAddr);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PaddIfaceV4 implements PaddIfaceV4 {
  const _PaddIfaceV4({@JsonKey(name: 'rx_bytes') required this.rxBytes, @JsonKey(name: 'tx_bytes') required this.txBytes, @JsonKey(name: 'num_addrs') required this.numAddrs, required this.name, this.addr, @JsonKey(name: 'gw_addr') this.gwAddr});
  factory _PaddIfaceV4.fromJson(Map<String, dynamic> json) => _$PaddIfaceV4FromJson(json);

@override@JsonKey(name: 'rx_bytes') final  PaddIfaceBytes rxBytes;
@override@JsonKey(name: 'tx_bytes') final  PaddIfaceBytes txBytes;
@override@JsonKey(name: 'num_addrs') final  int numAddrs;
@override final  String name;
@override final  String? addr;
@override@JsonKey(name: 'gw_addr') final  String? gwAddr;

/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddIfaceV4CopyWith<_PaddIfaceV4> get copyWith => __$PaddIfaceV4CopyWithImpl<_PaddIfaceV4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddIfaceV4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddIfaceV4&&(identical(other.rxBytes, rxBytes) || other.rxBytes == rxBytes)&&(identical(other.txBytes, txBytes) || other.txBytes == txBytes)&&(identical(other.numAddrs, numAddrs) || other.numAddrs == numAddrs)&&(identical(other.name, name) || other.name == name)&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.gwAddr, gwAddr) || other.gwAddr == gwAddr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rxBytes,txBytes,numAddrs,name,addr,gwAddr);

@override
String toString() {
  return 'PaddIfaceV4(rxBytes: $rxBytes, txBytes: $txBytes, numAddrs: $numAddrs, name: $name, addr: $addr, gwAddr: $gwAddr)';
}


}

/// @nodoc
abstract mixin class _$PaddIfaceV4CopyWith<$Res> implements $PaddIfaceV4CopyWith<$Res> {
  factory _$PaddIfaceV4CopyWith(_PaddIfaceV4 value, $Res Function(_PaddIfaceV4) _then) = __$PaddIfaceV4CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rx_bytes') PaddIfaceBytes rxBytes,@JsonKey(name: 'tx_bytes') PaddIfaceBytes txBytes,@JsonKey(name: 'num_addrs') int numAddrs, String name, String? addr,@JsonKey(name: 'gw_addr') String? gwAddr
});


@override $PaddIfaceBytesCopyWith<$Res> get rxBytes;@override $PaddIfaceBytesCopyWith<$Res> get txBytes;

}
/// @nodoc
class __$PaddIfaceV4CopyWithImpl<$Res>
    implements _$PaddIfaceV4CopyWith<$Res> {
  __$PaddIfaceV4CopyWithImpl(this._self, this._then);

  final _PaddIfaceV4 _self;
  final $Res Function(_PaddIfaceV4) _then;

/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rxBytes = null,Object? txBytes = null,Object? numAddrs = null,Object? name = null,Object? addr = freezed,Object? gwAddr = freezed,}) {
  return _then(_PaddIfaceV4(
rxBytes: null == rxBytes ? _self.rxBytes : rxBytes // ignore: cast_nullable_to_non_nullable
as PaddIfaceBytes,txBytes: null == txBytes ? _self.txBytes : txBytes // ignore: cast_nullable_to_non_nullable
as PaddIfaceBytes,numAddrs: null == numAddrs ? _self.numAddrs : numAddrs // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,gwAddr: freezed == gwAddr ? _self.gwAddr : gwAddr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceBytesCopyWith<$Res> get rxBytes {
  
  return $PaddIfaceBytesCopyWith<$Res>(_self.rxBytes, (value) {
    return _then(_self.copyWith(rxBytes: value));
  });
}/// Create a copy of PaddIfaceV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddIfaceBytesCopyWith<$Res> get txBytes {
  
  return $PaddIfaceBytesCopyWith<$Res>(_self.txBytes, (value) {
    return _then(_self.copyWith(txBytes: value));
  });
}
}


/// @nodoc
mixin _$PaddIfaceV6 {

@JsonKey(name: 'num_addrs') int get numAddrs; String get name; String? get addr;@JsonKey(name: 'gw_addr') String? get gwAddr;
/// Create a copy of PaddIfaceV6
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddIfaceV6CopyWith<PaddIfaceV6> get copyWith => _$PaddIfaceV6CopyWithImpl<PaddIfaceV6>(this as PaddIfaceV6, _$identity);

  /// Serializes this PaddIfaceV6 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddIfaceV6&&(identical(other.numAddrs, numAddrs) || other.numAddrs == numAddrs)&&(identical(other.name, name) || other.name == name)&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.gwAddr, gwAddr) || other.gwAddr == gwAddr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numAddrs,name,addr,gwAddr);

@override
String toString() {
  return 'PaddIfaceV6(numAddrs: $numAddrs, name: $name, addr: $addr, gwAddr: $gwAddr)';
}


}

/// @nodoc
abstract mixin class $PaddIfaceV6CopyWith<$Res>  {
  factory $PaddIfaceV6CopyWith(PaddIfaceV6 value, $Res Function(PaddIfaceV6) _then) = _$PaddIfaceV6CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'num_addrs') int numAddrs, String name, String? addr,@JsonKey(name: 'gw_addr') String? gwAddr
});




}
/// @nodoc
class _$PaddIfaceV6CopyWithImpl<$Res>
    implements $PaddIfaceV6CopyWith<$Res> {
  _$PaddIfaceV6CopyWithImpl(this._self, this._then);

  final PaddIfaceV6 _self;
  final $Res Function(PaddIfaceV6) _then;

/// Create a copy of PaddIfaceV6
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numAddrs = null,Object? name = null,Object? addr = freezed,Object? gwAddr = freezed,}) {
  return _then(_self.copyWith(
numAddrs: null == numAddrs ? _self.numAddrs : numAddrs // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,gwAddr: freezed == gwAddr ? _self.gwAddr : gwAddr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddIfaceV6].
extension PaddIfaceV6Patterns on PaddIfaceV6 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddIfaceV6 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddIfaceV6() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddIfaceV6 value)  $default,){
final _that = this;
switch (_that) {
case _PaddIfaceV6():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddIfaceV6 value)?  $default,){
final _that = this;
switch (_that) {
case _PaddIfaceV6() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'num_addrs')  int numAddrs,  String name,  String? addr, @JsonKey(name: 'gw_addr')  String? gwAddr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddIfaceV6() when $default != null:
return $default(_that.numAddrs,_that.name,_that.addr,_that.gwAddr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'num_addrs')  int numAddrs,  String name,  String? addr, @JsonKey(name: 'gw_addr')  String? gwAddr)  $default,) {final _that = this;
switch (_that) {
case _PaddIfaceV6():
return $default(_that.numAddrs,_that.name,_that.addr,_that.gwAddr);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'num_addrs')  int numAddrs,  String name,  String? addr, @JsonKey(name: 'gw_addr')  String? gwAddr)?  $default,) {final _that = this;
switch (_that) {
case _PaddIfaceV6() when $default != null:
return $default(_that.numAddrs,_that.name,_that.addr,_that.gwAddr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddIfaceV6 implements PaddIfaceV6 {
  const _PaddIfaceV6({@JsonKey(name: 'num_addrs') required this.numAddrs, required this.name, this.addr, @JsonKey(name: 'gw_addr') this.gwAddr});
  factory _PaddIfaceV6.fromJson(Map<String, dynamic> json) => _$PaddIfaceV6FromJson(json);

@override@JsonKey(name: 'num_addrs') final  int numAddrs;
@override final  String name;
@override final  String? addr;
@override@JsonKey(name: 'gw_addr') final  String? gwAddr;

/// Create a copy of PaddIfaceV6
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddIfaceV6CopyWith<_PaddIfaceV6> get copyWith => __$PaddIfaceV6CopyWithImpl<_PaddIfaceV6>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddIfaceV6ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddIfaceV6&&(identical(other.numAddrs, numAddrs) || other.numAddrs == numAddrs)&&(identical(other.name, name) || other.name == name)&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.gwAddr, gwAddr) || other.gwAddr == gwAddr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numAddrs,name,addr,gwAddr);

@override
String toString() {
  return 'PaddIfaceV6(numAddrs: $numAddrs, name: $name, addr: $addr, gwAddr: $gwAddr)';
}


}

/// @nodoc
abstract mixin class _$PaddIfaceV6CopyWith<$Res> implements $PaddIfaceV6CopyWith<$Res> {
  factory _$PaddIfaceV6CopyWith(_PaddIfaceV6 value, $Res Function(_PaddIfaceV6) _then) = __$PaddIfaceV6CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'num_addrs') int numAddrs, String name, String? addr,@JsonKey(name: 'gw_addr') String? gwAddr
});




}
/// @nodoc
class __$PaddIfaceV6CopyWithImpl<$Res>
    implements _$PaddIfaceV6CopyWith<$Res> {
  __$PaddIfaceV6CopyWithImpl(this._self, this._then);

  final _PaddIfaceV6 _self;
  final $Res Function(_PaddIfaceV6) _then;

/// Create a copy of PaddIfaceV6
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numAddrs = null,Object? name = null,Object? addr = freezed,Object? gwAddr = freezed,}) {
  return _then(_PaddIfaceV6(
numAddrs: null == numAddrs ? _self.numAddrs : numAddrs // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,gwAddr: freezed == gwAddr ? _self.gwAddr : gwAddr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaddIfaceBytes {

 double get value; String get unit;
/// Create a copy of PaddIfaceBytes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddIfaceBytesCopyWith<PaddIfaceBytes> get copyWith => _$PaddIfaceBytesCopyWithImpl<PaddIfaceBytes>(this as PaddIfaceBytes, _$identity);

  /// Serializes this PaddIfaceBytes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddIfaceBytes&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,unit);

@override
String toString() {
  return 'PaddIfaceBytes(value: $value, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $PaddIfaceBytesCopyWith<$Res>  {
  factory $PaddIfaceBytesCopyWith(PaddIfaceBytes value, $Res Function(PaddIfaceBytes) _then) = _$PaddIfaceBytesCopyWithImpl;
@useResult
$Res call({
 double value, String unit
});




}
/// @nodoc
class _$PaddIfaceBytesCopyWithImpl<$Res>
    implements $PaddIfaceBytesCopyWith<$Res> {
  _$PaddIfaceBytesCopyWithImpl(this._self, this._then);

  final PaddIfaceBytes _self;
  final $Res Function(PaddIfaceBytes) _then;

/// Create a copy of PaddIfaceBytes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? unit = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddIfaceBytes].
extension PaddIfaceBytesPatterns on PaddIfaceBytes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddIfaceBytes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddIfaceBytes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddIfaceBytes value)  $default,){
final _that = this;
switch (_that) {
case _PaddIfaceBytes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddIfaceBytes value)?  $default,){
final _that = this;
switch (_that) {
case _PaddIfaceBytes() when $default != null:
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
case _PaddIfaceBytes() when $default != null:
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
case _PaddIfaceBytes():
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
case _PaddIfaceBytes() when $default != null:
return $default(_that.value,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddIfaceBytes implements PaddIfaceBytes {
  const _PaddIfaceBytes({required this.value, required this.unit});
  factory _PaddIfaceBytes.fromJson(Map<String, dynamic> json) => _$PaddIfaceBytesFromJson(json);

@override final  double value;
@override final  String unit;

/// Create a copy of PaddIfaceBytes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddIfaceBytesCopyWith<_PaddIfaceBytes> get copyWith => __$PaddIfaceBytesCopyWithImpl<_PaddIfaceBytes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddIfaceBytesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddIfaceBytes&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,unit);

@override
String toString() {
  return 'PaddIfaceBytes(value: $value, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$PaddIfaceBytesCopyWith<$Res> implements $PaddIfaceBytesCopyWith<$Res> {
  factory _$PaddIfaceBytesCopyWith(_PaddIfaceBytes value, $Res Function(_PaddIfaceBytes) _then) = __$PaddIfaceBytesCopyWithImpl;
@override @useResult
$Res call({
 double value, String unit
});




}
/// @nodoc
class __$PaddIfaceBytesCopyWithImpl<$Res>
    implements _$PaddIfaceBytesCopyWith<$Res> {
  __$PaddIfaceBytesCopyWithImpl(this._self, this._then);

  final _PaddIfaceBytes _self;
  final $Res Function(_PaddIfaceBytes) _then;

/// Create a copy of PaddIfaceBytes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? unit = null,}) {
  return _then(_PaddIfaceBytes(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaddConfig {

@JsonKey(name: 'dhcp_active') bool get dhcpActive;@JsonKey(name: 'dhcp_start') String get dhcpStart;@JsonKey(name: 'dhcp_end') String get dhcpEnd;@JsonKey(name: 'dhcp_ipv6') bool get dhcpIpv6;@JsonKey(name: 'dns_domain') String get dnsDomain;@JsonKey(name: 'dns_port') int get dnsPort;@JsonKey(name: 'dns_num_upstreams') int get dnsNumUpstreams;@JsonKey(name: 'dns_dnssec') bool get dnsDnssec;@JsonKey(name: 'dns_revServer_active') bool get dnsRevServerActive;@JsonKey(name: 'privacy_level') int get privacyLevel;
/// Create a copy of PaddConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddConfigCopyWith<PaddConfig> get copyWith => _$PaddConfigCopyWithImpl<PaddConfig>(this as PaddConfig, _$identity);

  /// Serializes this PaddConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddConfig&&(identical(other.dhcpActive, dhcpActive) || other.dhcpActive == dhcpActive)&&(identical(other.dhcpStart, dhcpStart) || other.dhcpStart == dhcpStart)&&(identical(other.dhcpEnd, dhcpEnd) || other.dhcpEnd == dhcpEnd)&&(identical(other.dhcpIpv6, dhcpIpv6) || other.dhcpIpv6 == dhcpIpv6)&&(identical(other.dnsDomain, dnsDomain) || other.dnsDomain == dnsDomain)&&(identical(other.dnsPort, dnsPort) || other.dnsPort == dnsPort)&&(identical(other.dnsNumUpstreams, dnsNumUpstreams) || other.dnsNumUpstreams == dnsNumUpstreams)&&(identical(other.dnsDnssec, dnsDnssec) || other.dnsDnssec == dnsDnssec)&&(identical(other.dnsRevServerActive, dnsRevServerActive) || other.dnsRevServerActive == dnsRevServerActive)&&(identical(other.privacyLevel, privacyLevel) || other.privacyLevel == privacyLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dhcpActive,dhcpStart,dhcpEnd,dhcpIpv6,dnsDomain,dnsPort,dnsNumUpstreams,dnsDnssec,dnsRevServerActive,privacyLevel);

@override
String toString() {
  return 'PaddConfig(dhcpActive: $dhcpActive, dhcpStart: $dhcpStart, dhcpEnd: $dhcpEnd, dhcpIpv6: $dhcpIpv6, dnsDomain: $dnsDomain, dnsPort: $dnsPort, dnsNumUpstreams: $dnsNumUpstreams, dnsDnssec: $dnsDnssec, dnsRevServerActive: $dnsRevServerActive, privacyLevel: $privacyLevel)';
}


}

/// @nodoc
abstract mixin class $PaddConfigCopyWith<$Res>  {
  factory $PaddConfigCopyWith(PaddConfig value, $Res Function(PaddConfig) _then) = _$PaddConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dhcp_active') bool dhcpActive,@JsonKey(name: 'dhcp_start') String dhcpStart,@JsonKey(name: 'dhcp_end') String dhcpEnd,@JsonKey(name: 'dhcp_ipv6') bool dhcpIpv6,@JsonKey(name: 'dns_domain') String dnsDomain,@JsonKey(name: 'dns_port') int dnsPort,@JsonKey(name: 'dns_num_upstreams') int dnsNumUpstreams,@JsonKey(name: 'dns_dnssec') bool dnsDnssec,@JsonKey(name: 'dns_revServer_active') bool dnsRevServerActive,@JsonKey(name: 'privacy_level') int privacyLevel
});




}
/// @nodoc
class _$PaddConfigCopyWithImpl<$Res>
    implements $PaddConfigCopyWith<$Res> {
  _$PaddConfigCopyWithImpl(this._self, this._then);

  final PaddConfig _self;
  final $Res Function(PaddConfig) _then;

/// Create a copy of PaddConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dhcpActive = null,Object? dhcpStart = null,Object? dhcpEnd = null,Object? dhcpIpv6 = null,Object? dnsDomain = null,Object? dnsPort = null,Object? dnsNumUpstreams = null,Object? dnsDnssec = null,Object? dnsRevServerActive = null,Object? privacyLevel = null,}) {
  return _then(_self.copyWith(
dhcpActive: null == dhcpActive ? _self.dhcpActive : dhcpActive // ignore: cast_nullable_to_non_nullable
as bool,dhcpStart: null == dhcpStart ? _self.dhcpStart : dhcpStart // ignore: cast_nullable_to_non_nullable
as String,dhcpEnd: null == dhcpEnd ? _self.dhcpEnd : dhcpEnd // ignore: cast_nullable_to_non_nullable
as String,dhcpIpv6: null == dhcpIpv6 ? _self.dhcpIpv6 : dhcpIpv6 // ignore: cast_nullable_to_non_nullable
as bool,dnsDomain: null == dnsDomain ? _self.dnsDomain : dnsDomain // ignore: cast_nullable_to_non_nullable
as String,dnsPort: null == dnsPort ? _self.dnsPort : dnsPort // ignore: cast_nullable_to_non_nullable
as int,dnsNumUpstreams: null == dnsNumUpstreams ? _self.dnsNumUpstreams : dnsNumUpstreams // ignore: cast_nullable_to_non_nullable
as int,dnsDnssec: null == dnsDnssec ? _self.dnsDnssec : dnsDnssec // ignore: cast_nullable_to_non_nullable
as bool,dnsRevServerActive: null == dnsRevServerActive ? _self.dnsRevServerActive : dnsRevServerActive // ignore: cast_nullable_to_non_nullable
as bool,privacyLevel: null == privacyLevel ? _self.privacyLevel : privacyLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddConfig].
extension PaddConfigPatterns on PaddConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddConfig value)  $default,){
final _that = this;
switch (_that) {
case _PaddConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddConfig value)?  $default,){
final _that = this;
switch (_that) {
case _PaddConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dhcp_active')  bool dhcpActive, @JsonKey(name: 'dhcp_start')  String dhcpStart, @JsonKey(name: 'dhcp_end')  String dhcpEnd, @JsonKey(name: 'dhcp_ipv6')  bool dhcpIpv6, @JsonKey(name: 'dns_domain')  String dnsDomain, @JsonKey(name: 'dns_port')  int dnsPort, @JsonKey(name: 'dns_num_upstreams')  int dnsNumUpstreams, @JsonKey(name: 'dns_dnssec')  bool dnsDnssec, @JsonKey(name: 'dns_revServer_active')  bool dnsRevServerActive, @JsonKey(name: 'privacy_level')  int privacyLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddConfig() when $default != null:
return $default(_that.dhcpActive,_that.dhcpStart,_that.dhcpEnd,_that.dhcpIpv6,_that.dnsDomain,_that.dnsPort,_that.dnsNumUpstreams,_that.dnsDnssec,_that.dnsRevServerActive,_that.privacyLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dhcp_active')  bool dhcpActive, @JsonKey(name: 'dhcp_start')  String dhcpStart, @JsonKey(name: 'dhcp_end')  String dhcpEnd, @JsonKey(name: 'dhcp_ipv6')  bool dhcpIpv6, @JsonKey(name: 'dns_domain')  String dnsDomain, @JsonKey(name: 'dns_port')  int dnsPort, @JsonKey(name: 'dns_num_upstreams')  int dnsNumUpstreams, @JsonKey(name: 'dns_dnssec')  bool dnsDnssec, @JsonKey(name: 'dns_revServer_active')  bool dnsRevServerActive, @JsonKey(name: 'privacy_level')  int privacyLevel)  $default,) {final _that = this;
switch (_that) {
case _PaddConfig():
return $default(_that.dhcpActive,_that.dhcpStart,_that.dhcpEnd,_that.dhcpIpv6,_that.dnsDomain,_that.dnsPort,_that.dnsNumUpstreams,_that.dnsDnssec,_that.dnsRevServerActive,_that.privacyLevel);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dhcp_active')  bool dhcpActive, @JsonKey(name: 'dhcp_start')  String dhcpStart, @JsonKey(name: 'dhcp_end')  String dhcpEnd, @JsonKey(name: 'dhcp_ipv6')  bool dhcpIpv6, @JsonKey(name: 'dns_domain')  String dnsDomain, @JsonKey(name: 'dns_port')  int dnsPort, @JsonKey(name: 'dns_num_upstreams')  int dnsNumUpstreams, @JsonKey(name: 'dns_dnssec')  bool dnsDnssec, @JsonKey(name: 'dns_revServer_active')  bool dnsRevServerActive, @JsonKey(name: 'privacy_level')  int privacyLevel)?  $default,) {final _that = this;
switch (_that) {
case _PaddConfig() when $default != null:
return $default(_that.dhcpActive,_that.dhcpStart,_that.dhcpEnd,_that.dhcpIpv6,_that.dnsDomain,_that.dnsPort,_that.dnsNumUpstreams,_that.dnsDnssec,_that.dnsRevServerActive,_that.privacyLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddConfig implements PaddConfig {
  const _PaddConfig({@JsonKey(name: 'dhcp_active') required this.dhcpActive, @JsonKey(name: 'dhcp_start') required this.dhcpStart, @JsonKey(name: 'dhcp_end') required this.dhcpEnd, @JsonKey(name: 'dhcp_ipv6') required this.dhcpIpv6, @JsonKey(name: 'dns_domain') required this.dnsDomain, @JsonKey(name: 'dns_port') required this.dnsPort, @JsonKey(name: 'dns_num_upstreams') required this.dnsNumUpstreams, @JsonKey(name: 'dns_dnssec') required this.dnsDnssec, @JsonKey(name: 'dns_revServer_active') required this.dnsRevServerActive, @JsonKey(name: 'privacy_level') required this.privacyLevel});
  factory _PaddConfig.fromJson(Map<String, dynamic> json) => _$PaddConfigFromJson(json);

@override@JsonKey(name: 'dhcp_active') final  bool dhcpActive;
@override@JsonKey(name: 'dhcp_start') final  String dhcpStart;
@override@JsonKey(name: 'dhcp_end') final  String dhcpEnd;
@override@JsonKey(name: 'dhcp_ipv6') final  bool dhcpIpv6;
@override@JsonKey(name: 'dns_domain') final  String dnsDomain;
@override@JsonKey(name: 'dns_port') final  int dnsPort;
@override@JsonKey(name: 'dns_num_upstreams') final  int dnsNumUpstreams;
@override@JsonKey(name: 'dns_dnssec') final  bool dnsDnssec;
@override@JsonKey(name: 'dns_revServer_active') final  bool dnsRevServerActive;
@override@JsonKey(name: 'privacy_level') final  int privacyLevel;

/// Create a copy of PaddConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddConfigCopyWith<_PaddConfig> get copyWith => __$PaddConfigCopyWithImpl<_PaddConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddConfig&&(identical(other.dhcpActive, dhcpActive) || other.dhcpActive == dhcpActive)&&(identical(other.dhcpStart, dhcpStart) || other.dhcpStart == dhcpStart)&&(identical(other.dhcpEnd, dhcpEnd) || other.dhcpEnd == dhcpEnd)&&(identical(other.dhcpIpv6, dhcpIpv6) || other.dhcpIpv6 == dhcpIpv6)&&(identical(other.dnsDomain, dnsDomain) || other.dnsDomain == dnsDomain)&&(identical(other.dnsPort, dnsPort) || other.dnsPort == dnsPort)&&(identical(other.dnsNumUpstreams, dnsNumUpstreams) || other.dnsNumUpstreams == dnsNumUpstreams)&&(identical(other.dnsDnssec, dnsDnssec) || other.dnsDnssec == dnsDnssec)&&(identical(other.dnsRevServerActive, dnsRevServerActive) || other.dnsRevServerActive == dnsRevServerActive)&&(identical(other.privacyLevel, privacyLevel) || other.privacyLevel == privacyLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dhcpActive,dhcpStart,dhcpEnd,dhcpIpv6,dnsDomain,dnsPort,dnsNumUpstreams,dnsDnssec,dnsRevServerActive,privacyLevel);

@override
String toString() {
  return 'PaddConfig(dhcpActive: $dhcpActive, dhcpStart: $dhcpStart, dhcpEnd: $dhcpEnd, dhcpIpv6: $dhcpIpv6, dnsDomain: $dnsDomain, dnsPort: $dnsPort, dnsNumUpstreams: $dnsNumUpstreams, dnsDnssec: $dnsDnssec, dnsRevServerActive: $dnsRevServerActive, privacyLevel: $privacyLevel)';
}


}

/// @nodoc
abstract mixin class _$PaddConfigCopyWith<$Res> implements $PaddConfigCopyWith<$Res> {
  factory _$PaddConfigCopyWith(_PaddConfig value, $Res Function(_PaddConfig) _then) = __$PaddConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dhcp_active') bool dhcpActive,@JsonKey(name: 'dhcp_start') String dhcpStart,@JsonKey(name: 'dhcp_end') String dhcpEnd,@JsonKey(name: 'dhcp_ipv6') bool dhcpIpv6,@JsonKey(name: 'dns_domain') String dnsDomain,@JsonKey(name: 'dns_port') int dnsPort,@JsonKey(name: 'dns_num_upstreams') int dnsNumUpstreams,@JsonKey(name: 'dns_dnssec') bool dnsDnssec,@JsonKey(name: 'dns_revServer_active') bool dnsRevServerActive,@JsonKey(name: 'privacy_level') int privacyLevel
});




}
/// @nodoc
class __$PaddConfigCopyWithImpl<$Res>
    implements _$PaddConfigCopyWith<$Res> {
  __$PaddConfigCopyWithImpl(this._self, this._then);

  final _PaddConfig _self;
  final $Res Function(_PaddConfig) _then;

/// Create a copy of PaddConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dhcpActive = null,Object? dhcpStart = null,Object? dhcpEnd = null,Object? dhcpIpv6 = null,Object? dnsDomain = null,Object? dnsPort = null,Object? dnsNumUpstreams = null,Object? dnsDnssec = null,Object? dnsRevServerActive = null,Object? privacyLevel = null,}) {
  return _then(_PaddConfig(
dhcpActive: null == dhcpActive ? _self.dhcpActive : dhcpActive // ignore: cast_nullable_to_non_nullable
as bool,dhcpStart: null == dhcpStart ? _self.dhcpStart : dhcpStart // ignore: cast_nullable_to_non_nullable
as String,dhcpEnd: null == dhcpEnd ? _self.dhcpEnd : dhcpEnd // ignore: cast_nullable_to_non_nullable
as String,dhcpIpv6: null == dhcpIpv6 ? _self.dhcpIpv6 : dhcpIpv6 // ignore: cast_nullable_to_non_nullable
as bool,dnsDomain: null == dnsDomain ? _self.dnsDomain : dnsDomain // ignore: cast_nullable_to_non_nullable
as String,dnsPort: null == dnsPort ? _self.dnsPort : dnsPort // ignore: cast_nullable_to_non_nullable
as int,dnsNumUpstreams: null == dnsNumUpstreams ? _self.dnsNumUpstreams : dnsNumUpstreams // ignore: cast_nullable_to_non_nullable
as int,dnsDnssec: null == dnsDnssec ? _self.dnsDnssec : dnsDnssec // ignore: cast_nullable_to_non_nullable
as bool,dnsRevServerActive: null == dnsRevServerActive ? _self.dnsRevServerActive : dnsRevServerActive // ignore: cast_nullable_to_non_nullable
as bool,privacyLevel: null == privacyLevel ? _self.privacyLevel : privacyLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaddSensors {

@JsonKey(name: 'hot_limit') double get hotLimit; String get unit;@JsonKey(name: 'cpu_temp') double? get cpuTemp;
/// Create a copy of PaddSensors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSensorsCopyWith<PaddSensors> get copyWith => _$PaddSensorsCopyWithImpl<PaddSensors>(this as PaddSensors, _$identity);

  /// Serializes this PaddSensors to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSensors&&(identical(other.hotLimit, hotLimit) || other.hotLimit == hotLimit)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotLimit,unit,cpuTemp);

@override
String toString() {
  return 'PaddSensors(hotLimit: $hotLimit, unit: $unit, cpuTemp: $cpuTemp)';
}


}

/// @nodoc
abstract mixin class $PaddSensorsCopyWith<$Res>  {
  factory $PaddSensorsCopyWith(PaddSensors value, $Res Function(PaddSensors) _then) = _$PaddSensorsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hot_limit') double hotLimit, String unit,@JsonKey(name: 'cpu_temp') double? cpuTemp
});




}
/// @nodoc
class _$PaddSensorsCopyWithImpl<$Res>
    implements $PaddSensorsCopyWith<$Res> {
  _$PaddSensorsCopyWithImpl(this._self, this._then);

  final PaddSensors _self;
  final $Res Function(PaddSensors) _then;

/// Create a copy of PaddSensors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotLimit = null,Object? unit = null,Object? cpuTemp = freezed,}) {
  return _then(_self.copyWith(
hotLimit: null == hotLimit ? _self.hotLimit : hotLimit // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,cpuTemp: freezed == cpuTemp ? _self.cpuTemp : cpuTemp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddSensors].
extension PaddSensorsPatterns on PaddSensors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSensors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSensors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSensors value)  $default,){
final _that = this;
switch (_that) {
case _PaddSensors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSensors value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSensors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hot_limit')  double hotLimit,  String unit, @JsonKey(name: 'cpu_temp')  double? cpuTemp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSensors() when $default != null:
return $default(_that.hotLimit,_that.unit,_that.cpuTemp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hot_limit')  double hotLimit,  String unit, @JsonKey(name: 'cpu_temp')  double? cpuTemp)  $default,) {final _that = this;
switch (_that) {
case _PaddSensors():
return $default(_that.hotLimit,_that.unit,_that.cpuTemp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hot_limit')  double hotLimit,  String unit, @JsonKey(name: 'cpu_temp')  double? cpuTemp)?  $default,) {final _that = this;
switch (_that) {
case _PaddSensors() when $default != null:
return $default(_that.hotLimit,_that.unit,_that.cpuTemp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddSensors implements PaddSensors {
  const _PaddSensors({@JsonKey(name: 'hot_limit') required this.hotLimit, required this.unit, @JsonKey(name: 'cpu_temp') this.cpuTemp});
  factory _PaddSensors.fromJson(Map<String, dynamic> json) => _$PaddSensorsFromJson(json);

@override@JsonKey(name: 'hot_limit') final  double hotLimit;
@override final  String unit;
@override@JsonKey(name: 'cpu_temp') final  double? cpuTemp;

/// Create a copy of PaddSensors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSensorsCopyWith<_PaddSensors> get copyWith => __$PaddSensorsCopyWithImpl<_PaddSensors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSensorsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSensors&&(identical(other.hotLimit, hotLimit) || other.hotLimit == hotLimit)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotLimit,unit,cpuTemp);

@override
String toString() {
  return 'PaddSensors(hotLimit: $hotLimit, unit: $unit, cpuTemp: $cpuTemp)';
}


}

/// @nodoc
abstract mixin class _$PaddSensorsCopyWith<$Res> implements $PaddSensorsCopyWith<$Res> {
  factory _$PaddSensorsCopyWith(_PaddSensors value, $Res Function(_PaddSensors) _then) = __$PaddSensorsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hot_limit') double hotLimit, String unit,@JsonKey(name: 'cpu_temp') double? cpuTemp
});




}
/// @nodoc
class __$PaddSensorsCopyWithImpl<$Res>
    implements _$PaddSensorsCopyWith<$Res> {
  __$PaddSensorsCopyWithImpl(this._self, this._then);

  final _PaddSensors _self;
  final $Res Function(_PaddSensors) _then;

/// Create a copy of PaddSensors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotLimit = null,Object? unit = null,Object? cpuTemp = freezed,}) {
  return _then(_PaddSensors(
hotLimit: null == hotLimit ? _self.hotLimit : hotLimit // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,cpuTemp: freezed == cpuTemp ? _self.cpuTemp : cpuTemp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$PaddSystem {

 int get uptime; PaddSystemMemory get memory; int get procs; PaddSystemCpu get cpu; PaddSystemFtl get ftl;
/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemCopyWith<PaddSystem> get copyWith => _$PaddSystemCopyWithImpl<PaddSystem>(this as PaddSystem, _$identity);

  /// Serializes this PaddSystem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystem&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.memory, memory) || other.memory == memory)&&(identical(other.procs, procs) || other.procs == procs)&&(identical(other.cpu, cpu) || other.cpu == cpu)&&(identical(other.ftl, ftl) || other.ftl == ftl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uptime,memory,procs,cpu,ftl);

@override
String toString() {
  return 'PaddSystem(uptime: $uptime, memory: $memory, procs: $procs, cpu: $cpu, ftl: $ftl)';
}


}

/// @nodoc
abstract mixin class $PaddSystemCopyWith<$Res>  {
  factory $PaddSystemCopyWith(PaddSystem value, $Res Function(PaddSystem) _then) = _$PaddSystemCopyWithImpl;
@useResult
$Res call({
 int uptime, PaddSystemMemory memory, int procs, PaddSystemCpu cpu, PaddSystemFtl ftl
});


$PaddSystemMemoryCopyWith<$Res> get memory;$PaddSystemCpuCopyWith<$Res> get cpu;$PaddSystemFtlCopyWith<$Res> get ftl;

}
/// @nodoc
class _$PaddSystemCopyWithImpl<$Res>
    implements $PaddSystemCopyWith<$Res> {
  _$PaddSystemCopyWithImpl(this._self, this._then);

  final PaddSystem _self;
  final $Res Function(PaddSystem) _then;

/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uptime = null,Object? memory = null,Object? procs = null,Object? cpu = null,Object? ftl = null,}) {
  return _then(_self.copyWith(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as PaddSystemMemory,procs: null == procs ? _self.procs : procs // ignore: cast_nullable_to_non_nullable
as int,cpu: null == cpu ? _self.cpu : cpu // ignore: cast_nullable_to_non_nullable
as PaddSystemCpu,ftl: null == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as PaddSystemFtl,
  ));
}
/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemMemoryCopyWith<$Res> get memory {
  
  return $PaddSystemMemoryCopyWith<$Res>(_self.memory, (value) {
    return _then(_self.copyWith(memory: value));
  });
}/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemCpuCopyWith<$Res> get cpu {
  
  return $PaddSystemCpuCopyWith<$Res>(_self.cpu, (value) {
    return _then(_self.copyWith(cpu: value));
  });
}/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemFtlCopyWith<$Res> get ftl {
  
  return $PaddSystemFtlCopyWith<$Res>(_self.ftl, (value) {
    return _then(_self.copyWith(ftl: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaddSystem].
extension PaddSystemPatterns on PaddSystem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystem value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystem value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int uptime,  PaddSystemMemory memory,  int procs,  PaddSystemCpu cpu,  PaddSystemFtl ftl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystem() when $default != null:
return $default(_that.uptime,_that.memory,_that.procs,_that.cpu,_that.ftl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int uptime,  PaddSystemMemory memory,  int procs,  PaddSystemCpu cpu,  PaddSystemFtl ftl)  $default,) {final _that = this;
switch (_that) {
case _PaddSystem():
return $default(_that.uptime,_that.memory,_that.procs,_that.cpu,_that.ftl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int uptime,  PaddSystemMemory memory,  int procs,  PaddSystemCpu cpu,  PaddSystemFtl ftl)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystem() when $default != null:
return $default(_that.uptime,_that.memory,_that.procs,_that.cpu,_that.ftl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PaddSystem implements PaddSystem {
  const _PaddSystem({required this.uptime, required this.memory, required this.procs, required this.cpu, required this.ftl});
  factory _PaddSystem.fromJson(Map<String, dynamic> json) => _$PaddSystemFromJson(json);

@override final  int uptime;
@override final  PaddSystemMemory memory;
@override final  int procs;
@override final  PaddSystemCpu cpu;
@override final  PaddSystemFtl ftl;

/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemCopyWith<_PaddSystem> get copyWith => __$PaddSystemCopyWithImpl<_PaddSystem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystem&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.memory, memory) || other.memory == memory)&&(identical(other.procs, procs) || other.procs == procs)&&(identical(other.cpu, cpu) || other.cpu == cpu)&&(identical(other.ftl, ftl) || other.ftl == ftl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uptime,memory,procs,cpu,ftl);

@override
String toString() {
  return 'PaddSystem(uptime: $uptime, memory: $memory, procs: $procs, cpu: $cpu, ftl: $ftl)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemCopyWith<$Res> implements $PaddSystemCopyWith<$Res> {
  factory _$PaddSystemCopyWith(_PaddSystem value, $Res Function(_PaddSystem) _then) = __$PaddSystemCopyWithImpl;
@override @useResult
$Res call({
 int uptime, PaddSystemMemory memory, int procs, PaddSystemCpu cpu, PaddSystemFtl ftl
});


@override $PaddSystemMemoryCopyWith<$Res> get memory;@override $PaddSystemCpuCopyWith<$Res> get cpu;@override $PaddSystemFtlCopyWith<$Res> get ftl;

}
/// @nodoc
class __$PaddSystemCopyWithImpl<$Res>
    implements _$PaddSystemCopyWith<$Res> {
  __$PaddSystemCopyWithImpl(this._self, this._then);

  final _PaddSystem _self;
  final $Res Function(_PaddSystem) _then;

/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uptime = null,Object? memory = null,Object? procs = null,Object? cpu = null,Object? ftl = null,}) {
  return _then(_PaddSystem(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as PaddSystemMemory,procs: null == procs ? _self.procs : procs // ignore: cast_nullable_to_non_nullable
as int,cpu: null == cpu ? _self.cpu : cpu // ignore: cast_nullable_to_non_nullable
as PaddSystemCpu,ftl: null == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as PaddSystemFtl,
  ));
}

/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemMemoryCopyWith<$Res> get memory {
  
  return $PaddSystemMemoryCopyWith<$Res>(_self.memory, (value) {
    return _then(_self.copyWith(memory: value));
  });
}/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemCpuCopyWith<$Res> get cpu {
  
  return $PaddSystemCpuCopyWith<$Res>(_self.cpu, (value) {
    return _then(_self.copyWith(cpu: value));
  });
}/// Create a copy of PaddSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemFtlCopyWith<$Res> get ftl {
  
  return $PaddSystemFtlCopyWith<$Res>(_self.ftl, (value) {
    return _then(_self.copyWith(ftl: value));
  });
}
}


/// @nodoc
mixin _$PaddSystemMemory {

 PaddSystemRam get ram; PaddSystemSwap get swap;
/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemMemoryCopyWith<PaddSystemMemory> get copyWith => _$PaddSystemMemoryCopyWithImpl<PaddSystemMemory>(this as PaddSystemMemory, _$identity);

  /// Serializes this PaddSystemMemory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystemMemory&&(identical(other.ram, ram) || other.ram == ram)&&(identical(other.swap, swap) || other.swap == swap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ram,swap);

@override
String toString() {
  return 'PaddSystemMemory(ram: $ram, swap: $swap)';
}


}

/// @nodoc
abstract mixin class $PaddSystemMemoryCopyWith<$Res>  {
  factory $PaddSystemMemoryCopyWith(PaddSystemMemory value, $Res Function(PaddSystemMemory) _then) = _$PaddSystemMemoryCopyWithImpl;
@useResult
$Res call({
 PaddSystemRam ram, PaddSystemSwap swap
});


$PaddSystemRamCopyWith<$Res> get ram;$PaddSystemSwapCopyWith<$Res> get swap;

}
/// @nodoc
class _$PaddSystemMemoryCopyWithImpl<$Res>
    implements $PaddSystemMemoryCopyWith<$Res> {
  _$PaddSystemMemoryCopyWithImpl(this._self, this._then);

  final PaddSystemMemory _self;
  final $Res Function(PaddSystemMemory) _then;

/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ram = null,Object? swap = null,}) {
  return _then(_self.copyWith(
ram: null == ram ? _self.ram : ram // ignore: cast_nullable_to_non_nullable
as PaddSystemRam,swap: null == swap ? _self.swap : swap // ignore: cast_nullable_to_non_nullable
as PaddSystemSwap,
  ));
}
/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemRamCopyWith<$Res> get ram {
  
  return $PaddSystemRamCopyWith<$Res>(_self.ram, (value) {
    return _then(_self.copyWith(ram: value));
  });
}/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemSwapCopyWith<$Res> get swap {
  
  return $PaddSystemSwapCopyWith<$Res>(_self.swap, (value) {
    return _then(_self.copyWith(swap: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaddSystemMemory].
extension PaddSystemMemoryPatterns on PaddSystemMemory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystemMemory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystemMemory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystemMemory value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystemMemory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystemMemory value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystemMemory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaddSystemRam ram,  PaddSystemSwap swap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystemMemory() when $default != null:
return $default(_that.ram,_that.swap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaddSystemRam ram,  PaddSystemSwap swap)  $default,) {final _that = this;
switch (_that) {
case _PaddSystemMemory():
return $default(_that.ram,_that.swap);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaddSystemRam ram,  PaddSystemSwap swap)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystemMemory() when $default != null:
return $default(_that.ram,_that.swap);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PaddSystemMemory implements PaddSystemMemory {
  const _PaddSystemMemory({required this.ram, required this.swap});
  factory _PaddSystemMemory.fromJson(Map<String, dynamic> json) => _$PaddSystemMemoryFromJson(json);

@override final  PaddSystemRam ram;
@override final  PaddSystemSwap swap;

/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemMemoryCopyWith<_PaddSystemMemory> get copyWith => __$PaddSystemMemoryCopyWithImpl<_PaddSystemMemory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemMemoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystemMemory&&(identical(other.ram, ram) || other.ram == ram)&&(identical(other.swap, swap) || other.swap == swap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ram,swap);

@override
String toString() {
  return 'PaddSystemMemory(ram: $ram, swap: $swap)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemMemoryCopyWith<$Res> implements $PaddSystemMemoryCopyWith<$Res> {
  factory _$PaddSystemMemoryCopyWith(_PaddSystemMemory value, $Res Function(_PaddSystemMemory) _then) = __$PaddSystemMemoryCopyWithImpl;
@override @useResult
$Res call({
 PaddSystemRam ram, PaddSystemSwap swap
});


@override $PaddSystemRamCopyWith<$Res> get ram;@override $PaddSystemSwapCopyWith<$Res> get swap;

}
/// @nodoc
class __$PaddSystemMemoryCopyWithImpl<$Res>
    implements _$PaddSystemMemoryCopyWith<$Res> {
  __$PaddSystemMemoryCopyWithImpl(this._self, this._then);

  final _PaddSystemMemory _self;
  final $Res Function(_PaddSystemMemory) _then;

/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ram = null,Object? swap = null,}) {
  return _then(_PaddSystemMemory(
ram: null == ram ? _self.ram : ram // ignore: cast_nullable_to_non_nullable
as PaddSystemRam,swap: null == swap ? _self.swap : swap // ignore: cast_nullable_to_non_nullable
as PaddSystemSwap,
  ));
}

/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemRamCopyWith<$Res> get ram {
  
  return $PaddSystemRamCopyWith<$Res>(_self.ram, (value) {
    return _then(_self.copyWith(ram: value));
  });
}/// Create a copy of PaddSystemMemory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemSwapCopyWith<$Res> get swap {
  
  return $PaddSystemSwapCopyWith<$Res>(_self.swap, (value) {
    return _then(_self.copyWith(swap: value));
  });
}
}


/// @nodoc
mixin _$PaddSystemRam {

 int get total; int get free; int get used; int get available;@JsonKey(name: '%used') double get percentUsed;
/// Create a copy of PaddSystemRam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemRamCopyWith<PaddSystemRam> get copyWith => _$PaddSystemRamCopyWithImpl<PaddSystemRam>(this as PaddSystemRam, _$identity);

  /// Serializes this PaddSystemRam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystemRam&&(identical(other.total, total) || other.total == total)&&(identical(other.free, free) || other.free == free)&&(identical(other.used, used) || other.used == used)&&(identical(other.available, available) || other.available == available)&&(identical(other.percentUsed, percentUsed) || other.percentUsed == percentUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,free,used,available,percentUsed);

@override
String toString() {
  return 'PaddSystemRam(total: $total, free: $free, used: $used, available: $available, percentUsed: $percentUsed)';
}


}

/// @nodoc
abstract mixin class $PaddSystemRamCopyWith<$Res>  {
  factory $PaddSystemRamCopyWith(PaddSystemRam value, $Res Function(PaddSystemRam) _then) = _$PaddSystemRamCopyWithImpl;
@useResult
$Res call({
 int total, int free, int used, int available,@JsonKey(name: '%used') double percentUsed
});




}
/// @nodoc
class _$PaddSystemRamCopyWithImpl<$Res>
    implements $PaddSystemRamCopyWith<$Res> {
  _$PaddSystemRamCopyWithImpl(this._self, this._then);

  final PaddSystemRam _self;
  final $Res Function(PaddSystemRam) _then;

/// Create a copy of PaddSystemRam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? free = null,Object? used = null,Object? available = null,Object? percentUsed = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as int,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,percentUsed: null == percentUsed ? _self.percentUsed : percentUsed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddSystemRam].
extension PaddSystemRamPatterns on PaddSystemRam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystemRam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystemRam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystemRam value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystemRam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystemRam value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystemRam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int free,  int used,  int available, @JsonKey(name: '%used')  double percentUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystemRam() when $default != null:
return $default(_that.total,_that.free,_that.used,_that.available,_that.percentUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int free,  int used,  int available, @JsonKey(name: '%used')  double percentUsed)  $default,) {final _that = this;
switch (_that) {
case _PaddSystemRam():
return $default(_that.total,_that.free,_that.used,_that.available,_that.percentUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int free,  int used,  int available, @JsonKey(name: '%used')  double percentUsed)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystemRam() when $default != null:
return $default(_that.total,_that.free,_that.used,_that.available,_that.percentUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddSystemRam implements PaddSystemRam {
  const _PaddSystemRam({required this.total, required this.free, required this.used, required this.available, @JsonKey(name: '%used') required this.percentUsed});
  factory _PaddSystemRam.fromJson(Map<String, dynamic> json) => _$PaddSystemRamFromJson(json);

@override final  int total;
@override final  int free;
@override final  int used;
@override final  int available;
@override@JsonKey(name: '%used') final  double percentUsed;

/// Create a copy of PaddSystemRam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemRamCopyWith<_PaddSystemRam> get copyWith => __$PaddSystemRamCopyWithImpl<_PaddSystemRam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemRamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystemRam&&(identical(other.total, total) || other.total == total)&&(identical(other.free, free) || other.free == free)&&(identical(other.used, used) || other.used == used)&&(identical(other.available, available) || other.available == available)&&(identical(other.percentUsed, percentUsed) || other.percentUsed == percentUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,free,used,available,percentUsed);

@override
String toString() {
  return 'PaddSystemRam(total: $total, free: $free, used: $used, available: $available, percentUsed: $percentUsed)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemRamCopyWith<$Res> implements $PaddSystemRamCopyWith<$Res> {
  factory _$PaddSystemRamCopyWith(_PaddSystemRam value, $Res Function(_PaddSystemRam) _then) = __$PaddSystemRamCopyWithImpl;
@override @useResult
$Res call({
 int total, int free, int used, int available,@JsonKey(name: '%used') double percentUsed
});




}
/// @nodoc
class __$PaddSystemRamCopyWithImpl<$Res>
    implements _$PaddSystemRamCopyWith<$Res> {
  __$PaddSystemRamCopyWithImpl(this._self, this._then);

  final _PaddSystemRam _self;
  final $Res Function(_PaddSystemRam) _then;

/// Create a copy of PaddSystemRam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? free = null,Object? used = null,Object? available = null,Object? percentUsed = null,}) {
  return _then(_PaddSystemRam(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as int,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,percentUsed: null == percentUsed ? _self.percentUsed : percentUsed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PaddSystemSwap {

 int get total; int get used; int get free;@JsonKey(name: '%used') double get percentUsed;
/// Create a copy of PaddSystemSwap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemSwapCopyWith<PaddSystemSwap> get copyWith => _$PaddSystemSwapCopyWithImpl<PaddSystemSwap>(this as PaddSystemSwap, _$identity);

  /// Serializes this PaddSystemSwap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystemSwap&&(identical(other.total, total) || other.total == total)&&(identical(other.used, used) || other.used == used)&&(identical(other.free, free) || other.free == free)&&(identical(other.percentUsed, percentUsed) || other.percentUsed == percentUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,used,free,percentUsed);

@override
String toString() {
  return 'PaddSystemSwap(total: $total, used: $used, free: $free, percentUsed: $percentUsed)';
}


}

/// @nodoc
abstract mixin class $PaddSystemSwapCopyWith<$Res>  {
  factory $PaddSystemSwapCopyWith(PaddSystemSwap value, $Res Function(PaddSystemSwap) _then) = _$PaddSystemSwapCopyWithImpl;
@useResult
$Res call({
 int total, int used, int free,@JsonKey(name: '%used') double percentUsed
});




}
/// @nodoc
class _$PaddSystemSwapCopyWithImpl<$Res>
    implements $PaddSystemSwapCopyWith<$Res> {
  _$PaddSystemSwapCopyWithImpl(this._self, this._then);

  final PaddSystemSwap _self;
  final $Res Function(PaddSystemSwap) _then;

/// Create a copy of PaddSystemSwap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? used = null,Object? free = null,Object? percentUsed = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as int,percentUsed: null == percentUsed ? _self.percentUsed : percentUsed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddSystemSwap].
extension PaddSystemSwapPatterns on PaddSystemSwap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystemSwap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystemSwap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystemSwap value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystemSwap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystemSwap value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystemSwap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int used,  int free, @JsonKey(name: '%used')  double percentUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystemSwap() when $default != null:
return $default(_that.total,_that.used,_that.free,_that.percentUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int used,  int free, @JsonKey(name: '%used')  double percentUsed)  $default,) {final _that = this;
switch (_that) {
case _PaddSystemSwap():
return $default(_that.total,_that.used,_that.free,_that.percentUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int used,  int free, @JsonKey(name: '%used')  double percentUsed)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystemSwap() when $default != null:
return $default(_that.total,_that.used,_that.free,_that.percentUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddSystemSwap implements PaddSystemSwap {
  const _PaddSystemSwap({required this.total, required this.used, required this.free, @JsonKey(name: '%used') required this.percentUsed});
  factory _PaddSystemSwap.fromJson(Map<String, dynamic> json) => _$PaddSystemSwapFromJson(json);

@override final  int total;
@override final  int used;
@override final  int free;
@override@JsonKey(name: '%used') final  double percentUsed;

/// Create a copy of PaddSystemSwap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemSwapCopyWith<_PaddSystemSwap> get copyWith => __$PaddSystemSwapCopyWithImpl<_PaddSystemSwap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemSwapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystemSwap&&(identical(other.total, total) || other.total == total)&&(identical(other.used, used) || other.used == used)&&(identical(other.free, free) || other.free == free)&&(identical(other.percentUsed, percentUsed) || other.percentUsed == percentUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,used,free,percentUsed);

@override
String toString() {
  return 'PaddSystemSwap(total: $total, used: $used, free: $free, percentUsed: $percentUsed)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemSwapCopyWith<$Res> implements $PaddSystemSwapCopyWith<$Res> {
  factory _$PaddSystemSwapCopyWith(_PaddSystemSwap value, $Res Function(_PaddSystemSwap) _then) = __$PaddSystemSwapCopyWithImpl;
@override @useResult
$Res call({
 int total, int used, int free,@JsonKey(name: '%used') double percentUsed
});




}
/// @nodoc
class __$PaddSystemSwapCopyWithImpl<$Res>
    implements _$PaddSystemSwapCopyWith<$Res> {
  __$PaddSystemSwapCopyWithImpl(this._self, this._then);

  final _PaddSystemSwap _self;
  final $Res Function(_PaddSystemSwap) _then;

/// Create a copy of PaddSystemSwap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? used = null,Object? free = null,Object? percentUsed = null,}) {
  return _then(_PaddSystemSwap(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as int,percentUsed: null == percentUsed ? _self.percentUsed : percentUsed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PaddSystemCpu {

 int get nprocs; PaddSystemLoad get load;@JsonKey(name: '%cpu') double? get percentCpu;
/// Create a copy of PaddSystemCpu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemCpuCopyWith<PaddSystemCpu> get copyWith => _$PaddSystemCpuCopyWithImpl<PaddSystemCpu>(this as PaddSystemCpu, _$identity);

  /// Serializes this PaddSystemCpu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystemCpu&&(identical(other.nprocs, nprocs) || other.nprocs == nprocs)&&(identical(other.load, load) || other.load == load)&&(identical(other.percentCpu, percentCpu) || other.percentCpu == percentCpu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nprocs,load,percentCpu);

@override
String toString() {
  return 'PaddSystemCpu(nprocs: $nprocs, load: $load, percentCpu: $percentCpu)';
}


}

/// @nodoc
abstract mixin class $PaddSystemCpuCopyWith<$Res>  {
  factory $PaddSystemCpuCopyWith(PaddSystemCpu value, $Res Function(PaddSystemCpu) _then) = _$PaddSystemCpuCopyWithImpl;
@useResult
$Res call({
 int nprocs, PaddSystemLoad load,@JsonKey(name: '%cpu') double? percentCpu
});


$PaddSystemLoadCopyWith<$Res> get load;

}
/// @nodoc
class _$PaddSystemCpuCopyWithImpl<$Res>
    implements $PaddSystemCpuCopyWith<$Res> {
  _$PaddSystemCpuCopyWithImpl(this._self, this._then);

  final PaddSystemCpu _self;
  final $Res Function(PaddSystemCpu) _then;

/// Create a copy of PaddSystemCpu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nprocs = null,Object? load = null,Object? percentCpu = freezed,}) {
  return _then(_self.copyWith(
nprocs: null == nprocs ? _self.nprocs : nprocs // ignore: cast_nullable_to_non_nullable
as int,load: null == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as PaddSystemLoad,percentCpu: freezed == percentCpu ? _self.percentCpu : percentCpu // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of PaddSystemCpu
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemLoadCopyWith<$Res> get load {
  
  return $PaddSystemLoadCopyWith<$Res>(_self.load, (value) {
    return _then(_self.copyWith(load: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaddSystemCpu].
extension PaddSystemCpuPatterns on PaddSystemCpu {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystemCpu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystemCpu() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystemCpu value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystemCpu():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystemCpu value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystemCpu() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int nprocs,  PaddSystemLoad load, @JsonKey(name: '%cpu')  double? percentCpu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystemCpu() when $default != null:
return $default(_that.nprocs,_that.load,_that.percentCpu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int nprocs,  PaddSystemLoad load, @JsonKey(name: '%cpu')  double? percentCpu)  $default,) {final _that = this;
switch (_that) {
case _PaddSystemCpu():
return $default(_that.nprocs,_that.load,_that.percentCpu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int nprocs,  PaddSystemLoad load, @JsonKey(name: '%cpu')  double? percentCpu)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystemCpu() when $default != null:
return $default(_that.nprocs,_that.load,_that.percentCpu);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PaddSystemCpu implements PaddSystemCpu {
  const _PaddSystemCpu({required this.nprocs, required this.load, @JsonKey(name: '%cpu') this.percentCpu});
  factory _PaddSystemCpu.fromJson(Map<String, dynamic> json) => _$PaddSystemCpuFromJson(json);

@override final  int nprocs;
@override final  PaddSystemLoad load;
@override@JsonKey(name: '%cpu') final  double? percentCpu;

/// Create a copy of PaddSystemCpu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemCpuCopyWith<_PaddSystemCpu> get copyWith => __$PaddSystemCpuCopyWithImpl<_PaddSystemCpu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemCpuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystemCpu&&(identical(other.nprocs, nprocs) || other.nprocs == nprocs)&&(identical(other.load, load) || other.load == load)&&(identical(other.percentCpu, percentCpu) || other.percentCpu == percentCpu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nprocs,load,percentCpu);

@override
String toString() {
  return 'PaddSystemCpu(nprocs: $nprocs, load: $load, percentCpu: $percentCpu)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemCpuCopyWith<$Res> implements $PaddSystemCpuCopyWith<$Res> {
  factory _$PaddSystemCpuCopyWith(_PaddSystemCpu value, $Res Function(_PaddSystemCpu) _then) = __$PaddSystemCpuCopyWithImpl;
@override @useResult
$Res call({
 int nprocs, PaddSystemLoad load,@JsonKey(name: '%cpu') double? percentCpu
});


@override $PaddSystemLoadCopyWith<$Res> get load;

}
/// @nodoc
class __$PaddSystemCpuCopyWithImpl<$Res>
    implements _$PaddSystemCpuCopyWith<$Res> {
  __$PaddSystemCpuCopyWithImpl(this._self, this._then);

  final _PaddSystemCpu _self;
  final $Res Function(_PaddSystemCpu) _then;

/// Create a copy of PaddSystemCpu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nprocs = null,Object? load = null,Object? percentCpu = freezed,}) {
  return _then(_PaddSystemCpu(
nprocs: null == nprocs ? _self.nprocs : nprocs // ignore: cast_nullable_to_non_nullable
as int,load: null == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as PaddSystemLoad,percentCpu: freezed == percentCpu ? _self.percentCpu : percentCpu // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of PaddSystemCpu
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaddSystemLoadCopyWith<$Res> get load {
  
  return $PaddSystemLoadCopyWith<$Res>(_self.load, (value) {
    return _then(_self.copyWith(load: value));
  });
}
}


/// @nodoc
mixin _$PaddSystemLoad {

 List<double> get raw; List<double> get percent;
/// Create a copy of PaddSystemLoad
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemLoadCopyWith<PaddSystemLoad> get copyWith => _$PaddSystemLoadCopyWithImpl<PaddSystemLoad>(this as PaddSystemLoad, _$identity);

  /// Serializes this PaddSystemLoad to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystemLoad&&const DeepCollectionEquality().equals(other.raw, raw)&&const DeepCollectionEquality().equals(other.percent, percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(raw),const DeepCollectionEquality().hash(percent));

@override
String toString() {
  return 'PaddSystemLoad(raw: $raw, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $PaddSystemLoadCopyWith<$Res>  {
  factory $PaddSystemLoadCopyWith(PaddSystemLoad value, $Res Function(PaddSystemLoad) _then) = _$PaddSystemLoadCopyWithImpl;
@useResult
$Res call({
 List<double> raw, List<double> percent
});




}
/// @nodoc
class _$PaddSystemLoadCopyWithImpl<$Res>
    implements $PaddSystemLoadCopyWith<$Res> {
  _$PaddSystemLoadCopyWithImpl(this._self, this._then);

  final PaddSystemLoad _self;
  final $Res Function(PaddSystemLoad) _then;

/// Create a copy of PaddSystemLoad
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? raw = null,Object? percent = null,}) {
  return _then(_self.copyWith(
raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as List<double>,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddSystemLoad].
extension PaddSystemLoadPatterns on PaddSystemLoad {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystemLoad value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystemLoad() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystemLoad value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystemLoad():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystemLoad value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystemLoad() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<double> raw,  List<double> percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystemLoad() when $default != null:
return $default(_that.raw,_that.percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<double> raw,  List<double> percent)  $default,) {final _that = this;
switch (_that) {
case _PaddSystemLoad():
return $default(_that.raw,_that.percent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<double> raw,  List<double> percent)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystemLoad() when $default != null:
return $default(_that.raw,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddSystemLoad implements PaddSystemLoad {
  const _PaddSystemLoad({required final  List<double> raw, required final  List<double> percent}): _raw = raw,_percent = percent;
  factory _PaddSystemLoad.fromJson(Map<String, dynamic> json) => _$PaddSystemLoadFromJson(json);

 final  List<double> _raw;
@override List<double> get raw {
  if (_raw is EqualUnmodifiableListView) return _raw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_raw);
}

 final  List<double> _percent;
@override List<double> get percent {
  if (_percent is EqualUnmodifiableListView) return _percent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_percent);
}


/// Create a copy of PaddSystemLoad
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemLoadCopyWith<_PaddSystemLoad> get copyWith => __$PaddSystemLoadCopyWithImpl<_PaddSystemLoad>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemLoadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystemLoad&&const DeepCollectionEquality().equals(other._raw, _raw)&&const DeepCollectionEquality().equals(other._percent, _percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_raw),const DeepCollectionEquality().hash(_percent));

@override
String toString() {
  return 'PaddSystemLoad(raw: $raw, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemLoadCopyWith<$Res> implements $PaddSystemLoadCopyWith<$Res> {
  factory _$PaddSystemLoadCopyWith(_PaddSystemLoad value, $Res Function(_PaddSystemLoad) _then) = __$PaddSystemLoadCopyWithImpl;
@override @useResult
$Res call({
 List<double> raw, List<double> percent
});




}
/// @nodoc
class __$PaddSystemLoadCopyWithImpl<$Res>
    implements _$PaddSystemLoadCopyWith<$Res> {
  __$PaddSystemLoadCopyWithImpl(this._self, this._then);

  final _PaddSystemLoad _self;
  final $Res Function(_PaddSystemLoad) _then;

/// Create a copy of PaddSystemLoad
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raw = null,Object? percent = null,}) {
  return _then(_PaddSystemLoad(
raw: null == raw ? _self._raw : raw // ignore: cast_nullable_to_non_nullable
as List<double>,percent: null == percent ? _self._percent : percent // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}


/// @nodoc
mixin _$PaddSystemFtl {

@JsonKey(name: '%mem') double get percentMem;@JsonKey(name: '%cpu') double get percentCpu;
/// Create a copy of PaddSystemFtl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaddSystemFtlCopyWith<PaddSystemFtl> get copyWith => _$PaddSystemFtlCopyWithImpl<PaddSystemFtl>(this as PaddSystemFtl, _$identity);

  /// Serializes this PaddSystemFtl to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaddSystemFtl&&(identical(other.percentMem, percentMem) || other.percentMem == percentMem)&&(identical(other.percentCpu, percentCpu) || other.percentCpu == percentCpu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,percentMem,percentCpu);

@override
String toString() {
  return 'PaddSystemFtl(percentMem: $percentMem, percentCpu: $percentCpu)';
}


}

/// @nodoc
abstract mixin class $PaddSystemFtlCopyWith<$Res>  {
  factory $PaddSystemFtlCopyWith(PaddSystemFtl value, $Res Function(PaddSystemFtl) _then) = _$PaddSystemFtlCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '%mem') double percentMem,@JsonKey(name: '%cpu') double percentCpu
});




}
/// @nodoc
class _$PaddSystemFtlCopyWithImpl<$Res>
    implements $PaddSystemFtlCopyWith<$Res> {
  _$PaddSystemFtlCopyWithImpl(this._self, this._then);

  final PaddSystemFtl _self;
  final $Res Function(PaddSystemFtl) _then;

/// Create a copy of PaddSystemFtl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? percentMem = null,Object? percentCpu = null,}) {
  return _then(_self.copyWith(
percentMem: null == percentMem ? _self.percentMem : percentMem // ignore: cast_nullable_to_non_nullable
as double,percentCpu: null == percentCpu ? _self.percentCpu : percentCpu // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaddSystemFtl].
extension PaddSystemFtlPatterns on PaddSystemFtl {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaddSystemFtl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaddSystemFtl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaddSystemFtl value)  $default,){
final _that = this;
switch (_that) {
case _PaddSystemFtl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaddSystemFtl value)?  $default,){
final _that = this;
switch (_that) {
case _PaddSystemFtl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '%mem')  double percentMem, @JsonKey(name: '%cpu')  double percentCpu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaddSystemFtl() when $default != null:
return $default(_that.percentMem,_that.percentCpu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '%mem')  double percentMem, @JsonKey(name: '%cpu')  double percentCpu)  $default,) {final _that = this;
switch (_that) {
case _PaddSystemFtl():
return $default(_that.percentMem,_that.percentCpu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '%mem')  double percentMem, @JsonKey(name: '%cpu')  double percentCpu)?  $default,) {final _that = this;
switch (_that) {
case _PaddSystemFtl() when $default != null:
return $default(_that.percentMem,_that.percentCpu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaddSystemFtl implements PaddSystemFtl {
  const _PaddSystemFtl({@JsonKey(name: '%mem') required this.percentMem, @JsonKey(name: '%cpu') required this.percentCpu});
  factory _PaddSystemFtl.fromJson(Map<String, dynamic> json) => _$PaddSystemFtlFromJson(json);

@override@JsonKey(name: '%mem') final  double percentMem;
@override@JsonKey(name: '%cpu') final  double percentCpu;

/// Create a copy of PaddSystemFtl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaddSystemFtlCopyWith<_PaddSystemFtl> get copyWith => __$PaddSystemFtlCopyWithImpl<_PaddSystemFtl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaddSystemFtlToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaddSystemFtl&&(identical(other.percentMem, percentMem) || other.percentMem == percentMem)&&(identical(other.percentCpu, percentCpu) || other.percentCpu == percentCpu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,percentMem,percentCpu);

@override
String toString() {
  return 'PaddSystemFtl(percentMem: $percentMem, percentCpu: $percentCpu)';
}


}

/// @nodoc
abstract mixin class _$PaddSystemFtlCopyWith<$Res> implements $PaddSystemFtlCopyWith<$Res> {
  factory _$PaddSystemFtlCopyWith(_PaddSystemFtl value, $Res Function(_PaddSystemFtl) _then) = __$PaddSystemFtlCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '%mem') double percentMem,@JsonKey(name: '%cpu') double percentCpu
});




}
/// @nodoc
class __$PaddSystemFtlCopyWithImpl<$Res>
    implements _$PaddSystemFtlCopyWith<$Res> {
  __$PaddSystemFtlCopyWithImpl(this._self, this._then);

  final _PaddSystemFtl _self;
  final $Res Function(_PaddSystemFtl) _then;

/// Create a copy of PaddSystemFtl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? percentMem = null,Object? percentCpu = null,}) {
  return _then(_PaddSystemFtl(
percentMem: null == percentMem ? _self.percentMem : percentMem // ignore: cast_nullable_to_non_nullable
as double,percentCpu: null == percentCpu ? _self.percentCpu : percentCpu // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
