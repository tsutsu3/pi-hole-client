// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ftl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtlInfo {

 int get privacyLevel;// v6-only fields
 int? get pid; int? get uptime; double? get percentMem; double? get percentCpu; double? get queryFrequency; bool? get allowDestructive; FtlDatabase? get database; FtlClients? get clients;
/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlInfoCopyWith<FtlInfo> get copyWith => _$FtlInfoCopyWithImpl<FtlInfo>(this as FtlInfo, _$identity);

  /// Serializes this FtlInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlInfo&&(identical(other.privacyLevel, privacyLevel) || other.privacyLevel == privacyLevel)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.percentMem, percentMem) || other.percentMem == percentMem)&&(identical(other.percentCpu, percentCpu) || other.percentCpu == percentCpu)&&(identical(other.queryFrequency, queryFrequency) || other.queryFrequency == queryFrequency)&&(identical(other.allowDestructive, allowDestructive) || other.allowDestructive == allowDestructive)&&(identical(other.database, database) || other.database == database)&&(identical(other.clients, clients) || other.clients == clients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,privacyLevel,pid,uptime,percentMem,percentCpu,queryFrequency,allowDestructive,database,clients);

@override
String toString() {
  return 'FtlInfo(privacyLevel: $privacyLevel, pid: $pid, uptime: $uptime, percentMem: $percentMem, percentCpu: $percentCpu, queryFrequency: $queryFrequency, allowDestructive: $allowDestructive, database: $database, clients: $clients)';
}


}

/// @nodoc
abstract mixin class $FtlInfoCopyWith<$Res>  {
  factory $FtlInfoCopyWith(FtlInfo value, $Res Function(FtlInfo) _then) = _$FtlInfoCopyWithImpl;
@useResult
$Res call({
 int privacyLevel, int? pid, int? uptime, double? percentMem, double? percentCpu, double? queryFrequency, bool? allowDestructive, FtlDatabase? database, FtlClients? clients
});


$FtlDatabaseCopyWith<$Res>? get database;$FtlClientsCopyWith<$Res>? get clients;

}
/// @nodoc
class _$FtlInfoCopyWithImpl<$Res>
    implements $FtlInfoCopyWith<$Res> {
  _$FtlInfoCopyWithImpl(this._self, this._then);

  final FtlInfo _self;
  final $Res Function(FtlInfo) _then;

/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? privacyLevel = null,Object? pid = freezed,Object? uptime = freezed,Object? percentMem = freezed,Object? percentCpu = freezed,Object? queryFrequency = freezed,Object? allowDestructive = freezed,Object? database = freezed,Object? clients = freezed,}) {
  return _then(_self.copyWith(
privacyLevel: null == privacyLevel ? _self.privacyLevel : privacyLevel // ignore: cast_nullable_to_non_nullable
as int,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,uptime: freezed == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int?,percentMem: freezed == percentMem ? _self.percentMem : percentMem // ignore: cast_nullable_to_non_nullable
as double?,percentCpu: freezed == percentCpu ? _self.percentCpu : percentCpu // ignore: cast_nullable_to_non_nullable
as double?,queryFrequency: freezed == queryFrequency ? _self.queryFrequency : queryFrequency // ignore: cast_nullable_to_non_nullable
as double?,allowDestructive: freezed == allowDestructive ? _self.allowDestructive : allowDestructive // ignore: cast_nullable_to_non_nullable
as bool?,database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as FtlDatabase?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as FtlClients?,
  ));
}
/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlDatabaseCopyWith<$Res>? get database {
    if (_self.database == null) {
    return null;
  }

  return $FtlDatabaseCopyWith<$Res>(_self.database!, (value) {
    return _then(_self.copyWith(database: value));
  });
}/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlClientsCopyWith<$Res>? get clients {
    if (_self.clients == null) {
    return null;
  }

  return $FtlClientsCopyWith<$Res>(_self.clients!, (value) {
    return _then(_self.copyWith(clients: value));
  });
}
}


