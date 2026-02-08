// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dns_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DnsConfig {

 bool get queryLogging;// v6-only fields
 List<String>? get upstreams; bool? get dnssec; bool? get bogusPriv; bool? get domainNeeded; bool? get expandHosts; String? get listeningMode; int? get port; int? get blockTTL; List<String>? get cnameRecords; List<String>? get revServers; List<String>? get hosts; DnsBlockingConfig? get blocking; DnsRateLimitConfig? get rateLimit;
/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsConfigCopyWith<DnsConfig> get copyWith => _$DnsConfigCopyWithImpl<DnsConfig>(this as DnsConfig, _$identity);

  /// Serializes this DnsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsConfig&&(identical(other.queryLogging, queryLogging) || other.queryLogging == queryLogging)&&const DeepCollectionEquality().equals(other.upstreams, upstreams)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.bogusPriv, bogusPriv) || other.bogusPriv == bogusPriv)&&(identical(other.domainNeeded, domainNeeded) || other.domainNeeded == domainNeeded)&&(identical(other.expandHosts, expandHosts) || other.expandHosts == expandHosts)&&(identical(other.listeningMode, listeningMode) || other.listeningMode == listeningMode)&&(identical(other.port, port) || other.port == port)&&(identical(other.blockTTL, blockTTL) || other.blockTTL == blockTTL)&&const DeepCollectionEquality().equals(other.cnameRecords, cnameRecords)&&const DeepCollectionEquality().equals(other.revServers, revServers)&&const DeepCollectionEquality().equals(other.hosts, hosts)&&(identical(other.blocking, blocking) || other.blocking == blocking)&&(identical(other.rateLimit, rateLimit) || other.rateLimit == rateLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queryLogging,const DeepCollectionEquality().hash(upstreams),dnssec,bogusPriv,domainNeeded,expandHosts,listeningMode,port,blockTTL,const DeepCollectionEquality().hash(cnameRecords),const DeepCollectionEquality().hash(revServers),const DeepCollectionEquality().hash(hosts),blocking,rateLimit);

@override
String toString() {
  return 'DnsConfig(queryLogging: $queryLogging, upstreams: $upstreams, dnssec: $dnssec, bogusPriv: $bogusPriv, domainNeeded: $domainNeeded, expandHosts: $expandHosts, listeningMode: $listeningMode, port: $port, blockTTL: $blockTTL, cnameRecords: $cnameRecords, revServers: $revServers, hosts: $hosts, blocking: $blocking, rateLimit: $rateLimit)';
}


}

