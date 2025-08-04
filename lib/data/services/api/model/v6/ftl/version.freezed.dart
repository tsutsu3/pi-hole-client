// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoVersion {

 VersionData get version; double get took;
/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoVersionCopyWith<InfoVersion> get copyWith => _$InfoVersionCopyWithImpl<InfoVersion>(this as InfoVersion, _$identity);

  /// Serializes this InfoVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoVersion&&(identical(other.version, version) || other.version == version)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,took);

@override
String toString() {
  return 'InfoVersion(version: $version, took: $took)';
}


}

/// @nodoc
abstract mixin class $InfoVersionCopyWith<$Res>  {
  factory $InfoVersionCopyWith(InfoVersion value, $Res Function(InfoVersion) _then) = _$InfoVersionCopyWithImpl;
@useResult
$Res call({
 VersionData version, double took
});


$VersionDataCopyWith<$Res> get version;

}
/// @nodoc
class _$InfoVersionCopyWithImpl<$Res>
    implements $InfoVersionCopyWith<$Res> {
  _$InfoVersionCopyWithImpl(this._self, this._then);

  final InfoVersion _self;
  final $Res Function(InfoVersion) _then;

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? took = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as VersionData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDataCopyWith<$Res> get version {
  
  return $VersionDataCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoVersion].
extension InfoVersionPatterns on InfoVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoVersion value)  $default,){
final _that = this;
switch (_that) {
case _InfoVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoVersion value)?  $default,){
final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VersionData version,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
return $default(_that.version,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VersionData version,  double took)  $default,) {final _that = this;
switch (_that) {
case _InfoVersion():
return $default(_that.version,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VersionData version,  double took)?  $default,) {final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
return $default(_that.version,_that.took);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoVersion implements InfoVersion {
  const _InfoVersion({required this.version, required this.took});
  factory _InfoVersion.fromJson(Map<String, dynamic> json) => _$InfoVersionFromJson(json);

@override final  VersionData version;
@override final  double took;

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoVersionCopyWith<_InfoVersion> get copyWith => __$InfoVersionCopyWithImpl<_InfoVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoVersion&&(identical(other.version, version) || other.version == version)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,took);

@override
String toString() {
  return 'InfoVersion(version: $version, took: $took)';
}


}

/// @nodoc
abstract mixin class _$InfoVersionCopyWith<$Res> implements $InfoVersionCopyWith<$Res> {
  factory _$InfoVersionCopyWith(_InfoVersion value, $Res Function(_InfoVersion) _then) = __$InfoVersionCopyWithImpl;
@override @useResult
$Res call({
 VersionData version, double took
});


@override $VersionDataCopyWith<$Res> get version;

}
/// @nodoc
class __$InfoVersionCopyWithImpl<$Res>
    implements _$InfoVersionCopyWith<$Res> {
  __$InfoVersionCopyWithImpl(this._self, this._then);

  final _InfoVersion _self;
  final $Res Function(_InfoVersion) _then;

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? took = null,}) {
  return _then(_InfoVersion(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as VersionData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of InfoVersion
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
mixin _$VersionData {

 Core get core; Web get web; FTL get ftl; Docker get docker;
/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionDataCopyWith<VersionData> get copyWith => _$VersionDataCopyWithImpl<VersionData>(this as VersionData, _$identity);

  /// Serializes this VersionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionData&&(identical(other.core, core) || other.core == core)&&(identical(other.web, web) || other.web == web)&&(identical(other.ftl, ftl) || other.ftl == ftl)&&(identical(other.docker, docker) || other.docker == docker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,core,web,ftl,docker);

@override
String toString() {
  return 'VersionData(core: $core, web: $web, ftl: $ftl, docker: $docker)';
}


}

/// @nodoc
abstract mixin class $VersionDataCopyWith<$Res>  {
  factory $VersionDataCopyWith(VersionData value, $Res Function(VersionData) _then) = _$VersionDataCopyWithImpl;
@useResult
$Res call({
 Core core, Web web, FTL ftl, Docker docker
});


$CoreCopyWith<$Res> get core;$WebCopyWith<$Res> get web;$FTLCopyWith<$Res> get ftl;$DockerCopyWith<$Res> get docker;

}
/// @nodoc
class _$VersionDataCopyWithImpl<$Res>
    implements $VersionDataCopyWith<$Res> {
  _$VersionDataCopyWithImpl(this._self, this._then);

  final VersionData _self;
  final $Res Function(VersionData) _then;

/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? core = null,Object? web = null,Object? ftl = null,Object? docker = null,}) {
  return _then(_self.copyWith(
core: null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as Core,web: null == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as Web,ftl: null == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as FTL,docker: null == docker ? _self.docker : docker // ignore: cast_nullable_to_non_nullable
as Docker,
  ));
}
/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreCopyWith<$Res> get core {
  
  return $CoreCopyWith<$Res>(_self.core, (value) {
    return _then(_self.copyWith(core: value));
  });
}/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebCopyWith<$Res> get web {
  
  return $WebCopyWith<$Res>(_self.web, (value) {
    return _then(_self.copyWith(web: value));
  });
}/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FTLCopyWith<$Res> get ftl {
  
  return $FTLCopyWith<$Res>(_self.ftl, (value) {
    return _then(_self.copyWith(ftl: value));
  });
}/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DockerCopyWith<$Res> get docker {
  
  return $DockerCopyWith<$Res>(_self.docker, (value) {
    return _then(_self.copyWith(docker: value));
  });
}
}


/// Adds pattern-matching-related methods to [VersionData].
extension VersionDataPatterns on VersionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersionData value)  $default,){
final _that = this;
switch (_that) {
case _VersionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersionData value)?  $default,){
final _that = this;
switch (_that) {
case _VersionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Core core,  Web web,  FTL ftl,  Docker docker)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VersionData() when $default != null:
return $default(_that.core,_that.web,_that.ftl,_that.docker);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Core core,  Web web,  FTL ftl,  Docker docker)  $default,) {final _that = this;
switch (_that) {
case _VersionData():
return $default(_that.core,_that.web,_that.ftl,_that.docker);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Core core,  Web web,  FTL ftl,  Docker docker)?  $default,) {final _that = this;
switch (_that) {
case _VersionData() when $default != null:
return $default(_that.core,_that.web,_that.ftl,_that.docker);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _VersionData implements VersionData {
  const _VersionData({required this.core, required this.web, required this.ftl, required this.docker});
  factory _VersionData.fromJson(Map<String, dynamic> json) => _$VersionDataFromJson(json);

@override final  Core core;
@override final  Web web;
@override final  FTL ftl;
@override final  Docker docker;

/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionDataCopyWith<_VersionData> get copyWith => __$VersionDataCopyWithImpl<_VersionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionData&&(identical(other.core, core) || other.core == core)&&(identical(other.web, web) || other.web == web)&&(identical(other.ftl, ftl) || other.ftl == ftl)&&(identical(other.docker, docker) || other.docker == docker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,core,web,ftl,docker);

@override
String toString() {
  return 'VersionData(core: $core, web: $web, ftl: $ftl, docker: $docker)';
}


}

/// @nodoc
abstract mixin class _$VersionDataCopyWith<$Res> implements $VersionDataCopyWith<$Res> {
  factory _$VersionDataCopyWith(_VersionData value, $Res Function(_VersionData) _then) = __$VersionDataCopyWithImpl;
@override @useResult
$Res call({
 Core core, Web web, FTL ftl, Docker docker
});


@override $CoreCopyWith<$Res> get core;@override $WebCopyWith<$Res> get web;@override $FTLCopyWith<$Res> get ftl;@override $DockerCopyWith<$Res> get docker;

}
/// @nodoc
class __$VersionDataCopyWithImpl<$Res>
    implements _$VersionDataCopyWith<$Res> {
  __$VersionDataCopyWithImpl(this._self, this._then);

  final _VersionData _self;
  final $Res Function(_VersionData) _then;

/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? core = null,Object? web = null,Object? ftl = null,Object? docker = null,}) {
  return _then(_VersionData(
core: null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as Core,web: null == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as Web,ftl: null == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as FTL,docker: null == docker ? _self.docker : docker // ignore: cast_nullable_to_non_nullable
as Docker,
  ));
}

/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreCopyWith<$Res> get core {
  
  return $CoreCopyWith<$Res>(_self.core, (value) {
    return _then(_self.copyWith(core: value));
  });
}/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebCopyWith<$Res> get web {
  
  return $WebCopyWith<$Res>(_self.web, (value) {
    return _then(_self.copyWith(web: value));
  });
}/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FTLCopyWith<$Res> get ftl {
  
  return $FTLCopyWith<$Res>(_self.ftl, (value) {
    return _then(_self.copyWith(ftl: value));
  });
}/// Create a copy of VersionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DockerCopyWith<$Res> get docker {
  
  return $DockerCopyWith<$Res>(_self.docker, (value) {
    return _then(_self.copyWith(docker: value));
  });
}
}