/// Adds pattern-matching-related methods to [FtlInfo].
extension FtlInfoPatterns on FtlInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlInfo value)  $default,){
final _that = this;
switch (_that) {
case _FtlInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FtlInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int privacyLevel,  int? pid,  int? uptime,  double? percentMem,  double? percentCpu,  double? queryFrequency,  bool? allowDestructive,  FtlDatabase? database,  FtlClients? clients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlInfo() when $default != null:
return $default(_that.privacyLevel,_that.pid,_that.uptime,_that.percentMem,_that.percentCpu,_that.queryFrequency,_that.allowDestructive,_that.database,_that.clients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int privacyLevel,  int? pid,  int? uptime,  double? percentMem,  double? percentCpu,  double? queryFrequency,  bool? allowDestructive,  FtlDatabase? database,  FtlClients? clients)  $default,) {final _that = this;
switch (_that) {
case _FtlInfo():
return $default(_that.privacyLevel,_that.pid,_that.uptime,_that.percentMem,_that.percentCpu,_that.queryFrequency,_that.allowDestructive,_that.database,_that.clients);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int privacyLevel,  int? pid,  int? uptime,  double? percentMem,  double? percentCpu,  double? queryFrequency,  bool? allowDestructive,  FtlDatabase? database,  FtlClients? clients)?  $default,) {final _that = this;
switch (_that) {
case _FtlInfo() when $default != null:
return $default(_that.privacyLevel,_that.pid,_that.uptime,_that.percentMem,_that.percentCpu,_that.queryFrequency,_that.allowDestructive,_that.database,_that.clients);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _FtlInfo implements FtlInfo {
  const _FtlInfo({required this.privacyLevel, this.pid, this.uptime, this.percentMem, this.percentCpu, this.queryFrequency, this.allowDestructive, this.database, this.clients});
  factory _FtlInfo.fromJson(Map<String, dynamic> json) => _$FtlInfoFromJson(json);

@override final  int privacyLevel;
// v6-only fields
@override final  int? pid;
@override final  int? uptime;
@override final  double? percentMem;
@override final  double? percentCpu;
@override final  double? queryFrequency;
@override final  bool? allowDestructive;
@override final  FtlDatabase? database;
@override final  FtlClients? clients;

/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlInfoCopyWith<_FtlInfo> get copyWith => __$FtlInfoCopyWithImpl<_FtlInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlInfo&&(identical(other.privacyLevel, privacyLevel) || other.privacyLevel == privacyLevel)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.percentMem, percentMem) || other.percentMem == percentMem)&&(identical(other.percentCpu, percentCpu) || other.percentCpu == percentCpu)&&(identical(other.queryFrequency, queryFrequency) || other.queryFrequency == queryFrequency)&&(identical(other.allowDestructive, allowDestructive) || other.allowDestructive == allowDestructive)&&(identical(other.database, database) || other.database == database)&&(identical(other.clients, clients) || other.clients == clients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,privacyLevel,pid,uptime,percentMem,percentCpu,queryFrequency,allowDestructive,database,clients);

@override
String toString() {
  return 'FtlInfo(privacyLevel: $privacyLevel, pid: $pid, uptime: $uptime, percentMem: $percentMem, percentCpu: $percentCpu, queryFrequency: $queryFrequency, allowDestructive: $allowDestructive, database: $database, clients: $clients)';
}


}

/// @nodoc
abstract mixin class _$FtlInfoCopyWith<$Res> implements $FtlInfoCopyWith<$Res> {
  factory _$FtlInfoCopyWith(_FtlInfo value, $Res Function(_FtlInfo) _then) = __$FtlInfoCopyWithImpl;
@override @useResult
$Res call({
 int privacyLevel, int? pid, int? uptime, double? percentMem, double? percentCpu, double? queryFrequency, bool? allowDestructive, FtlDatabase? database, FtlClients? clients
});


@override $FtlDatabaseCopyWith<$Res>? get database;@override $FtlClientsCopyWith<$Res>? get clients;

}
/// @nodoc
class __$FtlInfoCopyWithImpl<$Res>
    implements _$FtlInfoCopyWith<$Res> {
  __$FtlInfoCopyWithImpl(this._self, this._then);

  final _FtlInfo _self;
  final $Res Function(_FtlInfo) _then;

/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? privacyLevel = null,Object? pid = freezed,Object? uptime = freezed,Object? percentMem = freezed,Object? percentCpu = freezed,Object? queryFrequency = freezed,Object? allowDestructive = freezed,Object? database = freezed,Object? clients = freezed,}) {
  return _then(_FtlInfo(
privacyLevel: null == privacyLevel ? _self.privacyLevel : privacyLevel // ignore: cast_nullable_to_non_nullable
as int,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,uptime: freezed == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int?,percentMem: freezed == percentMem ? _self.percentMem : percentMem // ignore: cast_nullable_to_non_nullable
as double?,percentCpu: freezed == percentCpu ? _self.percentCpu : percentCpu // ignore: cast_nullable_to_non_nullable
as double?,queryFrequency: freezed == queryFrequency ? _self.queryFrequency : queryFrequency // ignore: cast_nullable_to_non_nullable
as double?,allowDestructive: freezed == allowDestructive ? _self.allowDestructive : allowDestructive // ignore: cast_nullable_to_non_nullable
as bool?,database: freezed == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as FtlDatabase?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as FtlClients?,
  ));
}

