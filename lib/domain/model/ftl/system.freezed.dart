// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtlSystem {

 int get uptime; double get ramUsage; double get cpuUsage;// v6-only fields
 int? get procs; MemoryInfo? get memory; CpuLoad? get cpuLoad;
/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlSystemCopyWith<FtlSystem> get copyWith => _$FtlSystemCopyWithImpl<FtlSystem>(this as FtlSystem, _$identity);

  /// Serializes this FtlSystem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlSystem&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.ramUsage, ramUsage) || other.ramUsage == ramUsage)&&(identical(other.cpuUsage, cpuUsage) || other.cpuUsage == cpuUsage)&&(identical(other.procs, procs) || other.procs == procs)&&(identical(other.memory, memory) || other.memory == memory)&&(identical(other.cpuLoad, cpuLoad) || other.cpuLoad == cpuLoad));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uptime,ramUsage,cpuUsage,procs,memory,cpuLoad);

@override
String toString() {
  return 'FtlSystem(uptime: $uptime, ramUsage: $ramUsage, cpuUsage: $cpuUsage, procs: $procs, memory: $memory, cpuLoad: $cpuLoad)';
}


}

/// @nodoc
abstract mixin class $FtlSystemCopyWith<$Res>  {
  factory $FtlSystemCopyWith(FtlSystem value, $Res Function(FtlSystem) _then) = _$FtlSystemCopyWithImpl;
@useResult
$Res call({
 int uptime, double ramUsage, double cpuUsage, int? procs, MemoryInfo? memory, CpuLoad? cpuLoad
});


$MemoryInfoCopyWith<$Res>? get memory;$CpuLoadCopyWith<$Res>? get cpuLoad;

}
/// @nodoc
class _$FtlSystemCopyWithImpl<$Res>
    implements $FtlSystemCopyWith<$Res> {
  _$FtlSystemCopyWithImpl(this._self, this._then);

  final FtlSystem _self;
  final $Res Function(FtlSystem) _then;

/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uptime = null,Object? ramUsage = null,Object? cpuUsage = null,Object? procs = freezed,Object? memory = freezed,Object? cpuLoad = freezed,}) {
  return _then(_self.copyWith(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,ramUsage: null == ramUsage ? _self.ramUsage : ramUsage // ignore: cast_nullable_to_non_nullable
as double,cpuUsage: null == cpuUsage ? _self.cpuUsage : cpuUsage // ignore: cast_nullable_to_non_nullable
as double,procs: freezed == procs ? _self.procs : procs // ignore: cast_nullable_to_non_nullable
as int?,memory: freezed == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as MemoryInfo?,cpuLoad: freezed == cpuLoad ? _self.cpuLoad : cpuLoad // ignore: cast_nullable_to_non_nullable
as CpuLoad?,
  ));
}
/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryInfoCopyWith<$Res>? get memory {
    if (_self.memory == null) {
    return null;
  }

  return $MemoryInfoCopyWith<$Res>(_self.memory!, (value) {
    return _then(_self.copyWith(memory: value));
  });
}/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CpuLoadCopyWith<$Res>? get cpuLoad {
    if (_self.cpuLoad == null) {
    return null;
  }

  return $CpuLoadCopyWith<$Res>(_self.cpuLoad!, (value) {
    return _then(_self.copyWith(cpuLoad: value));
  });
}
}


