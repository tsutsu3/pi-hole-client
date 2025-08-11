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
mixin _$InfoPiholeServer {

 InfoHost? get host; InfoSensor? get sensor; InfoSystem? get system; InfoVersion? get version;
/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoPiholeServerCopyWith<InfoPiholeServer> get copyWith => _$InfoPiholeServerCopyWithImpl<InfoPiholeServer>(this as InfoPiholeServer, _$identity);

  /// Serializes this InfoPiholeServer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoPiholeServer&&(identical(other.host, host) || other.host == host)&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.system, system) || other.system == system)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,sensor,system,version);

@override
String toString() {
  return 'InfoPiholeServer(host: $host, sensor: $sensor, system: $system, version: $version)';
}


}

/// @nodoc
abstract mixin class $InfoPiholeServerCopyWith<$Res>  {
  factory $InfoPiholeServerCopyWith(InfoPiholeServer value, $Res Function(InfoPiholeServer) _then) = _$InfoPiholeServerCopyWithImpl;
@useResult
$Res call({
 InfoHost? host, InfoSensor? sensor, InfoSystem? system, InfoVersion? version
});


$InfoHostCopyWith<$Res>? get host;$InfoSensorCopyWith<$Res>? get sensor;$InfoSystemCopyWith<$Res>? get system;$InfoVersionCopyWith<$Res>? get version;

}
/// @nodoc
class _$InfoPiholeServerCopyWithImpl<$Res>
    implements $InfoPiholeServerCopyWith<$Res> {
  _$InfoPiholeServerCopyWithImpl(this._self, this._then);

  final InfoPiholeServer _self;
  final $Res Function(InfoPiholeServer) _then;

/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = freezed,Object? sensor = freezed,Object? system = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as InfoHost?,sensor: freezed == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as InfoSensor?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as InfoSystem?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as InfoVersion?,
  ));
}
/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoHostCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $InfoHostCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoSensorCopyWith<$Res>? get sensor {
    if (_self.sensor == null) {
    return null;
  }

  return $InfoSensorCopyWith<$Res>(_self.sensor!, (value) {
    return _then(_self.copyWith(sensor: value));
  });
}/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $InfoSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoVersionCopyWith<$Res>? get version {
    if (_self.version == null) {
    return null;
  }

  return $InfoVersionCopyWith<$Res>(_self.version!, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoPiholeServer].
extension InfoPiholeServerPatterns on InfoPiholeServer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoPiholeServer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoPiholeServer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoPiholeServer value)  $default,){
final _that = this;
switch (_that) {
case _InfoPiholeServer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoPiholeServer value)?  $default,){
final _that = this;
switch (_that) {
case _InfoPiholeServer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InfoHost? host,  InfoSensor? sensor,  InfoSystem? system,  InfoVersion? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoPiholeServer() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InfoHost? host,  InfoSensor? sensor,  InfoSystem? system,  InfoVersion? version)  $default,) {final _that = this;
switch (_that) {
case _InfoPiholeServer():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InfoHost? host,  InfoSensor? sensor,  InfoSystem? system,  InfoVersion? version)?  $default,) {final _that = this;
switch (_that) {
case _InfoPiholeServer() when $default != null:
return $default(_that.host,_that.sensor,_that.system,_that.version);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoPiholeServer implements InfoPiholeServer {
  const _InfoPiholeServer({this.host, this.sensor, this.system, this.version});
  factory _InfoPiholeServer.fromJson(Map<String, dynamic> json) => _$InfoPiholeServerFromJson(json);

@override final  InfoHost? host;
@override final  InfoSensor? sensor;
@override final  InfoSystem? system;
@override final  InfoVersion? version;

/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoPiholeServerCopyWith<_InfoPiholeServer> get copyWith => __$InfoPiholeServerCopyWithImpl<_InfoPiholeServer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoPiholeServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoPiholeServer&&(identical(other.host, host) || other.host == host)&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.system, system) || other.system == system)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,sensor,system,version);

@override
String toString() {
  return 'InfoPiholeServer(host: $host, sensor: $sensor, system: $system, version: $version)';
}


}

/// @nodoc
abstract mixin class _$InfoPiholeServerCopyWith<$Res> implements $InfoPiholeServerCopyWith<$Res> {
  factory _$InfoPiholeServerCopyWith(_InfoPiholeServer value, $Res Function(_InfoPiholeServer) _then) = __$InfoPiholeServerCopyWithImpl;
@override @useResult
$Res call({
 InfoHost? host, InfoSensor? sensor, InfoSystem? system, InfoVersion? version
});


@override $InfoHostCopyWith<$Res>? get host;@override $InfoSensorCopyWith<$Res>? get sensor;@override $InfoSystemCopyWith<$Res>? get system;@override $InfoVersionCopyWith<$Res>? get version;

}
/// @nodoc
class __$InfoPiholeServerCopyWithImpl<$Res>
    implements _$InfoPiholeServerCopyWith<$Res> {
  __$InfoPiholeServerCopyWithImpl(this._self, this._then);

  final _InfoPiholeServer _self;
  final $Res Function(_InfoPiholeServer) _then;

/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = freezed,Object? sensor = freezed,Object? system = freezed,Object? version = freezed,}) {
  return _then(_InfoPiholeServer(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as InfoHost?,sensor: freezed == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as InfoSensor?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as InfoSystem?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as InfoVersion?,
  ));
}

/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoHostCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $InfoHostCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoSensorCopyWith<$Res>? get sensor {
    if (_self.sensor == null) {
    return null;
  }

  return $InfoSensorCopyWith<$Res>(_self.sensor!, (value) {
    return _then(_self.copyWith(sensor: value));
  });
}/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $InfoSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of InfoPiholeServer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoVersionCopyWith<$Res>? get version {
    if (_self.version == null) {
    return null;
  }

  return $InfoVersionCopyWith<$Res>(_self.version!, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}

// dart format on