/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlDatabaseCopyWith<$Res>? get database {
    if (_self.database == null) {
    return null;
  }

  return $FtlDatabaseCopyWith<$Res>(_self.database!, (value) {
    return _then(_self.copyWith(database: value));
  });
}/// Create a copy of FtlInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtlClientsCopyWith<$Res>? get clients {
    if (_self.clients == null) {
    return null;
  }

  return $FtlClientsCopyWith<$Res>(_self.clients!, (value) {
    return _then(_self.copyWith(clients: value));
  });
}
}


/// @nodoc
mixin _$FtlDatabase {

 int get gravityDomains; int get allowedExact; int get allowedRegex; int get deniedExact; int get deniedRegex;
/// Create a copy of FtlDatabase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlDatabaseCopyWith<FtlDatabase> get copyWith => _$FtlDatabaseCopyWithImpl<FtlDatabase>(this as FtlDatabase, _$identity);

  /// Serializes this FtlDatabase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlDatabase&&(identical(other.gravityDomains, gravityDomains) || other.gravityDomains == gravityDomains)&&(identical(other.allowedExact, allowedExact) || other.allowedExact == allowedExact)&&(identical(other.allowedRegex, allowedRegex) || other.allowedRegex == allowedRegex)&&(identical(other.deniedExact, deniedExact) || other.deniedExact == deniedExact)&&(identical(other.deniedRegex, deniedRegex) || other.deniedRegex == deniedRegex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gravityDomains,allowedExact,allowedRegex,deniedExact,deniedRegex);

@override
String toString() {
  return 'FtlDatabase(gravityDomains: $gravityDomains, allowedExact: $allowedExact, allowedRegex: $allowedRegex, deniedExact: $deniedExact, deniedRegex: $deniedRegex)';
}


}