/// @nodoc
abstract mixin class $DnsConfigCopyWith<$Res>  {
  factory $DnsConfigCopyWith(DnsConfig value, $Res Function(DnsConfig) _then) = _$DnsConfigCopyWithImpl;
@useResult
$Res call({
 bool queryLogging, List<String>? upstreams, bool? dnssec, bool? bogusPriv, bool? domainNeeded, bool? expandHosts, String? listeningMode, int? port, int? blockTTL, List<String>? cnameRecords, List<String>? revServers, List<String>? hosts, DnsBlockingConfig? blocking, DnsRateLimitConfig? rateLimit
});


$DnsBlockingConfigCopyWith<$Res>? get blocking;$DnsRateLimitConfigCopyWith<$Res>? get rateLimit;

}
/// @nodoc
class _$DnsConfigCopyWithImpl<$Res>
    implements $DnsConfigCopyWith<$Res> {
  _$DnsConfigCopyWithImpl(this._self, this._then);

  final DnsConfig _self;
  final $Res Function(DnsConfig) _then;

/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queryLogging = null,Object? upstreams = freezed,Object? dnssec = freezed,Object? bogusPriv = freezed,Object? domainNeeded = freezed,Object? expandHosts = freezed,Object? listeningMode = freezed,Object? port = freezed,Object? blockTTL = freezed,Object? cnameRecords = freezed,Object? revServers = freezed,Object? hosts = freezed,Object? blocking = freezed,Object? rateLimit = freezed,}) {
  return _then(_self.copyWith(
queryLogging: null == queryLogging ? _self.queryLogging : queryLogging // ignore: cast_nullable_to_non_nullable
as bool,upstreams: freezed == upstreams ? _self.upstreams : upstreams // ignore: cast_nullable_to_non_nullable
as List<String>?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as bool?,bogusPriv: freezed == bogusPriv ? _self.bogusPriv : bogusPriv // ignore: cast_nullable_to_non_nullable
as bool?,domainNeeded: freezed == domainNeeded ? _self.domainNeeded : domainNeeded // ignore: cast_nullable_to_non_nullable
as bool?,expandHosts: freezed == expandHosts ? _self.expandHosts : expandHosts // ignore: cast_nullable_to_non_nullable
as bool?,listeningMode: freezed == listeningMode ? _self.listeningMode : listeningMode // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int?,blockTTL: freezed == blockTTL ? _self.blockTTL : blockTTL // ignore: cast_nullable_to_non_nullable
as int?,cnameRecords: freezed == cnameRecords ? _self.cnameRecords : cnameRecords // ignore: cast_nullable_to_non_nullable
as List<String>?,revServers: freezed == revServers ? _self.revServers : revServers // ignore: cast_nullable_to_non_nullable
as List<String>?,hosts: freezed == hosts ? _self.hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<String>?,blocking: freezed == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as DnsBlockingConfig?,rateLimit: freezed == rateLimit ? _self.rateLimit : rateLimit // ignore: cast_nullable_to_non_nullable
as DnsRateLimitConfig?,
  ));
}
/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsBlockingConfigCopyWith<$Res>? get blocking {
    if (_self.blocking == null) {
    return null;
  }

  return $DnsBlockingConfigCopyWith<$Res>(_self.blocking!, (value) {
    return _then(_self.copyWith(blocking: value));
  });
}/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsRateLimitConfigCopyWith<$Res>? get rateLimit {
    if (_self.rateLimit == null) {
    return null;
  }

  return $DnsRateLimitConfigCopyWith<$Res>(_self.rateLimit!, (value) {
    return _then(_self.copyWith(rateLimit: value));
  });
}
}


