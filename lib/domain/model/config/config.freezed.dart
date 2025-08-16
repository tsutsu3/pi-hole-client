// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Config {

 Dns? get dns;
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigCopyWith<Config> get copyWith => _$ConfigCopyWithImpl<Config>(this as Config, _$identity);

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Config&&(identical(other.dns, dns) || other.dns == dns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dns);

@override
String toString() {
  return 'Config(dns: $dns)';
}


}

/// @nodoc
abstract mixin class $ConfigCopyWith<$Res>  {
  factory $ConfigCopyWith(Config value, $Res Function(Config) _then) = _$ConfigCopyWithImpl;
@useResult
$Res call({
 Dns? dns
});


$DnsCopyWith<$Res>? get dns;

}
/// @nodoc
class _$ConfigCopyWithImpl<$Res>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._self, this._then);

  final Config _self;
  final $Res Function(Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dns = freezed,}) {
  return _then(_self.copyWith(
dns: freezed == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as Dns?,
  ));
}
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCopyWith<$Res>? get dns {
    if (_self.dns == null) {
    return null;
  }

  return $DnsCopyWith<$Res>(_self.dns!, (value) {
    return _then(_self.copyWith(dns: value));
  });
}
}


/// Adds pattern-matching-related methods to [Config].
extension ConfigPatterns on Config {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Config value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Config() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Config value)  $default,){
final _that = this;
switch (_that) {
case _Config():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Config value)?  $default,){
final _that = this;
switch (_that) {
case _Config() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Dns? dns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.dns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Dns? dns)  $default,) {final _that = this;
switch (_that) {
case _Config():
return $default(_that.dns);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Dns? dns)?  $default,) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.dns);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Config implements Config {
  const _Config({this.dns});
  factory _Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

@override final  Dns? dns;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigCopyWith<_Config> get copyWith => __$ConfigCopyWithImpl<_Config>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Config&&(identical(other.dns, dns) || other.dns == dns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dns);

@override
String toString() {
  return 'Config(dns: $dns)';
}


}

/// @nodoc
abstract mixin class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) _then) = __$ConfigCopyWithImpl;
@override @useResult
$Res call({
 Dns? dns
});


@override $DnsCopyWith<$Res>? get dns;

}
/// @nodoc
class __$ConfigCopyWithImpl<$Res>
    implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(this._self, this._then);

  final _Config _self;
  final $Res Function(_Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dns = freezed,}) {
  return _then(_Config(
dns: freezed == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as Dns?,
  ));
}

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCopyWith<$Res>? get dns {
    if (_self.dns == null) {
    return null;
  }

  return $DnsCopyWith<$Res>(_self.dns!, (value) {
    return _then(_self.copyWith(dns: value));
  });
}
}


/// @nodoc
mixin _$Dns {

 bool? get queryLogging;
/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCopyWith<Dns> get copyWith => _$DnsCopyWithImpl<Dns>(this as Dns, _$identity);

  /// Serializes this Dns to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dns&&(identical(other.queryLogging, queryLogging) || other.queryLogging == queryLogging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queryLogging);

@override
String toString() {
  return 'Dns(queryLogging: $queryLogging)';
}


}

/// @nodoc
abstract mixin class $DnsCopyWith<$Res>  {
  factory $DnsCopyWith(Dns value, $Res Function(Dns) _then) = _$DnsCopyWithImpl;
@useResult
$Res call({
 bool? queryLogging
});




}
/// @nodoc
class _$DnsCopyWithImpl<$Res>
    implements $DnsCopyWith<$Res> {
  _$DnsCopyWithImpl(this._self, this._then);

  final Dns _self;
  final $Res Function(Dns) _then;

/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queryLogging = freezed,}) {
  return _then(_self.copyWith(
queryLogging: freezed == queryLogging ? _self.queryLogging : queryLogging // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Dns].
extension DnsPatterns on Dns {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dns value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dns() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dns value)  $default,){
final _that = this;
switch (_that) {
case _Dns():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dns value)?  $default,){
final _that = this;
switch (_that) {
case _Dns() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? queryLogging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dns() when $default != null:
return $default(_that.queryLogging);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? queryLogging)  $default,) {final _that = this;
switch (_that) {
case _Dns():
return $default(_that.queryLogging);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? queryLogging)?  $default,) {final _that = this;
switch (_that) {
case _Dns() when $default != null:
return $default(_that.queryLogging);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Dns implements Dns {
  const _Dns({this.queryLogging});
  factory _Dns.fromJson(Map<String, dynamic> json) => _$DnsFromJson(json);

@override final  bool? queryLogging;

/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsCopyWith<_Dns> get copyWith => __$DnsCopyWithImpl<_Dns>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dns&&(identical(other.queryLogging, queryLogging) || other.queryLogging == queryLogging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queryLogging);

@override
String toString() {
  return 'Dns(queryLogging: $queryLogging)';
}


}

/// @nodoc
abstract mixin class _$DnsCopyWith<$Res> implements $DnsCopyWith<$Res> {
  factory _$DnsCopyWith(_Dns value, $Res Function(_Dns) _then) = __$DnsCopyWithImpl;
@override @useResult
$Res call({
 bool? queryLogging
});




}
/// @nodoc
class __$DnsCopyWithImpl<$Res>
    implements _$DnsCopyWith<$Res> {
  __$DnsCopyWithImpl(this._self, this._then);

  final _Dns _self;
  final $Res Function(_Dns) _then;

/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queryLogging = freezed,}) {
  return _then(_Dns(
queryLogging: freezed == queryLogging ? _self.queryLogging : queryLogging // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