/// Adds pattern-matching-related methods to [FtlSystem].
extension FtlSystemPatterns on FtlSystem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlSystem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlSystem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlSystem value)  $default,){
final _that = this;
switch (_that) {
case _FtlSystem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlSystem value)?  $default,){
final _that = this;
switch (_that) {
case _FtlSystem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int uptime,  double ramUsage,  double cpuUsage,  int? procs,  MemoryInfo? memory,  CpuLoad? cpuLoad)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlSystem() when $default != null:
return $default(_that.uptime,_that.ramUsage,_that.cpuUsage,_that.procs,_that.memory,_that.cpuLoad);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int uptime,  double ramUsage,  double cpuUsage,  int? procs,  MemoryInfo? memory,  CpuLoad? cpuLoad)  $default,) {final _that = this;
switch (_that) {
case _FtlSystem():
return $default(_that.uptime,_that.ramUsage,_that.cpuUsage,_that.procs,_that.memory,_that.cpuLoad);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int uptime,  double ramUsage,  double cpuUsage,  int? procs,  MemoryInfo? memory,  CpuLoad? cpuLoad)?  $default,) {final _that = this;
switch (_that) {
case _FtlSystem() when $default != null:
return $default(_that.uptime,_that.ramUsage,_that.cpuUsage,_that.procs,_that.memory,_that.cpuLoad);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _FtlSystem implements FtlSystem {
  const _FtlSystem({required this.uptime, required this.ramUsage, required this.cpuUsage, this.procs, this.memory, this.cpuLoad});
  factory _FtlSystem.fromJson(Map<String, dynamic> json) => _$FtlSystemFromJson(json);

@override final  int uptime;
@override final  double ramUsage;
@override final  double cpuUsage;
// v6-only fields
@override final  int? procs;
@override final  MemoryInfo? memory;
@override final  CpuLoad? cpuLoad;

/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlSystemCopyWith<_FtlSystem> get copyWith => __$FtlSystemCopyWithImpl<_FtlSystem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlSystemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlSystem&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.ramUsage, ramUsage) || other.ramUsage == ramUsage)&&(identical(other.cpuUsage, cpuUsage) || other.cpuUsage == cpuUsage)&&(identical(other.procs, procs) || other.procs == procs)&&(identical(other.memory, memory) || other.memory == memory)&&(identical(other.cpuLoad, cpuLoad) || other.cpuLoad == cpuLoad));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uptime,ramUsage,cpuUsage,procs,memory,cpuLoad);

@override
String toString() {
  return 'FtlSystem(uptime: $uptime, ramUsage: $ramUsage, cpuUsage: $cpuUsage, procs: $procs, memory: $memory, cpuLoad: $cpuLoad)';
}


}

/// @nodoc
abstract mixin class _$FtlSystemCopyWith<$Res> implements $FtlSystemCopyWith<$Res> {
  factory _$FtlSystemCopyWith(_FtlSystem value, $Res Function(_FtlSystem) _then) = __$FtlSystemCopyWithImpl;
@override @useResult
$Res call({
 int uptime, double ramUsage, double cpuUsage, int? procs, MemoryInfo? memory, CpuLoad? cpuLoad
});


@override $MemoryInfoCopyWith<$Res>? get memory;@override $CpuLoadCopyWith<$Res>? get cpuLoad;

}
/// @nodoc
class __$FtlSystemCopyWithImpl<$Res>
    implements _$FtlSystemCopyWith<$Res> {
  __$FtlSystemCopyWithImpl(this._self, this._then);

  final _FtlSystem _self;
  final $Res Function(_FtlSystem) _then;

/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uptime = null,Object? ramUsage = null,Object? cpuUsage = null,Object? procs = freezed,Object? memory = freezed,Object? cpuLoad = freezed,}) {
  return _then(_FtlSystem(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,ramUsage: null == ramUsage ? _self.ramUsage : ramUsage // ignore: cast_nullable_to_non_nullable
as double,cpuUsage: null == cpuUsage ? _self.cpuUsage : cpuUsage // ignore: cast_nullable_to_non_nullable
as double,procs: freezed == procs ? _self.procs : procs // ignore: cast_nullable_to_non_nullable
as int?,memory: freezed == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as MemoryInfo?,cpuLoad: freezed == cpuLoad ? _self.cpuLoad : cpuLoad // ignore: cast_nullable_to_non_nullable
as CpuLoad?,
  ));
}

/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryInfoCopyWith<$Res>? get memory {
    if (_self.memory == null) {
    return null;
  }

  return $MemoryInfoCopyWith<$Res>(_self.memory!, (value) {
    return _then(_self.copyWith(memory: value));
  });
}/// Create a copy of FtlSystem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CpuLoadCopyWith<$Res>? get cpuLoad {
    if (_self.cpuLoad == null) {
    return null;
  }

  return $CpuLoadCopyWith<$Res>(_self.cpuLoad!, (value) {
    return _then(_self.copyWith(cpuLoad: value));
  });
}
}


/// @nodoc
mixin _$MemoryInfo {

 MemoryDetail get ram; MemoryDetail get swap;
/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemoryInfoCopyWith<MemoryInfo> get copyWith => _$MemoryInfoCopyWithImpl<MemoryInfo>(this as MemoryInfo, _$identity);

  /// Serializes this MemoryInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemoryInfo&&(identical(other.ram, ram) || other.ram == ram)&&(identical(other.swap, swap) || other.swap == swap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ram,swap);

@override
String toString() {
  return 'MemoryInfo(ram: $ram, swap: $swap)';
}


}