/// @nodoc
abstract mixin class $FtlDatabaseCopyWith<$Res>  {
  factory $FtlDatabaseCopyWith(FtlDatabase value, $Res Function(FtlDatabase) _then) = _$FtlDatabaseCopyWithImpl;
@useResult
$Res call({
 int gravityDomains, int allowedExact, int allowedRegex, int deniedExact, int deniedRegex
});




}
/// @nodoc
class _$FtlDatabaseCopyWithImpl<$Res>
    implements $FtlDatabaseCopyWith<$Res> {
  _$FtlDatabaseCopyWithImpl(this._self, this._then);

  final FtlDatabase _self;
  final $Res Function(FtlDatabase) _then;

/// Create a copy of FtlDatabase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gravityDomains = null,Object? allowedExact = null,Object? allowedRegex = null,Object? deniedExact = null,Object? deniedRegex = null,}) {
  return _then(_self.copyWith(
gravityDomains: null == gravityDomains ? _self.gravityDomains : gravityDomains // ignore: cast_nullable_to_non_nullable
as int,allowedExact: null == allowedExact ? _self.allowedExact : allowedExact // ignore: cast_nullable_to_non_nullable
as int,allowedRegex: null == allowedRegex ? _self.allowedRegex : allowedRegex // ignore: cast_nullable_to_non_nullable
as int,deniedExact: null == deniedExact ? _self.deniedExact : deniedExact // ignore: cast_nullable_to_non_nullable
as int,deniedRegex: null == deniedRegex ? _self.deniedRegex : deniedRegex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FtlDatabase].
extension FtlDatabasePatterns on FtlDatabase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlDatabase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlDatabase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlDatabase value)  $default,){
final _that = this;
switch (_that) {
case _FtlDatabase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlDatabase value)?  $default,){
final _that = this;
switch (_that) {
case _FtlDatabase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int gravityDomains,  int allowedExact,  int allowedRegex,  int deniedExact,  int deniedRegex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlDatabase() when $default != null:
return $default(_that.gravityDomains,_that.allowedExact,_that.allowedRegex,_that.deniedExact,_that.deniedRegex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int gravityDomains,  int allowedExact,  int allowedRegex,  int deniedExact,  int deniedRegex)  $default,) {final _that = this;
switch (_that) {
case _FtlDatabase():
return $default(_that.gravityDomains,_that.allowedExact,_that.allowedRegex,_that.deniedExact,_that.deniedRegex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int gravityDomains,  int allowedExact,  int allowedRegex,  int deniedExact,  int deniedRegex)?  $default,) {final _that = this;
switch (_that) {
case _FtlDatabase() when $default != null:
return $default(_that.gravityDomains,_that.allowedExact,_that.allowedRegex,_that.deniedExact,_that.deniedRegex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtlDatabase implements FtlDatabase {
  const _FtlDatabase({required this.gravityDomains, required this.allowedExact, required this.allowedRegex, required this.deniedExact, required this.deniedRegex});
  factory _FtlDatabase.fromJson(Map<String, dynamic> json) => _$FtlDatabaseFromJson(json);

@override final  int gravityDomains;
@override final  int allowedExact;
@override final  int allowedRegex;
@override final  int deniedExact;
@override final  int deniedRegex;

/// Create a copy of FtlDatabase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlDatabaseCopyWith<_FtlDatabase> get copyWith => __$FtlDatabaseCopyWithImpl<_FtlDatabase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlDatabaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlDatabase&&(identical(other.gravityDomains, gravityDomains) || other.gravityDomains == gravityDomains)&&(identical(other.allowedExact, allowedExact) || other.allowedExact == allowedExact)&&(identical(other.allowedRegex, allowedRegex) || other.allowedRegex == allowedRegex)&&(identical(other.deniedExact, deniedExact) || other.deniedExact == deniedExact)&&(identical(other.deniedRegex, deniedRegex) || other.deniedRegex == deniedRegex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gravityDomains,allowedExact,allowedRegex,deniedExact,deniedRegex);

@override
String toString() {
  return 'FtlDatabase(gravityDomains: $gravityDomains, allowedExact: $allowedExact, allowedRegex: $allowedRegex, deniedExact: $deniedExact, deniedRegex: $deniedRegex)';
}


}

/// @nodoc
abstract mixin class _$FtlDatabaseCopyWith<$Res> implements $FtlDatabaseCopyWith<$Res> {
  factory _$FtlDatabaseCopyWith(_FtlDatabase value, $Res Function(_FtlDatabase) _then) = __$FtlDatabaseCopyWithImpl;
@override @useResult
$Res call({
 int gravityDomains, int allowedExact, int allowedRegex, int deniedExact, int deniedRegex
});




}
/// @nodoc
class __$FtlDatabaseCopyWithImpl<$Res>
    implements _$FtlDatabaseCopyWith<$Res> {
  __$FtlDatabaseCopyWithImpl(this._self, this._then);

  final _FtlDatabase _self;
  final $Res Function(_FtlDatabase) _then;

/// Create a copy of FtlDatabase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gravityDomains = null,Object? allowedExact = null,Object? allowedRegex = null,Object? deniedExact = null,Object? deniedRegex = null,}) {
  return _then(_FtlDatabase(
gravityDomains: null == gravityDomains ? _self.gravityDomains : gravityDomains // ignore: cast_nullable_to_non_nullable
as int,allowedExact: null == allowedExact ? _self.allowedExact : allowedExact // ignore: cast_nullable_to_non_nullable
as int,allowedRegex: null == allowedRegex ? _self.allowedRegex : allowedRegex // ignore: cast_nullable_to_non_nullable
as int,deniedExact: null == deniedExact ? _self.deniedExact : deniedExact // ignore: cast_nullable_to_non_nullable
as int,deniedRegex: null == deniedRegex ? _self.deniedRegex : deniedRegex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FtlClients {

 int get total; int get active;
/// Create a copy of FtlClients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlClientsCopyWith<FtlClients> get copyWith => _$FtlClientsCopyWithImpl<FtlClients>(this as FtlClients, _$identity);

  /// Serializes this FtlClients to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlClients&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,active);

@override
String toString() {
  return 'FtlClients(total: $total, active: $active)';
}


}

/// @nodoc
abstract mixin class $FtlClientsCopyWith<$Res>  {
  factory $FtlClientsCopyWith(FtlClients value, $Res Function(FtlClients) _then) = _$FtlClientsCopyWithImpl;
@useResult
$Res call({
 int total, int active
});




}
/// @nodoc
class _$FtlClientsCopyWithImpl<$Res>
    implements $FtlClientsCopyWith<$Res> {
  _$FtlClientsCopyWithImpl(this._self, this._then);

  final FtlClients _self;
  final $Res Function(FtlClients) _then;

/// Create a copy of FtlClients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? active = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FtlClients].
extension FtlClientsPatterns on FtlClients {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlClients value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlClients() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlClients value)  $default,){
final _that = this;
switch (_that) {
case _FtlClients():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlClients value)?  $default,){
final _that = this;
switch (_that) {
case _FtlClients() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlClients() when $default != null:
return $default(_that.total,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int active)  $default,) {final _that = this;
switch (_that) {
case _FtlClients():
return $default(_that.total,_that.active);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int active)?  $default,) {final _that = this;
switch (_that) {
case _FtlClients() when $default != null:
return $default(_that.total,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtlClients implements FtlClients {
  const _FtlClients({required this.total, required this.active});
  factory _FtlClients.fromJson(Map<String, dynamic> json) => _$FtlClientsFromJson(json);

@override final  int total;
@override final  int active;

/// Create a copy of FtlClients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlClientsCopyWith<_FtlClients> get copyWith => __$FtlClientsCopyWithImpl<_FtlClients>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlClientsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlClients&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,active);

@override
String toString() {
  return 'FtlClients(total: $total, active: $active)';
}


}

/// @nodoc
abstract mixin class _$FtlClientsCopyWith<$Res> implements $FtlClientsCopyWith<$Res> {
  factory _$FtlClientsCopyWith(_FtlClients value, $Res Function(_FtlClients) _then) = __$FtlClientsCopyWithImpl;
@override @useResult
$Res call({
 int total, int active
});




}
/// @nodoc
class __$FtlClientsCopyWithImpl<$Res>
    implements _$FtlClientsCopyWith<$Res> {
  __$FtlClientsCopyWithImpl(this._self, this._then);

  final _FtlClients _self;
  final $Res Function(_FtlClients) _then;

/// Create a copy of FtlClients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? active = null,}) {
  return _then(_FtlClients(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