/// Adds pattern-matching-related methods to [DnsConfig].
extension DnsConfigPatterns on DnsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsConfig value)  $default,){
final _that = this;
switch (_that) {
case _DnsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _DnsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool queryLogging,  List<String>? upstreams,  bool? dnssec,  bool? bogusPriv,  bool? domainNeeded,  bool? expandHosts,  String? listeningMode,  int? port,  int? blockTTL,  List<String>? cnameRecords,  List<String>? revServers,  List<String>? hosts,  DnsBlockingConfig? blocking,  DnsRateLimitConfig? rateLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsConfig() when $default != null:
return $default(_that.queryLogging,_that.upstreams,_that.dnssec,_that.bogusPriv,_that.domainNeeded,_that.expandHosts,_that.listeningMode,_that.port,_that.blockTTL,_that.cnameRecords,_that.revServers,_that.hosts,_that.blocking,_that.rateLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool queryLogging,  List<String>? upstreams,  bool? dnssec,  bool? bogusPriv,  bool? domainNeeded,  bool? expandHosts,  String? listeningMode,  int? port,  int? blockTTL,  List<String>? cnameRecords,  List<String>? revServers,  List<String>? hosts,  DnsBlockingConfig? blocking,  DnsRateLimitConfig? rateLimit)  $default,) {final _that = this;
switch (_that) {
case _DnsConfig():
return $default(_that.queryLogging,_that.upstreams,_that.dnssec,_that.bogusPriv,_that.domainNeeded,_that.expandHosts,_that.listeningMode,_that.port,_that.blockTTL,_that.cnameRecords,_that.revServers,_that.hosts,_that.blocking,_that.rateLimit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool queryLogging,  List<String>? upstreams,  bool? dnssec,  bool? bogusPriv,  bool? domainNeeded,  bool? expandHosts,  String? listeningMode,  int? port,  int? blockTTL,  List<String>? cnameRecords,  List<String>? revServers,  List<String>? hosts,  DnsBlockingConfig? blocking,  DnsRateLimitConfig? rateLimit)?  $default,) {final _that = this;
switch (_that) {
case _DnsConfig() when $default != null:
return $default(_that.queryLogging,_that.upstreams,_that.dnssec,_that.bogusPriv,_that.domainNeeded,_that.expandHosts,_that.listeningMode,_that.port,_that.blockTTL,_that.cnameRecords,_that.revServers,_that.hosts,_that.blocking,_that.rateLimit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _DnsConfig implements DnsConfig {
  const _DnsConfig({required this.queryLogging, final  List<String>? upstreams, this.dnssec, this.bogusPriv, this.domainNeeded, this.expandHosts, this.listeningMode, this.port, this.blockTTL, final  List<String>? cnameRecords, final  List<String>? revServers, final  List<String>? hosts, this.blocking, this.rateLimit}): _upstreams = upstreams,_cnameRecords = cnameRecords,_revServers = revServers,_hosts = hosts;
  factory _DnsConfig.fromJson(Map<String, dynamic> json) => _$DnsConfigFromJson(json);

@override final  bool queryLogging;
// v6-only fields
 final  List<String>? _upstreams;
// v6-only fields
@override List<String>? get upstreams {
  final value = _upstreams;
  if (value == null) return null;
  if (_upstreams is EqualUnmodifiableListView) return _upstreams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? dnssec;
@override final  bool? bogusPriv;
@override final  bool? domainNeeded;
@override final  bool? expandHosts;
@override final  String? listeningMode;
@override final  int? port;
@override final  int? blockTTL;
 final  List<String>? _cnameRecords;
@override List<String>? get cnameRecords {
  final value = _cnameRecords;
  if (value == null) return null;
  if (_cnameRecords is EqualUnmodifiableListView) return _cnameRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _revServers;
@override List<String>? get revServers {
  final value = _revServers;
  if (value == null) return null;
  if (_revServers is EqualUnmodifiableListView) return _revServers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _hosts;
@override List<String>? get hosts {
  final value = _hosts;
  if (value == null) return null;
  if (_hosts is EqualUnmodifiableListView) return _hosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DnsBlockingConfig? blocking;
@override final  DnsRateLimitConfig? rateLimit;

/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsConfigCopyWith<_DnsConfig> get copyWith => __$DnsConfigCopyWithImpl<_DnsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsConfig&&(identical(other.queryLogging, queryLogging) || other.queryLogging == queryLogging)&&const DeepCollectionEquality().equals(other._upstreams, _upstreams)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.bogusPriv, bogusPriv) || other.bogusPriv == bogusPriv)&&(identical(other.domainNeeded, domainNeeded) || other.domainNeeded == domainNeeded)&&(identical(other.expandHosts, expandHosts) || other.expandHosts == expandHosts)&&(identical(other.listeningMode, listeningMode) || other.listeningMode == listeningMode)&&(identical(other.port, port) || other.port == port)&&(identical(other.blockTTL, blockTTL) || other.blockTTL == blockTTL)&&const DeepCollectionEquality().equals(other._cnameRecords, _cnameRecords)&&const DeepCollectionEquality().equals(other._revServers, _revServers)&&const DeepCollectionEquality().equals(other._hosts, _hosts)&&(identical(other.blocking, blocking) || other.blocking == blocking)&&(identical(other.rateLimit, rateLimit) || other.rateLimit == rateLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queryLogging,const DeepCollectionEquality().hash(_upstreams),dnssec,bogusPriv,domainNeeded,expandHosts,listeningMode,port,blockTTL,const DeepCollectionEquality().hash(_cnameRecords),const DeepCollectionEquality().hash(_revServers),const DeepCollectionEquality().hash(_hosts),blocking,rateLimit);

@override
String toString() {
  return 'DnsConfig(queryLogging: $queryLogging, upstreams: $upstreams, dnssec: $dnssec, bogusPriv: $bogusPriv, domainNeeded: $domainNeeded, expandHosts: $expandHosts, listeningMode: $listeningMode, port: $port, blockTTL: $blockTTL, cnameRecords: $cnameRecords, revServers: $revServers, hosts: $hosts, blocking: $blocking, rateLimit: $rateLimit)';
}


}

/// @nodoc
abstract mixin class _$DnsConfigCopyWith<$Res> implements $DnsConfigCopyWith<$Res> {
  factory _$DnsConfigCopyWith(_DnsConfig value, $Res Function(_DnsConfig) _then) = __$DnsConfigCopyWithImpl;
@override @useResult
$Res call({
 bool queryLogging, List<String>? upstreams, bool? dnssec, bool? bogusPriv, bool? domainNeeded, bool? expandHosts, String? listeningMode, int? port, int? blockTTL, List<String>? cnameRecords, List<String>? revServers, List<String>? hosts, DnsBlockingConfig? blocking, DnsRateLimitConfig? rateLimit
});


@override $DnsBlockingConfigCopyWith<$Res>? get blocking;@override $DnsRateLimitConfigCopyWith<$Res>? get rateLimit;

}
/// @nodoc
class __$DnsConfigCopyWithImpl<$Res>
    implements _$DnsConfigCopyWith<$Res> {
  __$DnsConfigCopyWithImpl(this._self, this._then);

  final _DnsConfig _self;
  final $Res Function(_DnsConfig) _then;

/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queryLogging = null,Object? upstreams = freezed,Object? dnssec = freezed,Object? bogusPriv = freezed,Object? domainNeeded = freezed,Object? expandHosts = freezed,Object? listeningMode = freezed,Object? port = freezed,Object? blockTTL = freezed,Object? cnameRecords = freezed,Object? revServers = freezed,Object? hosts = freezed,Object? blocking = freezed,Object? rateLimit = freezed,}) {
  return _then(_DnsConfig(
queryLogging: null == queryLogging ? _self.queryLogging : queryLogging // ignore: cast_nullable_to_non_nullable
as bool,upstreams: freezed == upstreams ? _self._upstreams : upstreams // ignore: cast_nullable_to_non_nullable
as List<String>?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as bool?,bogusPriv: freezed == bogusPriv ? _self.bogusPriv : bogusPriv // ignore: cast_nullable_to_non_nullable
as bool?,domainNeeded: freezed == domainNeeded ? _self.domainNeeded : domainNeeded // ignore: cast_nullable_to_non_nullable
as bool?,expandHosts: freezed == expandHosts ? _self.expandHosts : expandHosts // ignore: cast_nullable_to_non_nullable
as bool?,listeningMode: freezed == listeningMode ? _self.listeningMode : listeningMode // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int?,blockTTL: freezed == blockTTL ? _self.blockTTL : blockTTL // ignore: cast_nullable_to_non_nullable
as int?,cnameRecords: freezed == cnameRecords ? _self._cnameRecords : cnameRecords // ignore: cast_nullable_to_non_nullable
as List<String>?,revServers: freezed == revServers ? _self._revServers : revServers // ignore: cast_nullable_to_non_nullable
as List<String>?,hosts: freezed == hosts ? _self._hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<String>?,blocking: freezed == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as DnsBlockingConfig?,rateLimit: freezed == rateLimit ? _self.rateLimit : rateLimit // ignore: cast_nullable_to_non_nullable
as DnsRateLimitConfig?,
  ));
}

/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsBlockingConfigCopyWith<$Res>? get blocking {
    if (_self.blocking == null) {
    return null;
  }

  return $DnsBlockingConfigCopyWith<$Res>(_self.blocking!, (value) {
    return _then(_self.copyWith(blocking: value));
  });
}/// Create a copy of DnsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsRateLimitConfigCopyWith<$Res>? get rateLimit {
    if (_self.rateLimit == null) {
    return null;
  }

  return $DnsRateLimitConfigCopyWith<$Res>(_self.rateLimit!, (value) {
    return _then(_self.copyWith(rateLimit: value));
  });
}
}


/// @nodoc
mixin _$DnsBlockingConfig {

 bool get active; String get mode;
/// Create a copy of DnsBlockingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsBlockingConfigCopyWith<DnsBlockingConfig> get copyWith => _$DnsBlockingConfigCopyWithImpl<DnsBlockingConfig>(this as DnsBlockingConfig, _$identity);

  /// Serializes this DnsBlockingConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsBlockingConfig&&(identical(other.active, active) || other.active == active)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,mode);

@override
String toString() {
  return 'DnsBlockingConfig(active: $active, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $DnsBlockingConfigCopyWith<$Res>  {
  factory $DnsBlockingConfigCopyWith(DnsBlockingConfig value, $Res Function(DnsBlockingConfig) _then) = _$DnsBlockingConfigCopyWithImpl;
@useResult
$Res call({
 bool active, String mode
});




}
/// @nodoc
class _$DnsBlockingConfigCopyWithImpl<$Res>
    implements $DnsBlockingConfigCopyWith<$Res> {
  _$DnsBlockingConfigCopyWithImpl(this._self, this._then);

  final DnsBlockingConfig _self;
  final $Res Function(DnsBlockingConfig) _then;

/// Create a copy of DnsBlockingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? mode = null,}) {
  return _then(_self.copyWith(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsBlockingConfig].
extension DnsBlockingConfigPatterns on DnsBlockingConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsBlockingConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsBlockingConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsBlockingConfig value)  $default,){
final _that = this;
switch (_that) {
case _DnsBlockingConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsBlockingConfig value)?  $default,){
final _that = this;
switch (_that) {
case _DnsBlockingConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool active,  String mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsBlockingConfig() when $default != null:
return $default(_that.active,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool active,  String mode)  $default,) {final _that = this;
switch (_that) {
case _DnsBlockingConfig():
return $default(_that.active,_that.mode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool active,  String mode)?  $default,) {final _that = this;
switch (_that) {
case _DnsBlockingConfig() when $default != null:
return $default(_that.active,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DnsBlockingConfig implements DnsBlockingConfig {
  const _DnsBlockingConfig({required this.active, required this.mode});
  factory _DnsBlockingConfig.fromJson(Map<String, dynamic> json) => _$DnsBlockingConfigFromJson(json);

@override final  bool active;
@override final  String mode;

/// Create a copy of DnsBlockingConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsBlockingConfigCopyWith<_DnsBlockingConfig> get copyWith => __$DnsBlockingConfigCopyWithImpl<_DnsBlockingConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsBlockingConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsBlockingConfig&&(identical(other.active, active) || other.active == active)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,mode);

@override
String toString() {
  return 'DnsBlockingConfig(active: $active, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$DnsBlockingConfigCopyWith<$Res> implements $DnsBlockingConfigCopyWith<$Res> {
  factory _$DnsBlockingConfigCopyWith(_DnsBlockingConfig value, $Res Function(_DnsBlockingConfig) _then) = __$DnsBlockingConfigCopyWithImpl;
@override @useResult
$Res call({
 bool active, String mode
});




}
/// @nodoc
class __$DnsBlockingConfigCopyWithImpl<$Res>
    implements _$DnsBlockingConfigCopyWith<$Res> {
  __$DnsBlockingConfigCopyWithImpl(this._self, this._then);

  final _DnsBlockingConfig _self;
  final $Res Function(_DnsBlockingConfig) _then;

/// Create a copy of DnsBlockingConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? mode = null,}) {
  return _then(_DnsBlockingConfig(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DnsRateLimitConfig {

 int get count; int get interval;
/// Create a copy of DnsRateLimitConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsRateLimitConfigCopyWith<DnsRateLimitConfig> get copyWith => _$DnsRateLimitConfigCopyWithImpl<DnsRateLimitConfig>(this as DnsRateLimitConfig, _$identity);

  /// Serializes this DnsRateLimitConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsRateLimitConfig&&(identical(other.count, count) || other.count == count)&&(identical(other.interval, interval) || other.interval == interval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,interval);

@override
String toString() {
  return 'DnsRateLimitConfig(count: $count, interval: $interval)';
}


}

/// @nodoc
abstract mixin class $DnsRateLimitConfigCopyWith<$Res>  {
  factory $DnsRateLimitConfigCopyWith(DnsRateLimitConfig value, $Res Function(DnsRateLimitConfig) _then) = _$DnsRateLimitConfigCopyWithImpl;
@useResult
$Res call({
 int count, int interval
});




}
/// @nodoc
class _$DnsRateLimitConfigCopyWithImpl<$Res>
    implements $DnsRateLimitConfigCopyWith<$Res> {
  _$DnsRateLimitConfigCopyWithImpl(this._self, this._then);

  final DnsRateLimitConfig _self;
  final $Res Function(DnsRateLimitConfig) _then;

/// Create a copy of DnsRateLimitConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? interval = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsRateLimitConfig].
extension DnsRateLimitConfigPatterns on DnsRateLimitConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsRateLimitConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsRateLimitConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsRateLimitConfig value)  $default,){
final _that = this;
switch (_that) {
case _DnsRateLimitConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsRateLimitConfig value)?  $default,){
final _that = this;
switch (_that) {
case _DnsRateLimitConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int interval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsRateLimitConfig() when $default != null:
return $default(_that.count,_that.interval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int interval)  $default,) {final _that = this;
switch (_that) {
case _DnsRateLimitConfig():
return $default(_that.count,_that.interval);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int interval)?  $default,) {final _that = this;
switch (_that) {
case _DnsRateLimitConfig() when $default != null:
return $default(_that.count,_that.interval);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DnsRateLimitConfig implements DnsRateLimitConfig {
  const _DnsRateLimitConfig({required this.count, required this.interval});
  factory _DnsRateLimitConfig.fromJson(Map<String, dynamic> json) => _$DnsRateLimitConfigFromJson(json);

@override final  int count;
@override final  int interval;

/// Create a copy of DnsRateLimitConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsRateLimitConfigCopyWith<_DnsRateLimitConfig> get copyWith => __$DnsRateLimitConfigCopyWithImpl<_DnsRateLimitConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsRateLimitConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsRateLimitConfig&&(identical(other.count, count) || other.count == count)&&(identical(other.interval, interval) || other.interval == interval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,interval);

@override
String toString() {
  return 'DnsRateLimitConfig(count: $count, interval: $interval)';
}


}

/// @nodoc
abstract mixin class _$DnsRateLimitConfigCopyWith<$Res> implements $DnsRateLimitConfigCopyWith<$Res> {
  factory _$DnsRateLimitConfigCopyWith(_DnsRateLimitConfig value, $Res Function(_DnsRateLimitConfig) _then) = __$DnsRateLimitConfigCopyWithImpl;
@override @useResult
$Res call({
 int count, int interval
});




}
/// @nodoc
class __$DnsRateLimitConfigCopyWithImpl<$Res>
    implements _$DnsRateLimitConfigCopyWith<$Res> {
  __$DnsRateLimitConfigCopyWithImpl(this._self, this._then);

  final _DnsRateLimitConfig _self;
  final $Res Function(_DnsRateLimitConfig) _then;

/// Create a copy of DnsRateLimitConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? interval = null,}) {
  return _then(_DnsRateLimitConfig(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