/// @nodoc
abstract mixin class $MemoryInfoCopyWith<$Res>  {
  factory $MemoryInfoCopyWith(MemoryInfo value, $Res Function(MemoryInfo) _then) = _$MemoryInfoCopyWithImpl;
@useResult
$Res call({
 MemoryDetail ram, MemoryDetail swap
});


$MemoryDetailCopyWith<$Res> get ram;$MemoryDetailCopyWith<$Res> get swap;

}
/// @nodoc
class _$MemoryInfoCopyWithImpl<$Res>
    implements $MemoryInfoCopyWith<$Res> {
  _$MemoryInfoCopyWithImpl(this._self, this._then);

  final MemoryInfo _self;
  final $Res Function(MemoryInfo) _then;

/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ram = null,Object? swap = null,}) {
  return _then(_self.copyWith(
ram: null == ram ? _self.ram : ram // ignore: cast_nullable_to_non_nullable
as MemoryDetail,swap: null == swap ? _self.swap : swap // ignore: cast_nullable_to_non_nullable
as MemoryDetail,
  ));
}
/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryDetailCopyWith<$Res> get ram {
  
  return $MemoryDetailCopyWith<$Res>(_self.ram, (value) {
    return _then(_self.copyWith(ram: value));
  });
}/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryDetailCopyWith<$Res> get swap {
  
  return $MemoryDetailCopyWith<$Res>(_self.swap, (value) {
    return _then(_self.copyWith(swap: value));
  });
}
}


/// Adds pattern-matching-related methods to [MemoryInfo].
extension MemoryInfoPatterns on MemoryInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemoryInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemoryInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemoryInfo value)  $default,){
final _that = this;
switch (_that) {
case _MemoryInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemoryInfo value)?  $default,){
final _that = this;
switch (_that) {
case _MemoryInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MemoryDetail ram,  MemoryDetail swap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemoryInfo() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MemoryDetail ram,  MemoryDetail swap)  $default,) {final _that = this;
switch (_that) {
case _MemoryInfo():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MemoryDetail ram,  MemoryDetail swap)?  $default,) {final _that = this;
switch (_that) {
case _MemoryInfo() when $default != null:
return $default(_that.ram,_that.swap);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MemoryInfo implements MemoryInfo {
  const _MemoryInfo({required this.ram, required this.swap});
  factory _MemoryInfo.fromJson(Map<String, dynamic> json) => _$MemoryInfoFromJson(json);

@override final  MemoryDetail ram;
@override final  MemoryDetail swap;

/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemoryInfoCopyWith<_MemoryInfo> get copyWith => __$MemoryInfoCopyWithImpl<_MemoryInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemoryInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemoryInfo&&(identical(other.ram, ram) || other.ram == ram)&&(identical(other.swap, swap) || other.swap == swap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ram,swap);

@override
String toString() {
  return 'MemoryInfo(ram: $ram, swap: $swap)';
}


}

/// @nodoc
abstract mixin class _$MemoryInfoCopyWith<$Res> implements $MemoryInfoCopyWith<$Res> {
  factory _$MemoryInfoCopyWith(_MemoryInfo value, $Res Function(_MemoryInfo) _then) = __$MemoryInfoCopyWithImpl;
@override @useResult
$Res call({
 MemoryDetail ram, MemoryDetail swap
});


@override $MemoryDetailCopyWith<$Res> get ram;@override $MemoryDetailCopyWith<$Res> get swap;

}
/// @nodoc
class __$MemoryInfoCopyWithImpl<$Res>
    implements _$MemoryInfoCopyWith<$Res> {
  __$MemoryInfoCopyWithImpl(this._self, this._then);

  final _MemoryInfo _self;
  final $Res Function(_MemoryInfo) _then;

/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ram = null,Object? swap = null,}) {
  return _then(_MemoryInfo(
ram: null == ram ? _self.ram : ram // ignore: cast_nullable_to_non_nullable
as MemoryDetail,swap: null == swap ? _self.swap : swap // ignore: cast_nullable_to_non_nullable
as MemoryDetail,
  ));
}

/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryDetailCopyWith<$Res> get ram {
  
  return $MemoryDetailCopyWith<$Res>(_self.ram, (value) {
    return _then(_self.copyWith(ram: value));
  });
}/// Create a copy of MemoryInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryDetailCopyWith<$Res> get swap {
  
  return $MemoryDetailCopyWith<$Res>(_self.swap, (value) {
    return _then(_self.copyWith(swap: value));
  });
}
}


