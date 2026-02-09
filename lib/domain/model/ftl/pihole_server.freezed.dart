// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pihole_server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PiholeServer {

 FtlHost? get host; FtlSensor? get sensor; FtlSystem? get system; FtlVersion? get version;
/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PiholeServerCopyWith<PiholeServer> get copyWith => _$PiholeServerCopyWithImpl<PiholeServer>(this as PiholeServer, _$identity);

  /// Serializes this PiholeServer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PiholeServer&&(identical(other.host, host) || other.host == host)&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.system, system) || other.system == system)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,sensor,system,version);

@override
String toString() {
  return 'PiholeServer(host: $host, sensor: $sensor, system: $system, version: $version)';
}


}

/// @nodoc
abstract mixin class $PiholeServerCopyWith<$Res>  {
  factory $PiholeServerCopyWith(PiholeServer value, $Res Function(PiholeServer) _then) = _$PiholeServerCopyWithImpl;
@useResult
$Res call({
 FtlHost? host, FtlSensor? sensor, FtlSystem? system, FtlVersion? version
});


$FtlHostCopyWith<$Res>? get host;$FtlSensorCopyWith<$Res>? get sensor;$FtlSystemCopyWith<$Res>? get system;$FtlVersionCopyWith<$Res>? get version;

}
/// @nodoc
class _$PiholeServerCopyWithImpl<$Res>
    implements $PiholeServerCopyWith<$Res> {
  _$PiholeServerCopyWithImpl(this._self, this._then);

  final PiholeServer _self;
  final $Res Function(PiholeServer) _then;

/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = freezed,Object? sensor = freezed,Object? system = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as FtlHost?,sensor: freezed == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as FtlSensor?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as FtlSystem?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as FtlVersion?,
  ));
}
/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlHostCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $FtlHostCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlSensorCopyWith<$Res>? get sensor {
    if (_self.sensor == null) {
    return null;
  }

  return $FtlSensorCopyWith<$Res>(_self.sensor!, (value) {
    return _then(_self.copyWith(sensor: value));
  });
}/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $FtlSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlVersionCopyWith<$Res>? get version {
    if (_self.version == null) {
    return null;
  }

  return $FtlVersionCopyWith<$Res>(_self.version!, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// Adds pattern-matching-related methods to [PiholeServer].
extension PiholeServerPatterns on PiholeServer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PiholeServer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PiholeServer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PiholeServer value)  $default,){
final _that = this;
switch (_that) {
case _PiholeServer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PiholeServer value)?  $default,){
final _that = this;
switch (_that) {
case _PiholeServer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FtlHost? host,  FtlSensor? sensor,  FtlSystem? system,  FtlVersion? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PiholeServer() when $default != null:
return $default(_that.host,_that.sensor,_that.system,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FtlHost? host,  FtlSensor? sensor,  FtlSystem? system,  FtlVersion? version)  $default,) {final _that = this;
switch (_that) {
case _PiholeServer():
return $default(_that.host,_that.sensor,_that.system,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FtlHost? host,  FtlSensor? sensor,  FtlSystem? system,  FtlVersion? version)?  $default,) {final _that = this;
switch (_that) {
case _PiholeServer() when $default != null:
return $default(_that.host,_that.sensor,_that.system,_that.version);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PiholeServer implements PiholeServer {
  const _PiholeServer({this.host, this.sensor, this.system, this.version});
  factory _PiholeServer.fromJson(Map<String, dynamic> json) => _$PiholeServerFromJson(json);

@override final  FtlHost? host;
@override final  FtlSensor? sensor;
@override final  FtlSystem? system;
@override final  FtlVersion? version;

/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PiholeServerCopyWith<_PiholeServer> get copyWith => __$PiholeServerCopyWithImpl<_PiholeServer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PiholeServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PiholeServer&&(identical(other.host, host) || other.host == host)&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.system, system) || other.system == system)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,sensor,system,version);

@override
String toString() {
  return 'PiholeServer(host: $host, sensor: $sensor, system: $system, version: $version)';
}


}

/// @nodoc
abstract mixin class _$PiholeServerCopyWith<$Res> implements $PiholeServerCopyWith<$Res> {
  factory _$PiholeServerCopyWith(_PiholeServer value, $Res Function(_PiholeServer) _then) = __$PiholeServerCopyWithImpl;
@override @useResult
$Res call({
 FtlHost? host, FtlSensor? sensor, FtlSystem? system, FtlVersion? version
});


@override $FtlHostCopyWith<$Res>? get host;@override $FtlSensorCopyWith<$Res>? get sensor;@override $FtlSystemCopyWith<$Res>? get system;@override $FtlVersionCopyWith<$Res>? get version;

}
/// @nodoc
class __$PiholeServerCopyWithImpl<$Res>
    implements _$PiholeServerCopyWith<$Res> {
  __$PiholeServerCopyWithImpl(this._self, this._then);

  final _PiholeServer _self;
  final $Res Function(_PiholeServer) _then;

/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = freezed,Object? sensor = freezed,Object? system = freezed,Object? version = freezed,}) {
  return _then(_PiholeServer(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as FtlHost?,sensor: freezed == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as FtlSensor?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as FtlSystem?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as FtlVersion?,
  ));
}

/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlHostCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $FtlHostCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlSensorCopyWith<$Res>? get sensor {
    if (_self.sensor == null) {
    return null;
  }

  return $FtlSensorCopyWith<$Res>(_self.sensor!, (value) {
    return _then(_self.copyWith(sensor: value));
  });
}/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $FtlSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of PiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlVersionCopyWith<$Res>? get version {
    if (_self.version == null) {
    return null;
  }

  return $FtlVersionCopyWith<$Res>(_self.version!, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}

// dart format on
