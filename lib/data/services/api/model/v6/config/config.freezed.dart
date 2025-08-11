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

 ConfigData? get config; double? get took;
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigCopyWith<Config> get copyWith => _$ConfigCopyWithImpl<Config>(this as Config, _$identity);

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Config&&(identical(other.config, config) || other.config == config)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,config,took);

@override
String toString() {
  return 'Config(config: $config, took: $took)';
}


}

/// @nodoc
abstract mixin class $ConfigCopyWith<$Res>  {
  factory $ConfigCopyWith(Config value, $Res Function(Config) _then) = _$ConfigCopyWithImpl;
@useResult
$Res call({
 ConfigData? config, double? took
});


$ConfigDataCopyWith<$Res>? get config;

}
/// @nodoc
class _$ConfigCopyWithImpl<$Res>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._self, this._then);

  final Config _self;
  final $Res Function(Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = freezed,Object? took = freezed,}) {
  return _then(_self.copyWith(
config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ConfigData?,took: freezed == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigDataCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $ConfigDataCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConfigData? config,  double? took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.config,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConfigData? config,  double? took)  $default,) {final _that = this;
switch (_that) {
case _Config():
return $default(_that.config,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConfigData? config,  double? took)?  $default,) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.config,_that.took);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Config implements Config {
  const _Config({this.config, this.took});
  factory _Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

@override final  ConfigData? config;
@override final  double? took;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Config&&(identical(other.config, config) || other.config == config)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,config,took);

@override
String toString() {
  return 'Config(config: $config, took: $took)';
}


}

/// @nodoc
abstract mixin class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) _then) = __$ConfigCopyWithImpl;
@override @useResult
$Res call({
 ConfigData? config, double? took
});