/// @nodoc
mixin _$MemoryDetail {

 double get total; double get used; double get free;
/// Create a copy of MemoryDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemoryDetailCopyWith<MemoryDetail> get copyWith => _$MemoryDetailCopyWithImpl<MemoryDetail>(this as MemoryDetail, _$identity);

  /// Serializes this MemoryDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemoryDetail&&(identical(other.total, total) || other.total == total)&&(identical(other.used, used) || other.used == used)&&(identical(other.free, free) || other.free == free));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,used,free);

@override
String toString() {
  return 'MemoryDetail(total: $total, used: $used, free: $free)';
}


}

/// @nodoc
abstract mixin class $MemoryDetailCopyWith<$Res>  {
  factory $MemoryDetailCopyWith(MemoryDetail value, $Res Function(MemoryDetail) _then) = _$MemoryDetailCopyWithImpl;
@useResult
$Res call({
 double total, double used, double free
});




}
/// @nodoc
class _$MemoryDetailCopyWithImpl<$Res>
    implements $MemoryDetailCopyWith<$Res> {
  _$MemoryDetailCopyWithImpl(this._self, this._then);

  final MemoryDetail _self;
  final $Res Function(MemoryDetail) _then;

/// Create a copy of MemoryDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? used = null,Object? free = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as double,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MemoryDetail].
extension MemoryDetailPatterns on MemoryDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemoryDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemoryDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemoryDetail value)  $default,){
final _that = this;
switch (_that) {
case _MemoryDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemoryDetail value)?  $default,){
final _that = this;
switch (_that) {
case _MemoryDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double total,  double used,  double free)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemoryDetail() when $default != null:
return $default(_that.total,_that.used,_that.free);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double total,  double used,  double free)  $default,) {final _that = this;
switch (_that) {
case _MemoryDetail():
return $default(_that.total,_that.used,_that.free);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double total,  double used,  double free)?  $default,) {final _that = this;
switch (_that) {
case _MemoryDetail() when $default != null:
return $default(_that.total,_that.used,_that.free);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemoryDetail implements MemoryDetail {
  const _MemoryDetail({required this.total, required this.used, required this.free});
  factory _MemoryDetail.fromJson(Map<String, dynamic> json) => _$MemoryDetailFromJson(json);

@override final  double total;
@override final  double used;
@override final  double free;

/// Create a copy of MemoryDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemoryDetailCopyWith<_MemoryDetail> get copyWith => __$MemoryDetailCopyWithImpl<_MemoryDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemoryDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemoryDetail&&(identical(other.total, total) || other.total == total)&&(identical(other.used, used) || other.used == used)&&(identical(other.free, free) || other.free == free));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,used,free);

@override
String toString() {
  return 'MemoryDetail(total: $total, used: $used, free: $free)';
}


}

/// @nodoc
abstract mixin class _$MemoryDetailCopyWith<$Res> implements $MemoryDetailCopyWith<$Res> {
  factory _$MemoryDetailCopyWith(_MemoryDetail value, $Res Function(_MemoryDetail) _then) = __$MemoryDetailCopyWithImpl;
@override @useResult
$Res call({
 double total, double used, double free
});




}
/// @nodoc
class __$MemoryDetailCopyWithImpl<$Res>
    implements _$MemoryDetailCopyWith<$Res> {
  __$MemoryDetailCopyWithImpl(this._self, this._then);

  final _MemoryDetail _self;
  final $Res Function(_MemoryDetail) _then;

/// Create a copy of MemoryDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? used = null,Object? free = null,}) {
  return _then(_MemoryDetail(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as double,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CpuLoad {

 double get avg1m; double get avg5m; double get avg15m;
/// Create a copy of CpuLoad
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CpuLoadCopyWith<CpuLoad> get copyWith => _$CpuLoadCopyWithImpl<CpuLoad>(this as CpuLoad, _$identity);

  /// Serializes this CpuLoad to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CpuLoad&&(identical(other.avg1m, avg1m) || other.avg1m == avg1m)&&(identical(other.avg5m, avg5m) || other.avg5m == avg5m)&&(identical(other.avg15m, avg15m) || other.avg15m == avg15m));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avg1m,avg5m,avg15m);

@override
String toString() {
  return 'CpuLoad(avg1m: $avg1m, avg5m: $avg5m, avg15m: $avg15m)';
}


}

/// @nodoc
abstract mixin class $CpuLoadCopyWith<$Res>  {
  factory $CpuLoadCopyWith(CpuLoad value, $Res Function(CpuLoad) _then) = _$CpuLoadCopyWithImpl;
@useResult
$Res call({
 double avg1m, double avg5m, double avg15m
});




}
/// @nodoc
class _$CpuLoadCopyWithImpl<$Res>
    implements $CpuLoadCopyWith<$Res> {
  _$CpuLoadCopyWithImpl(this._self, this._then);

  final CpuLoad _self;
  final $Res Function(CpuLoad) _then;

/// Create a copy of CpuLoad
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avg1m = null,Object? avg5m = null,Object? avg15m = null,}) {
  return _then(_self.copyWith(
avg1m: null == avg1m ? _self.avg1m : avg1m // ignore: cast_nullable_to_non_nullable
as double,avg5m: null == avg5m ? _self.avg5m : avg5m // ignore: cast_nullable_to_non_nullable
as double,avg15m: null == avg15m ? _self.avg15m : avg15m // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CpuLoad].
extension CpuLoadPatterns on CpuLoad {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CpuLoad value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CpuLoad() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CpuLoad value)  $default,){
final _that = this;
switch (_that) {
case _CpuLoad():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CpuLoad value)?  $default,){
final _that = this;
switch (_that) {
case _CpuLoad() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double avg1m,  double avg5m,  double avg15m)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CpuLoad() when $default != null:
return $default(_that.avg1m,_that.avg5m,_that.avg15m);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double avg1m,  double avg5m,  double avg15m)  $default,) {final _that = this;
switch (_that) {
case _CpuLoad():
return $default(_that.avg1m,_that.avg5m,_that.avg15m);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double avg1m,  double avg5m,  double avg15m)?  $default,) {final _that = this;
switch (_that) {
case _CpuLoad() when $default != null:
return $default(_that.avg1m,_that.avg5m,_that.avg15m);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CpuLoad implements CpuLoad {
  const _CpuLoad({required this.avg1m, required this.avg5m, required this.avg15m});
  factory _CpuLoad.fromJson(Map<String, dynamic> json) => _$CpuLoadFromJson(json);

@override final  double avg1m;
@override final  double avg5m;
@override final  double avg15m;

/// Create a copy of CpuLoad
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CpuLoadCopyWith<_CpuLoad> get copyWith => __$CpuLoadCopyWithImpl<_CpuLoad>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CpuLoadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CpuLoad&&(identical(other.avg1m, avg1m) || other.avg1m == avg1m)&&(identical(other.avg5m, avg5m) || other.avg5m == avg5m)&&(identical(other.avg15m, avg15m) || other.avg15m == avg15m));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avg1m,avg5m,avg15m);

@override
String toString() {
  return 'CpuLoad(avg1m: $avg1m, avg5m: $avg5m, avg15m: $avg15m)';
}


}

/// @nodoc
abstract mixin class _$CpuLoadCopyWith<$Res> implements $CpuLoadCopyWith<$Res> {
  factory _$CpuLoadCopyWith(_CpuLoad value, $Res Function(_CpuLoad) _then) = __$CpuLoadCopyWithImpl;
@override @useResult
$Res call({
 double avg1m, double avg5m, double avg15m
});




}
/// @nodoc
class __$CpuLoadCopyWithImpl<$Res>
    implements _$CpuLoadCopyWith<$Res> {
  __$CpuLoadCopyWithImpl(this._self, this._then);

  final _CpuLoad _self;
  final $Res Function(_CpuLoad) _then;

/// Create a copy of CpuLoad
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avg1m = null,Object? avg5m = null,Object? avg15m = null,}) {
  return _then(_CpuLoad(
avg1m: null == avg1m ? _self.avg1m : avg1m // ignore: cast_nullable_to_non_nullable
as double,avg5m: null == avg5m ? _self.avg5m : avg5m // ignore: cast_nullable_to_non_nullable
as double,avg15m: null == avg15m ? _self.avg15m : avg15m // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