/// @nodoc
mixin _$Core {

 LocalVersion get local; RemoteVersion get remote;
/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreCopyWith<Core> get copyWith => _$CoreCopyWithImpl<Core>(this as Core, _$identity);

  /// Serializes this Core to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Core&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'Core(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class $CoreCopyWith<$Res>  {
  factory $CoreCopyWith(Core value, $Res Function(Core) _then) = _$CoreCopyWithImpl;
@useResult
$Res call({
 LocalVersion local, RemoteVersion remote
});


$LocalVersionCopyWith<$Res> get local;$RemoteVersionCopyWith<$Res> get remote;

}
/// @nodoc
class _$CoreCopyWithImpl<$Res>
    implements $CoreCopyWith<$Res> {
  _$CoreCopyWithImpl(this._self, this._then);

  final Core _self;
  final $Res Function(Core) _then;

/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? local = null,Object? remote = null,}) {
  return _then(_self.copyWith(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as LocalVersion,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as RemoteVersion,
  ));
}
/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalVersionCopyWith<$Res> get local {
  
  return $LocalVersionCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<$Res> get remote {
  
  return $RemoteVersionCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// Adds pattern-matching-related methods to [Core].
extension CorePatterns on Core {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Core value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Core() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Core value)  $default,){
final _that = this;
switch (_that) {
case _Core():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Core value)?  $default,){
final _that = this;
switch (_that) {
case _Core() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocalVersion local,  RemoteVersion remote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Core() when $default != null:
return $default(_that.local,_that.remote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocalVersion local,  RemoteVersion remote)  $default,) {final _that = this;
switch (_that) {
case _Core():
return $default(_that.local,_that.remote);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocalVersion local,  RemoteVersion remote)?  $default,) {final _that = this;
switch (_that) {
case _Core() when $default != null:
return $default(_that.local,_that.remote);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Core implements Core {
  const _Core({required this.local, required this.remote});
  factory _Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);

@override final  LocalVersion local;
@override final  RemoteVersion remote;

/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoreCopyWith<_Core> get copyWith => __$CoreCopyWithImpl<_Core>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Core&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'Core(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class _$CoreCopyWith<$Res> implements $CoreCopyWith<$Res> {
  factory _$CoreCopyWith(_Core value, $Res Function(_Core) _then) = __$CoreCopyWithImpl;
@override @useResult
$Res call({
 LocalVersion local, RemoteVersion remote
});


@override $LocalVersionCopyWith<$Res> get local;@override $RemoteVersionCopyWith<$Res> get remote;

}
/// @nodoc
class __$CoreCopyWithImpl<$Res>
    implements _$CoreCopyWith<$Res> {
  __$CoreCopyWithImpl(this._self, this._then);

  final _Core _self;
  final $Res Function(_Core) _then;

/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? local = null,Object? remote = null,}) {
  return _then(_Core(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as LocalVersion,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as RemoteVersion,
  ));
}

/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalVersionCopyWith<$Res> get local {
  
  return $LocalVersionCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of Core
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<$Res> get remote {
  
  return $RemoteVersionCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// @nodoc
mixin _$Web {

 LocalVersion get local; RemoteVersion get remote;
/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebCopyWith<Web> get copyWith => _$WebCopyWithImpl<Web>(this as Web, _$identity);

  /// Serializes this Web to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Web&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'Web(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class $WebCopyWith<$Res>  {
  factory $WebCopyWith(Web value, $Res Function(Web) _then) = _$WebCopyWithImpl;
@useResult
$Res call({
 LocalVersion local, RemoteVersion remote
});


$LocalVersionCopyWith<$Res> get local;$RemoteVersionCopyWith<$Res> get remote;

}
/// @nodoc
class _$WebCopyWithImpl<$Res>
    implements $WebCopyWith<$Res> {
  _$WebCopyWithImpl(this._self, this._then);

  final Web _self;
  final $Res Function(Web) _then;

/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? local = null,Object? remote = null,}) {
  return _then(_self.copyWith(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as LocalVersion,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as RemoteVersion,
  ));
}
/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalVersionCopyWith<$Res> get local {
  
  return $LocalVersionCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<$Res> get remote {
  
  return $RemoteVersionCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// Adds pattern-matching-related methods to [Web].
extension WebPatterns on Web {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Web value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Web() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Web value)  $default,){
final _that = this;
switch (_that) {
case _Web():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Web value)?  $default,){
final _that = this;
switch (_that) {
case _Web() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocalVersion local,  RemoteVersion remote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Web() when $default != null:
return $default(_that.local,_that.remote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocalVersion local,  RemoteVersion remote)  $default,) {final _that = this;
switch (_that) {
case _Web():
return $default(_that.local,_that.remote);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocalVersion local,  RemoteVersion remote)?  $default,) {final _that = this;
switch (_that) {
case _Web() when $default != null:
return $default(_that.local,_that.remote);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Web implements Web {
  const _Web({required this.local, required this.remote});
  factory _Web.fromJson(Map<String, dynamic> json) => _$WebFromJson(json);

@override final  LocalVersion local;
@override final  RemoteVersion remote;

/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebCopyWith<_Web> get copyWith => __$WebCopyWithImpl<_Web>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Web&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'Web(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class _$WebCopyWith<$Res> implements $WebCopyWith<$Res> {
  factory _$WebCopyWith(_Web value, $Res Function(_Web) _then) = __$WebCopyWithImpl;
@override @useResult
$Res call({
 LocalVersion local, RemoteVersion remote
});


@override $LocalVersionCopyWith<$Res> get local;@override $RemoteVersionCopyWith<$Res> get remote;

}
/// @nodoc
class __$WebCopyWithImpl<$Res>
    implements _$WebCopyWith<$Res> {
  __$WebCopyWithImpl(this._self, this._then);

  final _Web _self;
  final $Res Function(_Web) _then;

/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? local = null,Object? remote = null,}) {
  return _then(_Web(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as LocalVersion,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as RemoteVersion,
  ));
}

/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalVersionCopyWith<$Res> get local {
  
  return $LocalVersionCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of Web
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<$Res> get remote {
  
  return $RemoteVersionCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// @nodoc
mixin _$FTL {

 LocalFTL get local; RemoteVersion get remote;
/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FTLCopyWith<FTL> get copyWith => _$FTLCopyWithImpl<FTL>(this as FTL, _$identity);

  /// Serializes this FTL to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FTL&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'FTL(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class $FTLCopyWith<$Res>  {
  factory $FTLCopyWith(FTL value, $Res Function(FTL) _then) = _$FTLCopyWithImpl;
@useResult
$Res call({
 LocalFTL local, RemoteVersion remote
});


$LocalFTLCopyWith<$Res> get local;$RemoteVersionCopyWith<$Res> get remote;

}
/// @nodoc
class _$FTLCopyWithImpl<$Res>
    implements $FTLCopyWith<$Res> {
  _$FTLCopyWithImpl(this._self, this._then);

  final FTL _self;
  final $Res Function(FTL) _then;

/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? local = null,Object? remote = null,}) {
  return _then(_self.copyWith(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as LocalFTL,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as RemoteVersion,
  ));
}
/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalFTLCopyWith<$Res> get local {
  
  return $LocalFTLCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<$Res> get remote {
  
  return $RemoteVersionCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// Adds pattern-matching-related methods to [FTL].
extension FTLPatterns on FTL {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FTL value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FTL() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FTL value)  $default,){
final _that = this;
switch (_that) {
case _FTL():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FTL value)?  $default,){
final _that = this;
switch (_that) {
case _FTL() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocalFTL local,  RemoteVersion remote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FTL() when $default != null:
return $default(_that.local,_that.remote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocalFTL local,  RemoteVersion remote)  $default,) {final _that = this;
switch (_that) {
case _FTL():
return $default(_that.local,_that.remote);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocalFTL local,  RemoteVersion remote)?  $default,) {final _that = this;
switch (_that) {
case _FTL() when $default != null:
return $default(_that.local,_that.remote);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _FTL implements FTL {
  const _FTL({required this.local, required this.remote});
  factory _FTL.fromJson(Map<String, dynamic> json) => _$FTLFromJson(json);

@override final  LocalFTL local;
@override final  RemoteVersion remote;

/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FTLCopyWith<_FTL> get copyWith => __$FTLCopyWithImpl<_FTL>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FTLToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FTL&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'FTL(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class _$FTLCopyWith<$Res> implements $FTLCopyWith<$Res> {
  factory _$FTLCopyWith(_FTL value, $Res Function(_FTL) _then) = __$FTLCopyWithImpl;
@override @useResult
$Res call({
 LocalFTL local, RemoteVersion remote
});


@override $LocalFTLCopyWith<$Res> get local;@override $RemoteVersionCopyWith<$Res> get remote;

}
/// @nodoc
class __$FTLCopyWithImpl<$Res>
    implements _$FTLCopyWith<$Res> {
  __$FTLCopyWithImpl(this._self, this._then);

  final _FTL _self;
  final $Res Function(_FTL) _then;

/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? local = null,Object? remote = null,}) {
  return _then(_FTL(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as LocalFTL,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as RemoteVersion,
  ));
}

/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalFTLCopyWith<$Res> get local {
  
  return $LocalFTLCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of FTL
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<$Res> get remote {
  
  return $RemoteVersionCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// @nodoc
mixin _$Docker {

 String? get local; String? get remote;
/// Create a copy of Docker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DockerCopyWith<Docker> get copyWith => _$DockerCopyWithImpl<Docker>(this as Docker, _$identity);

  /// Serializes this Docker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Docker&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'Docker(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class $DockerCopyWith<$Res>  {
  factory $DockerCopyWith(Docker value, $Res Function(Docker) _then) = _$DockerCopyWithImpl;
@useResult
$Res call({
 String? local, String? remote
});




}
/// @nodoc
class _$DockerCopyWithImpl<$Res>
    implements $DockerCopyWith<$Res> {
  _$DockerCopyWithImpl(this._self, this._then);

  final Docker _self;
  final $Res Function(Docker) _then;

/// Create a copy of Docker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? local = freezed,Object? remote = freezed,}) {
  return _then(_self.copyWith(
local: freezed == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Docker].
extension DockerPatterns on Docker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Docker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Docker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Docker value)  $default,){
final _that = this;
switch (_that) {
case _Docker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Docker value)?  $default,){
final _that = this;
switch (_that) {
case _Docker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? local,  String? remote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Docker() when $default != null:
return $default(_that.local,_that.remote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? local,  String? remote)  $default,) {final _that = this;
switch (_that) {
case _Docker():
return $default(_that.local,_that.remote);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? local,  String? remote)?  $default,) {final _that = this;
switch (_that) {
case _Docker() when $default != null:
return $default(_that.local,_that.remote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Docker implements Docker {
  const _Docker({required this.local, required this.remote});
  factory _Docker.fromJson(Map<String, dynamic> json) => _$DockerFromJson(json);

@override final  String? local;
@override final  String? remote;

/// Create a copy of Docker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DockerCopyWith<_Docker> get copyWith => __$DockerCopyWithImpl<_Docker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DockerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Docker&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote);

@override
String toString() {
  return 'Docker(local: $local, remote: $remote)';
}


}

/// @nodoc
abstract mixin class _$DockerCopyWith<$Res> implements $DockerCopyWith<$Res> {
  factory _$DockerCopyWith(_Docker value, $Res Function(_Docker) _then) = __$DockerCopyWithImpl;
@override @useResult
$Res call({
 String? local, String? remote
});




}
/// @nodoc
class __$DockerCopyWithImpl<$Res>
    implements _$DockerCopyWith<$Res> {
  __$DockerCopyWithImpl(this._self, this._then);

  final _Docker _self;
  final $Res Function(_Docker) _then;

/// Create a copy of Docker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? local = freezed,Object? remote = freezed,}) {
  return _then(_Docker(
local: freezed == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LocalVersion {

 String? get branch; String? get version; String? get hash;
/// Create a copy of LocalVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalVersionCopyWith<LocalVersion> get copyWith => _$LocalVersionCopyWithImpl<LocalVersion>(this as LocalVersion, _$identity);

  /// Serializes this LocalVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalVersion&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branch,version,hash);

@override
String toString() {
  return 'LocalVersion(branch: $branch, version: $version, hash: $hash)';
}


}

/// @nodoc
abstract mixin class $LocalVersionCopyWith<$Res>  {
  factory $LocalVersionCopyWith(LocalVersion value, $Res Function(LocalVersion) _then) = _$LocalVersionCopyWithImpl;
@useResult
$Res call({
 String? branch, String? version, String? hash
});




}
/// @nodoc
class _$LocalVersionCopyWithImpl<$Res>
    implements $LocalVersionCopyWith<$Res> {
  _$LocalVersionCopyWithImpl(this._self, this._then);

  final LocalVersion _self;
  final $Res Function(LocalVersion) _then;

/// Create a copy of LocalVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branch = freezed,Object? version = freezed,Object? hash = freezed,}) {
  return _then(_self.copyWith(
branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalVersion].
extension LocalVersionPatterns on LocalVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalVersion value)  $default,){
final _that = this;
switch (_that) {
case _LocalVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalVersion value)?  $default,){
final _that = this;
switch (_that) {
case _LocalVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? branch,  String? version,  String? hash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalVersion() when $default != null:
return $default(_that.branch,_that.version,_that.hash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? branch,  String? version,  String? hash)  $default,) {final _that = this;
switch (_that) {
case _LocalVersion():
return $default(_that.branch,_that.version,_that.hash);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? branch,  String? version,  String? hash)?  $default,) {final _that = this;
switch (_that) {
case _LocalVersion() when $default != null:
return $default(_that.branch,_that.version,_that.hash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalVersion implements LocalVersion {
  const _LocalVersion({required this.branch, required this.version, required this.hash});
  factory _LocalVersion.fromJson(Map<String, dynamic> json) => _$LocalVersionFromJson(json);

@override final  String? branch;
@override final  String? version;
@override final  String? hash;

/// Create a copy of LocalVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalVersionCopyWith<_LocalVersion> get copyWith => __$LocalVersionCopyWithImpl<_LocalVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalVersion&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branch,version,hash);

@override
String toString() {
  return 'LocalVersion(branch: $branch, version: $version, hash: $hash)';
}


}

/// @nodoc
abstract mixin class _$LocalVersionCopyWith<$Res> implements $LocalVersionCopyWith<$Res> {
  factory _$LocalVersionCopyWith(_LocalVersion value, $Res Function(_LocalVersion) _then) = __$LocalVersionCopyWithImpl;
@override @useResult
$Res call({
 String? branch, String? version, String? hash
});




}
/// @nodoc
class __$LocalVersionCopyWithImpl<$Res>
    implements _$LocalVersionCopyWith<$Res> {
  __$LocalVersionCopyWithImpl(this._self, this._then);

  final _LocalVersion _self;
  final $Res Function(_LocalVersion) _then;

/// Create a copy of LocalVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branch = freezed,Object? version = freezed,Object? hash = freezed,}) {
  return _then(_LocalVersion(
branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RemoteVersion {

 String? get version; String? get hash;
/// Create a copy of RemoteVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteVersionCopyWith<RemoteVersion> get copyWith => _$RemoteVersionCopyWithImpl<RemoteVersion>(this as RemoteVersion, _$identity);

  /// Serializes this RemoteVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteVersion&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,hash);

@override
String toString() {
  return 'RemoteVersion(version: $version, hash: $hash)';
}


}

/// @nodoc
abstract mixin class $RemoteVersionCopyWith<$Res>  {
  factory $RemoteVersionCopyWith(RemoteVersion value, $Res Function(RemoteVersion) _then) = _$RemoteVersionCopyWithImpl;
@useResult
$Res call({
 String? version, String? hash
});




}
/// @nodoc
class _$RemoteVersionCopyWithImpl<$Res>
    implements $RemoteVersionCopyWith<$Res> {
  _$RemoteVersionCopyWithImpl(this._self, this._then);

  final RemoteVersion _self;
  final $Res Function(RemoteVersion) _then;

/// Create a copy of RemoteVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = freezed,Object? hash = freezed,}) {
  return _then(_self.copyWith(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteVersion].
extension RemoteVersionPatterns on RemoteVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteVersion value)  $default,){
final _that = this;
switch (_that) {
case _RemoteVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteVersion value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? version,  String? hash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteVersion() when $default != null:
return $default(_that.version,_that.hash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? version,  String? hash)  $default,) {final _that = this;
switch (_that) {
case _RemoteVersion():
return $default(_that.version,_that.hash);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? version,  String? hash)?  $default,) {final _that = this;
switch (_that) {
case _RemoteVersion() when $default != null:
return $default(_that.version,_that.hash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteVersion implements RemoteVersion {
  const _RemoteVersion({required this.version, required this.hash});
  factory _RemoteVersion.fromJson(Map<String, dynamic> json) => _$RemoteVersionFromJson(json);

@override final  String? version;
@override final  String? hash;

/// Create a copy of RemoteVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteVersionCopyWith<_RemoteVersion> get copyWith => __$RemoteVersionCopyWithImpl<_RemoteVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteVersion&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,hash);

@override
String toString() {
  return 'RemoteVersion(version: $version, hash: $hash)';
}


}

/// @nodoc
abstract mixin class _$RemoteVersionCopyWith<$Res> implements $RemoteVersionCopyWith<$Res> {
  factory _$RemoteVersionCopyWith(_RemoteVersion value, $Res Function(_RemoteVersion) _then) = __$RemoteVersionCopyWithImpl;
@override @useResult
$Res call({
 String? version, String? hash
});




}
/// @nodoc
class __$RemoteVersionCopyWithImpl<$Res>
    implements _$RemoteVersionCopyWith<$Res> {
  __$RemoteVersionCopyWithImpl(this._self, this._then);

  final _RemoteVersion _self;
  final $Res Function(_RemoteVersion) _then;

/// Create a copy of RemoteVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = freezed,Object? hash = freezed,}) {
  return _then(_RemoteVersion(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LocalFTL {

 String? get branch; String? get version; String? get hash; String? get date;
/// Create a copy of LocalFTL
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalFTLCopyWith<LocalFTL> get copyWith => _$LocalFTLCopyWithImpl<LocalFTL>(this as LocalFTL, _$identity);

  /// Serializes this LocalFTL to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalFTL&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branch,version,hash,date);

@override
String toString() {
  return 'LocalFTL(branch: $branch, version: $version, hash: $hash, date: $date)';
}


}

/// @nodoc
abstract mixin class $LocalFTLCopyWith<$Res>  {
  factory $LocalFTLCopyWith(LocalFTL value, $Res Function(LocalFTL) _then) = _$LocalFTLCopyWithImpl;
@useResult
$Res call({
 String? branch, String? version, String? hash, String? date
});




}
/// @nodoc
class _$LocalFTLCopyWithImpl<$Res>
    implements $LocalFTLCopyWith<$Res> {
  _$LocalFTLCopyWithImpl(this._self, this._then);

  final LocalFTL _self;
  final $Res Function(LocalFTL) _then;

/// Create a copy of LocalFTL
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branch = freezed,Object? version = freezed,Object? hash = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalFTL].
extension LocalFTLPatterns on LocalFTL {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalFTL value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalFTL() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalFTL value)  $default,){
final _that = this;
switch (_that) {
case _LocalFTL():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalFTL value)?  $default,){
final _that = this;
switch (_that) {
case _LocalFTL() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? branch,  String? version,  String? hash,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalFTL() when $default != null:
return $default(_that.branch,_that.version,_that.hash,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? branch,  String? version,  String? hash,  String? date)  $default,) {final _that = this;
switch (_that) {
case _LocalFTL():
return $default(_that.branch,_that.version,_that.hash,_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? branch,  String? version,  String? hash,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _LocalFTL() when $default != null:
return $default(_that.branch,_that.version,_that.hash,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalFTL implements LocalFTL {
  const _LocalFTL({required this.branch, required this.version, required this.hash, required this.date});
  factory _LocalFTL.fromJson(Map<String, dynamic> json) => _$LocalFTLFromJson(json);

@override final  String? branch;
@override final  String? version;
@override final  String? hash;
@override final  String? date;

/// Create a copy of LocalFTL
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalFTLCopyWith<_LocalFTL> get copyWith => __$LocalFTLCopyWithImpl<_LocalFTL>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalFTLToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalFTL&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branch,version,hash,date);

@override
String toString() {
  return 'LocalFTL(branch: $branch, version: $version, hash: $hash, date: $date)';
}


}

/// @nodoc
abstract mixin class _$LocalFTLCopyWith<$Res> implements $LocalFTLCopyWith<$Res> {
  factory _$LocalFTLCopyWith(_LocalFTL value, $Res Function(_LocalFTL) _then) = __$LocalFTLCopyWithImpl;
@override @useResult
$Res call({
 String? branch, String? version, String? hash, String? date
});




}
/// @nodoc
class __$LocalFTLCopyWithImpl<$Res>
    implements _$LocalFTLCopyWith<$Res> {
  __$LocalFTLCopyWithImpl(this._self, this._then);

  final _LocalFTL _self;
  final $Res Function(_LocalFTL) _then;

/// Create a copy of LocalFTL
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branch = freezed,Object? version = freezed,Object? hash = freezed,Object? date = freezed,}) {
  return _then(_LocalFTL(
branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