@override $ConfigDataCopyWith<$Res>? get config;

}
/// @nodoc
class __$ConfigCopyWithImpl<$Res>
    implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(this._self, this._then);

  final _Config _self;
  final $Res Function(_Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = freezed,Object? took = freezed,}) {
  return _then(_Config(
config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ConfigData?,took: freezed == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigDataCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $ConfigDataCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// @nodoc
mixin _$ConfigData {

 Dns? get dns; Dhcp? get dhcp; Ntp? get ntp; Resolver? get resolver; Database? get database; Webserver? get webserver; Files? get files; Misc? get misc; Debug? get debug;
/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigDataCopyWith<ConfigData> get copyWith => _$ConfigDataCopyWithImpl<ConfigData>(this as ConfigData, _$identity);

  /// Serializes this ConfigData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigData&&(identical(other.dns, dns) || other.dns == dns)&&(identical(other.dhcp, dhcp) || other.dhcp == dhcp)&&(identical(other.ntp, ntp) || other.ntp == ntp)&&(identical(other.resolver, resolver) || other.resolver == resolver)&&(identical(other.database, database) || other.database == database)&&(identical(other.webserver, webserver) || other.webserver == webserver)&&(identical(other.files, files) || other.files == files)&&(identical(other.misc, misc) || other.misc == misc)&&(identical(other.debug, debug) || other.debug == debug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dns,dhcp,ntp,resolver,database,webserver,files,misc,debug);

@override
String toString() {
  return 'ConfigData(dns: $dns, dhcp: $dhcp, ntp: $ntp, resolver: $resolver, database: $database, webserver: $webserver, files: $files, misc: $misc, debug: $debug)';
}


}

/// @nodoc
abstract mixin class $ConfigDataCopyWith<$Res>  {
  factory $ConfigDataCopyWith(ConfigData value, $Res Function(ConfigData) _then) = _$ConfigDataCopyWithImpl;
@useResult
$Res call({
 Dns? dns, Dhcp? dhcp, Ntp? ntp, Resolver? resolver, Database? database, Webserver? webserver, Files? files, Misc? misc, Debug? debug
});


$DnsCopyWith<$Res>? get dns;$DhcpCopyWith<$Res>? get dhcp;$NtpCopyWith<$Res>? get ntp;$ResolverCopyWith<$Res>? get resolver;$DatabaseCopyWith<$Res>? get database;$WebserverCopyWith<$Res>? get webserver;$FilesCopyWith<$Res>? get files;$MiscCopyWith<$Res>? get misc;$DebugCopyWith<$Res>? get debug;

}
/// @nodoc
class _$ConfigDataCopyWithImpl<$Res>
    implements $ConfigDataCopyWith<$Res> {
  _$ConfigDataCopyWithImpl(this._self, this._then);

  final ConfigData _self;
  final $Res Function(ConfigData) _then;

/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dns = freezed,Object? dhcp = freezed,Object? ntp = freezed,Object? resolver = freezed,Object? database = freezed,Object? webserver = freezed,Object? files = freezed,Object? misc = freezed,Object? debug = freezed,}) {
  return _then(_self.copyWith(
dns: freezed == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as Dns?,dhcp: freezed == dhcp ? _self.dhcp : dhcp // ignore: cast_nullable_to_non_nullable
as Dhcp?,ntp: freezed == ntp ? _self.ntp : ntp // ignore: cast_nullable_to_non_nullable
as Ntp?,resolver: freezed == resolver ? _self.resolver : resolver // ignore: cast_nullable_to_non_nullable
as Resolver?,database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as Database?,webserver: freezed == webserver ? _self.webserver : webserver // ignore: cast_nullable_to_non_nullable
as Webserver?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as Files?,misc: freezed == misc ? _self.misc : misc // ignore: cast_nullable_to_non_nullable
as Misc?,debug: freezed == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as Debug?,
  ));
}
/// Create a copy of ConfigData
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
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DhcpCopyWith<$Res>? get dhcp {
    if (_self.dhcp == null) {
    return null;
  }

  return $DhcpCopyWith<$Res>(_self.dhcp!, (value) {
    return _then(_self.copyWith(dhcp: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpCopyWith<$Res>? get ntp {
    if (_self.ntp == null) {
    return null;
  }

  return $NtpCopyWith<$Res>(_self.ntp!, (value) {
    return _then(_self.copyWith(ntp: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolverCopyWith<$Res>? get resolver {
    if (_self.resolver == null) {
    return null;
  }

  return $ResolverCopyWith<$Res>(_self.resolver!, (value) {
    return _then(_self.copyWith(resolver: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatabaseCopyWith<$Res>? get database {
    if (_self.database == null) {
    return null;
  }

  return $DatabaseCopyWith<$Res>(_self.database!, (value) {
    return _then(_self.copyWith(database: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebserverCopyWith<$Res>? get webserver {
    if (_self.webserver == null) {
    return null;
  }

  return $WebserverCopyWith<$Res>(_self.webserver!, (value) {
    return _then(_self.copyWith(webserver: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilesCopyWith<$Res>? get files {
    if (_self.files == null) {
    return null;
  }

  return $FilesCopyWith<$Res>(_self.files!, (value) {
    return _then(_self.copyWith(files: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MiscCopyWith<$Res>? get misc {
    if (_self.misc == null) {
    return null;
  }

  return $MiscCopyWith<$Res>(_self.misc!, (value) {
    return _then(_self.copyWith(misc: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DebugCopyWith<$Res>? get debug {
    if (_self.debug == null) {
    return null;
  }

  return $DebugCopyWith<$Res>(_self.debug!, (value) {
    return _then(_self.copyWith(debug: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConfigData].
extension ConfigDataPatterns on ConfigData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigData value)  $default,){
final _that = this;
switch (_that) {
case _ConfigData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigData value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Dns? dns,  Dhcp? dhcp,  Ntp? ntp,  Resolver? resolver,  Database? database,  Webserver? webserver,  Files? files,  Misc? misc,  Debug? debug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigData() when $default != null:
return $default(_that.dns,_that.dhcp,_that.ntp,_that.resolver,_that.database,_that.webserver,_that.files,_that.misc,_that.debug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Dns? dns,  Dhcp? dhcp,  Ntp? ntp,  Resolver? resolver,  Database? database,  Webserver? webserver,  Files? files,  Misc? misc,  Debug? debug)  $default,) {final _that = this;
switch (_that) {
case _ConfigData():
return $default(_that.dns,_that.dhcp,_that.ntp,_that.resolver,_that.database,_that.webserver,_that.files,_that.misc,_that.debug);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Dns? dns,  Dhcp? dhcp,  Ntp? ntp,  Resolver? resolver,  Database? database,  Webserver? webserver,  Files? files,  Misc? misc,  Debug? debug)?  $default,) {final _that = this;
switch (_that) {
case _ConfigData() when $default != null:
return $default(_that.dns,_that.dhcp,_that.ntp,_that.resolver,_that.database,_that.webserver,_that.files,_that.misc,_that.debug);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _ConfigData implements ConfigData {
  const _ConfigData({this.dns, this.dhcp, this.ntp, this.resolver, this.database, this.webserver, this.files, this.misc, this.debug});
  factory _ConfigData.fromJson(Map<String, dynamic> json) => _$ConfigDataFromJson(json);

@override final  Dns? dns;
@override final  Dhcp? dhcp;
@override final  Ntp? ntp;
@override final  Resolver? resolver;
@override final  Database? database;
@override final  Webserver? webserver;
@override final  Files? files;
@override final  Misc? misc;
@override final  Debug? debug;

/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigDataCopyWith<_ConfigData> get copyWith => __$ConfigDataCopyWithImpl<_ConfigData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigData&&(identical(other.dns, dns) || other.dns == dns)&&(identical(other.dhcp, dhcp) || other.dhcp == dhcp)&&(identical(other.ntp, ntp) || other.ntp == ntp)&&(identical(other.resolver, resolver) || other.resolver == resolver)&&(identical(other.database, database) || other.database == database)&&(identical(other.webserver, webserver) || other.webserver == webserver)&&(identical(other.files, files) || other.files == files)&&(identical(other.misc, misc) || other.misc == misc)&&(identical(other.debug, debug) || other.debug == debug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dns,dhcp,ntp,resolver,database,webserver,files,misc,debug);

@override
String toString() {
  return 'ConfigData(dns: $dns, dhcp: $dhcp, ntp: $ntp, resolver: $resolver, database: $database, webserver: $webserver, files: $files, misc: $misc, debug: $debug)';
}


}

/// @nodoc
abstract mixin class _$ConfigDataCopyWith<$Res> implements $ConfigDataCopyWith<$Res> {
  factory _$ConfigDataCopyWith(_ConfigData value, $Res Function(_ConfigData) _then) = __$ConfigDataCopyWithImpl;
@override @useResult
$Res call({
 Dns? dns, Dhcp? dhcp, Ntp? ntp, Resolver? resolver, Database? database, Webserver? webserver, Files? files, Misc? misc, Debug? debug
});


@override $DnsCopyWith<$Res>? get dns;@override $DhcpCopyWith<$Res>? get dhcp;@override $NtpCopyWith<$Res>? get ntp;@override $ResolverCopyWith<$Res>? get resolver;@override $DatabaseCopyWith<$Res>? get database;@override $WebserverCopyWith<$Res>? get webserver;@override $FilesCopyWith<$Res>? get files;@override $MiscCopyWith<$Res>? get misc;@override $DebugCopyWith<$Res>? get debug;

}
/// @nodoc
class __$ConfigDataCopyWithImpl<$Res>
    implements _$ConfigDataCopyWith<$Res> {
  __$ConfigDataCopyWithImpl(this._self, this._then);

  final _ConfigData _self;
  final $Res Function(_ConfigData) _then;

/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dns = freezed,Object? dhcp = freezed,Object? ntp = freezed,Object? resolver = freezed,Object? database = freezed,Object? webserver = freezed,Object? files = freezed,Object? misc = freezed,Object? debug = freezed,}) {
  return _then(_ConfigData(
dns: freezed == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as Dns?,dhcp: freezed == dhcp ? _self.dhcp : dhcp // ignore: cast_nullable_to_non_nullable
as Dhcp?,ntp: freezed == ntp ? _self.ntp : ntp // ignore: cast_nullable_to_non_nullable
as Ntp?,resolver: freezed == resolver ? _self.resolver : resolver // ignore: cast_nullable_to_non_nullable
as Resolver?,database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as Database?,webserver: freezed == webserver ? _self.webserver : webserver // ignore: cast_nullable_to_non_nullable
as Webserver?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as Files?,misc: freezed == misc ? _self.misc : misc // ignore: cast_nullable_to_non_nullable
as Misc?,debug: freezed == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as Debug?,
  ));
}

/// Create a copy of ConfigData
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
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DhcpCopyWith<$Res>? get dhcp {
    if (_self.dhcp == null) {
    return null;
  }

  return $DhcpCopyWith<$Res>(_self.dhcp!, (value) {
    return _then(_self.copyWith(dhcp: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpCopyWith<$Res>? get ntp {
    if (_self.ntp == null) {
    return null;
  }

  return $NtpCopyWith<$Res>(_self.ntp!, (value) {
    return _then(_self.copyWith(ntp: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolverCopyWith<$Res>? get resolver {
    if (_self.resolver == null) {
    return null;
  }

  return $ResolverCopyWith<$Res>(_self.resolver!, (value) {
    return _then(_self.copyWith(resolver: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatabaseCopyWith<$Res>? get database {
    if (_self.database == null) {
    return null;
  }

  return $DatabaseCopyWith<$Res>(_self.database!, (value) {
    return _then(_self.copyWith(database: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebserverCopyWith<$Res>? get webserver {
    if (_self.webserver == null) {
    return null;
  }

  return $WebserverCopyWith<$Res>(_self.webserver!, (value) {
    return _then(_self.copyWith(webserver: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilesCopyWith<$Res>? get files {
    if (_self.files == null) {
    return null;
  }

  return $FilesCopyWith<$Res>(_self.files!, (value) {
    return _then(_self.copyWith(files: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MiscCopyWith<$Res>? get misc {
    if (_self.misc == null) {
    return null;
  }

  return $MiscCopyWith<$Res>(_self.misc!, (value) {
    return _then(_self.copyWith(misc: value));
  });
}/// Create a copy of ConfigData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DebugCopyWith<$Res>? get debug {
    if (_self.debug == null) {
    return null;
  }

  return $DebugCopyWith<$Res>(_self.debug!, (value) {
    return _then(_self.copyWith(debug: value));
  });
}
}


/// @nodoc
mixin _$Dns {

 List<String>? get upstreams;@JsonKey(name: 'CNAMEdeepInspect') bool? get cnameDeepInspect; bool? get blockESNI;@JsonKey(name: 'EDNS0ECS') bool? get edns0ECS; bool? get ignoreLocalhost; bool? get showDNSSEC; bool? get analyzeOnlyAandAAAA; String? get piholePTR; String? get replyWhenBusy; int? get blockTTL; List<String>? get hosts; bool? get domainNeeded; bool? get expandHosts; String? get domain; bool? get bogusPriv; bool? get dnssec; String? get interface; String? get hostRecord; String? get listeningMode; bool? get queryLogging; List<String>? get cnameRecords; int? get port; DnsCache? get cache; List<String>? get revServers; DnsBlocking? get blocking; SpecialDomains? get specialDomains; DnsReply? get reply; RateLimit? get rateLimit;
/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCopyWith<Dns> get copyWith => _$DnsCopyWithImpl<Dns>(this as Dns, _$identity);

  /// Serializes this Dns to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dns&&const DeepCollectionEquality().equals(other.upstreams, upstreams)&&(identical(other.cnameDeepInspect, cnameDeepInspect) || other.cnameDeepInspect == cnameDeepInspect)&&(identical(other.blockESNI, blockESNI) || other.blockESNI == blockESNI)&&(identical(other.edns0ECS, edns0ECS) || other.edns0ECS == edns0ECS)&&(identical(other.ignoreLocalhost, ignoreLocalhost) || other.ignoreLocalhost == ignoreLocalhost)&&(identical(other.showDNSSEC, showDNSSEC) || other.showDNSSEC == showDNSSEC)&&(identical(other.analyzeOnlyAandAAAA, analyzeOnlyAandAAAA) || other.analyzeOnlyAandAAAA == analyzeOnlyAandAAAA)&&(identical(other.piholePTR, piholePTR) || other.piholePTR == piholePTR)&&(identical(other.replyWhenBusy, replyWhenBusy) || other.replyWhenBusy == replyWhenBusy)&&(identical(other.blockTTL, blockTTL) || other.blockTTL == blockTTL)&&const DeepCollectionEquality().equals(other.hosts, hosts)&&(identical(other.domainNeeded, domainNeeded) || other.domainNeeded == domainNeeded)&&(identical(other.expandHosts, expandHosts) || other.expandHosts == expandHosts)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.bogusPriv, bogusPriv) || other.bogusPriv == bogusPriv)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.hostRecord, hostRecord) || other.hostRecord == hostRecord)&&(identical(other.listeningMode, listeningMode) || other.listeningMode == listeningMode)&&(identical(other.queryLogging, queryLogging) || other.queryLogging == queryLogging)&&const DeepCollectionEquality().equals(other.cnameRecords, cnameRecords)&&(identical(other.port, port) || other.port == port)&&(identical(other.cache, cache) || other.cache == cache)&&const DeepCollectionEquality().equals(other.revServers, revServers)&&(identical(other.blocking, blocking) || other.blocking == blocking)&&(identical(other.specialDomains, specialDomains) || other.specialDomains == specialDomains)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.rateLimit, rateLimit) || other.rateLimit == rateLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(upstreams),cnameDeepInspect,blockESNI,edns0ECS,ignoreLocalhost,showDNSSEC,analyzeOnlyAandAAAA,piholePTR,replyWhenBusy,blockTTL,const DeepCollectionEquality().hash(hosts),domainNeeded,expandHosts,domain,bogusPriv,dnssec,interface,hostRecord,listeningMode,queryLogging,const DeepCollectionEquality().hash(cnameRecords),port,cache,const DeepCollectionEquality().hash(revServers),blocking,specialDomains,reply,rateLimit]);

@override
String toString() {
  return 'Dns(upstreams: $upstreams, cnameDeepInspect: $cnameDeepInspect, blockESNI: $blockESNI, edns0ECS: $edns0ECS, ignoreLocalhost: $ignoreLocalhost, showDNSSEC: $showDNSSEC, analyzeOnlyAandAAAA: $analyzeOnlyAandAAAA, piholePTR: $piholePTR, replyWhenBusy: $replyWhenBusy, blockTTL: $blockTTL, hosts: $hosts, domainNeeded: $domainNeeded, expandHosts: $expandHosts, domain: $domain, bogusPriv: $bogusPriv, dnssec: $dnssec, interface: $interface, hostRecord: $hostRecord, listeningMode: $listeningMode, queryLogging: $queryLogging, cnameRecords: $cnameRecords, port: $port, cache: $cache, revServers: $revServers, blocking: $blocking, specialDomains: $specialDomains, reply: $reply, rateLimit: $rateLimit)';
}


}

/// @nodoc
abstract mixin class $DnsCopyWith<$Res>  {
  factory $DnsCopyWith(Dns value, $Res Function(Dns) _then) = _$DnsCopyWithImpl;
@useResult
$Res call({
 List<String>? upstreams,@JsonKey(name: 'CNAMEdeepInspect') bool? cnameDeepInspect, bool? blockESNI,@JsonKey(name: 'EDNS0ECS') bool? edns0ECS, bool? ignoreLocalhost, bool? showDNSSEC, bool? analyzeOnlyAandAAAA, String? piholePTR, String? replyWhenBusy, int? blockTTL, List<String>? hosts, bool? domainNeeded, bool? expandHosts, String? domain, bool? bogusPriv, bool? dnssec, String? interface, String? hostRecord, String? listeningMode, bool? queryLogging, List<String>? cnameRecords, int? port, DnsCache? cache, List<String>? revServers, DnsBlocking? blocking, SpecialDomains? specialDomains, DnsReply? reply, RateLimit? rateLimit
});


$DnsCacheCopyWith<$Res>? get cache;$DnsBlockingCopyWith<$Res>? get blocking;$SpecialDomainsCopyWith<$Res>? get specialDomains;$DnsReplyCopyWith<$Res>? get reply;$RateLimitCopyWith<$Res>? get rateLimit;

}
/// @nodoc
class _$DnsCopyWithImpl<$Res>
    implements $DnsCopyWith<$Res> {
  _$DnsCopyWithImpl(this._self, this._then);

  final Dns _self;
  final $Res Function(Dns) _then;

/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upstreams = freezed,Object? cnameDeepInspect = freezed,Object? blockESNI = freezed,Object? edns0ECS = freezed,Object? ignoreLocalhost = freezed,Object? showDNSSEC = freezed,Object? analyzeOnlyAandAAAA = freezed,Object? piholePTR = freezed,Object? replyWhenBusy = freezed,Object? blockTTL = freezed,Object? hosts = freezed,Object? domainNeeded = freezed,Object? expandHosts = freezed,Object? domain = freezed,Object? bogusPriv = freezed,Object? dnssec = freezed,Object? interface = freezed,Object? hostRecord = freezed,Object? listeningMode = freezed,Object? queryLogging = freezed,Object? cnameRecords = freezed,Object? port = freezed,Object? cache = freezed,Object? revServers = freezed,Object? blocking = freezed,Object? specialDomains = freezed,Object? reply = freezed,Object? rateLimit = freezed,}) {
  return _then(_self.copyWith(
upstreams: freezed == upstreams ? _self.upstreams : upstreams // ignore: cast_nullable_to_non_nullable
as List<String>?,cnameDeepInspect: freezed == cnameDeepInspect ? _self.cnameDeepInspect : cnameDeepInspect // ignore: cast_nullable_to_non_nullable
as bool?,blockESNI: freezed == blockESNI ? _self.blockESNI : blockESNI // ignore: cast_nullable_to_non_nullable
as bool?,edns0ECS: freezed == edns0ECS ? _self.edns0ECS : edns0ECS // ignore: cast_nullable_to_non_nullable
as bool?,ignoreLocalhost: freezed == ignoreLocalhost ? _self.ignoreLocalhost : ignoreLocalhost // ignore: cast_nullable_to_non_nullable
as bool?,showDNSSEC: freezed == showDNSSEC ? _self.showDNSSEC : showDNSSEC // ignore: cast_nullable_to_non_nullable
as bool?,analyzeOnlyAandAAAA: freezed == analyzeOnlyAandAAAA ? _self.analyzeOnlyAandAAAA : analyzeOnlyAandAAAA // ignore: cast_nullable_to_non_nullable
as bool?,piholePTR: freezed == piholePTR ? _self.piholePTR : piholePTR // ignore: cast_nullable_to_non_nullable
as String?,replyWhenBusy: freezed == replyWhenBusy ? _self.replyWhenBusy : replyWhenBusy // ignore: cast_nullable_to_non_nullable
as String?,blockTTL: freezed == blockTTL ? _self.blockTTL : blockTTL // ignore: cast_nullable_to_non_nullable
as int?,hosts: freezed == hosts ? _self.hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<String>?,domainNeeded: freezed == domainNeeded ? _self.domainNeeded : domainNeeded // ignore: cast_nullable_to_non_nullable
as bool?,expandHosts: freezed == expandHosts ? _self.expandHosts : expandHosts // ignore: cast_nullable_to_non_nullable
as bool?,domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,bogusPriv: freezed == bogusPriv ? _self.bogusPriv : bogusPriv // ignore: cast_nullable_to_non_nullable
as bool?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as bool?,interface: freezed == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as String?,hostRecord: freezed == hostRecord ? _self.hostRecord : hostRecord // ignore: cast_nullable_to_non_nullable
as String?,listeningMode: freezed == listeningMode ? _self.listeningMode : listeningMode // ignore: cast_nullable_to_non_nullable
as String?,queryLogging: freezed == queryLogging ? _self.queryLogging : queryLogging // ignore: cast_nullable_to_non_nullable
as bool?,cnameRecords: freezed == cnameRecords ? _self.cnameRecords : cnameRecords // ignore: cast_nullable_to_non_nullable
as List<String>?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int?,cache: freezed == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as DnsCache?,revServers: freezed == revServers ? _self.revServers : revServers // ignore: cast_nullable_to_non_nullable
as List<String>?,blocking: freezed == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as DnsBlocking?,specialDomains: freezed == specialDomains ? _self.specialDomains : specialDomains // ignore: cast_nullable_to_non_nullable
as SpecialDomains?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as DnsReply?,rateLimit: freezed == rateLimit ? _self.rateLimit : rateLimit // ignore: cast_nullable_to_non_nullable
as RateLimit?,
  ));
}
/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<$Res>? get cache {
    if (_self.cache == null) {
    return null;
  }

  return $DnsCacheCopyWith<$Res>(_self.cache!, (value) {
    return _then(_self.copyWith(cache: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsBlockingCopyWith<$Res>? get blocking {
    if (_self.blocking == null) {
    return null;
  }

  return $DnsBlockingCopyWith<$Res>(_self.blocking!, (value) {
    return _then(_self.copyWith(blocking: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpecialDomainsCopyWith<$Res>? get specialDomains {
    if (_self.specialDomains == null) {
    return null;
  }

  return $SpecialDomainsCopyWith<$Res>(_self.specialDomains!, (value) {
    return _then(_self.copyWith(specialDomains: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsReplyCopyWith<$Res>? get reply {
    if (_self.reply == null) {
    return null;
  }

  return $DnsReplyCopyWith<$Res>(_self.reply!, (value) {
    return _then(_self.copyWith(reply: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateLimitCopyWith<$Res>? get rateLimit {
    if (_self.rateLimit == null) {
    return null;
  }

  return $RateLimitCopyWith<$Res>(_self.rateLimit!, (value) {
    return _then(_self.copyWith(rateLimit: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? upstreams, @JsonKey(name: 'CNAMEdeepInspect')  bool? cnameDeepInspect,  bool? blockESNI, @JsonKey(name: 'EDNS0ECS')  bool? edns0ECS,  bool? ignoreLocalhost,  bool? showDNSSEC,  bool? analyzeOnlyAandAAAA,  String? piholePTR,  String? replyWhenBusy,  int? blockTTL,  List<String>? hosts,  bool? domainNeeded,  bool? expandHosts,  String? domain,  bool? bogusPriv,  bool? dnssec,  String? interface,  String? hostRecord,  String? listeningMode,  bool? queryLogging,  List<String>? cnameRecords,  int? port,  DnsCache? cache,  List<String>? revServers,  DnsBlocking? blocking,  SpecialDomains? specialDomains,  DnsReply? reply,  RateLimit? rateLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dns() when $default != null:
return $default(_that.upstreams,_that.cnameDeepInspect,_that.blockESNI,_that.edns0ECS,_that.ignoreLocalhost,_that.showDNSSEC,_that.analyzeOnlyAandAAAA,_that.piholePTR,_that.replyWhenBusy,_that.blockTTL,_that.hosts,_that.domainNeeded,_that.expandHosts,_that.domain,_that.bogusPriv,_that.dnssec,_that.interface,_that.hostRecord,_that.listeningMode,_that.queryLogging,_that.cnameRecords,_that.port,_that.cache,_that.revServers,_that.blocking,_that.specialDomains,_that.reply,_that.rateLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? upstreams, @JsonKey(name: 'CNAMEdeepInspect')  bool? cnameDeepInspect,  bool? blockESNI, @JsonKey(name: 'EDNS0ECS')  bool? edns0ECS,  bool? ignoreLocalhost,  bool? showDNSSEC,  bool? analyzeOnlyAandAAAA,  String? piholePTR,  String? replyWhenBusy,  int? blockTTL,  List<String>? hosts,  bool? domainNeeded,  bool? expandHosts,  String? domain,  bool? bogusPriv,  bool? dnssec,  String? interface,  String? hostRecord,  String? listeningMode,  bool? queryLogging,  List<String>? cnameRecords,  int? port,  DnsCache? cache,  List<String>? revServers,  DnsBlocking? blocking,  SpecialDomains? specialDomains,  DnsReply? reply,  RateLimit? rateLimit)  $default,) {final _that = this;
switch (_that) {
case _Dns():
return $default(_that.upstreams,_that.cnameDeepInspect,_that.blockESNI,_that.edns0ECS,_that.ignoreLocalhost,_that.showDNSSEC,_that.analyzeOnlyAandAAAA,_that.piholePTR,_that.replyWhenBusy,_that.blockTTL,_that.hosts,_that.domainNeeded,_that.expandHosts,_that.domain,_that.bogusPriv,_that.dnssec,_that.interface,_that.hostRecord,_that.listeningMode,_that.queryLogging,_that.cnameRecords,_that.port,_that.cache,_that.revServers,_that.blocking,_that.specialDomains,_that.reply,_that.rateLimit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? upstreams, @JsonKey(name: 'CNAMEdeepInspect')  bool? cnameDeepInspect,  bool? blockESNI, @JsonKey(name: 'EDNS0ECS')  bool? edns0ECS,  bool? ignoreLocalhost,  bool? showDNSSEC,  bool? analyzeOnlyAandAAAA,  String? piholePTR,  String? replyWhenBusy,  int? blockTTL,  List<String>? hosts,  bool? domainNeeded,  bool? expandHosts,  String? domain,  bool? bogusPriv,  bool? dnssec,  String? interface,  String? hostRecord,  String? listeningMode,  bool? queryLogging,  List<String>? cnameRecords,  int? port,  DnsCache? cache,  List<String>? revServers,  DnsBlocking? blocking,  SpecialDomains? specialDomains,  DnsReply? reply,  RateLimit? rateLimit)?  $default,) {final _that = this;
switch (_that) {
case _Dns() when $default != null:
return $default(_that.upstreams,_that.cnameDeepInspect,_that.blockESNI,_that.edns0ECS,_that.ignoreLocalhost,_that.showDNSSEC,_that.analyzeOnlyAandAAAA,_that.piholePTR,_that.replyWhenBusy,_that.blockTTL,_that.hosts,_that.domainNeeded,_that.expandHosts,_that.domain,_that.bogusPriv,_that.dnssec,_that.interface,_that.hostRecord,_that.listeningMode,_that.queryLogging,_that.cnameRecords,_that.port,_that.cache,_that.revServers,_that.blocking,_that.specialDomains,_that.reply,_that.rateLimit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Dns implements Dns {
  const _Dns({final  List<String>? upstreams, @JsonKey(name: 'CNAMEdeepInspect') this.cnameDeepInspect, this.blockESNI, @JsonKey(name: 'EDNS0ECS') this.edns0ECS, this.ignoreLocalhost, this.showDNSSEC, this.analyzeOnlyAandAAAA, this.piholePTR, this.replyWhenBusy, this.blockTTL, final  List<String>? hosts, this.domainNeeded, this.expandHosts, this.domain, this.bogusPriv, this.dnssec, this.interface, this.hostRecord, this.listeningMode, this.queryLogging, final  List<String>? cnameRecords, this.port, this.cache, final  List<String>? revServers, this.blocking, this.specialDomains, this.reply, this.rateLimit}): _upstreams = upstreams,_hosts = hosts,_cnameRecords = cnameRecords,_revServers = revServers;
  factory _Dns.fromJson(Map<String, dynamic> json) => _$DnsFromJson(json);

 final  List<String>? _upstreams;
@override List<String>? get upstreams {
  final value = _upstreams;
  if (value == null) return null;
  if (_upstreams is EqualUnmodifiableListView) return _upstreams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'CNAMEdeepInspect') final  bool? cnameDeepInspect;
@override final  bool? blockESNI;
@override@JsonKey(name: 'EDNS0ECS') final  bool? edns0ECS;
@override final  bool? ignoreLocalhost;
@override final  bool? showDNSSEC;
@override final  bool? analyzeOnlyAandAAAA;
@override final  String? piholePTR;
@override final  String? replyWhenBusy;
@override final  int? blockTTL;
 final  List<String>? _hosts;
@override List<String>? get hosts {
  final value = _hosts;
  if (value == null) return null;
  if (_hosts is EqualUnmodifiableListView) return _hosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? domainNeeded;
@override final  bool? expandHosts;
@override final  String? domain;
@override final  bool? bogusPriv;
@override final  bool? dnssec;
@override final  String? interface;
@override final  String? hostRecord;
@override final  String? listeningMode;
@override final  bool? queryLogging;
 final  List<String>? _cnameRecords;
@override List<String>? get cnameRecords {
  final value = _cnameRecords;
  if (value == null) return null;
  if (_cnameRecords is EqualUnmodifiableListView) return _cnameRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? port;
@override final  DnsCache? cache;
 final  List<String>? _revServers;
@override List<String>? get revServers {
  final value = _revServers;
  if (value == null) return null;
  if (_revServers is EqualUnmodifiableListView) return _revServers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DnsBlocking? blocking;
@override final  SpecialDomains? specialDomains;
@override final  DnsReply? reply;
@override final  RateLimit? rateLimit;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dns&&const DeepCollectionEquality().equals(other._upstreams, _upstreams)&&(identical(other.cnameDeepInspect, cnameDeepInspect) || other.cnameDeepInspect == cnameDeepInspect)&&(identical(other.blockESNI, blockESNI) || other.blockESNI == blockESNI)&&(identical(other.edns0ECS, edns0ECS) || other.edns0ECS == edns0ECS)&&(identical(other.ignoreLocalhost, ignoreLocalhost) || other.ignoreLocalhost == ignoreLocalhost)&&(identical(other.showDNSSEC, showDNSSEC) || other.showDNSSEC == showDNSSEC)&&(identical(other.analyzeOnlyAandAAAA, analyzeOnlyAandAAAA) || other.analyzeOnlyAandAAAA == analyzeOnlyAandAAAA)&&(identical(other.piholePTR, piholePTR) || other.piholePTR == piholePTR)&&(identical(other.replyWhenBusy, replyWhenBusy) || other.replyWhenBusy == replyWhenBusy)&&(identical(other.blockTTL, blockTTL) || other.blockTTL == blockTTL)&&const DeepCollectionEquality().equals(other._hosts, _hosts)&&(identical(other.domainNeeded, domainNeeded) || other.domainNeeded == domainNeeded)&&(identical(other.expandHosts, expandHosts) || other.expandHosts == expandHosts)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.bogusPriv, bogusPriv) || other.bogusPriv == bogusPriv)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.hostRecord, hostRecord) || other.hostRecord == hostRecord)&&(identical(other.listeningMode, listeningMode) || other.listeningMode == listeningMode)&&(identical(other.queryLogging, queryLogging) || other.queryLogging == queryLogging)&&const DeepCollectionEquality().equals(other._cnameRecords, _cnameRecords)&&(identical(other.port, port) || other.port == port)&&(identical(other.cache, cache) || other.cache == cache)&&const DeepCollectionEquality().equals(other._revServers, _revServers)&&(identical(other.blocking, blocking) || other.blocking == blocking)&&(identical(other.specialDomains, specialDomains) || other.specialDomains == specialDomains)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.rateLimit, rateLimit) || other.rateLimit == rateLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_upstreams),cnameDeepInspect,blockESNI,edns0ECS,ignoreLocalhost,showDNSSEC,analyzeOnlyAandAAAA,piholePTR,replyWhenBusy,blockTTL,const DeepCollectionEquality().hash(_hosts),domainNeeded,expandHosts,domain,bogusPriv,dnssec,interface,hostRecord,listeningMode,queryLogging,const DeepCollectionEquality().hash(_cnameRecords),port,cache,const DeepCollectionEquality().hash(_revServers),blocking,specialDomains,reply,rateLimit]);

@override
String toString() {
  return 'Dns(upstreams: $upstreams, cnameDeepInspect: $cnameDeepInspect, blockESNI: $blockESNI, edns0ECS: $edns0ECS, ignoreLocalhost: $ignoreLocalhost, showDNSSEC: $showDNSSEC, analyzeOnlyAandAAAA: $analyzeOnlyAandAAAA, piholePTR: $piholePTR, replyWhenBusy: $replyWhenBusy, blockTTL: $blockTTL, hosts: $hosts, domainNeeded: $domainNeeded, expandHosts: $expandHosts, domain: $domain, bogusPriv: $bogusPriv, dnssec: $dnssec, interface: $interface, hostRecord: $hostRecord, listeningMode: $listeningMode, queryLogging: $queryLogging, cnameRecords: $cnameRecords, port: $port, cache: $cache, revServers: $revServers, blocking: $blocking, specialDomains: $specialDomains, reply: $reply, rateLimit: $rateLimit)';
}


}

/// @nodoc
abstract mixin class _$DnsCopyWith<$Res> implements $DnsCopyWith<$Res> {
  factory _$DnsCopyWith(_Dns value, $Res Function(_Dns) _then) = __$DnsCopyWithImpl;
@override @useResult
$Res call({
 List<String>? upstreams,@JsonKey(name: 'CNAMEdeepInspect') bool? cnameDeepInspect, bool? blockESNI,@JsonKey(name: 'EDNS0ECS') bool? edns0ECS, bool? ignoreLocalhost, bool? showDNSSEC, bool? analyzeOnlyAandAAAA, String? piholePTR, String? replyWhenBusy, int? blockTTL, List<String>? hosts, bool? domainNeeded, bool? expandHosts, String? domain, bool? bogusPriv, bool? dnssec, String? interface, String? hostRecord, String? listeningMode, bool? queryLogging, List<String>? cnameRecords, int? port, DnsCache? cache, List<String>? revServers, DnsBlocking? blocking, SpecialDomains? specialDomains, DnsReply? reply, RateLimit? rateLimit
});


@override $DnsCacheCopyWith<$Res>? get cache;@override $DnsBlockingCopyWith<$Res>? get blocking;@override $SpecialDomainsCopyWith<$Res>? get specialDomains;@override $DnsReplyCopyWith<$Res>? get reply;@override $RateLimitCopyWith<$Res>? get rateLimit;

}
/// @nodoc
class __$DnsCopyWithImpl<$Res>
    implements _$DnsCopyWith<$Res> {
  __$DnsCopyWithImpl(this._self, this._then);

  final _Dns _self;
  final $Res Function(_Dns) _then;

/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upstreams = freezed,Object? cnameDeepInspect = freezed,Object? blockESNI = freezed,Object? edns0ECS = freezed,Object? ignoreLocalhost = freezed,Object? showDNSSEC = freezed,Object? analyzeOnlyAandAAAA = freezed,Object? piholePTR = freezed,Object? replyWhenBusy = freezed,Object? blockTTL = freezed,Object? hosts = freezed,Object? domainNeeded = freezed,Object? expandHosts = freezed,Object? domain = freezed,Object? bogusPriv = freezed,Object? dnssec = freezed,Object? interface = freezed,Object? hostRecord = freezed,Object? listeningMode = freezed,Object? queryLogging = freezed,Object? cnameRecords = freezed,Object? port = freezed,Object? cache = freezed,Object? revServers = freezed,Object? blocking = freezed,Object? specialDomains = freezed,Object? reply = freezed,Object? rateLimit = freezed,}) {
  return _then(_Dns(
upstreams: freezed == upstreams ? _self._upstreams : upstreams // ignore: cast_nullable_to_non_nullable
as List<String>?,cnameDeepInspect: freezed == cnameDeepInspect ? _self.cnameDeepInspect : cnameDeepInspect // ignore: cast_nullable_to_non_nullable
as bool?,blockESNI: freezed == blockESNI ? _self.blockESNI : blockESNI // ignore: cast_nullable_to_non_nullable
as bool?,edns0ECS: freezed == edns0ECS ? _self.edns0ECS : edns0ECS // ignore: cast_nullable_to_non_nullable
as bool?,ignoreLocalhost: freezed == ignoreLocalhost ? _self.ignoreLocalhost : ignoreLocalhost // ignore: cast_nullable_to_non_nullable
as bool?,showDNSSEC: freezed == showDNSSEC ? _self.showDNSSEC : showDNSSEC // ignore: cast_nullable_to_non_nullable
as bool?,analyzeOnlyAandAAAA: freezed == analyzeOnlyAandAAAA ? _self.analyzeOnlyAandAAAA : analyzeOnlyAandAAAA // ignore: cast_nullable_to_non_nullable
as bool?,piholePTR: freezed == piholePTR ? _self.piholePTR : piholePTR // ignore: cast_nullable_to_non_nullable
as String?,replyWhenBusy: freezed == replyWhenBusy ? _self.replyWhenBusy : replyWhenBusy // ignore: cast_nullable_to_non_nullable
as String?,blockTTL: freezed == blockTTL ? _self.blockTTL : blockTTL // ignore: cast_nullable_to_non_nullable
as int?,hosts: freezed == hosts ? _self._hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<String>?,domainNeeded: freezed == domainNeeded ? _self.domainNeeded : domainNeeded // ignore: cast_nullable_to_non_nullable
as bool?,expandHosts: freezed == expandHosts ? _self.expandHosts : expandHosts // ignore: cast_nullable_to_non_nullable
as bool?,domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,bogusPriv: freezed == bogusPriv ? _self.bogusPriv : bogusPriv // ignore: cast_nullable_to_non_nullable
as bool?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as bool?,interface: freezed == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as String?,hostRecord: freezed == hostRecord ? _self.hostRecord : hostRecord // ignore: cast_nullable_to_non_nullable
as String?,listeningMode: freezed == listeningMode ? _self.listeningMode : listeningMode // ignore: cast_nullable_to_non_nullable
as String?,queryLogging: freezed == queryLogging ? _self.queryLogging : queryLogging // ignore: cast_nullable_to_non_nullable
as bool?,cnameRecords: freezed == cnameRecords ? _self._cnameRecords : cnameRecords // ignore: cast_nullable_to_non_nullable
as List<String>?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int?,cache: freezed == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as DnsCache?,revServers: freezed == revServers ? _self._revServers : revServers // ignore: cast_nullable_to_non_nullable
as List<String>?,blocking: freezed == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as DnsBlocking?,specialDomains: freezed == specialDomains ? _self.specialDomains : specialDomains // ignore: cast_nullable_to_non_nullable
as SpecialDomains?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as DnsReply?,rateLimit: freezed == rateLimit ? _self.rateLimit : rateLimit // ignore: cast_nullable_to_non_nullable
as RateLimit?,
  ));
}

/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<$Res>? get cache {
    if (_self.cache == null) {
    return null;
  }

  return $DnsCacheCopyWith<$Res>(_self.cache!, (value) {
    return _then(_self.copyWith(cache: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsBlockingCopyWith<$Res>? get blocking {
    if (_self.blocking == null) {
    return null;
  }

  return $DnsBlockingCopyWith<$Res>(_self.blocking!, (value) {
    return _then(_self.copyWith(blocking: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpecialDomainsCopyWith<$Res>? get specialDomains {
    if (_self.specialDomains == null) {
    return null;
  }

  return $SpecialDomainsCopyWith<$Res>(_self.specialDomains!, (value) {
    return _then(_self.copyWith(specialDomains: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsReplyCopyWith<$Res>? get reply {
    if (_self.reply == null) {
    return null;
  }

  return $DnsReplyCopyWith<$Res>(_self.reply!, (value) {
    return _then(_self.copyWith(reply: value));
  });
}/// Create a copy of Dns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateLimitCopyWith<$Res>? get rateLimit {
    if (_self.rateLimit == null) {
    return null;
  }

  return $RateLimitCopyWith<$Res>(_self.rateLimit!, (value) {
    return _then(_self.copyWith(rateLimit: value));
  });
}
}


/// @nodoc
mixin _$DnsCache {

 int? get size; int? get optimizer; int? get upstreamBlockedTTL;
/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<DnsCache> get copyWith => _$DnsCacheCopyWithImpl<DnsCache>(this as DnsCache, _$identity);

  /// Serializes this DnsCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsCache&&(identical(other.size, size) || other.size == size)&&(identical(other.optimizer, optimizer) || other.optimizer == optimizer)&&(identical(other.upstreamBlockedTTL, upstreamBlockedTTL) || other.upstreamBlockedTTL == upstreamBlockedTTL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,optimizer,upstreamBlockedTTL);

@override
String toString() {
  return 'DnsCache(size: $size, optimizer: $optimizer, upstreamBlockedTTL: $upstreamBlockedTTL)';
}


}

/// @nodoc
abstract mixin class $DnsCacheCopyWith<$Res>  {
  factory $DnsCacheCopyWith(DnsCache value, $Res Function(DnsCache) _then) = _$DnsCacheCopyWithImpl;
@useResult
$Res call({
 int? size, int? optimizer, int? upstreamBlockedTTL
});




}
/// @nodoc
class _$DnsCacheCopyWithImpl<$Res>
    implements $DnsCacheCopyWith<$Res> {
  _$DnsCacheCopyWithImpl(this._self, this._then);

  final DnsCache _self;
  final $Res Function(DnsCache) _then;

/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = freezed,Object? optimizer = freezed,Object? upstreamBlockedTTL = freezed,}) {
  return _then(_self.copyWith(
size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,optimizer: freezed == optimizer ? _self.optimizer : optimizer // ignore: cast_nullable_to_non_nullable
as int?,upstreamBlockedTTL: freezed == upstreamBlockedTTL ? _self.upstreamBlockedTTL : upstreamBlockedTTL // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsCache].
extension DnsCachePatterns on DnsCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsCache value)  $default,){
final _that = this;
switch (_that) {
case _DnsCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsCache value)?  $default,){
final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? size,  int? optimizer,  int? upstreamBlockedTTL)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
return $default(_that.size,_that.optimizer,_that.upstreamBlockedTTL);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? size,  int? optimizer,  int? upstreamBlockedTTL)  $default,) {final _that = this;
switch (_that) {
case _DnsCache():
return $default(_that.size,_that.optimizer,_that.upstreamBlockedTTL);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? size,  int? optimizer,  int? upstreamBlockedTTL)?  $default,) {final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
return $default(_that.size,_that.optimizer,_that.upstreamBlockedTTL);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _DnsCache implements DnsCache {
  const _DnsCache({this.size, this.optimizer, this.upstreamBlockedTTL});
  factory _DnsCache.fromJson(Map<String, dynamic> json) => _$DnsCacheFromJson(json);

@override final  int? size;
@override final  int? optimizer;
@override final  int? upstreamBlockedTTL;

/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsCacheCopyWith<_DnsCache> get copyWith => __$DnsCacheCopyWithImpl<_DnsCache>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsCacheToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsCache&&(identical(other.size, size) || other.size == size)&&(identical(other.optimizer, optimizer) || other.optimizer == optimizer)&&(identical(other.upstreamBlockedTTL, upstreamBlockedTTL) || other.upstreamBlockedTTL == upstreamBlockedTTL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,optimizer,upstreamBlockedTTL);

@override
String toString() {
  return 'DnsCache(size: $size, optimizer: $optimizer, upstreamBlockedTTL: $upstreamBlockedTTL)';
}


}

/// @nodoc
abstract mixin class _$DnsCacheCopyWith<$Res> implements $DnsCacheCopyWith<$Res> {
  factory _$DnsCacheCopyWith(_DnsCache value, $Res Function(_DnsCache) _then) = __$DnsCacheCopyWithImpl;
@override @useResult
$Res call({
 int? size, int? optimizer, int? upstreamBlockedTTL
});




}
/// @nodoc
class __$DnsCacheCopyWithImpl<$Res>
    implements _$DnsCacheCopyWith<$Res> {
  __$DnsCacheCopyWithImpl(this._self, this._then);

  final _DnsCache _self;
  final $Res Function(_DnsCache) _then;

/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = freezed,Object? optimizer = freezed,Object? upstreamBlockedTTL = freezed,}) {
  return _then(_DnsCache(
size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,optimizer: freezed == optimizer ? _self.optimizer : optimizer // ignore: cast_nullable_to_non_nullable
as int?,upstreamBlockedTTL: freezed == upstreamBlockedTTL ? _self.upstreamBlockedTTL : upstreamBlockedTTL // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DnsBlocking {

 bool? get active; String? get mode; String? get edns;
/// Create a copy of DnsBlocking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsBlockingCopyWith<DnsBlocking> get copyWith => _$DnsBlockingCopyWithImpl<DnsBlocking>(this as DnsBlocking, _$identity);

  /// Serializes this DnsBlocking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsBlocking&&(identical(other.active, active) || other.active == active)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.edns, edns) || other.edns == edns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,mode,edns);

@override
String toString() {
  return 'DnsBlocking(active: $active, mode: $mode, edns: $edns)';
}


}

/// @nodoc
abstract mixin class $DnsBlockingCopyWith<$Res>  {
  factory $DnsBlockingCopyWith(DnsBlocking value, $Res Function(DnsBlocking) _then) = _$DnsBlockingCopyWithImpl;
@useResult
$Res call({
 bool? active, String? mode, String? edns
});




}
/// @nodoc
class _$DnsBlockingCopyWithImpl<$Res>
    implements $DnsBlockingCopyWith<$Res> {
  _$DnsBlockingCopyWithImpl(this._self, this._then);

  final DnsBlocking _self;
  final $Res Function(DnsBlocking) _then;

/// Create a copy of DnsBlocking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = freezed,Object? mode = freezed,Object? edns = freezed,}) {
  return _then(_self.copyWith(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,edns: freezed == edns ? _self.edns : edns // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsBlocking].
extension DnsBlockingPatterns on DnsBlocking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsBlocking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsBlocking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsBlocking value)  $default,){
final _that = this;
switch (_that) {
case _DnsBlocking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsBlocking value)?  $default,){
final _that = this;
switch (_that) {
case _DnsBlocking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? active,  String? mode,  String? edns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsBlocking() when $default != null:
return $default(_that.active,_that.mode,_that.edns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? active,  String? mode,  String? edns)  $default,) {final _that = this;
switch (_that) {
case _DnsBlocking():
return $default(_that.active,_that.mode,_that.edns);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? active,  String? mode,  String? edns)?  $default,) {final _that = this;
switch (_that) {
case _DnsBlocking() when $default != null:
return $default(_that.active,_that.mode,_that.edns);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _DnsBlocking implements DnsBlocking {
  const _DnsBlocking({this.active, this.mode, this.edns});
  factory _DnsBlocking.fromJson(Map<String, dynamic> json) => _$DnsBlockingFromJson(json);

@override final  bool? active;
@override final  String? mode;
@override final  String? edns;

/// Create a copy of DnsBlocking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsBlockingCopyWith<_DnsBlocking> get copyWith => __$DnsBlockingCopyWithImpl<_DnsBlocking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsBlockingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsBlocking&&(identical(other.active, active) || other.active == active)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.edns, edns) || other.edns == edns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,mode,edns);

@override
String toString() {
  return 'DnsBlocking(active: $active, mode: $mode, edns: $edns)';
}


}

/// @nodoc
abstract mixin class _$DnsBlockingCopyWith<$Res> implements $DnsBlockingCopyWith<$Res> {
  factory _$DnsBlockingCopyWith(_DnsBlocking value, $Res Function(_DnsBlocking) _then) = __$DnsBlockingCopyWithImpl;
@override @useResult
$Res call({
 bool? active, String? mode, String? edns
});




}
/// @nodoc
class __$DnsBlockingCopyWithImpl<$Res>
    implements _$DnsBlockingCopyWith<$Res> {
  __$DnsBlockingCopyWithImpl(this._self, this._then);

  final _DnsBlocking _self;
  final $Res Function(_DnsBlocking) _then;

/// Create a copy of DnsBlocking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = freezed,Object? mode = freezed,Object? edns = freezed,}) {
  return _then(_DnsBlocking(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,edns: freezed == edns ? _self.edns : edns // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SpecialDomains {

 bool? get mozillaCanary; bool? get iCloudPrivateRelay; bool? get designatedResolver;
/// Create a copy of SpecialDomains
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialDomainsCopyWith<SpecialDomains> get copyWith => _$SpecialDomainsCopyWithImpl<SpecialDomains>(this as SpecialDomains, _$identity);

  /// Serializes this SpecialDomains to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialDomains&&(identical(other.mozillaCanary, mozillaCanary) || other.mozillaCanary == mozillaCanary)&&(identical(other.iCloudPrivateRelay, iCloudPrivateRelay) || other.iCloudPrivateRelay == iCloudPrivateRelay)&&(identical(other.designatedResolver, designatedResolver) || other.designatedResolver == designatedResolver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mozillaCanary,iCloudPrivateRelay,designatedResolver);

@override
String toString() {
  return 'SpecialDomains(mozillaCanary: $mozillaCanary, iCloudPrivateRelay: $iCloudPrivateRelay, designatedResolver: $designatedResolver)';
}


}

/// @nodoc
abstract mixin class $SpecialDomainsCopyWith<$Res>  {
  factory $SpecialDomainsCopyWith(SpecialDomains value, $Res Function(SpecialDomains) _then) = _$SpecialDomainsCopyWithImpl;
@useResult
$Res call({
 bool? mozillaCanary, bool? iCloudPrivateRelay, bool? designatedResolver
});




}
/// @nodoc
class _$SpecialDomainsCopyWithImpl<$Res>
    implements $SpecialDomainsCopyWith<$Res> {
  _$SpecialDomainsCopyWithImpl(this._self, this._then);

  final SpecialDomains _self;
  final $Res Function(SpecialDomains) _then;

/// Create a copy of SpecialDomains
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mozillaCanary = freezed,Object? iCloudPrivateRelay = freezed,Object? designatedResolver = freezed,}) {
  return _then(_self.copyWith(
mozillaCanary: freezed == mozillaCanary ? _self.mozillaCanary : mozillaCanary // ignore: cast_nullable_to_non_nullable
as bool?,iCloudPrivateRelay: freezed == iCloudPrivateRelay ? _self.iCloudPrivateRelay : iCloudPrivateRelay // ignore: cast_nullable_to_non_nullable
as bool?,designatedResolver: freezed == designatedResolver ? _self.designatedResolver : designatedResolver // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecialDomains].
extension SpecialDomainsPatterns on SpecialDomains {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialDomains value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialDomains() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialDomains value)  $default,){
final _that = this;
switch (_that) {
case _SpecialDomains():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialDomains value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialDomains() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? mozillaCanary,  bool? iCloudPrivateRelay,  bool? designatedResolver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialDomains() when $default != null:
return $default(_that.mozillaCanary,_that.iCloudPrivateRelay,_that.designatedResolver);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? mozillaCanary,  bool? iCloudPrivateRelay,  bool? designatedResolver)  $default,) {final _that = this;
switch (_that) {
case _SpecialDomains():
return $default(_that.mozillaCanary,_that.iCloudPrivateRelay,_that.designatedResolver);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? mozillaCanary,  bool? iCloudPrivateRelay,  bool? designatedResolver)?  $default,) {final _that = this;
switch (_that) {
case _SpecialDomains() when $default != null:
return $default(_that.mozillaCanary,_that.iCloudPrivateRelay,_that.designatedResolver);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _SpecialDomains implements SpecialDomains {
  const _SpecialDomains({this.mozillaCanary, this.iCloudPrivateRelay, this.designatedResolver});
  factory _SpecialDomains.fromJson(Map<String, dynamic> json) => _$SpecialDomainsFromJson(json);

@override final  bool? mozillaCanary;
@override final  bool? iCloudPrivateRelay;
@override final  bool? designatedResolver;

/// Create a copy of SpecialDomains
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialDomainsCopyWith<_SpecialDomains> get copyWith => __$SpecialDomainsCopyWithImpl<_SpecialDomains>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecialDomainsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialDomains&&(identical(other.mozillaCanary, mozillaCanary) || other.mozillaCanary == mozillaCanary)&&(identical(other.iCloudPrivateRelay, iCloudPrivateRelay) || other.iCloudPrivateRelay == iCloudPrivateRelay)&&(identical(other.designatedResolver, designatedResolver) || other.designatedResolver == designatedResolver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mozillaCanary,iCloudPrivateRelay,designatedResolver);

@override
String toString() {
  return 'SpecialDomains(mozillaCanary: $mozillaCanary, iCloudPrivateRelay: $iCloudPrivateRelay, designatedResolver: $designatedResolver)';
}


}

/// @nodoc
abstract mixin class _$SpecialDomainsCopyWith<$Res> implements $SpecialDomainsCopyWith<$Res> {
  factory _$SpecialDomainsCopyWith(_SpecialDomains value, $Res Function(_SpecialDomains) _then) = __$SpecialDomainsCopyWithImpl;
@override @useResult
$Res call({
 bool? mozillaCanary, bool? iCloudPrivateRelay, bool? designatedResolver
});




}
/// @nodoc
class __$SpecialDomainsCopyWithImpl<$Res>
    implements _$SpecialDomainsCopyWith<$Res> {
  __$SpecialDomainsCopyWithImpl(this._self, this._then);

  final _SpecialDomains _self;
  final $Res Function(_SpecialDomains) _then;

/// Create a copy of SpecialDomains
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mozillaCanary = freezed,Object? iCloudPrivateRelay = freezed,Object? designatedResolver = freezed,}) {
  return _then(_SpecialDomains(
mozillaCanary: freezed == mozillaCanary ? _self.mozillaCanary : mozillaCanary // ignore: cast_nullable_to_non_nullable
as bool?,iCloudPrivateRelay: freezed == iCloudPrivateRelay ? _self.iCloudPrivateRelay : iCloudPrivateRelay // ignore: cast_nullable_to_non_nullable
as bool?,designatedResolver: freezed == designatedResolver ? _self.designatedResolver : designatedResolver // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$DnsReply {

 ReplyHost? get host; ReplyHost? get blocking;
/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsReplyCopyWith<DnsReply> get copyWith => _$DnsReplyCopyWithImpl<DnsReply>(this as DnsReply, _$identity);

  /// Serializes this DnsReply to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsReply&&(identical(other.host, host) || other.host == host)&&(identical(other.blocking, blocking) || other.blocking == blocking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,blocking);

@override
String toString() {
  return 'DnsReply(host: $host, blocking: $blocking)';
}


}

/// @nodoc
abstract mixin class $DnsReplyCopyWith<$Res>  {
  factory $DnsReplyCopyWith(DnsReply value, $Res Function(DnsReply) _then) = _$DnsReplyCopyWithImpl;
@useResult
$Res call({
 ReplyHost? host, ReplyHost? blocking
});


$ReplyHostCopyWith<$Res>? get host;$ReplyHostCopyWith<$Res>? get blocking;

}
/// @nodoc
class _$DnsReplyCopyWithImpl<$Res>
    implements $DnsReplyCopyWith<$Res> {
  _$DnsReplyCopyWithImpl(this._self, this._then);

  final DnsReply _self;
  final $Res Function(DnsReply) _then;

/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = freezed,Object? blocking = freezed,}) {
  return _then(_self.copyWith(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as ReplyHost?,blocking: freezed == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as ReplyHost?,
  ));
}
/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyHostCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $ReplyHostCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyHostCopyWith<$Res>? get blocking {
    if (_self.blocking == null) {
    return null;
  }

  return $ReplyHostCopyWith<$Res>(_self.blocking!, (value) {
    return _then(_self.copyWith(blocking: value));
  });
}
}


/// Adds pattern-matching-related methods to [DnsReply].
extension DnsReplyPatterns on DnsReply {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsReply value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsReply() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsReply value)  $default,){
final _that = this;
switch (_that) {
case _DnsReply():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsReply value)?  $default,){
final _that = this;
switch (_that) {
case _DnsReply() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReplyHost? host,  ReplyHost? blocking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsReply() when $default != null:
return $default(_that.host,_that.blocking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReplyHost? host,  ReplyHost? blocking)  $default,) {final _that = this;
switch (_that) {
case _DnsReply():
return $default(_that.host,_that.blocking);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReplyHost? host,  ReplyHost? blocking)?  $default,) {final _that = this;
switch (_that) {
case _DnsReply() when $default != null:
return $default(_that.host,_that.blocking);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _DnsReply implements DnsReply {
  const _DnsReply({this.host, this.blocking});
  factory _DnsReply.fromJson(Map<String, dynamic> json) => _$DnsReplyFromJson(json);

@override final  ReplyHost? host;
@override final  ReplyHost? blocking;

/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsReplyCopyWith<_DnsReply> get copyWith => __$DnsReplyCopyWithImpl<_DnsReply>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsReplyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsReply&&(identical(other.host, host) || other.host == host)&&(identical(other.blocking, blocking) || other.blocking == blocking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,blocking);

@override
String toString() {
  return 'DnsReply(host: $host, blocking: $blocking)';
}


}

/// @nodoc
abstract mixin class _$DnsReplyCopyWith<$Res> implements $DnsReplyCopyWith<$Res> {
  factory _$DnsReplyCopyWith(_DnsReply value, $Res Function(_DnsReply) _then) = __$DnsReplyCopyWithImpl;
@override @useResult
$Res call({
 ReplyHost? host, ReplyHost? blocking
});


@override $ReplyHostCopyWith<$Res>? get host;@override $ReplyHostCopyWith<$Res>? get blocking;

}
/// @nodoc
class __$DnsReplyCopyWithImpl<$Res>
    implements _$DnsReplyCopyWith<$Res> {
  __$DnsReplyCopyWithImpl(this._self, this._then);

  final _DnsReply _self;
  final $Res Function(_DnsReply) _then;

/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = freezed,Object? blocking = freezed,}) {
  return _then(_DnsReply(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as ReplyHost?,blocking: freezed == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as ReplyHost?,
  ));
}

/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyHostCopyWith<$Res>? get host {
    if (_self.host == null) {
    return null;
  }

  return $ReplyHostCopyWith<$Res>(_self.host!, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of DnsReply
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyHostCopyWith<$Res>? get blocking {
    if (_self.blocking == null) {
    return null;
  }

  return $ReplyHostCopyWith<$Res>(_self.blocking!, (value) {
    return _then(_self.copyWith(blocking: value));
  });
}
}


/// @nodoc
mixin _$ReplyHost {

 bool? get force4; bool? get force6;@JsonKey(name: 'IPv4') String? get ipv4;@JsonKey(name: 'IPv6') String? get ipv6;
/// Create a copy of ReplyHost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyHostCopyWith<ReplyHost> get copyWith => _$ReplyHostCopyWithImpl<ReplyHost>(this as ReplyHost, _$identity);

  /// Serializes this ReplyHost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyHost&&(identical(other.force4, force4) || other.force4 == force4)&&(identical(other.force6, force6) || other.force6 == force6)&&(identical(other.ipv4, ipv4) || other.ipv4 == ipv4)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,force4,force6,ipv4,ipv6);

@override
String toString() {
  return 'ReplyHost(force4: $force4, force6: $force6, ipv4: $ipv4, ipv6: $ipv6)';
}


}

/// @nodoc
abstract mixin class $ReplyHostCopyWith<$Res>  {
  factory $ReplyHostCopyWith(ReplyHost value, $Res Function(ReplyHost) _then) = _$ReplyHostCopyWithImpl;
@useResult
$Res call({
 bool? force4, bool? force6,@JsonKey(name: 'IPv4') String? ipv4,@JsonKey(name: 'IPv6') String? ipv6
});




}
/// @nodoc
class _$ReplyHostCopyWithImpl<$Res>
    implements $ReplyHostCopyWith<$Res> {
  _$ReplyHostCopyWithImpl(this._self, this._then);

  final ReplyHost _self;
  final $Res Function(ReplyHost) _then;

/// Create a copy of ReplyHost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? force4 = freezed,Object? force6 = freezed,Object? ipv4 = freezed,Object? ipv6 = freezed,}) {
  return _then(_self.copyWith(
force4: freezed == force4 ? _self.force4 : force4 // ignore: cast_nullable_to_non_nullable
as bool?,force6: freezed == force6 ? _self.force6 : force6 // ignore: cast_nullable_to_non_nullable
as bool?,ipv4: freezed == ipv4 ? _self.ipv4 : ipv4 // ignore: cast_nullable_to_non_nullable
as String?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplyHost].
extension ReplyHostPatterns on ReplyHost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplyHost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplyHost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplyHost value)  $default,){
final _that = this;
switch (_that) {
case _ReplyHost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplyHost value)?  $default,){
final _that = this;
switch (_that) {
case _ReplyHost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? force4,  bool? force6, @JsonKey(name: 'IPv4')  String? ipv4, @JsonKey(name: 'IPv6')  String? ipv6)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyHost() when $default != null:
return $default(_that.force4,_that.force6,_that.ipv4,_that.ipv6);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? force4,  bool? force6, @JsonKey(name: 'IPv4')  String? ipv4, @JsonKey(name: 'IPv6')  String? ipv6)  $default,) {final _that = this;
switch (_that) {
case _ReplyHost():
return $default(_that.force4,_that.force6,_that.ipv4,_that.ipv6);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? force4,  bool? force6, @JsonKey(name: 'IPv4')  String? ipv4, @JsonKey(name: 'IPv6')  String? ipv6)?  $default,) {final _that = this;
switch (_that) {
case _ReplyHost() when $default != null:
return $default(_that.force4,_that.force6,_that.ipv4,_that.ipv6);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _ReplyHost implements ReplyHost {
  const _ReplyHost({this.force4, this.force6, @JsonKey(name: 'IPv4') this.ipv4, @JsonKey(name: 'IPv6') this.ipv6});
  factory _ReplyHost.fromJson(Map<String, dynamic> json) => _$ReplyHostFromJson(json);

@override final  bool? force4;
@override final  bool? force6;
@override@JsonKey(name: 'IPv4') final  String? ipv4;
@override@JsonKey(name: 'IPv6') final  String? ipv6;

/// Create a copy of ReplyHost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyHostCopyWith<_ReplyHost> get copyWith => __$ReplyHostCopyWithImpl<_ReplyHost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplyHostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyHost&&(identical(other.force4, force4) || other.force4 == force4)&&(identical(other.force6, force6) || other.force6 == force6)&&(identical(other.ipv4, ipv4) || other.ipv4 == ipv4)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,force4,force6,ipv4,ipv6);

@override
String toString() {
  return 'ReplyHost(force4: $force4, force6: $force6, ipv4: $ipv4, ipv6: $ipv6)';
}


}

/// @nodoc
abstract mixin class _$ReplyHostCopyWith<$Res> implements $ReplyHostCopyWith<$Res> {
  factory _$ReplyHostCopyWith(_ReplyHost value, $Res Function(_ReplyHost) _then) = __$ReplyHostCopyWithImpl;
@override @useResult
$Res call({
 bool? force4, bool? force6,@JsonKey(name: 'IPv4') String? ipv4,@JsonKey(name: 'IPv6') String? ipv6
});




}
/// @nodoc
class __$ReplyHostCopyWithImpl<$Res>
    implements _$ReplyHostCopyWith<$Res> {
  __$ReplyHostCopyWithImpl(this._self, this._then);

  final _ReplyHost _self;
  final $Res Function(_ReplyHost) _then;

/// Create a copy of ReplyHost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? force4 = freezed,Object? force6 = freezed,Object? ipv4 = freezed,Object? ipv6 = freezed,}) {
  return _then(_ReplyHost(
force4: freezed == force4 ? _self.force4 : force4 // ignore: cast_nullable_to_non_nullable
as bool?,force6: freezed == force6 ? _self.force6 : force6 // ignore: cast_nullable_to_non_nullable
as bool?,ipv4: freezed == ipv4 ? _self.ipv4 : ipv4 // ignore: cast_nullable_to_non_nullable
as String?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RateLimit {

 int? get count; int? get interval;
/// Create a copy of RateLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitCopyWith<RateLimit> get copyWith => _$RateLimitCopyWithImpl<RateLimit>(this as RateLimit, _$identity);

  /// Serializes this RateLimit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimit&&(identical(other.count, count) || other.count == count)&&(identical(other.interval, interval) || other.interval == interval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,interval);

@override
String toString() {
  return 'RateLimit(count: $count, interval: $interval)';
}


}

/// @nodoc
abstract mixin class $RateLimitCopyWith<$Res>  {
  factory $RateLimitCopyWith(RateLimit value, $Res Function(RateLimit) _then) = _$RateLimitCopyWithImpl;
@useResult
$Res call({
 int? count, int? interval
});




}
/// @nodoc
class _$RateLimitCopyWithImpl<$Res>
    implements $RateLimitCopyWith<$Res> {
  _$RateLimitCopyWithImpl(this._self, this._then);

  final RateLimit _self;
  final $Res Function(RateLimit) _then;

/// Create a copy of RateLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = freezed,Object? interval = freezed,}) {
  return _then(_self.copyWith(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RateLimit].
extension RateLimitPatterns on RateLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateLimit value)  $default,){
final _that = this;
switch (_that) {
case _RateLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateLimit value)?  $default,){
final _that = this;
switch (_that) {
case _RateLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? count,  int? interval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateLimit() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? count,  int? interval)  $default,) {final _that = this;
switch (_that) {
case _RateLimit():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? count,  int? interval)?  $default,) {final _that = this;
switch (_that) {
case _RateLimit() when $default != null:
return $default(_that.count,_that.interval);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _RateLimit implements RateLimit {
  const _RateLimit({this.count, this.interval});
  factory _RateLimit.fromJson(Map<String, dynamic> json) => _$RateLimitFromJson(json);

@override final  int? count;
@override final  int? interval;

/// Create a copy of RateLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateLimitCopyWith<_RateLimit> get copyWith => __$RateLimitCopyWithImpl<_RateLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateLimitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimit&&(identical(other.count, count) || other.count == count)&&(identical(other.interval, interval) || other.interval == interval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,interval);

@override
String toString() {
  return 'RateLimit(count: $count, interval: $interval)';
}


}

/// @nodoc
abstract mixin class _$RateLimitCopyWith<$Res> implements $RateLimitCopyWith<$Res> {
  factory _$RateLimitCopyWith(_RateLimit value, $Res Function(_RateLimit) _then) = __$RateLimitCopyWithImpl;
@override @useResult
$Res call({
 int? count, int? interval
});




}
/// @nodoc
class __$RateLimitCopyWithImpl<$Res>
    implements _$RateLimitCopyWith<$Res> {
  __$RateLimitCopyWithImpl(this._self, this._then);

  final _RateLimit _self;
  final $Res Function(_RateLimit) _then;

/// Create a copy of RateLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = freezed,Object? interval = freezed,}) {
  return _then(_RateLimit(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Dhcp {

 bool? get active; String? get start; String? get end; String? get router; String? get netmask; String? get leaseTime; bool? get ipv6; bool? get rapidCommit; bool? get multiDNS; bool? get logging; bool? get ignoreUnknownClients; List<String>? get hosts;
/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DhcpCopyWith<Dhcp> get copyWith => _$DhcpCopyWithImpl<Dhcp>(this as Dhcp, _$identity);

  /// Serializes this Dhcp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dhcp&&(identical(other.active, active) || other.active == active)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.router, router) || other.router == router)&&(identical(other.netmask, netmask) || other.netmask == netmask)&&(identical(other.leaseTime, leaseTime) || other.leaseTime == leaseTime)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6)&&(identical(other.rapidCommit, rapidCommit) || other.rapidCommit == rapidCommit)&&(identical(other.multiDNS, multiDNS) || other.multiDNS == multiDNS)&&(identical(other.logging, logging) || other.logging == logging)&&(identical(other.ignoreUnknownClients, ignoreUnknownClients) || other.ignoreUnknownClients == ignoreUnknownClients)&&const DeepCollectionEquality().equals(other.hosts, hosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,start,end,router,netmask,leaseTime,ipv6,rapidCommit,multiDNS,logging,ignoreUnknownClients,const DeepCollectionEquality().hash(hosts));

@override
String toString() {
  return 'Dhcp(active: $active, start: $start, end: $end, router: $router, netmask: $netmask, leaseTime: $leaseTime, ipv6: $ipv6, rapidCommit: $rapidCommit, multiDNS: $multiDNS, logging: $logging, ignoreUnknownClients: $ignoreUnknownClients, hosts: $hosts)';
}


}

/// @nodoc
abstract mixin class $DhcpCopyWith<$Res>  {
  factory $DhcpCopyWith(Dhcp value, $Res Function(Dhcp) _then) = _$DhcpCopyWithImpl;
@useResult
$Res call({
 bool? active, String? start, String? end, String? router, String? netmask, String? leaseTime, bool? ipv6, bool? rapidCommit, bool? multiDNS, bool? logging, bool? ignoreUnknownClients, List<String>? hosts
});




}
/// @nodoc
class _$DhcpCopyWithImpl<$Res>
    implements $DhcpCopyWith<$Res> {
  _$DhcpCopyWithImpl(this._self, this._then);

  final Dhcp _self;
  final $Res Function(Dhcp) _then;

/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = freezed,Object? start = freezed,Object? end = freezed,Object? router = freezed,Object? netmask = freezed,Object? leaseTime = freezed,Object? ipv6 = freezed,Object? rapidCommit = freezed,Object? multiDNS = freezed,Object? logging = freezed,Object? ignoreUnknownClients = freezed,Object? hosts = freezed,}) {
  return _then(_self.copyWith(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,router: freezed == router ? _self.router : router // ignore: cast_nullable_to_non_nullable
as String?,netmask: freezed == netmask ? _self.netmask : netmask // ignore: cast_nullable_to_non_nullable
as String?,leaseTime: freezed == leaseTime ? _self.leaseTime : leaseTime // ignore: cast_nullable_to_non_nullable
as String?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as bool?,rapidCommit: freezed == rapidCommit ? _self.rapidCommit : rapidCommit // ignore: cast_nullable_to_non_nullable
as bool?,multiDNS: freezed == multiDNS ? _self.multiDNS : multiDNS // ignore: cast_nullable_to_non_nullable
as bool?,logging: freezed == logging ? _self.logging : logging // ignore: cast_nullable_to_non_nullable
as bool?,ignoreUnknownClients: freezed == ignoreUnknownClients ? _self.ignoreUnknownClients : ignoreUnknownClients // ignore: cast_nullable_to_non_nullable
as bool?,hosts: freezed == hosts ? _self.hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Dhcp].
extension DhcpPatterns on Dhcp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dhcp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dhcp value)  $default,){
final _that = this;
switch (_that) {
case _Dhcp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dhcp value)?  $default,){
final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? active,  String? start,  String? end,  String? router,  String? netmask,  String? leaseTime,  bool? ipv6,  bool? rapidCommit,  bool? multiDNS,  bool? logging,  bool? ignoreUnknownClients,  List<String>? hosts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
return $default(_that.active,_that.start,_that.end,_that.router,_that.netmask,_that.leaseTime,_that.ipv6,_that.rapidCommit,_that.multiDNS,_that.logging,_that.ignoreUnknownClients,_that.hosts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? active,  String? start,  String? end,  String? router,  String? netmask,  String? leaseTime,  bool? ipv6,  bool? rapidCommit,  bool? multiDNS,  bool? logging,  bool? ignoreUnknownClients,  List<String>? hosts)  $default,) {final _that = this;
switch (_that) {
case _Dhcp():
return $default(_that.active,_that.start,_that.end,_that.router,_that.netmask,_that.leaseTime,_that.ipv6,_that.rapidCommit,_that.multiDNS,_that.logging,_that.ignoreUnknownClients,_that.hosts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? active,  String? start,  String? end,  String? router,  String? netmask,  String? leaseTime,  bool? ipv6,  bool? rapidCommit,  bool? multiDNS,  bool? logging,  bool? ignoreUnknownClients,  List<String>? hosts)?  $default,) {final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
return $default(_that.active,_that.start,_that.end,_that.router,_that.netmask,_that.leaseTime,_that.ipv6,_that.rapidCommit,_that.multiDNS,_that.logging,_that.ignoreUnknownClients,_that.hosts);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Dhcp implements Dhcp {
  const _Dhcp({this.active, this.start, this.end, this.router, this.netmask, this.leaseTime, this.ipv6, this.rapidCommit, this.multiDNS, this.logging, this.ignoreUnknownClients, final  List<String>? hosts}): _hosts = hosts;
  factory _Dhcp.fromJson(Map<String, dynamic> json) => _$DhcpFromJson(json);

@override final  bool? active;
@override final  String? start;
@override final  String? end;
@override final  String? router;
@override final  String? netmask;
@override final  String? leaseTime;
@override final  bool? ipv6;
@override final  bool? rapidCommit;
@override final  bool? multiDNS;
@override final  bool? logging;
@override final  bool? ignoreUnknownClients;
 final  List<String>? _hosts;
@override List<String>? get hosts {
  final value = _hosts;
  if (value == null) return null;
  if (_hosts is EqualUnmodifiableListView) return _hosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DhcpCopyWith<_Dhcp> get copyWith => __$DhcpCopyWithImpl<_Dhcp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DhcpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dhcp&&(identical(other.active, active) || other.active == active)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.router, router) || other.router == router)&&(identical(other.netmask, netmask) || other.netmask == netmask)&&(identical(other.leaseTime, leaseTime) || other.leaseTime == leaseTime)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6)&&(identical(other.rapidCommit, rapidCommit) || other.rapidCommit == rapidCommit)&&(identical(other.multiDNS, multiDNS) || other.multiDNS == multiDNS)&&(identical(other.logging, logging) || other.logging == logging)&&(identical(other.ignoreUnknownClients, ignoreUnknownClients) || other.ignoreUnknownClients == ignoreUnknownClients)&&const DeepCollectionEquality().equals(other._hosts, _hosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,start,end,router,netmask,leaseTime,ipv6,rapidCommit,multiDNS,logging,ignoreUnknownClients,const DeepCollectionEquality().hash(_hosts));

@override
String toString() {
  return 'Dhcp(active: $active, start: $start, end: $end, router: $router, netmask: $netmask, leaseTime: $leaseTime, ipv6: $ipv6, rapidCommit: $rapidCommit, multiDNS: $multiDNS, logging: $logging, ignoreUnknownClients: $ignoreUnknownClients, hosts: $hosts)';
}


}

/// @nodoc
abstract mixin class _$DhcpCopyWith<$Res> implements $DhcpCopyWith<$Res> {
  factory _$DhcpCopyWith(_Dhcp value, $Res Function(_Dhcp) _then) = __$DhcpCopyWithImpl;
@override @useResult
$Res call({
 bool? active, String? start, String? end, String? router, String? netmask, String? leaseTime, bool? ipv6, bool? rapidCommit, bool? multiDNS, bool? logging, bool? ignoreUnknownClients, List<String>? hosts
});




}
/// @nodoc
class __$DhcpCopyWithImpl<$Res>
    implements _$DhcpCopyWith<$Res> {
  __$DhcpCopyWithImpl(this._self, this._then);

  final _Dhcp _self;
  final $Res Function(_Dhcp) _then;

/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = freezed,Object? start = freezed,Object? end = freezed,Object? router = freezed,Object? netmask = freezed,Object? leaseTime = freezed,Object? ipv6 = freezed,Object? rapidCommit = freezed,Object? multiDNS = freezed,Object? logging = freezed,Object? ignoreUnknownClients = freezed,Object? hosts = freezed,}) {
  return _then(_Dhcp(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,router: freezed == router ? _self.router : router // ignore: cast_nullable_to_non_nullable
as String?,netmask: freezed == netmask ? _self.netmask : netmask // ignore: cast_nullable_to_non_nullable
as String?,leaseTime: freezed == leaseTime ? _self.leaseTime : leaseTime // ignore: cast_nullable_to_non_nullable
as String?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as bool?,rapidCommit: freezed == rapidCommit ? _self.rapidCommit : rapidCommit // ignore: cast_nullable_to_non_nullable
as bool?,multiDNS: freezed == multiDNS ? _self.multiDNS : multiDNS // ignore: cast_nullable_to_non_nullable
as bool?,logging: freezed == logging ? _self.logging : logging // ignore: cast_nullable_to_non_nullable
as bool?,ignoreUnknownClients: freezed == ignoreUnknownClients ? _self.ignoreUnknownClients : ignoreUnknownClients // ignore: cast_nullable_to_non_nullable
as bool?,hosts: freezed == hosts ? _self._hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$Ntp {

 NtpEntry? get ipv4; NtpEntry? get ipv6; NtpSync? get sync;
/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NtpCopyWith<Ntp> get copyWith => _$NtpCopyWithImpl<Ntp>(this as Ntp, _$identity);

  /// Serializes this Ntp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ntp&&(identical(other.ipv4, ipv4) || other.ipv4 == ipv4)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6)&&(identical(other.sync, sync) || other.sync == sync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ipv4,ipv6,sync);

@override
String toString() {
  return 'Ntp(ipv4: $ipv4, ipv6: $ipv6, sync: $sync)';
}


}

/// @nodoc
abstract mixin class $NtpCopyWith<$Res>  {
  factory $NtpCopyWith(Ntp value, $Res Function(Ntp) _then) = _$NtpCopyWithImpl;
@useResult
$Res call({
 NtpEntry? ipv4, NtpEntry? ipv6, NtpSync? sync
});


$NtpEntryCopyWith<$Res>? get ipv4;$NtpEntryCopyWith<$Res>? get ipv6;$NtpSyncCopyWith<$Res>? get sync;

}
/// @nodoc
class _$NtpCopyWithImpl<$Res>
    implements $NtpCopyWith<$Res> {
  _$NtpCopyWithImpl(this._self, this._then);

  final Ntp _self;
  final $Res Function(Ntp) _then;

/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ipv4 = freezed,Object? ipv6 = freezed,Object? sync = freezed,}) {
  return _then(_self.copyWith(
ipv4: freezed == ipv4 ? _self.ipv4 : ipv4 // ignore: cast_nullable_to_non_nullable
as NtpEntry?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as NtpEntry?,sync: freezed == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as NtpSync?,
  ));
}
/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpEntryCopyWith<$Res>? get ipv4 {
    if (_self.ipv4 == null) {
    return null;
  }

  return $NtpEntryCopyWith<$Res>(_self.ipv4!, (value) {
    return _then(_self.copyWith(ipv4: value));
  });
}/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpEntryCopyWith<$Res>? get ipv6 {
    if (_self.ipv6 == null) {
    return null;
  }

  return $NtpEntryCopyWith<$Res>(_self.ipv6!, (value) {
    return _then(_self.copyWith(ipv6: value));
  });
}/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpSyncCopyWith<$Res>? get sync {
    if (_self.sync == null) {
    return null;
  }

  return $NtpSyncCopyWith<$Res>(_self.sync!, (value) {
    return _then(_self.copyWith(sync: value));
  });
}
}


/// Adds pattern-matching-related methods to [Ntp].
extension NtpPatterns on Ntp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ntp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ntp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ntp value)  $default,){
final _that = this;
switch (_that) {
case _Ntp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ntp value)?  $default,){
final _that = this;
switch (_that) {
case _Ntp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NtpEntry? ipv4,  NtpEntry? ipv6,  NtpSync? sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ntp() when $default != null:
return $default(_that.ipv4,_that.ipv6,_that.sync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NtpEntry? ipv4,  NtpEntry? ipv6,  NtpSync? sync)  $default,) {final _that = this;
switch (_that) {
case _Ntp():
return $default(_that.ipv4,_that.ipv6,_that.sync);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NtpEntry? ipv4,  NtpEntry? ipv6,  NtpSync? sync)?  $default,) {final _that = this;
switch (_that) {
case _Ntp() when $default != null:
return $default(_that.ipv4,_that.ipv6,_that.sync);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Ntp implements Ntp {
  const _Ntp({this.ipv4, this.ipv6, this.sync});
  factory _Ntp.fromJson(Map<String, dynamic> json) => _$NtpFromJson(json);

@override final  NtpEntry? ipv4;
@override final  NtpEntry? ipv6;
@override final  NtpSync? sync;

/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NtpCopyWith<_Ntp> get copyWith => __$NtpCopyWithImpl<_Ntp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NtpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ntp&&(identical(other.ipv4, ipv4) || other.ipv4 == ipv4)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6)&&(identical(other.sync, sync) || other.sync == sync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ipv4,ipv6,sync);

@override
String toString() {
  return 'Ntp(ipv4: $ipv4, ipv6: $ipv6, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$NtpCopyWith<$Res> implements $NtpCopyWith<$Res> {
  factory _$NtpCopyWith(_Ntp value, $Res Function(_Ntp) _then) = __$NtpCopyWithImpl;
@override @useResult
$Res call({
 NtpEntry? ipv4, NtpEntry? ipv6, NtpSync? sync
});


@override $NtpEntryCopyWith<$Res>? get ipv4;@override $NtpEntryCopyWith<$Res>? get ipv6;@override $NtpSyncCopyWith<$Res>? get sync;

}
/// @nodoc
class __$NtpCopyWithImpl<$Res>
    implements _$NtpCopyWith<$Res> {
  __$NtpCopyWithImpl(this._self, this._then);

  final _Ntp _self;
  final $Res Function(_Ntp) _then;

/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ipv4 = freezed,Object? ipv6 = freezed,Object? sync = freezed,}) {
  return _then(_Ntp(
ipv4: freezed == ipv4 ? _self.ipv4 : ipv4 // ignore: cast_nullable_to_non_nullable
as NtpEntry?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as NtpEntry?,sync: freezed == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as NtpSync?,
  ));
}

/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpEntryCopyWith<$Res>? get ipv4 {
    if (_self.ipv4 == null) {
    return null;
  }

  return $NtpEntryCopyWith<$Res>(_self.ipv4!, (value) {
    return _then(_self.copyWith(ipv4: value));
  });
}/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpEntryCopyWith<$Res>? get ipv6 {
    if (_self.ipv6 == null) {
    return null;
  }

  return $NtpEntryCopyWith<$Res>(_self.ipv6!, (value) {
    return _then(_self.copyWith(ipv6: value));
  });
}/// Create a copy of Ntp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpSyncCopyWith<$Res>? get sync {
    if (_self.sync == null) {
    return null;
  }

  return $NtpSyncCopyWith<$Res>(_self.sync!, (value) {
    return _then(_self.copyWith(sync: value));
  });
}
}


/// @nodoc
mixin _$NtpEntry {

@JsonSerializable(explicitToJson: true, includeIfNull: false) bool? get active; String? get address;
/// Create a copy of NtpEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NtpEntryCopyWith<NtpEntry> get copyWith => _$NtpEntryCopyWithImpl<NtpEntry>(this as NtpEntry, _$identity);

  /// Serializes this NtpEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NtpEntry&&(identical(other.active, active) || other.active == active)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,address);

@override
String toString() {
  return 'NtpEntry(active: $active, address: $address)';
}


}

/// @nodoc
abstract mixin class $NtpEntryCopyWith<$Res>  {
  factory $NtpEntryCopyWith(NtpEntry value, $Res Function(NtpEntry) _then) = _$NtpEntryCopyWithImpl;
@useResult
$Res call({
@JsonSerializable(explicitToJson: true, includeIfNull: false) bool? active, String? address
});




}
/// @nodoc
class _$NtpEntryCopyWithImpl<$Res>
    implements $NtpEntryCopyWith<$Res> {
  _$NtpEntryCopyWithImpl(this._self, this._then);

  final NtpEntry _self;
  final $Res Function(NtpEntry) _then;

/// Create a copy of NtpEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NtpEntry].
extension NtpEntryPatterns on NtpEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NtpEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NtpEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NtpEntry value)  $default,){
final _that = this;
switch (_that) {
case _NtpEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NtpEntry value)?  $default,){
final _that = this;
switch (_that) {
case _NtpEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonSerializable(explicitToJson: true, includeIfNull: false)  bool? active,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NtpEntry() when $default != null:
return $default(_that.active,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonSerializable(explicitToJson: true, includeIfNull: false)  bool? active,  String? address)  $default,) {final _that = this;
switch (_that) {
case _NtpEntry():
return $default(_that.active,_that.address);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonSerializable(explicitToJson: true, includeIfNull: false)  bool? active,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _NtpEntry() when $default != null:
return $default(_that.active,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NtpEntry implements NtpEntry {
  const _NtpEntry({@JsonSerializable(explicitToJson: true, includeIfNull: false) this.active, this.address});
  factory _NtpEntry.fromJson(Map<String, dynamic> json) => _$NtpEntryFromJson(json);

@override@JsonSerializable(explicitToJson: true, includeIfNull: false) final  bool? active;
@override final  String? address;

/// Create a copy of NtpEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NtpEntryCopyWith<_NtpEntry> get copyWith => __$NtpEntryCopyWithImpl<_NtpEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NtpEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NtpEntry&&(identical(other.active, active) || other.active == active)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,address);

@override
String toString() {
  return 'NtpEntry(active: $active, address: $address)';
}


}

/// @nodoc
abstract mixin class _$NtpEntryCopyWith<$Res> implements $NtpEntryCopyWith<$Res> {
  factory _$NtpEntryCopyWith(_NtpEntry value, $Res Function(_NtpEntry) _then) = __$NtpEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonSerializable(explicitToJson: true, includeIfNull: false) bool? active, String? address
});




}
/// @nodoc
class __$NtpEntryCopyWithImpl<$Res>
    implements _$NtpEntryCopyWith<$Res> {
  __$NtpEntryCopyWithImpl(this._self, this._then);

  final _NtpEntry _self;
  final $Res Function(_NtpEntry) _then;

/// Create a copy of NtpEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = freezed,Object? address = freezed,}) {
  return _then(_NtpEntry(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NtpSync {

 bool? get active; String? get server; int? get interval; int? get count; NtpRtc? get rtc;
/// Create a copy of NtpSync
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NtpSyncCopyWith<NtpSync> get copyWith => _$NtpSyncCopyWithImpl<NtpSync>(this as NtpSync, _$identity);

  /// Serializes this NtpSync to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NtpSync&&(identical(other.active, active) || other.active == active)&&(identical(other.server, server) || other.server == server)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.count, count) || other.count == count)&&(identical(other.rtc, rtc) || other.rtc == rtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,server,interval,count,rtc);

@override
String toString() {
  return 'NtpSync(active: $active, server: $server, interval: $interval, count: $count, rtc: $rtc)';
}


}

/// @nodoc
abstract mixin class $NtpSyncCopyWith<$Res>  {
  factory $NtpSyncCopyWith(NtpSync value, $Res Function(NtpSync) _then) = _$NtpSyncCopyWithImpl;
@useResult
$Res call({
 bool? active, String? server, int? interval, int? count, NtpRtc? rtc
});


$NtpRtcCopyWith<$Res>? get rtc;

}
/// @nodoc
class _$NtpSyncCopyWithImpl<$Res>
    implements $NtpSyncCopyWith<$Res> {
  _$NtpSyncCopyWithImpl(this._self, this._then);

  final NtpSync _self;
  final $Res Function(NtpSync) _then;

/// Create a copy of NtpSync
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = freezed,Object? server = freezed,Object? interval = freezed,Object? count = freezed,Object? rtc = freezed,}) {
  return _then(_self.copyWith(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,server: freezed == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as String?,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,rtc: freezed == rtc ? _self.rtc : rtc // ignore: cast_nullable_to_non_nullable
as NtpRtc?,
  ));
}
/// Create a copy of NtpSync
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpRtcCopyWith<$Res>? get rtc {
    if (_self.rtc == null) {
    return null;
  }

  return $NtpRtcCopyWith<$Res>(_self.rtc!, (value) {
    return _then(_self.copyWith(rtc: value));
  });
}
}


/// Adds pattern-matching-related methods to [NtpSync].
extension NtpSyncPatterns on NtpSync {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NtpSync value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NtpSync() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NtpSync value)  $default,){
final _that = this;
switch (_that) {
case _NtpSync():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NtpSync value)?  $default,){
final _that = this;
switch (_that) {
case _NtpSync() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? active,  String? server,  int? interval,  int? count,  NtpRtc? rtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NtpSync() when $default != null:
return $default(_that.active,_that.server,_that.interval,_that.count,_that.rtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? active,  String? server,  int? interval,  int? count,  NtpRtc? rtc)  $default,) {final _that = this;
switch (_that) {
case _NtpSync():
return $default(_that.active,_that.server,_that.interval,_that.count,_that.rtc);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? active,  String? server,  int? interval,  int? count,  NtpRtc? rtc)?  $default,) {final _that = this;
switch (_that) {
case _NtpSync() when $default != null:
return $default(_that.active,_that.server,_that.interval,_that.count,_that.rtc);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _NtpSync implements NtpSync {
  const _NtpSync({this.active, this.server, this.interval, this.count, this.rtc});
  factory _NtpSync.fromJson(Map<String, dynamic> json) => _$NtpSyncFromJson(json);

@override final  bool? active;
@override final  String? server;
@override final  int? interval;
@override final  int? count;
@override final  NtpRtc? rtc;

/// Create a copy of NtpSync
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NtpSyncCopyWith<_NtpSync> get copyWith => __$NtpSyncCopyWithImpl<_NtpSync>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NtpSyncToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NtpSync&&(identical(other.active, active) || other.active == active)&&(identical(other.server, server) || other.server == server)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.count, count) || other.count == count)&&(identical(other.rtc, rtc) || other.rtc == rtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,server,interval,count,rtc);

@override
String toString() {
  return 'NtpSync(active: $active, server: $server, interval: $interval, count: $count, rtc: $rtc)';
}


}

/// @nodoc
abstract mixin class _$NtpSyncCopyWith<$Res> implements $NtpSyncCopyWith<$Res> {
  factory _$NtpSyncCopyWith(_NtpSync value, $Res Function(_NtpSync) _then) = __$NtpSyncCopyWithImpl;
@override @useResult
$Res call({
 bool? active, String? server, int? interval, int? count, NtpRtc? rtc
});


@override $NtpRtcCopyWith<$Res>? get rtc;

}
/// @nodoc
class __$NtpSyncCopyWithImpl<$Res>
    implements _$NtpSyncCopyWith<$Res> {
  __$NtpSyncCopyWithImpl(this._self, this._then);

  final _NtpSync _self;
  final $Res Function(_NtpSync) _then;

/// Create a copy of NtpSync
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = freezed,Object? server = freezed,Object? interval = freezed,Object? count = freezed,Object? rtc = freezed,}) {
  return _then(_NtpSync(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,server: freezed == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as String?,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,rtc: freezed == rtc ? _self.rtc : rtc // ignore: cast_nullable_to_non_nullable
as NtpRtc?,
  ));
}

/// Create a copy of NtpSync
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NtpRtcCopyWith<$Res>? get rtc {
    if (_self.rtc == null) {
    return null;
  }

  return $NtpRtcCopyWith<$Res>(_self.rtc!, (value) {
    return _then(_self.copyWith(rtc: value));
  });
}
}


/// @nodoc
mixin _$NtpRtc {

 bool? get set; String? get device; bool? get utc;
/// Create a copy of NtpRtc
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NtpRtcCopyWith<NtpRtc> get copyWith => _$NtpRtcCopyWithImpl<NtpRtc>(this as NtpRtc, _$identity);

  /// Serializes this NtpRtc to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NtpRtc&&(identical(other.set, set) || other.set == set)&&(identical(other.device, device) || other.device == device)&&(identical(other.utc, utc) || other.utc == utc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,set,device,utc);

@override
String toString() {
  return 'NtpRtc(set: $set, device: $device, utc: $utc)';
}


}

/// @nodoc
abstract mixin class $NtpRtcCopyWith<$Res>  {
  factory $NtpRtcCopyWith(NtpRtc value, $Res Function(NtpRtc) _then) = _$NtpRtcCopyWithImpl;
@useResult
$Res call({
 bool? set, String? device, bool? utc
});




}
/// @nodoc
class _$NtpRtcCopyWithImpl<$Res>
    implements $NtpRtcCopyWith<$Res> {
  _$NtpRtcCopyWithImpl(this._self, this._then);

  final NtpRtc _self;
  final $Res Function(NtpRtc) _then;

/// Create a copy of NtpRtc
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? set = freezed,Object? device = freezed,Object? utc = freezed,}) {
  return _then(_self.copyWith(
set: freezed == set ? _self.set : set // ignore: cast_nullable_to_non_nullable
as bool?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,utc: freezed == utc ? _self.utc : utc // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [NtpRtc].
extension NtpRtcPatterns on NtpRtc {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NtpRtc value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NtpRtc() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NtpRtc value)  $default,){
final _that = this;
switch (_that) {
case _NtpRtc():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NtpRtc value)?  $default,){
final _that = this;
switch (_that) {
case _NtpRtc() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? set,  String? device,  bool? utc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NtpRtc() when $default != null:
return $default(_that.set,_that.device,_that.utc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? set,  String? device,  bool? utc)  $default,) {final _that = this;
switch (_that) {
case _NtpRtc():
return $default(_that.set,_that.device,_that.utc);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? set,  String? device,  bool? utc)?  $default,) {final _that = this;
switch (_that) {
case _NtpRtc() when $default != null:
return $default(_that.set,_that.device,_that.utc);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _NtpRtc implements NtpRtc {
  const _NtpRtc({this.set, this.device, this.utc});
  factory _NtpRtc.fromJson(Map<String, dynamic> json) => _$NtpRtcFromJson(json);

@override final  bool? set;
@override final  String? device;
@override final  bool? utc;

/// Create a copy of NtpRtc
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NtpRtcCopyWith<_NtpRtc> get copyWith => __$NtpRtcCopyWithImpl<_NtpRtc>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NtpRtcToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NtpRtc&&(identical(other.set, set) || other.set == set)&&(identical(other.device, device) || other.device == device)&&(identical(other.utc, utc) || other.utc == utc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,set,device,utc);

@override
String toString() {
  return 'NtpRtc(set: $set, device: $device, utc: $utc)';
}


}

/// @nodoc
abstract mixin class _$NtpRtcCopyWith<$Res> implements $NtpRtcCopyWith<$Res> {
  factory _$NtpRtcCopyWith(_NtpRtc value, $Res Function(_NtpRtc) _then) = __$NtpRtcCopyWithImpl;
@override @useResult
$Res call({
 bool? set, String? device, bool? utc
});




}
/// @nodoc
class __$NtpRtcCopyWithImpl<$Res>
    implements _$NtpRtcCopyWith<$Res> {
  __$NtpRtcCopyWithImpl(this._self, this._then);

  final _NtpRtc _self;
  final $Res Function(_NtpRtc) _then;

/// Create a copy of NtpRtc
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? set = freezed,Object? device = freezed,Object? utc = freezed,}) {
  return _then(_NtpRtc(
set: freezed == set ? _self.set : set // ignore: cast_nullable_to_non_nullable
as bool?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,utc: freezed == utc ? _self.utc : utc // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Resolver {

 bool? get resolveIPv4; bool? get resolveIPv6; bool? get networkNames; String? get refreshNames;
/// Create a copy of Resolver
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolverCopyWith<Resolver> get copyWith => _$ResolverCopyWithImpl<Resolver>(this as Resolver, _$identity);

  /// Serializes this Resolver to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resolver&&(identical(other.resolveIPv4, resolveIPv4) || other.resolveIPv4 == resolveIPv4)&&(identical(other.resolveIPv6, resolveIPv6) || other.resolveIPv6 == resolveIPv6)&&(identical(other.networkNames, networkNames) || other.networkNames == networkNames)&&(identical(other.refreshNames, refreshNames) || other.refreshNames == refreshNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resolveIPv4,resolveIPv6,networkNames,refreshNames);

@override
String toString() {
  return 'Resolver(resolveIPv4: $resolveIPv4, resolveIPv6: $resolveIPv6, networkNames: $networkNames, refreshNames: $refreshNames)';
}


}

/// @nodoc
abstract mixin class $ResolverCopyWith<$Res>  {
  factory $ResolverCopyWith(Resolver value, $Res Function(Resolver) _then) = _$ResolverCopyWithImpl;
@useResult
$Res call({
 bool? resolveIPv4, bool? resolveIPv6, bool? networkNames, String? refreshNames
});




}
/// @nodoc
class _$ResolverCopyWithImpl<$Res>
    implements $ResolverCopyWith<$Res> {
  _$ResolverCopyWithImpl(this._self, this._then);

  final Resolver _self;
  final $Res Function(Resolver) _then;

/// Create a copy of Resolver
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resolveIPv4 = freezed,Object? resolveIPv6 = freezed,Object? networkNames = freezed,Object? refreshNames = freezed,}) {
  return _then(_self.copyWith(
resolveIPv4: freezed == resolveIPv4 ? _self.resolveIPv4 : resolveIPv4 // ignore: cast_nullable_to_non_nullable
as bool?,resolveIPv6: freezed == resolveIPv6 ? _self.resolveIPv6 : resolveIPv6 // ignore: cast_nullable_to_non_nullable
as bool?,networkNames: freezed == networkNames ? _self.networkNames : networkNames // ignore: cast_nullable_to_non_nullable
as bool?,refreshNames: freezed == refreshNames ? _self.refreshNames : refreshNames // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Resolver].
extension ResolverPatterns on Resolver {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resolver value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resolver() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resolver value)  $default,){
final _that = this;
switch (_that) {
case _Resolver():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resolver value)?  $default,){
final _that = this;
switch (_that) {
case _Resolver() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? resolveIPv4,  bool? resolveIPv6,  bool? networkNames,  String? refreshNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resolver() when $default != null:
return $default(_that.resolveIPv4,_that.resolveIPv6,_that.networkNames,_that.refreshNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? resolveIPv4,  bool? resolveIPv6,  bool? networkNames,  String? refreshNames)  $default,) {final _that = this;
switch (_that) {
case _Resolver():
return $default(_that.resolveIPv4,_that.resolveIPv6,_that.networkNames,_that.refreshNames);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? resolveIPv4,  bool? resolveIPv6,  bool? networkNames,  String? refreshNames)?  $default,) {final _that = this;
switch (_that) {
case _Resolver() when $default != null:
return $default(_that.resolveIPv4,_that.resolveIPv6,_that.networkNames,_that.refreshNames);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Resolver implements Resolver {
  const _Resolver({this.resolveIPv4, this.resolveIPv6, this.networkNames, this.refreshNames});
  factory _Resolver.fromJson(Map<String, dynamic> json) => _$ResolverFromJson(json);

@override final  bool? resolveIPv4;
@override final  bool? resolveIPv6;
@override final  bool? networkNames;
@override final  String? refreshNames;

/// Create a copy of Resolver
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolverCopyWith<_Resolver> get copyWith => __$ResolverCopyWithImpl<_Resolver>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResolverToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resolver&&(identical(other.resolveIPv4, resolveIPv4) || other.resolveIPv4 == resolveIPv4)&&(identical(other.resolveIPv6, resolveIPv6) || other.resolveIPv6 == resolveIPv6)&&(identical(other.networkNames, networkNames) || other.networkNames == networkNames)&&(identical(other.refreshNames, refreshNames) || other.refreshNames == refreshNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resolveIPv4,resolveIPv6,networkNames,refreshNames);

@override
String toString() {
  return 'Resolver(resolveIPv4: $resolveIPv4, resolveIPv6: $resolveIPv6, networkNames: $networkNames, refreshNames: $refreshNames)';
}


}

/// @nodoc
abstract mixin class _$ResolverCopyWith<$Res> implements $ResolverCopyWith<$Res> {
  factory _$ResolverCopyWith(_Resolver value, $Res Function(_Resolver) _then) = __$ResolverCopyWithImpl;
@override @useResult
$Res call({
 bool? resolveIPv4, bool? resolveIPv6, bool? networkNames, String? refreshNames
});




}
/// @nodoc
class __$ResolverCopyWithImpl<$Res>
    implements _$ResolverCopyWith<$Res> {
  __$ResolverCopyWithImpl(this._self, this._then);

  final _Resolver _self;
  final $Res Function(_Resolver) _then;

/// Create a copy of Resolver
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resolveIPv4 = freezed,Object? resolveIPv6 = freezed,Object? networkNames = freezed,Object? refreshNames = freezed,}) {
  return _then(_Resolver(
resolveIPv4: freezed == resolveIPv4 ? _self.resolveIPv4 : resolveIPv4 // ignore: cast_nullable_to_non_nullable
as bool?,resolveIPv6: freezed == resolveIPv6 ? _self.resolveIPv6 : resolveIPv6 // ignore: cast_nullable_to_non_nullable
as bool?,networkNames: freezed == networkNames ? _self.networkNames : networkNames // ignore: cast_nullable_to_non_nullable
as bool?,refreshNames: freezed == refreshNames ? _self.refreshNames : refreshNames // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Database {

@JsonKey(name: 'DBimport') bool? get dbImport; int? get maxDBdays;@JsonKey(name: 'DBinterval') int? get dbInterval; bool? get useWAL; DatabaseNetwork? get network;
/// Create a copy of Database
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseCopyWith<Database> get copyWith => _$DatabaseCopyWithImpl<Database>(this as Database, _$identity);

  /// Serializes this Database to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Database&&(identical(other.dbImport, dbImport) || other.dbImport == dbImport)&&(identical(other.maxDBdays, maxDBdays) || other.maxDBdays == maxDBdays)&&(identical(other.dbInterval, dbInterval) || other.dbInterval == dbInterval)&&(identical(other.useWAL, useWAL) || other.useWAL == useWAL)&&(identical(other.network, network) || other.network == network));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dbImport,maxDBdays,dbInterval,useWAL,network);

@override
String toString() {
  return 'Database(dbImport: $dbImport, maxDBdays: $maxDBdays, dbInterval: $dbInterval, useWAL: $useWAL, network: $network)';
}


}

/// @nodoc
abstract mixin class $DatabaseCopyWith<$Res>  {
  factory $DatabaseCopyWith(Database value, $Res Function(Database) _then) = _$DatabaseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DBimport') bool? dbImport, int? maxDBdays,@JsonKey(name: 'DBinterval') int? dbInterval, bool? useWAL, DatabaseNetwork? network
});


$DatabaseNetworkCopyWith<$Res>? get network;

}
/// @nodoc
class _$DatabaseCopyWithImpl<$Res>
    implements $DatabaseCopyWith<$Res> {
  _$DatabaseCopyWithImpl(this._self, this._then);

  final Database _self;
  final $Res Function(Database) _then;

/// Create a copy of Database
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dbImport = freezed,Object? maxDBdays = freezed,Object? dbInterval = freezed,Object? useWAL = freezed,Object? network = freezed,}) {
  return _then(_self.copyWith(
dbImport: freezed == dbImport ? _self.dbImport : dbImport // ignore: cast_nullable_to_non_nullable
as bool?,maxDBdays: freezed == maxDBdays ? _self.maxDBdays : maxDBdays // ignore: cast_nullable_to_non_nullable
as int?,dbInterval: freezed == dbInterval ? _self.dbInterval : dbInterval // ignore: cast_nullable_to_non_nullable
as int?,useWAL: freezed == useWAL ? _self.useWAL : useWAL // ignore: cast_nullable_to_non_nullable
as bool?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as DatabaseNetwork?,
  ));
}
/// Create a copy of Database
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatabaseNetworkCopyWith<$Res>? get network {
    if (_self.network == null) {
    return null;
  }

  return $DatabaseNetworkCopyWith<$Res>(_self.network!, (value) {
    return _then(_self.copyWith(network: value));
  });
}
}


/// Adds pattern-matching-related methods to [Database].
extension DatabasePatterns on Database {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Database value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Database() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Database value)  $default,){
final _that = this;
switch (_that) {
case _Database():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Database value)?  $default,){
final _that = this;
switch (_that) {
case _Database() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DBimport')  bool? dbImport,  int? maxDBdays, @JsonKey(name: 'DBinterval')  int? dbInterval,  bool? useWAL,  DatabaseNetwork? network)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Database() when $default != null:
return $default(_that.dbImport,_that.maxDBdays,_that.dbInterval,_that.useWAL,_that.network);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DBimport')  bool? dbImport,  int? maxDBdays, @JsonKey(name: 'DBinterval')  int? dbInterval,  bool? useWAL,  DatabaseNetwork? network)  $default,) {final _that = this;
switch (_that) {
case _Database():
return $default(_that.dbImport,_that.maxDBdays,_that.dbInterval,_that.useWAL,_that.network);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DBimport')  bool? dbImport,  int? maxDBdays, @JsonKey(name: 'DBinterval')  int? dbInterval,  bool? useWAL,  DatabaseNetwork? network)?  $default,) {final _that = this;
switch (_that) {
case _Database() when $default != null:
return $default(_that.dbImport,_that.maxDBdays,_that.dbInterval,_that.useWAL,_that.network);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Database implements Database {
  const _Database({@JsonKey(name: 'DBimport') this.dbImport, this.maxDBdays, @JsonKey(name: 'DBinterval') this.dbInterval, this.useWAL, this.network});
  factory _Database.fromJson(Map<String, dynamic> json) => _$DatabaseFromJson(json);

@override@JsonKey(name: 'DBimport') final  bool? dbImport;
@override final  int? maxDBdays;
@override@JsonKey(name: 'DBinterval') final  int? dbInterval;
@override final  bool? useWAL;
@override final  DatabaseNetwork? network;

/// Create a copy of Database
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatabaseCopyWith<_Database> get copyWith => __$DatabaseCopyWithImpl<_Database>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatabaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Database&&(identical(other.dbImport, dbImport) || other.dbImport == dbImport)&&(identical(other.maxDBdays, maxDBdays) || other.maxDBdays == maxDBdays)&&(identical(other.dbInterval, dbInterval) || other.dbInterval == dbInterval)&&(identical(other.useWAL, useWAL) || other.useWAL == useWAL)&&(identical(other.network, network) || other.network == network));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dbImport,maxDBdays,dbInterval,useWAL,network);

@override
String toString() {
  return 'Database(dbImport: $dbImport, maxDBdays: $maxDBdays, dbInterval: $dbInterval, useWAL: $useWAL, network: $network)';
}


}

/// @nodoc
abstract mixin class _$DatabaseCopyWith<$Res> implements $DatabaseCopyWith<$Res> {
  factory _$DatabaseCopyWith(_Database value, $Res Function(_Database) _then) = __$DatabaseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DBimport') bool? dbImport, int? maxDBdays,@JsonKey(name: 'DBinterval') int? dbInterval, bool? useWAL, DatabaseNetwork? network
});


@override $DatabaseNetworkCopyWith<$Res>? get network;

}
/// @nodoc
class __$DatabaseCopyWithImpl<$Res>
    implements _$DatabaseCopyWith<$Res> {
  __$DatabaseCopyWithImpl(this._self, this._then);

  final _Database _self;
  final $Res Function(_Database) _then;

/// Create a copy of Database
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dbImport = freezed,Object? maxDBdays = freezed,Object? dbInterval = freezed,Object? useWAL = freezed,Object? network = freezed,}) {
  return _then(_Database(
dbImport: freezed == dbImport ? _self.dbImport : dbImport // ignore: cast_nullable_to_non_nullable
as bool?,maxDBdays: freezed == maxDBdays ? _self.maxDBdays : maxDBdays // ignore: cast_nullable_to_non_nullable
as int?,dbInterval: freezed == dbInterval ? _self.dbInterval : dbInterval // ignore: cast_nullable_to_non_nullable
as int?,useWAL: freezed == useWAL ? _self.useWAL : useWAL // ignore: cast_nullable_to_non_nullable
as bool?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as DatabaseNetwork?,
  ));
}

/// Create a copy of Database
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatabaseNetworkCopyWith<$Res>? get network {
    if (_self.network == null) {
    return null;
  }

  return $DatabaseNetworkCopyWith<$Res>(_self.network!, (value) {
    return _then(_self.copyWith(network: value));
  });
}
}


/// @nodoc
mixin _$DatabaseNetwork {

 bool? get parseARPcache; int? get expire;
/// Create a copy of DatabaseNetwork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseNetworkCopyWith<DatabaseNetwork> get copyWith => _$DatabaseNetworkCopyWithImpl<DatabaseNetwork>(this as DatabaseNetwork, _$identity);

  /// Serializes this DatabaseNetwork to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseNetwork&&(identical(other.parseARPcache, parseARPcache) || other.parseARPcache == parseARPcache)&&(identical(other.expire, expire) || other.expire == expire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parseARPcache,expire);

@override
String toString() {
  return 'DatabaseNetwork(parseARPcache: $parseARPcache, expire: $expire)';
}


}

/// @nodoc
abstract mixin class $DatabaseNetworkCopyWith<$Res>  {
  factory $DatabaseNetworkCopyWith(DatabaseNetwork value, $Res Function(DatabaseNetwork) _then) = _$DatabaseNetworkCopyWithImpl;
@useResult
$Res call({
 bool? parseARPcache, int? expire
});




}
/// @nodoc
class _$DatabaseNetworkCopyWithImpl<$Res>
    implements $DatabaseNetworkCopyWith<$Res> {
  _$DatabaseNetworkCopyWithImpl(this._self, this._then);

  final DatabaseNetwork _self;
  final $Res Function(DatabaseNetwork) _then;

/// Create a copy of DatabaseNetwork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parseARPcache = freezed,Object? expire = freezed,}) {
  return _then(_self.copyWith(
parseARPcache: freezed == parseARPcache ? _self.parseARPcache : parseARPcache // ignore: cast_nullable_to_non_nullable
as bool?,expire: freezed == expire ? _self.expire : expire // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DatabaseNetwork].
extension DatabaseNetworkPatterns on DatabaseNetwork {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DatabaseNetwork value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DatabaseNetwork() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DatabaseNetwork value)  $default,){
final _that = this;
switch (_that) {
case _DatabaseNetwork():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DatabaseNetwork value)?  $default,){
final _that = this;
switch (_that) {
case _DatabaseNetwork() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? parseARPcache,  int? expire)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DatabaseNetwork() when $default != null:
return $default(_that.parseARPcache,_that.expire);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? parseARPcache,  int? expire)  $default,) {final _that = this;
switch (_that) {
case _DatabaseNetwork():
return $default(_that.parseARPcache,_that.expire);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? parseARPcache,  int? expire)?  $default,) {final _that = this;
switch (_that) {
case _DatabaseNetwork() when $default != null:
return $default(_that.parseARPcache,_that.expire);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _DatabaseNetwork implements DatabaseNetwork {
  const _DatabaseNetwork({this.parseARPcache, this.expire});
  factory _DatabaseNetwork.fromJson(Map<String, dynamic> json) => _$DatabaseNetworkFromJson(json);

@override final  bool? parseARPcache;
@override final  int? expire;

/// Create a copy of DatabaseNetwork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatabaseNetworkCopyWith<_DatabaseNetwork> get copyWith => __$DatabaseNetworkCopyWithImpl<_DatabaseNetwork>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatabaseNetworkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DatabaseNetwork&&(identical(other.parseARPcache, parseARPcache) || other.parseARPcache == parseARPcache)&&(identical(other.expire, expire) || other.expire == expire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parseARPcache,expire);

@override
String toString() {
  return 'DatabaseNetwork(parseARPcache: $parseARPcache, expire: $expire)';
}


}

/// @nodoc
abstract mixin class _$DatabaseNetworkCopyWith<$Res> implements $DatabaseNetworkCopyWith<$Res> {
  factory _$DatabaseNetworkCopyWith(_DatabaseNetwork value, $Res Function(_DatabaseNetwork) _then) = __$DatabaseNetworkCopyWithImpl;
@override @useResult
$Res call({
 bool? parseARPcache, int? expire
});




}
/// @nodoc
class __$DatabaseNetworkCopyWithImpl<$Res>
    implements _$DatabaseNetworkCopyWith<$Res> {
  __$DatabaseNetworkCopyWithImpl(this._self, this._then);

  final _DatabaseNetwork _self;
  final $Res Function(_DatabaseNetwork) _then;

/// Create a copy of DatabaseNetwork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parseARPcache = freezed,Object? expire = freezed,}) {
  return _then(_DatabaseNetwork(
parseARPcache: freezed == parseARPcache ? _self.parseARPcache : parseARPcache // ignore: cast_nullable_to_non_nullable
as bool?,expire: freezed == expire ? _self.expire : expire // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Webserver {

 String? get domain; String? get acl; String? get port; int? get threads; List<String>? get headers;@JsonKey(name: 'serve_all') bool? get serveAll; WebSession? get session; WebTls? get tls; WebPaths? get paths; WebInterface? get interface; WebApi? get api;
/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebserverCopyWith<Webserver> get copyWith => _$WebserverCopyWithImpl<Webserver>(this as Webserver, _$identity);

  /// Serializes this Webserver to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Webserver&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.acl, acl) || other.acl == acl)&&(identical(other.port, port) || other.port == port)&&(identical(other.threads, threads) || other.threads == threads)&&const DeepCollectionEquality().equals(other.headers, headers)&&(identical(other.serveAll, serveAll) || other.serveAll == serveAll)&&(identical(other.session, session) || other.session == session)&&(identical(other.tls, tls) || other.tls == tls)&&(identical(other.paths, paths) || other.paths == paths)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.api, api) || other.api == api));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,acl,port,threads,const DeepCollectionEquality().hash(headers),serveAll,session,tls,paths,interface,api);

@override
String toString() {
  return 'Webserver(domain: $domain, acl: $acl, port: $port, threads: $threads, headers: $headers, serveAll: $serveAll, session: $session, tls: $tls, paths: $paths, interface: $interface, api: $api)';
}


}

/// @nodoc
abstract mixin class $WebserverCopyWith<$Res>  {
  factory $WebserverCopyWith(Webserver value, $Res Function(Webserver) _then) = _$WebserverCopyWithImpl;
@useResult
$Res call({
 String? domain, String? acl, String? port, int? threads, List<String>? headers,@JsonKey(name: 'serve_all') bool? serveAll, WebSession? session, WebTls? tls, WebPaths? paths, WebInterface? interface, WebApi? api
});


$WebSessionCopyWith<$Res>? get session;$WebTlsCopyWith<$Res>? get tls;$WebPathsCopyWith<$Res>? get paths;$WebInterfaceCopyWith<$Res>? get interface;$WebApiCopyWith<$Res>? get api;

}
/// @nodoc
class _$WebserverCopyWithImpl<$Res>
    implements $WebserverCopyWith<$Res> {
  _$WebserverCopyWithImpl(this._self, this._then);

  final Webserver _self;
  final $Res Function(Webserver) _then;

/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = freezed,Object? acl = freezed,Object? port = freezed,Object? threads = freezed,Object? headers = freezed,Object? serveAll = freezed,Object? session = freezed,Object? tls = freezed,Object? paths = freezed,Object? interface = freezed,Object? api = freezed,}) {
  return _then(_self.copyWith(
domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,acl: freezed == acl ? _self.acl : acl // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,threads: freezed == threads ? _self.threads : threads // ignore: cast_nullable_to_non_nullable
as int?,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as List<String>?,serveAll: freezed == serveAll ? _self.serveAll : serveAll // ignore: cast_nullable_to_non_nullable
as bool?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WebSession?,tls: freezed == tls ? _self.tls : tls // ignore: cast_nullable_to_non_nullable
as WebTls?,paths: freezed == paths ? _self.paths : paths // ignore: cast_nullable_to_non_nullable
as WebPaths?,interface: freezed == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as WebInterface?,api: freezed == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as WebApi?,
  ));
}
/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $WebSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebTlsCopyWith<$Res>? get tls {
    if (_self.tls == null) {
    return null;
  }

  return $WebTlsCopyWith<$Res>(_self.tls!, (value) {
    return _then(_self.copyWith(tls: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebPathsCopyWith<$Res>? get paths {
    if (_self.paths == null) {
    return null;
  }

  return $WebPathsCopyWith<$Res>(_self.paths!, (value) {
    return _then(_self.copyWith(paths: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebInterfaceCopyWith<$Res>? get interface {
    if (_self.interface == null) {
    return null;
  }

  return $WebInterfaceCopyWith<$Res>(_self.interface!, (value) {
    return _then(_self.copyWith(interface: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebApiCopyWith<$Res>? get api {
    if (_self.api == null) {
    return null;
  }

  return $WebApiCopyWith<$Res>(_self.api!, (value) {
    return _then(_self.copyWith(api: value));
  });
}
}


/// Adds pattern-matching-related methods to [Webserver].
extension WebserverPatterns on Webserver {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Webserver value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Webserver() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Webserver value)  $default,){
final _that = this;
switch (_that) {
case _Webserver():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Webserver value)?  $default,){
final _that = this;
switch (_that) {
case _Webserver() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? domain,  String? acl,  String? port,  int? threads,  List<String>? headers, @JsonKey(name: 'serve_all')  bool? serveAll,  WebSession? session,  WebTls? tls,  WebPaths? paths,  WebInterface? interface,  WebApi? api)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Webserver() when $default != null:
return $default(_that.domain,_that.acl,_that.port,_that.threads,_that.headers,_that.serveAll,_that.session,_that.tls,_that.paths,_that.interface,_that.api);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? domain,  String? acl,  String? port,  int? threads,  List<String>? headers, @JsonKey(name: 'serve_all')  bool? serveAll,  WebSession? session,  WebTls? tls,  WebPaths? paths,  WebInterface? interface,  WebApi? api)  $default,) {final _that = this;
switch (_that) {
case _Webserver():
return $default(_that.domain,_that.acl,_that.port,_that.threads,_that.headers,_that.serveAll,_that.session,_that.tls,_that.paths,_that.interface,_that.api);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? domain,  String? acl,  String? port,  int? threads,  List<String>? headers, @JsonKey(name: 'serve_all')  bool? serveAll,  WebSession? session,  WebTls? tls,  WebPaths? paths,  WebInterface? interface,  WebApi? api)?  $default,) {final _that = this;
switch (_that) {
case _Webserver() when $default != null:
return $default(_that.domain,_that.acl,_that.port,_that.threads,_that.headers,_that.serveAll,_that.session,_that.tls,_that.paths,_that.interface,_that.api);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Webserver implements Webserver {
  const _Webserver({this.domain, this.acl, this.port, this.threads, final  List<String>? headers, @JsonKey(name: 'serve_all') this.serveAll, this.session, this.tls, this.paths, this.interface, this.api}): _headers = headers;
  factory _Webserver.fromJson(Map<String, dynamic> json) => _$WebserverFromJson(json);

@override final  String? domain;
@override final  String? acl;
@override final  String? port;
@override final  int? threads;
 final  List<String>? _headers;
@override List<String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableListView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'serve_all') final  bool? serveAll;
@override final  WebSession? session;
@override final  WebTls? tls;
@override final  WebPaths? paths;
@override final  WebInterface? interface;
@override final  WebApi? api;

/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebserverCopyWith<_Webserver> get copyWith => __$WebserverCopyWithImpl<_Webserver>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebserverToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Webserver&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.acl, acl) || other.acl == acl)&&(identical(other.port, port) || other.port == port)&&(identical(other.threads, threads) || other.threads == threads)&&const DeepCollectionEquality().equals(other._headers, _headers)&&(identical(other.serveAll, serveAll) || other.serveAll == serveAll)&&(identical(other.session, session) || other.session == session)&&(identical(other.tls, tls) || other.tls == tls)&&(identical(other.paths, paths) || other.paths == paths)&&(identical(other.interface, interface) || other.interface == interface)&&(identical(other.api, api) || other.api == api));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,acl,port,threads,const DeepCollectionEquality().hash(_headers),serveAll,session,tls,paths,interface,api);

@override
String toString() {
  return 'Webserver(domain: $domain, acl: $acl, port: $port, threads: $threads, headers: $headers, serveAll: $serveAll, session: $session, tls: $tls, paths: $paths, interface: $interface, api: $api)';
}


}

/// @nodoc
abstract mixin class _$WebserverCopyWith<$Res> implements $WebserverCopyWith<$Res> {
  factory _$WebserverCopyWith(_Webserver value, $Res Function(_Webserver) _then) = __$WebserverCopyWithImpl;
@override @useResult
$Res call({
 String? domain, String? acl, String? port, int? threads, List<String>? headers,@JsonKey(name: 'serve_all') bool? serveAll, WebSession? session, WebTls? tls, WebPaths? paths, WebInterface? interface, WebApi? api
});


@override $WebSessionCopyWith<$Res>? get session;@override $WebTlsCopyWith<$Res>? get tls;@override $WebPathsCopyWith<$Res>? get paths;@override $WebInterfaceCopyWith<$Res>? get interface;@override $WebApiCopyWith<$Res>? get api;

}
/// @nodoc
class __$WebserverCopyWithImpl<$Res>
    implements _$WebserverCopyWith<$Res> {
  __$WebserverCopyWithImpl(this._self, this._then);

  final _Webserver _self;
  final $Res Function(_Webserver) _then;

/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = freezed,Object? acl = freezed,Object? port = freezed,Object? threads = freezed,Object? headers = freezed,Object? serveAll = freezed,Object? session = freezed,Object? tls = freezed,Object? paths = freezed,Object? interface = freezed,Object? api = freezed,}) {
  return _then(_Webserver(
domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,acl: freezed == acl ? _self.acl : acl // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,threads: freezed == threads ? _self.threads : threads // ignore: cast_nullable_to_non_nullable
as int?,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as List<String>?,serveAll: freezed == serveAll ? _self.serveAll : serveAll // ignore: cast_nullable_to_non_nullable
as bool?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WebSession?,tls: freezed == tls ? _self.tls : tls // ignore: cast_nullable_to_non_nullable
as WebTls?,paths: freezed == paths ? _self.paths : paths // ignore: cast_nullable_to_non_nullable
as WebPaths?,interface: freezed == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as WebInterface?,api: freezed == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as WebApi?,
  ));
}

/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $WebSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebTlsCopyWith<$Res>? get tls {
    if (_self.tls == null) {
    return null;
  }

  return $WebTlsCopyWith<$Res>(_self.tls!, (value) {
    return _then(_self.copyWith(tls: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebPathsCopyWith<$Res>? get paths {
    if (_self.paths == null) {
    return null;
  }

  return $WebPathsCopyWith<$Res>(_self.paths!, (value) {
    return _then(_self.copyWith(paths: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebInterfaceCopyWith<$Res>? get interface {
    if (_self.interface == null) {
    return null;
  }

  return $WebInterfaceCopyWith<$Res>(_self.interface!, (value) {
    return _then(_self.copyWith(interface: value));
  });
}/// Create a copy of Webserver
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebApiCopyWith<$Res>? get api {
    if (_self.api == null) {
    return null;
  }

  return $WebApiCopyWith<$Res>(_self.api!, (value) {
    return _then(_self.copyWith(api: value));
  });
}
}


/// @nodoc
mixin _$WebSession {

 int? get timeout; bool? get restore;
/// Create a copy of WebSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebSessionCopyWith<WebSession> get copyWith => _$WebSessionCopyWithImpl<WebSession>(this as WebSession, _$identity);

  /// Serializes this WebSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebSession&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.restore, restore) || other.restore == restore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeout,restore);

@override
String toString() {
  return 'WebSession(timeout: $timeout, restore: $restore)';
}


}

/// @nodoc
abstract mixin class $WebSessionCopyWith<$Res>  {
  factory $WebSessionCopyWith(WebSession value, $Res Function(WebSession) _then) = _$WebSessionCopyWithImpl;
@useResult
$Res call({
 int? timeout, bool? restore
});




}
/// @nodoc
class _$WebSessionCopyWithImpl<$Res>
    implements $WebSessionCopyWith<$Res> {
  _$WebSessionCopyWithImpl(this._self, this._then);

  final WebSession _self;
  final $Res Function(WebSession) _then;

/// Create a copy of WebSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeout = freezed,Object? restore = freezed,}) {
  return _then(_self.copyWith(
timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as int?,restore: freezed == restore ? _self.restore : restore // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [WebSession].
extension WebSessionPatterns on WebSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebSession value)  $default,){
final _that = this;
switch (_that) {
case _WebSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebSession value)?  $default,){
final _that = this;
switch (_that) {
case _WebSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? timeout,  bool? restore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebSession() when $default != null:
return $default(_that.timeout,_that.restore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? timeout,  bool? restore)  $default,) {final _that = this;
switch (_that) {
case _WebSession():
return $default(_that.timeout,_that.restore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? timeout,  bool? restore)?  $default,) {final _that = this;
switch (_that) {
case _WebSession() when $default != null:
return $default(_that.timeout,_that.restore);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _WebSession implements WebSession {
  const _WebSession({this.timeout, this.restore});
  factory _WebSession.fromJson(Map<String, dynamic> json) => _$WebSessionFromJson(json);

@override final  int? timeout;
@override final  bool? restore;

/// Create a copy of WebSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebSessionCopyWith<_WebSession> get copyWith => __$WebSessionCopyWithImpl<_WebSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebSession&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.restore, restore) || other.restore == restore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeout,restore);

@override
String toString() {
  return 'WebSession(timeout: $timeout, restore: $restore)';
}


}

/// @nodoc
abstract mixin class _$WebSessionCopyWith<$Res> implements $WebSessionCopyWith<$Res> {
  factory _$WebSessionCopyWith(_WebSession value, $Res Function(_WebSession) _then) = __$WebSessionCopyWithImpl;
@override @useResult
$Res call({
 int? timeout, bool? restore
});




}
/// @nodoc
class __$WebSessionCopyWithImpl<$Res>
    implements _$WebSessionCopyWith<$Res> {
  __$WebSessionCopyWithImpl(this._self, this._then);

  final _WebSession _self;
  final $Res Function(_WebSession) _then;

/// Create a copy of WebSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeout = freezed,Object? restore = freezed,}) {
  return _then(_WebSession(
timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as int?,restore: freezed == restore ? _self.restore : restore // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$WebTls {

 String? get cert;
/// Create a copy of WebTls
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebTlsCopyWith<WebTls> get copyWith => _$WebTlsCopyWithImpl<WebTls>(this as WebTls, _$identity);

  /// Serializes this WebTls to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebTls&&(identical(other.cert, cert) || other.cert == cert));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cert);

@override
String toString() {
  return 'WebTls(cert: $cert)';
}


}

/// @nodoc
abstract mixin class $WebTlsCopyWith<$Res>  {
  factory $WebTlsCopyWith(WebTls value, $Res Function(WebTls) _then) = _$WebTlsCopyWithImpl;
@useResult
$Res call({
 String? cert
});




}
/// @nodoc
class _$WebTlsCopyWithImpl<$Res>
    implements $WebTlsCopyWith<$Res> {
  _$WebTlsCopyWithImpl(this._self, this._then);

  final WebTls _self;
  final $Res Function(WebTls) _then;

/// Create a copy of WebTls
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cert = freezed,}) {
  return _then(_self.copyWith(
cert: freezed == cert ? _self.cert : cert // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WebTls].
extension WebTlsPatterns on WebTls {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebTls value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebTls() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebTls value)  $default,){
final _that = this;
switch (_that) {
case _WebTls():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebTls value)?  $default,){
final _that = this;
switch (_that) {
case _WebTls() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cert)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebTls() when $default != null:
return $default(_that.cert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cert)  $default,) {final _that = this;
switch (_that) {
case _WebTls():
return $default(_that.cert);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cert)?  $default,) {final _that = this;
switch (_that) {
case _WebTls() when $default != null:
return $default(_that.cert);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _WebTls implements WebTls {
  const _WebTls({this.cert});
  factory _WebTls.fromJson(Map<String, dynamic> json) => _$WebTlsFromJson(json);

@override final  String? cert;

/// Create a copy of WebTls
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebTlsCopyWith<_WebTls> get copyWith => __$WebTlsCopyWithImpl<_WebTls>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebTlsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebTls&&(identical(other.cert, cert) || other.cert == cert));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cert);

@override
String toString() {
  return 'WebTls(cert: $cert)';
}


}

/// @nodoc
abstract mixin class _$WebTlsCopyWith<$Res> implements $WebTlsCopyWith<$Res> {
  factory _$WebTlsCopyWith(_WebTls value, $Res Function(_WebTls) _then) = __$WebTlsCopyWithImpl;
@override @useResult
$Res call({
 String? cert
});




}
/// @nodoc
class __$WebTlsCopyWithImpl<$Res>
    implements _$WebTlsCopyWith<$Res> {
  __$WebTlsCopyWithImpl(this._self, this._then);

  final _WebTls _self;
  final $Res Function(_WebTls) _then;

/// Create a copy of WebTls
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cert = freezed,}) {
  return _then(_WebTls(
cert: freezed == cert ? _self.cert : cert // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WebPaths {

 String? get webroot; String? get webhome; String? get prefix;
/// Create a copy of WebPaths
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebPathsCopyWith<WebPaths> get copyWith => _$WebPathsCopyWithImpl<WebPaths>(this as WebPaths, _$identity);

  /// Serializes this WebPaths to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebPaths&&(identical(other.webroot, webroot) || other.webroot == webroot)&&(identical(other.webhome, webhome) || other.webhome == webhome)&&(identical(other.prefix, prefix) || other.prefix == prefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,webroot,webhome,prefix);

@override
String toString() {
  return 'WebPaths(webroot: $webroot, webhome: $webhome, prefix: $prefix)';
}


}

/// @nodoc
abstract mixin class $WebPathsCopyWith<$Res>  {
  factory $WebPathsCopyWith(WebPaths value, $Res Function(WebPaths) _then) = _$WebPathsCopyWithImpl;
@useResult
$Res call({
 String? webroot, String? webhome, String? prefix
});




}
/// @nodoc
class _$WebPathsCopyWithImpl<$Res>
    implements $WebPathsCopyWith<$Res> {
  _$WebPathsCopyWithImpl(this._self, this._then);

  final WebPaths _self;
  final $Res Function(WebPaths) _then;

/// Create a copy of WebPaths
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? webroot = freezed,Object? webhome = freezed,Object? prefix = freezed,}) {
  return _then(_self.copyWith(
webroot: freezed == webroot ? _self.webroot : webroot // ignore: cast_nullable_to_non_nullable
as String?,webhome: freezed == webhome ? _self.webhome : webhome // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WebPaths].
extension WebPathsPatterns on WebPaths {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebPaths value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebPaths() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebPaths value)  $default,){
final _that = this;
switch (_that) {
case _WebPaths():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebPaths value)?  $default,){
final _that = this;
switch (_that) {
case _WebPaths() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? webroot,  String? webhome,  String? prefix)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebPaths() when $default != null:
return $default(_that.webroot,_that.webhome,_that.prefix);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? webroot,  String? webhome,  String? prefix)  $default,) {final _that = this;
switch (_that) {
case _WebPaths():
return $default(_that.webroot,_that.webhome,_that.prefix);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? webroot,  String? webhome,  String? prefix)?  $default,) {final _that = this;
switch (_that) {
case _WebPaths() when $default != null:
return $default(_that.webroot,_that.webhome,_that.prefix);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _WebPaths implements WebPaths {
  const _WebPaths({this.webroot, this.webhome, this.prefix});
  factory _WebPaths.fromJson(Map<String, dynamic> json) => _$WebPathsFromJson(json);

@override final  String? webroot;
@override final  String? webhome;
@override final  String? prefix;

/// Create a copy of WebPaths
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebPathsCopyWith<_WebPaths> get copyWith => __$WebPathsCopyWithImpl<_WebPaths>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebPathsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebPaths&&(identical(other.webroot, webroot) || other.webroot == webroot)&&(identical(other.webhome, webhome) || other.webhome == webhome)&&(identical(other.prefix, prefix) || other.prefix == prefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,webroot,webhome,prefix);

@override
String toString() {
  return 'WebPaths(webroot: $webroot, webhome: $webhome, prefix: $prefix)';
}


}

/// @nodoc
abstract mixin class _$WebPathsCopyWith<$Res> implements $WebPathsCopyWith<$Res> {
  factory _$WebPathsCopyWith(_WebPaths value, $Res Function(_WebPaths) _then) = __$WebPathsCopyWithImpl;
@override @useResult
$Res call({
 String? webroot, String? webhome, String? prefix
});




}
/// @nodoc
class __$WebPathsCopyWithImpl<$Res>
    implements _$WebPathsCopyWith<$Res> {
  __$WebPathsCopyWithImpl(this._self, this._then);

  final _WebPaths _self;
  final $Res Function(_WebPaths) _then;

/// Create a copy of WebPaths
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? webroot = freezed,Object? webhome = freezed,Object? prefix = freezed,}) {
  return _then(_WebPaths(
webroot: freezed == webroot ? _self.webroot : webroot // ignore: cast_nullable_to_non_nullable
as String?,webhome: freezed == webhome ? _self.webhome : webhome // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WebInterface {

 bool? get boxed; String? get theme;
/// Create a copy of WebInterface
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebInterfaceCopyWith<WebInterface> get copyWith => _$WebInterfaceCopyWithImpl<WebInterface>(this as WebInterface, _$identity);

  /// Serializes this WebInterface to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebInterface&&(identical(other.boxed, boxed) || other.boxed == boxed)&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boxed,theme);

@override
String toString() {
  return 'WebInterface(boxed: $boxed, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $WebInterfaceCopyWith<$Res>  {
  factory $WebInterfaceCopyWith(WebInterface value, $Res Function(WebInterface) _then) = _$WebInterfaceCopyWithImpl;
@useResult
$Res call({
 bool? boxed, String? theme
});




}
/// @nodoc
class _$WebInterfaceCopyWithImpl<$Res>
    implements $WebInterfaceCopyWith<$Res> {
  _$WebInterfaceCopyWithImpl(this._self, this._then);

  final WebInterface _self;
  final $Res Function(WebInterface) _then;

/// Create a copy of WebInterface
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boxed = freezed,Object? theme = freezed,}) {
  return _then(_self.copyWith(
boxed: freezed == boxed ? _self.boxed : boxed // ignore: cast_nullable_to_non_nullable
as bool?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WebInterface].
extension WebInterfacePatterns on WebInterface {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebInterface value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebInterface() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebInterface value)  $default,){
final _that = this;
switch (_that) {
case _WebInterface():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebInterface value)?  $default,){
final _that = this;
switch (_that) {
case _WebInterface() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? boxed,  String? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebInterface() when $default != null:
return $default(_that.boxed,_that.theme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? boxed,  String? theme)  $default,) {final _that = this;
switch (_that) {
case _WebInterface():
return $default(_that.boxed,_that.theme);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? boxed,  String? theme)?  $default,) {final _that = this;
switch (_that) {
case _WebInterface() when $default != null:
return $default(_that.boxed,_that.theme);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _WebInterface implements WebInterface {
  const _WebInterface({this.boxed, this.theme});
  factory _WebInterface.fromJson(Map<String, dynamic> json) => _$WebInterfaceFromJson(json);

@override final  bool? boxed;
@override final  String? theme;

/// Create a copy of WebInterface
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebInterfaceCopyWith<_WebInterface> get copyWith => __$WebInterfaceCopyWithImpl<_WebInterface>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebInterfaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebInterface&&(identical(other.boxed, boxed) || other.boxed == boxed)&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boxed,theme);

@override
String toString() {
  return 'WebInterface(boxed: $boxed, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$WebInterfaceCopyWith<$Res> implements $WebInterfaceCopyWith<$Res> {
  factory _$WebInterfaceCopyWith(_WebInterface value, $Res Function(_WebInterface) _then) = __$WebInterfaceCopyWithImpl;
@override @useResult
$Res call({
 bool? boxed, String? theme
});




}
/// @nodoc
class __$WebInterfaceCopyWithImpl<$Res>
    implements _$WebInterfaceCopyWith<$Res> {
  __$WebInterfaceCopyWithImpl(this._self, this._then);

  final _WebInterface _self;
  final $Res Function(_WebInterface) _then;

/// Create a copy of WebInterface
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boxed = freezed,Object? theme = freezed,}) {
  return _then(_WebInterface(
boxed: freezed == boxed ? _self.boxed : boxed // ignore: cast_nullable_to_non_nullable
as bool?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WebApi {

@JsonKey(name: 'max_sessions') int? get maxSessions; bool? get prettyJSON; String? get password; String? get pwhash;@JsonKey(name: 'totp_secret') String? get totpSecret;@JsonKey(name: 'app_pwhash') String? get appPwhash;@JsonKey(name: 'app_sudo') bool? get appSudo;@JsonKey(name: 'cli_pw') bool? get cliPw; List<String>? get excludeClients; List<String>? get excludeDomains; int? get maxHistory; int? get maxClients;@JsonKey(name: 'client_history_global_max') bool? get clientHistoryGlobalMax;@JsonKey(name: 'allow_destructive') bool? get allowDestructive; Temp? get temp;
/// Create a copy of WebApi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebApiCopyWith<WebApi> get copyWith => _$WebApiCopyWithImpl<WebApi>(this as WebApi, _$identity);

  /// Serializes this WebApi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebApi&&(identical(other.maxSessions, maxSessions) || other.maxSessions == maxSessions)&&(identical(other.prettyJSON, prettyJSON) || other.prettyJSON == prettyJSON)&&(identical(other.password, password) || other.password == password)&&(identical(other.pwhash, pwhash) || other.pwhash == pwhash)&&(identical(other.totpSecret, totpSecret) || other.totpSecret == totpSecret)&&(identical(other.appPwhash, appPwhash) || other.appPwhash == appPwhash)&&(identical(other.appSudo, appSudo) || other.appSudo == appSudo)&&(identical(other.cliPw, cliPw) || other.cliPw == cliPw)&&const DeepCollectionEquality().equals(other.excludeClients, excludeClients)&&const DeepCollectionEquality().equals(other.excludeDomains, excludeDomains)&&(identical(other.maxHistory, maxHistory) || other.maxHistory == maxHistory)&&(identical(other.maxClients, maxClients) || other.maxClients == maxClients)&&(identical(other.clientHistoryGlobalMax, clientHistoryGlobalMax) || other.clientHistoryGlobalMax == clientHistoryGlobalMax)&&(identical(other.allowDestructive, allowDestructive) || other.allowDestructive == allowDestructive)&&(identical(other.temp, temp) || other.temp == temp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxSessions,prettyJSON,password,pwhash,totpSecret,appPwhash,appSudo,cliPw,const DeepCollectionEquality().hash(excludeClients),const DeepCollectionEquality().hash(excludeDomains),maxHistory,maxClients,clientHistoryGlobalMax,allowDestructive,temp);

@override
String toString() {
  return 'WebApi(maxSessions: $maxSessions, prettyJSON: $prettyJSON, password: $password, pwhash: $pwhash, totpSecret: $totpSecret, appPwhash: $appPwhash, appSudo: $appSudo, cliPw: $cliPw, excludeClients: $excludeClients, excludeDomains: $excludeDomains, maxHistory: $maxHistory, maxClients: $maxClients, clientHistoryGlobalMax: $clientHistoryGlobalMax, allowDestructive: $allowDestructive, temp: $temp)';
}


}

/// @nodoc
abstract mixin class $WebApiCopyWith<$Res>  {
  factory $WebApiCopyWith(WebApi value, $Res Function(WebApi) _then) = _$WebApiCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'max_sessions') int? maxSessions, bool? prettyJSON, String? password, String? pwhash,@JsonKey(name: 'totp_secret') String? totpSecret,@JsonKey(name: 'app_pwhash') String? appPwhash,@JsonKey(name: 'app_sudo') bool? appSudo,@JsonKey(name: 'cli_pw') bool? cliPw, List<String>? excludeClients, List<String>? excludeDomains, int? maxHistory, int? maxClients,@JsonKey(name: 'client_history_global_max') bool? clientHistoryGlobalMax,@JsonKey(name: 'allow_destructive') bool? allowDestructive, Temp? temp
});


$TempCopyWith<$Res>? get temp;

}
/// @nodoc
class _$WebApiCopyWithImpl<$Res>
    implements $WebApiCopyWith<$Res> {
  _$WebApiCopyWithImpl(this._self, this._then);

  final WebApi _self;
  final $Res Function(WebApi) _then;

/// Create a copy of WebApi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxSessions = freezed,Object? prettyJSON = freezed,Object? password = freezed,Object? pwhash = freezed,Object? totpSecret = freezed,Object? appPwhash = freezed,Object? appSudo = freezed,Object? cliPw = freezed,Object? excludeClients = freezed,Object? excludeDomains = freezed,Object? maxHistory = freezed,Object? maxClients = freezed,Object? clientHistoryGlobalMax = freezed,Object? allowDestructive = freezed,Object? temp = freezed,}) {
  return _then(_self.copyWith(
maxSessions: freezed == maxSessions ? _self.maxSessions : maxSessions // ignore: cast_nullable_to_non_nullable
as int?,prettyJSON: freezed == prettyJSON ? _self.prettyJSON : prettyJSON // ignore: cast_nullable_to_non_nullable
as bool?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,pwhash: freezed == pwhash ? _self.pwhash : pwhash // ignore: cast_nullable_to_non_nullable
as String?,totpSecret: freezed == totpSecret ? _self.totpSecret : totpSecret // ignore: cast_nullable_to_non_nullable
as String?,appPwhash: freezed == appPwhash ? _self.appPwhash : appPwhash // ignore: cast_nullable_to_non_nullable
as String?,appSudo: freezed == appSudo ? _self.appSudo : appSudo // ignore: cast_nullable_to_non_nullable
as bool?,cliPw: freezed == cliPw ? _self.cliPw : cliPw // ignore: cast_nullable_to_non_nullable
as bool?,excludeClients: freezed == excludeClients ? _self.excludeClients : excludeClients // ignore: cast_nullable_to_non_nullable
as List<String>?,excludeDomains: freezed == excludeDomains ? _self.excludeDomains : excludeDomains // ignore: cast_nullable_to_non_nullable
as List<String>?,maxHistory: freezed == maxHistory ? _self.maxHistory : maxHistory // ignore: cast_nullable_to_non_nullable
as int?,maxClients: freezed == maxClients ? _self.maxClients : maxClients // ignore: cast_nullable_to_non_nullable
as int?,clientHistoryGlobalMax: freezed == clientHistoryGlobalMax ? _self.clientHistoryGlobalMax : clientHistoryGlobalMax // ignore: cast_nullable_to_non_nullable
as bool?,allowDestructive: freezed == allowDestructive ? _self.allowDestructive : allowDestructive // ignore: cast_nullable_to_non_nullable
as bool?,temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as Temp?,
  ));
}
/// Create a copy of WebApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TempCopyWith<$Res>? get temp {
    if (_self.temp == null) {
    return null;
  }

  return $TempCopyWith<$Res>(_self.temp!, (value) {
    return _then(_self.copyWith(temp: value));
  });
}
}


/// Adds pattern-matching-related methods to [WebApi].
extension WebApiPatterns on WebApi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebApi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebApi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebApi value)  $default,){
final _that = this;
switch (_that) {
case _WebApi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebApi value)?  $default,){
final _that = this;
switch (_that) {
case _WebApi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'max_sessions')  int? maxSessions,  bool? prettyJSON,  String? password,  String? pwhash, @JsonKey(name: 'totp_secret')  String? totpSecret, @JsonKey(name: 'app_pwhash')  String? appPwhash, @JsonKey(name: 'app_sudo')  bool? appSudo, @JsonKey(name: 'cli_pw')  bool? cliPw,  List<String>? excludeClients,  List<String>? excludeDomains,  int? maxHistory,  int? maxClients, @JsonKey(name: 'client_history_global_max')  bool? clientHistoryGlobalMax, @JsonKey(name: 'allow_destructive')  bool? allowDestructive,  Temp? temp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebApi() when $default != null:
return $default(_that.maxSessions,_that.prettyJSON,_that.password,_that.pwhash,_that.totpSecret,_that.appPwhash,_that.appSudo,_that.cliPw,_that.excludeClients,_that.excludeDomains,_that.maxHistory,_that.maxClients,_that.clientHistoryGlobalMax,_that.allowDestructive,_that.temp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'max_sessions')  int? maxSessions,  bool? prettyJSON,  String? password,  String? pwhash, @JsonKey(name: 'totp_secret')  String? totpSecret, @JsonKey(name: 'app_pwhash')  String? appPwhash, @JsonKey(name: 'app_sudo')  bool? appSudo, @JsonKey(name: 'cli_pw')  bool? cliPw,  List<String>? excludeClients,  List<String>? excludeDomains,  int? maxHistory,  int? maxClients, @JsonKey(name: 'client_history_global_max')  bool? clientHistoryGlobalMax, @JsonKey(name: 'allow_destructive')  bool? allowDestructive,  Temp? temp)  $default,) {final _that = this;
switch (_that) {
case _WebApi():
return $default(_that.maxSessions,_that.prettyJSON,_that.password,_that.pwhash,_that.totpSecret,_that.appPwhash,_that.appSudo,_that.cliPw,_that.excludeClients,_that.excludeDomains,_that.maxHistory,_that.maxClients,_that.clientHistoryGlobalMax,_that.allowDestructive,_that.temp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'max_sessions')  int? maxSessions,  bool? prettyJSON,  String? password,  String? pwhash, @JsonKey(name: 'totp_secret')  String? totpSecret, @JsonKey(name: 'app_pwhash')  String? appPwhash, @JsonKey(name: 'app_sudo')  bool? appSudo, @JsonKey(name: 'cli_pw')  bool? cliPw,  List<String>? excludeClients,  List<String>? excludeDomains,  int? maxHistory,  int? maxClients, @JsonKey(name: 'client_history_global_max')  bool? clientHistoryGlobalMax, @JsonKey(name: 'allow_destructive')  bool? allowDestructive,  Temp? temp)?  $default,) {final _that = this;
switch (_that) {
case _WebApi() when $default != null:
return $default(_that.maxSessions,_that.prettyJSON,_that.password,_that.pwhash,_that.totpSecret,_that.appPwhash,_that.appSudo,_that.cliPw,_that.excludeClients,_that.excludeDomains,_that.maxHistory,_that.maxClients,_that.clientHistoryGlobalMax,_that.allowDestructive,_that.temp);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _WebApi implements WebApi {
  const _WebApi({@JsonKey(name: 'max_sessions') this.maxSessions, this.prettyJSON, this.password, this.pwhash, @JsonKey(name: 'totp_secret') this.totpSecret, @JsonKey(name: 'app_pwhash') this.appPwhash, @JsonKey(name: 'app_sudo') this.appSudo, @JsonKey(name: 'cli_pw') this.cliPw, final  List<String>? excludeClients, final  List<String>? excludeDomains, this.maxHistory, this.maxClients, @JsonKey(name: 'client_history_global_max') this.clientHistoryGlobalMax, @JsonKey(name: 'allow_destructive') this.allowDestructive, this.temp}): _excludeClients = excludeClients,_excludeDomains = excludeDomains;
  factory _WebApi.fromJson(Map<String, dynamic> json) => _$WebApiFromJson(json);

@override@JsonKey(name: 'max_sessions') final  int? maxSessions;
@override final  bool? prettyJSON;
@override final  String? password;
@override final  String? pwhash;
@override@JsonKey(name: 'totp_secret') final  String? totpSecret;
@override@JsonKey(name: 'app_pwhash') final  String? appPwhash;
@override@JsonKey(name: 'app_sudo') final  bool? appSudo;
@override@JsonKey(name: 'cli_pw') final  bool? cliPw;
 final  List<String>? _excludeClients;
@override List<String>? get excludeClients {
  final value = _excludeClients;
  if (value == null) return null;
  if (_excludeClients is EqualUnmodifiableListView) return _excludeClients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _excludeDomains;
@override List<String>? get excludeDomains {
  final value = _excludeDomains;
  if (value == null) return null;
  if (_excludeDomains is EqualUnmodifiableListView) return _excludeDomains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? maxHistory;
@override final  int? maxClients;
@override@JsonKey(name: 'client_history_global_max') final  bool? clientHistoryGlobalMax;
@override@JsonKey(name: 'allow_destructive') final  bool? allowDestructive;
@override final  Temp? temp;

/// Create a copy of WebApi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebApiCopyWith<_WebApi> get copyWith => __$WebApiCopyWithImpl<_WebApi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebApiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebApi&&(identical(other.maxSessions, maxSessions) || other.maxSessions == maxSessions)&&(identical(other.prettyJSON, prettyJSON) || other.prettyJSON == prettyJSON)&&(identical(other.password, password) || other.password == password)&&(identical(other.pwhash, pwhash) || other.pwhash == pwhash)&&(identical(other.totpSecret, totpSecret) || other.totpSecret == totpSecret)&&(identical(other.appPwhash, appPwhash) || other.appPwhash == appPwhash)&&(identical(other.appSudo, appSudo) || other.appSudo == appSudo)&&(identical(other.cliPw, cliPw) || other.cliPw == cliPw)&&const DeepCollectionEquality().equals(other._excludeClients, _excludeClients)&&const DeepCollectionEquality().equals(other._excludeDomains, _excludeDomains)&&(identical(other.maxHistory, maxHistory) || other.maxHistory == maxHistory)&&(identical(other.maxClients, maxClients) || other.maxClients == maxClients)&&(identical(other.clientHistoryGlobalMax, clientHistoryGlobalMax) || other.clientHistoryGlobalMax == clientHistoryGlobalMax)&&(identical(other.allowDestructive, allowDestructive) || other.allowDestructive == allowDestructive)&&(identical(other.temp, temp) || other.temp == temp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxSessions,prettyJSON,password,pwhash,totpSecret,appPwhash,appSudo,cliPw,const DeepCollectionEquality().hash(_excludeClients),const DeepCollectionEquality().hash(_excludeDomains),maxHistory,maxClients,clientHistoryGlobalMax,allowDestructive,temp);

@override
String toString() {
  return 'WebApi(maxSessions: $maxSessions, prettyJSON: $prettyJSON, password: $password, pwhash: $pwhash, totpSecret: $totpSecret, appPwhash: $appPwhash, appSudo: $appSudo, cliPw: $cliPw, excludeClients: $excludeClients, excludeDomains: $excludeDomains, maxHistory: $maxHistory, maxClients: $maxClients, clientHistoryGlobalMax: $clientHistoryGlobalMax, allowDestructive: $allowDestructive, temp: $temp)';
}


}

/// @nodoc
abstract mixin class _$WebApiCopyWith<$Res> implements $WebApiCopyWith<$Res> {
  factory _$WebApiCopyWith(_WebApi value, $Res Function(_WebApi) _then) = __$WebApiCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'max_sessions') int? maxSessions, bool? prettyJSON, String? password, String? pwhash,@JsonKey(name: 'totp_secret') String? totpSecret,@JsonKey(name: 'app_pwhash') String? appPwhash,@JsonKey(name: 'app_sudo') bool? appSudo,@JsonKey(name: 'cli_pw') bool? cliPw, List<String>? excludeClients, List<String>? excludeDomains, int? maxHistory, int? maxClients,@JsonKey(name: 'client_history_global_max') bool? clientHistoryGlobalMax,@JsonKey(name: 'allow_destructive') bool? allowDestructive, Temp? temp
});


@override $TempCopyWith<$Res>? get temp;

}
/// @nodoc
class __$WebApiCopyWithImpl<$Res>
    implements _$WebApiCopyWith<$Res> {
  __$WebApiCopyWithImpl(this._self, this._then);

  final _WebApi _self;
  final $Res Function(_WebApi) _then;

/// Create a copy of WebApi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxSessions = freezed,Object? prettyJSON = freezed,Object? password = freezed,Object? pwhash = freezed,Object? totpSecret = freezed,Object? appPwhash = freezed,Object? appSudo = freezed,Object? cliPw = freezed,Object? excludeClients = freezed,Object? excludeDomains = freezed,Object? maxHistory = freezed,Object? maxClients = freezed,Object? clientHistoryGlobalMax = freezed,Object? allowDestructive = freezed,Object? temp = freezed,}) {
  return _then(_WebApi(
maxSessions: freezed == maxSessions ? _self.maxSessions : maxSessions // ignore: cast_nullable_to_non_nullable
as int?,prettyJSON: freezed == prettyJSON ? _self.prettyJSON : prettyJSON // ignore: cast_nullable_to_non_nullable
as bool?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,pwhash: freezed == pwhash ? _self.pwhash : pwhash // ignore: cast_nullable_to_non_nullable
as String?,totpSecret: freezed == totpSecret ? _self.totpSecret : totpSecret // ignore: cast_nullable_to_non_nullable
as String?,appPwhash: freezed == appPwhash ? _self.appPwhash : appPwhash // ignore: cast_nullable_to_non_nullable
as String?,appSudo: freezed == appSudo ? _self.appSudo : appSudo // ignore: cast_nullable_to_non_nullable
as bool?,cliPw: freezed == cliPw ? _self.cliPw : cliPw // ignore: cast_nullable_to_non_nullable
as bool?,excludeClients: freezed == excludeClients ? _self._excludeClients : excludeClients // ignore: cast_nullable_to_non_nullable
as List<String>?,excludeDomains: freezed == excludeDomains ? _self._excludeDomains : excludeDomains // ignore: cast_nullable_to_non_nullable
as List<String>?,maxHistory: freezed == maxHistory ? _self.maxHistory : maxHistory // ignore: cast_nullable_to_non_nullable
as int?,maxClients: freezed == maxClients ? _self.maxClients : maxClients // ignore: cast_nullable_to_non_nullable
as int?,clientHistoryGlobalMax: freezed == clientHistoryGlobalMax ? _self.clientHistoryGlobalMax : clientHistoryGlobalMax // ignore: cast_nullable_to_non_nullable
as bool?,allowDestructive: freezed == allowDestructive ? _self.allowDestructive : allowDestructive // ignore: cast_nullable_to_non_nullable
as bool?,temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as Temp?,
  ));
}

/// Create a copy of WebApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TempCopyWith<$Res>? get temp {
    if (_self.temp == null) {
    return null;
  }

  return $TempCopyWith<$Res>(_self.temp!, (value) {
    return _then(_self.copyWith(temp: value));
  });
}
}


/// @nodoc
mixin _$Temp {

 double? get limit; String? get unit;
/// Create a copy of Temp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TempCopyWith<Temp> get copyWith => _$TempCopyWithImpl<Temp>(this as Temp, _$identity);

  /// Serializes this Temp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Temp&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,unit);

@override
String toString() {
  return 'Temp(limit: $limit, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $TempCopyWith<$Res>  {
  factory $TempCopyWith(Temp value, $Res Function(Temp) _then) = _$TempCopyWithImpl;
@useResult
$Res call({
 double? limit, String? unit
});




}
/// @nodoc
class _$TempCopyWithImpl<$Res>
    implements $TempCopyWith<$Res> {
  _$TempCopyWithImpl(this._self, this._then);

  final Temp _self;
  final $Res Function(Temp) _then;

/// Create a copy of Temp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = freezed,Object? unit = freezed,}) {
  return _then(_self.copyWith(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Temp].
extension TempPatterns on Temp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Temp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Temp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Temp value)  $default,){
final _that = this;
switch (_that) {
case _Temp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Temp value)?  $default,){
final _that = this;
switch (_that) {
case _Temp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? limit,  String? unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Temp() when $default != null:
return $default(_that.limit,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? limit,  String? unit)  $default,) {final _that = this;
switch (_that) {
case _Temp():
return $default(_that.limit,_that.unit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? limit,  String? unit)?  $default,) {final _that = this;
switch (_that) {
case _Temp() when $default != null:
return $default(_that.limit,_that.unit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Temp implements Temp {
  const _Temp({this.limit, this.unit});
  factory _Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

@override final  double? limit;
@override final  String? unit;

/// Create a copy of Temp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TempCopyWith<_Temp> get copyWith => __$TempCopyWithImpl<_Temp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TempToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Temp&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,unit);

@override
String toString() {
  return 'Temp(limit: $limit, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$TempCopyWith<$Res> implements $TempCopyWith<$Res> {
  factory _$TempCopyWith(_Temp value, $Res Function(_Temp) _then) = __$TempCopyWithImpl;
@override @useResult
$Res call({
 double? limit, String? unit
});




}
/// @nodoc
class __$TempCopyWithImpl<$Res>
    implements _$TempCopyWith<$Res> {
  __$TempCopyWithImpl(this._self, this._then);

  final _Temp _self;
  final $Res Function(_Temp) _then;

/// Create a copy of Temp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = freezed,Object? unit = freezed,}) {
  return _then(_Temp(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Files {

 String? get pid; String? get database; String? get gravity;@JsonKey(name: 'gravity_tmp') String? get gravityTmp; String? get macvendor; String? get setupVars; String? get pcap; LogFiles? get log;
/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilesCopyWith<Files> get copyWith => _$FilesCopyWithImpl<Files>(this as Files, _$identity);

  /// Serializes this Files to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Files&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.database, database) || other.database == database)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.gravityTmp, gravityTmp) || other.gravityTmp == gravityTmp)&&(identical(other.macvendor, macvendor) || other.macvendor == macvendor)&&(identical(other.setupVars, setupVars) || other.setupVars == setupVars)&&(identical(other.pcap, pcap) || other.pcap == pcap)&&(identical(other.log, log) || other.log == log));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pid,database,gravity,gravityTmp,macvendor,setupVars,pcap,log);

@override
String toString() {
  return 'Files(pid: $pid, database: $database, gravity: $gravity, gravityTmp: $gravityTmp, macvendor: $macvendor, setupVars: $setupVars, pcap: $pcap, log: $log)';
}


}

/// @nodoc
abstract mixin class $FilesCopyWith<$Res>  {
  factory $FilesCopyWith(Files value, $Res Function(Files) _then) = _$FilesCopyWithImpl;
@useResult
$Res call({
 String? pid, String? database, String? gravity,@JsonKey(name: 'gravity_tmp') String? gravityTmp, String? macvendor, String? setupVars, String? pcap, LogFiles? log
});


$LogFilesCopyWith<$Res>? get log;

}
/// @nodoc
class _$FilesCopyWithImpl<$Res>
    implements $FilesCopyWith<$Res> {
  _$FilesCopyWithImpl(this._self, this._then);

  final Files _self;
  final $Res Function(Files) _then;

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pid = freezed,Object? database = freezed,Object? gravity = freezed,Object? gravityTmp = freezed,Object? macvendor = freezed,Object? setupVars = freezed,Object? pcap = freezed,Object? log = freezed,}) {
  return _then(_self.copyWith(
pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as String?,database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as String?,gravity: freezed == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as String?,gravityTmp: freezed == gravityTmp ? _self.gravityTmp : gravityTmp // ignore: cast_nullable_to_non_nullable
as String?,macvendor: freezed == macvendor ? _self.macvendor : macvendor // ignore: cast_nullable_to_non_nullable
as String?,setupVars: freezed == setupVars ? _self.setupVars : setupVars // ignore: cast_nullable_to_non_nullable
as String?,pcap: freezed == pcap ? _self.pcap : pcap // ignore: cast_nullable_to_non_nullable
as String?,log: freezed == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as LogFiles?,
  ));
}
/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogFilesCopyWith<$Res>? get log {
    if (_self.log == null) {
    return null;
  }

  return $LogFilesCopyWith<$Res>(_self.log!, (value) {
    return _then(_self.copyWith(log: value));
  });
}
}


/// Adds pattern-matching-related methods to [Files].
extension FilesPatterns on Files {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Files value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Files() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Files value)  $default,){
final _that = this;
switch (_that) {
case _Files():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Files value)?  $default,){
final _that = this;
switch (_that) {
case _Files() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pid,  String? database,  String? gravity, @JsonKey(name: 'gravity_tmp')  String? gravityTmp,  String? macvendor,  String? setupVars,  String? pcap,  LogFiles? log)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Files() when $default != null:
return $default(_that.pid,_that.database,_that.gravity,_that.gravityTmp,_that.macvendor,_that.setupVars,_that.pcap,_that.log);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pid,  String? database,  String? gravity, @JsonKey(name: 'gravity_tmp')  String? gravityTmp,  String? macvendor,  String? setupVars,  String? pcap,  LogFiles? log)  $default,) {final _that = this;
switch (_that) {
case _Files():
return $default(_that.pid,_that.database,_that.gravity,_that.gravityTmp,_that.macvendor,_that.setupVars,_that.pcap,_that.log);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pid,  String? database,  String? gravity, @JsonKey(name: 'gravity_tmp')  String? gravityTmp,  String? macvendor,  String? setupVars,  String? pcap,  LogFiles? log)?  $default,) {final _that = this;
switch (_that) {
case _Files() when $default != null:
return $default(_that.pid,_that.database,_that.gravity,_that.gravityTmp,_that.macvendor,_that.setupVars,_that.pcap,_that.log);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Files implements Files {
  const _Files({this.pid, this.database, this.gravity, @JsonKey(name: 'gravity_tmp') this.gravityTmp, this.macvendor, this.setupVars, this.pcap, this.log});
  factory _Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);

@override final  String? pid;
@override final  String? database;
@override final  String? gravity;
@override@JsonKey(name: 'gravity_tmp') final  String? gravityTmp;
@override final  String? macvendor;
@override final  String? setupVars;
@override final  String? pcap;
@override final  LogFiles? log;

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilesCopyWith<_Files> get copyWith => __$FilesCopyWithImpl<_Files>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Files&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.database, database) || other.database == database)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.gravityTmp, gravityTmp) || other.gravityTmp == gravityTmp)&&(identical(other.macvendor, macvendor) || other.macvendor == macvendor)&&(identical(other.setupVars, setupVars) || other.setupVars == setupVars)&&(identical(other.pcap, pcap) || other.pcap == pcap)&&(identical(other.log, log) || other.log == log));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pid,database,gravity,gravityTmp,macvendor,setupVars,pcap,log);

@override
String toString() {
  return 'Files(pid: $pid, database: $database, gravity: $gravity, gravityTmp: $gravityTmp, macvendor: $macvendor, setupVars: $setupVars, pcap: $pcap, log: $log)';
}


}

/// @nodoc
abstract mixin class _$FilesCopyWith<$Res> implements $FilesCopyWith<$Res> {
  factory _$FilesCopyWith(_Files value, $Res Function(_Files) _then) = __$FilesCopyWithImpl;
@override @useResult
$Res call({
 String? pid, String? database, String? gravity,@JsonKey(name: 'gravity_tmp') String? gravityTmp, String? macvendor, String? setupVars, String? pcap, LogFiles? log
});


@override $LogFilesCopyWith<$Res>? get log;

}
/// @nodoc
class __$FilesCopyWithImpl<$Res>
    implements _$FilesCopyWith<$Res> {
  __$FilesCopyWithImpl(this._self, this._then);

  final _Files _self;
  final $Res Function(_Files) _then;

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pid = freezed,Object? database = freezed,Object? gravity = freezed,Object? gravityTmp = freezed,Object? macvendor = freezed,Object? setupVars = freezed,Object? pcap = freezed,Object? log = freezed,}) {
  return _then(_Files(
pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as String?,database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as String?,gravity: freezed == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as String?,gravityTmp: freezed == gravityTmp ? _self.gravityTmp : gravityTmp // ignore: cast_nullable_to_non_nullable
as String?,macvendor: freezed == macvendor ? _self.macvendor : macvendor // ignore: cast_nullable_to_non_nullable
as String?,setupVars: freezed == setupVars ? _self.setupVars : setupVars // ignore: cast_nullable_to_non_nullable
as String?,pcap: freezed == pcap ? _self.pcap : pcap // ignore: cast_nullable_to_non_nullable
as String?,log: freezed == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as LogFiles?,
  ));
}

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogFilesCopyWith<$Res>? get log {
    if (_self.log == null) {
    return null;
  }

  return $LogFilesCopyWith<$Res>(_self.log!, (value) {
    return _then(_self.copyWith(log: value));
  });
}
}


/// @nodoc
mixin _$LogFiles {

 String? get ftl; String? get dnsmasq; String? get webserver;
/// Create a copy of LogFiles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogFilesCopyWith<LogFiles> get copyWith => _$LogFilesCopyWithImpl<LogFiles>(this as LogFiles, _$identity);

  /// Serializes this LogFiles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogFiles&&(identical(other.ftl, ftl) || other.ftl == ftl)&&(identical(other.dnsmasq, dnsmasq) || other.dnsmasq == dnsmasq)&&(identical(other.webserver, webserver) || other.webserver == webserver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ftl,dnsmasq,webserver);

@override
String toString() {
  return 'LogFiles(ftl: $ftl, dnsmasq: $dnsmasq, webserver: $webserver)';
}


}

/// @nodoc
abstract mixin class $LogFilesCopyWith<$Res>  {
  factory $LogFilesCopyWith(LogFiles value, $Res Function(LogFiles) _then) = _$LogFilesCopyWithImpl;
@useResult
$Res call({
 String? ftl, String? dnsmasq, String? webserver
});




}
/// @nodoc
class _$LogFilesCopyWithImpl<$Res>
    implements $LogFilesCopyWith<$Res> {
  _$LogFilesCopyWithImpl(this._self, this._then);

  final LogFiles _self;
  final $Res Function(LogFiles) _then;

/// Create a copy of LogFiles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ftl = freezed,Object? dnsmasq = freezed,Object? webserver = freezed,}) {
  return _then(_self.copyWith(
ftl: freezed == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as String?,dnsmasq: freezed == dnsmasq ? _self.dnsmasq : dnsmasq // ignore: cast_nullable_to_non_nullable
as String?,webserver: freezed == webserver ? _self.webserver : webserver // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogFiles].
extension LogFilesPatterns on LogFiles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogFiles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogFiles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogFiles value)  $default,){
final _that = this;
switch (_that) {
case _LogFiles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogFiles value)?  $default,){
final _that = this;
switch (_that) {
case _LogFiles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? ftl,  String? dnsmasq,  String? webserver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogFiles() when $default != null:
return $default(_that.ftl,_that.dnsmasq,_that.webserver);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? ftl,  String? dnsmasq,  String? webserver)  $default,) {final _that = this;
switch (_that) {
case _LogFiles():
return $default(_that.ftl,_that.dnsmasq,_that.webserver);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? ftl,  String? dnsmasq,  String? webserver)?  $default,) {final _that = this;
switch (_that) {
case _LogFiles() when $default != null:
return $default(_that.ftl,_that.dnsmasq,_that.webserver);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _LogFiles implements LogFiles {
  const _LogFiles({this.ftl, this.dnsmasq, this.webserver});
  factory _LogFiles.fromJson(Map<String, dynamic> json) => _$LogFilesFromJson(json);

@override final  String? ftl;
@override final  String? dnsmasq;
@override final  String? webserver;

/// Create a copy of LogFiles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogFilesCopyWith<_LogFiles> get copyWith => __$LogFilesCopyWithImpl<_LogFiles>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogFilesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogFiles&&(identical(other.ftl, ftl) || other.ftl == ftl)&&(identical(other.dnsmasq, dnsmasq) || other.dnsmasq == dnsmasq)&&(identical(other.webserver, webserver) || other.webserver == webserver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ftl,dnsmasq,webserver);

@override
String toString() {
  return 'LogFiles(ftl: $ftl, dnsmasq: $dnsmasq, webserver: $webserver)';
}


}

/// @nodoc
abstract mixin class _$LogFilesCopyWith<$Res> implements $LogFilesCopyWith<$Res> {
  factory _$LogFilesCopyWith(_LogFiles value, $Res Function(_LogFiles) _then) = __$LogFilesCopyWithImpl;
@override @useResult
$Res call({
 String? ftl, String? dnsmasq, String? webserver
});




}
/// @nodoc
class __$LogFilesCopyWithImpl<$Res>
    implements _$LogFilesCopyWith<$Res> {
  __$LogFilesCopyWithImpl(this._self, this._then);

  final _LogFiles _self;
  final $Res Function(_LogFiles) _then;

/// Create a copy of LogFiles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ftl = freezed,Object? dnsmasq = freezed,Object? webserver = freezed,}) {
  return _then(_LogFiles(
ftl: freezed == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as String?,dnsmasq: freezed == dnsmasq ? _self.dnsmasq : dnsmasq // ignore: cast_nullable_to_non_nullable
as String?,webserver: freezed == webserver ? _self.webserver : webserver // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Misc {

 int? get nice;@JsonKey(name: 'delay_startup') int? get delayStartup; bool? get addr2line;@JsonKey(name: 'etc_dnsmasq_d') bool? get etcDnsmasqD; int? get privacylevel;@JsonKey(name: 'dnsmasq_lines') List<String>? get dnsmasqLines; bool? get extraLogging; bool? get readOnly; Check? get check;
/// Create a copy of Misc
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MiscCopyWith<Misc> get copyWith => _$MiscCopyWithImpl<Misc>(this as Misc, _$identity);

  /// Serializes this Misc to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Misc&&(identical(other.nice, nice) || other.nice == nice)&&(identical(other.delayStartup, delayStartup) || other.delayStartup == delayStartup)&&(identical(other.addr2line, addr2line) || other.addr2line == addr2line)&&(identical(other.etcDnsmasqD, etcDnsmasqD) || other.etcDnsmasqD == etcDnsmasqD)&&(identical(other.privacylevel, privacylevel) || other.privacylevel == privacylevel)&&const DeepCollectionEquality().equals(other.dnsmasqLines, dnsmasqLines)&&(identical(other.extraLogging, extraLogging) || other.extraLogging == extraLogging)&&(identical(other.readOnly, readOnly) || other.readOnly == readOnly)&&(identical(other.check, check) || other.check == check));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nice,delayStartup,addr2line,etcDnsmasqD,privacylevel,const DeepCollectionEquality().hash(dnsmasqLines),extraLogging,readOnly,check);

@override
String toString() {
  return 'Misc(nice: $nice, delayStartup: $delayStartup, addr2line: $addr2line, etcDnsmasqD: $etcDnsmasqD, privacylevel: $privacylevel, dnsmasqLines: $dnsmasqLines, extraLogging: $extraLogging, readOnly: $readOnly, check: $check)';
}


}

/// @nodoc
abstract mixin class $MiscCopyWith<$Res>  {
  factory $MiscCopyWith(Misc value, $Res Function(Misc) _then) = _$MiscCopyWithImpl;
@useResult
$Res call({
 int? nice,@JsonKey(name: 'delay_startup') int? delayStartup, bool? addr2line,@JsonKey(name: 'etc_dnsmasq_d') bool? etcDnsmasqD, int? privacylevel,@JsonKey(name: 'dnsmasq_lines') List<String>? dnsmasqLines, bool? extraLogging, bool? readOnly, Check? check
});


$CheckCopyWith<$Res>? get check;

}
/// @nodoc
class _$MiscCopyWithImpl<$Res>
    implements $MiscCopyWith<$Res> {
  _$MiscCopyWithImpl(this._self, this._then);

  final Misc _self;
  final $Res Function(Misc) _then;

/// Create a copy of Misc
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nice = freezed,Object? delayStartup = freezed,Object? addr2line = freezed,Object? etcDnsmasqD = freezed,Object? privacylevel = freezed,Object? dnsmasqLines = freezed,Object? extraLogging = freezed,Object? readOnly = freezed,Object? check = freezed,}) {
  return _then(_self.copyWith(
nice: freezed == nice ? _self.nice : nice // ignore: cast_nullable_to_non_nullable
as int?,delayStartup: freezed == delayStartup ? _self.delayStartup : delayStartup // ignore: cast_nullable_to_non_nullable
as int?,addr2line: freezed == addr2line ? _self.addr2line : addr2line // ignore: cast_nullable_to_non_nullable
as bool?,etcDnsmasqD: freezed == etcDnsmasqD ? _self.etcDnsmasqD : etcDnsmasqD // ignore: cast_nullable_to_non_nullable
as bool?,privacylevel: freezed == privacylevel ? _self.privacylevel : privacylevel // ignore: cast_nullable_to_non_nullable
as int?,dnsmasqLines: freezed == dnsmasqLines ? _self.dnsmasqLines : dnsmasqLines // ignore: cast_nullable_to_non_nullable
as List<String>?,extraLogging: freezed == extraLogging ? _self.extraLogging : extraLogging // ignore: cast_nullable_to_non_nullable
as bool?,readOnly: freezed == readOnly ? _self.readOnly : readOnly // ignore: cast_nullable_to_non_nullable
as bool?,check: freezed == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as Check?,
  ));
}
/// Create a copy of Misc
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckCopyWith<$Res>? get check {
    if (_self.check == null) {
    return null;
  }

  return $CheckCopyWith<$Res>(_self.check!, (value) {
    return _then(_self.copyWith(check: value));
  });
}
}


/// Adds pattern-matching-related methods to [Misc].
extension MiscPatterns on Misc {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Misc value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Misc() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Misc value)  $default,){
final _that = this;
switch (_that) {
case _Misc():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Misc value)?  $default,){
final _that = this;
switch (_that) {
case _Misc() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? nice, @JsonKey(name: 'delay_startup')  int? delayStartup,  bool? addr2line, @JsonKey(name: 'etc_dnsmasq_d')  bool? etcDnsmasqD,  int? privacylevel, @JsonKey(name: 'dnsmasq_lines')  List<String>? dnsmasqLines,  bool? extraLogging,  bool? readOnly,  Check? check)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Misc() when $default != null:
return $default(_that.nice,_that.delayStartup,_that.addr2line,_that.etcDnsmasqD,_that.privacylevel,_that.dnsmasqLines,_that.extraLogging,_that.readOnly,_that.check);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? nice, @JsonKey(name: 'delay_startup')  int? delayStartup,  bool? addr2line, @JsonKey(name: 'etc_dnsmasq_d')  bool? etcDnsmasqD,  int? privacylevel, @JsonKey(name: 'dnsmasq_lines')  List<String>? dnsmasqLines,  bool? extraLogging,  bool? readOnly,  Check? check)  $default,) {final _that = this;
switch (_that) {
case _Misc():
return $default(_that.nice,_that.delayStartup,_that.addr2line,_that.etcDnsmasqD,_that.privacylevel,_that.dnsmasqLines,_that.extraLogging,_that.readOnly,_that.check);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? nice, @JsonKey(name: 'delay_startup')  int? delayStartup,  bool? addr2line, @JsonKey(name: 'etc_dnsmasq_d')  bool? etcDnsmasqD,  int? privacylevel, @JsonKey(name: 'dnsmasq_lines')  List<String>? dnsmasqLines,  bool? extraLogging,  bool? readOnly,  Check? check)?  $default,) {final _that = this;
switch (_that) {
case _Misc() when $default != null:
return $default(_that.nice,_that.delayStartup,_that.addr2line,_that.etcDnsmasqD,_that.privacylevel,_that.dnsmasqLines,_that.extraLogging,_that.readOnly,_that.check);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Misc implements Misc {
  const _Misc({this.nice, @JsonKey(name: 'delay_startup') this.delayStartup, this.addr2line, @JsonKey(name: 'etc_dnsmasq_d') this.etcDnsmasqD, this.privacylevel, @JsonKey(name: 'dnsmasq_lines') final  List<String>? dnsmasqLines, this.extraLogging, this.readOnly, this.check}): _dnsmasqLines = dnsmasqLines;
  factory _Misc.fromJson(Map<String, dynamic> json) => _$MiscFromJson(json);

@override final  int? nice;
@override@JsonKey(name: 'delay_startup') final  int? delayStartup;
@override final  bool? addr2line;
@override@JsonKey(name: 'etc_dnsmasq_d') final  bool? etcDnsmasqD;
@override final  int? privacylevel;
 final  List<String>? _dnsmasqLines;
@override@JsonKey(name: 'dnsmasq_lines') List<String>? get dnsmasqLines {
  final value = _dnsmasqLines;
  if (value == null) return null;
  if (_dnsmasqLines is EqualUnmodifiableListView) return _dnsmasqLines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? extraLogging;
@override final  bool? readOnly;
@override final  Check? check;

/// Create a copy of Misc
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MiscCopyWith<_Misc> get copyWith => __$MiscCopyWithImpl<_Misc>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MiscToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Misc&&(identical(other.nice, nice) || other.nice == nice)&&(identical(other.delayStartup, delayStartup) || other.delayStartup == delayStartup)&&(identical(other.addr2line, addr2line) || other.addr2line == addr2line)&&(identical(other.etcDnsmasqD, etcDnsmasqD) || other.etcDnsmasqD == etcDnsmasqD)&&(identical(other.privacylevel, privacylevel) || other.privacylevel == privacylevel)&&const DeepCollectionEquality().equals(other._dnsmasqLines, _dnsmasqLines)&&(identical(other.extraLogging, extraLogging) || other.extraLogging == extraLogging)&&(identical(other.readOnly, readOnly) || other.readOnly == readOnly)&&(identical(other.check, check) || other.check == check));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nice,delayStartup,addr2line,etcDnsmasqD,privacylevel,const DeepCollectionEquality().hash(_dnsmasqLines),extraLogging,readOnly,check);

@override
String toString() {
  return 'Misc(nice: $nice, delayStartup: $delayStartup, addr2line: $addr2line, etcDnsmasqD: $etcDnsmasqD, privacylevel: $privacylevel, dnsmasqLines: $dnsmasqLines, extraLogging: $extraLogging, readOnly: $readOnly, check: $check)';
}


}

/// @nodoc
abstract mixin class _$MiscCopyWith<$Res> implements $MiscCopyWith<$Res> {
  factory _$MiscCopyWith(_Misc value, $Res Function(_Misc) _then) = __$MiscCopyWithImpl;
@override @useResult
$Res call({
 int? nice,@JsonKey(name: 'delay_startup') int? delayStartup, bool? addr2line,@JsonKey(name: 'etc_dnsmasq_d') bool? etcDnsmasqD, int? privacylevel,@JsonKey(name: 'dnsmasq_lines') List<String>? dnsmasqLines, bool? extraLogging, bool? readOnly, Check? check
});


@override $CheckCopyWith<$Res>? get check;

}
/// @nodoc
class __$MiscCopyWithImpl<$Res>
    implements _$MiscCopyWith<$Res> {
  __$MiscCopyWithImpl(this._self, this._then);

  final _Misc _self;
  final $Res Function(_Misc) _then;

/// Create a copy of Misc
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nice = freezed,Object? delayStartup = freezed,Object? addr2line = freezed,Object? etcDnsmasqD = freezed,Object? privacylevel = freezed,Object? dnsmasqLines = freezed,Object? extraLogging = freezed,Object? readOnly = freezed,Object? check = freezed,}) {
  return _then(_Misc(
nice: freezed == nice ? _self.nice : nice // ignore: cast_nullable_to_non_nullable
as int?,delayStartup: freezed == delayStartup ? _self.delayStartup : delayStartup // ignore: cast_nullable_to_non_nullable
as int?,addr2line: freezed == addr2line ? _self.addr2line : addr2line // ignore: cast_nullable_to_non_nullable
as bool?,etcDnsmasqD: freezed == etcDnsmasqD ? _self.etcDnsmasqD : etcDnsmasqD // ignore: cast_nullable_to_non_nullable
as bool?,privacylevel: freezed == privacylevel ? _self.privacylevel : privacylevel // ignore: cast_nullable_to_non_nullable
as int?,dnsmasqLines: freezed == dnsmasqLines ? _self._dnsmasqLines : dnsmasqLines // ignore: cast_nullable_to_non_nullable
as List<String>?,extraLogging: freezed == extraLogging ? _self.extraLogging : extraLogging // ignore: cast_nullable_to_non_nullable
as bool?,readOnly: freezed == readOnly ? _self.readOnly : readOnly // ignore: cast_nullable_to_non_nullable
as bool?,check: freezed == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as Check?,
  ));
}

/// Create a copy of Misc
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckCopyWith<$Res>? get check {
    if (_self.check == null) {
    return null;
  }

  return $CheckCopyWith<$Res>(_self.check!, (value) {
    return _then(_self.copyWith(check: value));
  });
}
}


/// @nodoc
mixin _$Check {

 bool? get load; int? get shmem; int? get disk;
/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckCopyWith<Check> get copyWith => _$CheckCopyWithImpl<Check>(this as Check, _$identity);

  /// Serializes this Check to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Check&&(identical(other.load, load) || other.load == load)&&(identical(other.shmem, shmem) || other.shmem == shmem)&&(identical(other.disk, disk) || other.disk == disk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,load,shmem,disk);

@override
String toString() {
  return 'Check(load: $load, shmem: $shmem, disk: $disk)';
}


}

/// @nodoc
abstract mixin class $CheckCopyWith<$Res>  {
  factory $CheckCopyWith(Check value, $Res Function(Check) _then) = _$CheckCopyWithImpl;
@useResult
$Res call({
 bool? load, int? shmem, int? disk
});




}
/// @nodoc
class _$CheckCopyWithImpl<$Res>
    implements $CheckCopyWith<$Res> {
  _$CheckCopyWithImpl(this._self, this._then);

  final Check _self;
  final $Res Function(Check) _then;

/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? load = freezed,Object? shmem = freezed,Object? disk = freezed,}) {
  return _then(_self.copyWith(
load: freezed == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as bool?,shmem: freezed == shmem ? _self.shmem : shmem // ignore: cast_nullable_to_non_nullable
as int?,disk: freezed == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Check].
extension CheckPatterns on Check {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Check value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Check() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Check value)  $default,){
final _that = this;
switch (_that) {
case _Check():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Check value)?  $default,){
final _that = this;
switch (_that) {
case _Check() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? load,  int? shmem,  int? disk)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Check() when $default != null:
return $default(_that.load,_that.shmem,_that.disk);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? load,  int? shmem,  int? disk)  $default,) {final _that = this;
switch (_that) {
case _Check():
return $default(_that.load,_that.shmem,_that.disk);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? load,  int? shmem,  int? disk)?  $default,) {final _that = this;
switch (_that) {
case _Check() when $default != null:
return $default(_that.load,_that.shmem,_that.disk);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Check implements Check {
  const _Check({this.load, this.shmem, this.disk});
  factory _Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);

@override final  bool? load;
@override final  int? shmem;
@override final  int? disk;

/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckCopyWith<_Check> get copyWith => __$CheckCopyWithImpl<_Check>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Check&&(identical(other.load, load) || other.load == load)&&(identical(other.shmem, shmem) || other.shmem == shmem)&&(identical(other.disk, disk) || other.disk == disk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,load,shmem,disk);

@override
String toString() {
  return 'Check(load: $load, shmem: $shmem, disk: $disk)';
}


}

/// @nodoc
abstract mixin class _$CheckCopyWith<$Res> implements $CheckCopyWith<$Res> {
  factory _$CheckCopyWith(_Check value, $Res Function(_Check) _then) = __$CheckCopyWithImpl;
@override @useResult
$Res call({
 bool? load, int? shmem, int? disk
});




}
/// @nodoc
class __$CheckCopyWithImpl<$Res>
    implements _$CheckCopyWith<$Res> {
  __$CheckCopyWithImpl(this._self, this._then);

  final _Check _self;
  final $Res Function(_Check) _then;

/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? load = freezed,Object? shmem = freezed,Object? disk = freezed,}) {
  return _then(_Check(
load: freezed == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as bool?,shmem: freezed == shmem ? _self.shmem : shmem // ignore: cast_nullable_to_non_nullable
as int?,disk: freezed == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Debug {

 bool? get database; bool? get networking; bool? get locks; bool? get queries; bool? get flags; bool? get shmem; bool? get gc; bool? get arp; bool? get regex; bool? get api; bool? get tls; bool? get overtime; bool? get status; bool? get caps; bool? get dnssec; bool? get vectors; bool? get resolver; bool? get edns0; bool? get clients; bool? get aliasclients; bool? get events; bool? get helper; bool? get config; bool? get inotify; bool? get webserver; bool? get extra; bool? get reserved; bool? get ntp; bool? get netlink; bool? get all;
/// Create a copy of Debug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DebugCopyWith<Debug> get copyWith => _$DebugCopyWithImpl<Debug>(this as Debug, _$identity);

  /// Serializes this Debug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Debug&&(identical(other.database, database) || other.database == database)&&(identical(other.networking, networking) || other.networking == networking)&&(identical(other.locks, locks) || other.locks == locks)&&(identical(other.queries, queries) || other.queries == queries)&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.shmem, shmem) || other.shmem == shmem)&&(identical(other.gc, gc) || other.gc == gc)&&(identical(other.arp, arp) || other.arp == arp)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.api, api) || other.api == api)&&(identical(other.tls, tls) || other.tls == tls)&&(identical(other.overtime, overtime) || other.overtime == overtime)&&(identical(other.status, status) || other.status == status)&&(identical(other.caps, caps) || other.caps == caps)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.vectors, vectors) || other.vectors == vectors)&&(identical(other.resolver, resolver) || other.resolver == resolver)&&(identical(other.edns0, edns0) || other.edns0 == edns0)&&(identical(other.clients, clients) || other.clients == clients)&&(identical(other.aliasclients, aliasclients) || other.aliasclients == aliasclients)&&(identical(other.events, events) || other.events == events)&&(identical(other.helper, helper) || other.helper == helper)&&(identical(other.config, config) || other.config == config)&&(identical(other.inotify, inotify) || other.inotify == inotify)&&(identical(other.webserver, webserver) || other.webserver == webserver)&&(identical(other.extra, extra) || other.extra == extra)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.ntp, ntp) || other.ntp == ntp)&&(identical(other.netlink, netlink) || other.netlink == netlink)&&(identical(other.all, all) || other.all == all));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,database,networking,locks,queries,flags,shmem,gc,arp,regex,api,tls,overtime,status,caps,dnssec,vectors,resolver,edns0,clients,aliasclients,events,helper,config,inotify,webserver,extra,reserved,ntp,netlink,all]);

@override
String toString() {
  return 'Debug(database: $database, networking: $networking, locks: $locks, queries: $queries, flags: $flags, shmem: $shmem, gc: $gc, arp: $arp, regex: $regex, api: $api, tls: $tls, overtime: $overtime, status: $status, caps: $caps, dnssec: $dnssec, vectors: $vectors, resolver: $resolver, edns0: $edns0, clients: $clients, aliasclients: $aliasclients, events: $events, helper: $helper, config: $config, inotify: $inotify, webserver: $webserver, extra: $extra, reserved: $reserved, ntp: $ntp, netlink: $netlink, all: $all)';
}


}

/// @nodoc
abstract mixin class $DebugCopyWith<$Res>  {
  factory $DebugCopyWith(Debug value, $Res Function(Debug) _then) = _$DebugCopyWithImpl;
@useResult
$Res call({
 bool? database, bool? networking, bool? locks, bool? queries, bool? flags, bool? shmem, bool? gc, bool? arp, bool? regex, bool? api, bool? tls, bool? overtime, bool? status, bool? caps, bool? dnssec, bool? vectors, bool? resolver, bool? edns0, bool? clients, bool? aliasclients, bool? events, bool? helper, bool? config, bool? inotify, bool? webserver, bool? extra, bool? reserved, bool? ntp, bool? netlink, bool? all
});




}
/// @nodoc
class _$DebugCopyWithImpl<$Res>
    implements $DebugCopyWith<$Res> {
  _$DebugCopyWithImpl(this._self, this._then);

  final Debug _self;
  final $Res Function(Debug) _then;

/// Create a copy of Debug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? database = freezed,Object? networking = freezed,Object? locks = freezed,Object? queries = freezed,Object? flags = freezed,Object? shmem = freezed,Object? gc = freezed,Object? arp = freezed,Object? regex = freezed,Object? api = freezed,Object? tls = freezed,Object? overtime = freezed,Object? status = freezed,Object? caps = freezed,Object? dnssec = freezed,Object? vectors = freezed,Object? resolver = freezed,Object? edns0 = freezed,Object? clients = freezed,Object? aliasclients = freezed,Object? events = freezed,Object? helper = freezed,Object? config = freezed,Object? inotify = freezed,Object? webserver = freezed,Object? extra = freezed,Object? reserved = freezed,Object? ntp = freezed,Object? netlink = freezed,Object? all = freezed,}) {
  return _then(_self.copyWith(
database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as bool?,networking: freezed == networking ? _self.networking : networking // ignore: cast_nullable_to_non_nullable
as bool?,locks: freezed == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as bool?,queries: freezed == queries ? _self.queries : queries // ignore: cast_nullable_to_non_nullable
as bool?,flags: freezed == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as bool?,shmem: freezed == shmem ? _self.shmem : shmem // ignore: cast_nullable_to_non_nullable
as bool?,gc: freezed == gc ? _self.gc : gc // ignore: cast_nullable_to_non_nullable
as bool?,arp: freezed == arp ? _self.arp : arp // ignore: cast_nullable_to_non_nullable
as bool?,regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as bool?,api: freezed == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as bool?,tls: freezed == tls ? _self.tls : tls // ignore: cast_nullable_to_non_nullable
as bool?,overtime: freezed == overtime ? _self.overtime : overtime // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,caps: freezed == caps ? _self.caps : caps // ignore: cast_nullable_to_non_nullable
as bool?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as bool?,vectors: freezed == vectors ? _self.vectors : vectors // ignore: cast_nullable_to_non_nullable
as bool?,resolver: freezed == resolver ? _self.resolver : resolver // ignore: cast_nullable_to_non_nullable
as bool?,edns0: freezed == edns0 ? _self.edns0 : edns0 // ignore: cast_nullable_to_non_nullable
as bool?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as bool?,aliasclients: freezed == aliasclients ? _self.aliasclients : aliasclients // ignore: cast_nullable_to_non_nullable
as bool?,events: freezed == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as bool?,helper: freezed == helper ? _self.helper : helper // ignore: cast_nullable_to_non_nullable
as bool?,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as bool?,inotify: freezed == inotify ? _self.inotify : inotify // ignore: cast_nullable_to_non_nullable
as bool?,webserver: freezed == webserver ? _self.webserver : webserver // ignore: cast_nullable_to_non_nullable
as bool?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as bool?,reserved: freezed == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool?,ntp: freezed == ntp ? _self.ntp : ntp // ignore: cast_nullable_to_non_nullable
as bool?,netlink: freezed == netlink ? _self.netlink : netlink // ignore: cast_nullable_to_non_nullable
as bool?,all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Debug].
extension DebugPatterns on Debug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Debug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Debug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Debug value)  $default,){
final _that = this;
switch (_that) {
case _Debug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Debug value)?  $default,){
final _that = this;
switch (_that) {
case _Debug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? database,  bool? networking,  bool? locks,  bool? queries,  bool? flags,  bool? shmem,  bool? gc,  bool? arp,  bool? regex,  bool? api,  bool? tls,  bool? overtime,  bool? status,  bool? caps,  bool? dnssec,  bool? vectors,  bool? resolver,  bool? edns0,  bool? clients,  bool? aliasclients,  bool? events,  bool? helper,  bool? config,  bool? inotify,  bool? webserver,  bool? extra,  bool? reserved,  bool? ntp,  bool? netlink,  bool? all)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Debug() when $default != null:
return $default(_that.database,_that.networking,_that.locks,_that.queries,_that.flags,_that.shmem,_that.gc,_that.arp,_that.regex,_that.api,_that.tls,_that.overtime,_that.status,_that.caps,_that.dnssec,_that.vectors,_that.resolver,_that.edns0,_that.clients,_that.aliasclients,_that.events,_that.helper,_that.config,_that.inotify,_that.webserver,_that.extra,_that.reserved,_that.ntp,_that.netlink,_that.all);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? database,  bool? networking,  bool? locks,  bool? queries,  bool? flags,  bool? shmem,  bool? gc,  bool? arp,  bool? regex,  bool? api,  bool? tls,  bool? overtime,  bool? status,  bool? caps,  bool? dnssec,  bool? vectors,  bool? resolver,  bool? edns0,  bool? clients,  bool? aliasclients,  bool? events,  bool? helper,  bool? config,  bool? inotify,  bool? webserver,  bool? extra,  bool? reserved,  bool? ntp,  bool? netlink,  bool? all)  $default,) {final _that = this;
switch (_that) {
case _Debug():
return $default(_that.database,_that.networking,_that.locks,_that.queries,_that.flags,_that.shmem,_that.gc,_that.arp,_that.regex,_that.api,_that.tls,_that.overtime,_that.status,_that.caps,_that.dnssec,_that.vectors,_that.resolver,_that.edns0,_that.clients,_that.aliasclients,_that.events,_that.helper,_that.config,_that.inotify,_that.webserver,_that.extra,_that.reserved,_that.ntp,_that.netlink,_that.all);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? database,  bool? networking,  bool? locks,  bool? queries,  bool? flags,  bool? shmem,  bool? gc,  bool? arp,  bool? regex,  bool? api,  bool? tls,  bool? overtime,  bool? status,  bool? caps,  bool? dnssec,  bool? vectors,  bool? resolver,  bool? edns0,  bool? clients,  bool? aliasclients,  bool? events,  bool? helper,  bool? config,  bool? inotify,  bool? webserver,  bool? extra,  bool? reserved,  bool? ntp,  bool? netlink,  bool? all)?  $default,) {final _that = this;
switch (_that) {
case _Debug() when $default != null:
return $default(_that.database,_that.networking,_that.locks,_that.queries,_that.flags,_that.shmem,_that.gc,_that.arp,_that.regex,_that.api,_that.tls,_that.overtime,_that.status,_that.caps,_that.dnssec,_that.vectors,_that.resolver,_that.edns0,_that.clients,_that.aliasclients,_that.events,_that.helper,_that.config,_that.inotify,_that.webserver,_that.extra,_that.reserved,_that.ntp,_that.netlink,_that.all);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _Debug implements Debug {
  const _Debug({this.database, this.networking, this.locks, this.queries, this.flags, this.shmem, this.gc, this.arp, this.regex, this.api, this.tls, this.overtime, this.status, this.caps, this.dnssec, this.vectors, this.resolver, this.edns0, this.clients, this.aliasclients, this.events, this.helper, this.config, this.inotify, this.webserver, this.extra, this.reserved, this.ntp, this.netlink, this.all});
  factory _Debug.fromJson(Map<String, dynamic> json) => _$DebugFromJson(json);

@override final  bool? database;
@override final  bool? networking;
@override final  bool? locks;
@override final  bool? queries;
@override final  bool? flags;
@override final  bool? shmem;
@override final  bool? gc;
@override final  bool? arp;
@override final  bool? regex;
@override final  bool? api;
@override final  bool? tls;
@override final  bool? overtime;
@override final  bool? status;
@override final  bool? caps;
@override final  bool? dnssec;
@override final  bool? vectors;
@override final  bool? resolver;
@override final  bool? edns0;
@override final  bool? clients;
@override final  bool? aliasclients;
@override final  bool? events;
@override final  bool? helper;
@override final  bool? config;
@override final  bool? inotify;
@override final  bool? webserver;
@override final  bool? extra;
@override final  bool? reserved;
@override final  bool? ntp;
@override final  bool? netlink;
@override final  bool? all;

/// Create a copy of Debug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DebugCopyWith<_Debug> get copyWith => __$DebugCopyWithImpl<_Debug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DebugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Debug&&(identical(other.database, database) || other.database == database)&&(identical(other.networking, networking) || other.networking == networking)&&(identical(other.locks, locks) || other.locks == locks)&&(identical(other.queries, queries) || other.queries == queries)&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.shmem, shmem) || other.shmem == shmem)&&(identical(other.gc, gc) || other.gc == gc)&&(identical(other.arp, arp) || other.arp == arp)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.api, api) || other.api == api)&&(identical(other.tls, tls) || other.tls == tls)&&(identical(other.overtime, overtime) || other.overtime == overtime)&&(identical(other.status, status) || other.status == status)&&(identical(other.caps, caps) || other.caps == caps)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.vectors, vectors) || other.vectors == vectors)&&(identical(other.resolver, resolver) || other.resolver == resolver)&&(identical(other.edns0, edns0) || other.edns0 == edns0)&&(identical(other.clients, clients) || other.clients == clients)&&(identical(other.aliasclients, aliasclients) || other.aliasclients == aliasclients)&&(identical(other.events, events) || other.events == events)&&(identical(other.helper, helper) || other.helper == helper)&&(identical(other.config, config) || other.config == config)&&(identical(other.inotify, inotify) || other.inotify == inotify)&&(identical(other.webserver, webserver) || other.webserver == webserver)&&(identical(other.extra, extra) || other.extra == extra)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.ntp, ntp) || other.ntp == ntp)&&(identical(other.netlink, netlink) || other.netlink == netlink)&&(identical(other.all, all) || other.all == all));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,database,networking,locks,queries,flags,shmem,gc,arp,regex,api,tls,overtime,status,caps,dnssec,vectors,resolver,edns0,clients,aliasclients,events,helper,config,inotify,webserver,extra,reserved,ntp,netlink,all]);

@override
String toString() {
  return 'Debug(database: $database, networking: $networking, locks: $locks, queries: $queries, flags: $flags, shmem: $shmem, gc: $gc, arp: $arp, regex: $regex, api: $api, tls: $tls, overtime: $overtime, status: $status, caps: $caps, dnssec: $dnssec, vectors: $vectors, resolver: $resolver, edns0: $edns0, clients: $clients, aliasclients: $aliasclients, events: $events, helper: $helper, config: $config, inotify: $inotify, webserver: $webserver, extra: $extra, reserved: $reserved, ntp: $ntp, netlink: $netlink, all: $all)';
}


}

/// @nodoc
abstract mixin class _$DebugCopyWith<$Res> implements $DebugCopyWith<$Res> {
  factory _$DebugCopyWith(_Debug value, $Res Function(_Debug) _then) = __$DebugCopyWithImpl;
@override @useResult
$Res call({
 bool? database, bool? networking, bool? locks, bool? queries, bool? flags, bool? shmem, bool? gc, bool? arp, bool? regex, bool? api, bool? tls, bool? overtime, bool? status, bool? caps, bool? dnssec, bool? vectors, bool? resolver, bool? edns0, bool? clients, bool? aliasclients, bool? events, bool? helper, bool? config, bool? inotify, bool? webserver, bool? extra, bool? reserved, bool? ntp, bool? netlink, bool? all
});




}
/// @nodoc
class __$DebugCopyWithImpl<$Res>
    implements _$DebugCopyWith<$Res> {
  __$DebugCopyWithImpl(this._self, this._then);

  final _Debug _self;
  final $Res Function(_Debug) _then;

/// Create a copy of Debug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? database = freezed,Object? networking = freezed,Object? locks = freezed,Object? queries = freezed,Object? flags = freezed,Object? shmem = freezed,Object? gc = freezed,Object? arp = freezed,Object? regex = freezed,Object? api = freezed,Object? tls = freezed,Object? overtime = freezed,Object? status = freezed,Object? caps = freezed,Object? dnssec = freezed,Object? vectors = freezed,Object? resolver = freezed,Object? edns0 = freezed,Object? clients = freezed,Object? aliasclients = freezed,Object? events = freezed,Object? helper = freezed,Object? config = freezed,Object? inotify = freezed,Object? webserver = freezed,Object? extra = freezed,Object? reserved = freezed,Object? ntp = freezed,Object? netlink = freezed,Object? all = freezed,}) {
  return _then(_Debug(
database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as bool?,networking: freezed == networking ? _self.networking : networking // ignore: cast_nullable_to_non_nullable
as bool?,locks: freezed == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as bool?,queries: freezed == queries ? _self.queries : queries // ignore: cast_nullable_to_non_nullable
as bool?,flags: freezed == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as bool?,shmem: freezed == shmem ? _self.shmem : shmem // ignore: cast_nullable_to_non_nullable
as bool?,gc: freezed == gc ? _self.gc : gc // ignore: cast_nullable_to_non_nullable
as bool?,arp: freezed == arp ? _self.arp : arp // ignore: cast_nullable_to_non_nullable
as bool?,regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as bool?,api: freezed == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as bool?,tls: freezed == tls ? _self.tls : tls // ignore: cast_nullable_to_non_nullable
as bool?,overtime: freezed == overtime ? _self.overtime : overtime // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,caps: freezed == caps ? _self.caps : caps // ignore: cast_nullable_to_non_nullable
as bool?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as bool?,vectors: freezed == vectors ? _self.vectors : vectors // ignore: cast_nullable_to_non_nullable
as bool?,resolver: freezed == resolver ? _self.resolver : resolver // ignore: cast_nullable_to_non_nullable
as bool?,edns0: freezed == edns0 ? _self.edns0 : edns0 // ignore: cast_nullable_to_non_nullable
as bool?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as bool?,aliasclients: freezed == aliasclients ? _self.aliasclients : aliasclients // ignore: cast_nullable_to_non_nullable
as bool?,events: freezed == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as bool?,helper: freezed == helper ? _self.helper : helper // ignore: cast_nullable_to_non_nullable
as bool?,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as bool?,inotify: freezed == inotify ? _self.inotify : inotify // ignore: cast_nullable_to_non_nullable
as bool?,webserver: freezed == webserver ? _self.webserver : webserver // ignore: cast_nullable_to_non_nullable
as bool?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as bool?,reserved: freezed == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool?,ntp: freezed == ntp ? _self.ntp : ntp // ignore: cast_nullable_to_non_nullable
as bool?,netlink: freezed == netlink ? _self.netlink : netlink // ignore: cast_nullable_to_non_nullable
as bool?,all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
