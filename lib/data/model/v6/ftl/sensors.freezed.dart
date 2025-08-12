// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoSensors {

 SensorsData get sensors; double get took;
/// Create a copy of InfoSensors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoSensorsCopyWith<InfoSensors> get copyWith => _$InfoSensorsCopyWithImpl<InfoSensors>(this as InfoSensors, _$identity);

  /// Serializes this InfoSensors to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoSensors&&(identical(other.sensors, sensors) || other.sensors == sensors)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensors,took);

@override
String toString() {
  return 'InfoSensors(sensors: $sensors, took: $took)';
}


}

/// @nodoc
abstract mixin class $InfoSensorsCopyWith<$Res>  {
  factory $InfoSensorsCopyWith(InfoSensors value, $Res Function(InfoSensors) _then) = _$InfoSensorsCopyWithImpl;
@useResult
$Res call({
 SensorsData sensors, double took
});


$SensorsDataCopyWith<$Res> get sensors;

}
/// @nodoc
class _$InfoSensorsCopyWithImpl<$Res>
    implements $InfoSensorsCopyWith<$Res> {
  _$InfoSensorsCopyWithImpl(this._self, this._then);

  final InfoSensors _self;
  final $Res Function(InfoSensors) _then;

/// Create a copy of InfoSensors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensors = null,Object? took = null,}) {
  return _then(_self.copyWith(
sensors: null == sensors ? _self.sensors : sensors // ignore: cast_nullable_to_non_nullable
as SensorsData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of InfoSensors
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorsDataCopyWith<$Res> get sensors {
  
  return $SensorsDataCopyWith<$Res>(_self.sensors, (value) {
    return _then(_self.copyWith(sensors: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoSensors].
extension InfoSensorsPatterns on InfoSensors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoSensors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoSensors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoSensors value)  $default,){
final _that = this;
switch (_that) {
case _InfoSensors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoSensors value)?  $default,){
final _that = this;
switch (_that) {
case _InfoSensors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SensorsData sensors,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoSensors() when $default != null:
return $default(_that.sensors,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SensorsData sensors,  double took)  $default,) {final _that = this;
switch (_that) {
case _InfoSensors():
return $default(_that.sensors,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SensorsData sensors,  double took)?  $default,) {final _that = this;
switch (_that) {
case _InfoSensors() when $default != null:
return $default(_that.sensors,_that.took);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoSensors implements InfoSensors {
  const _InfoSensors({required this.sensors, required this.took});
  factory _InfoSensors.fromJson(Map<String, dynamic> json) => _$InfoSensorsFromJson(json);

@override final  SensorsData sensors;
@override final  double took;

/// Create a copy of InfoSensors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoSensorsCopyWith<_InfoSensors> get copyWith => __$InfoSensorsCopyWithImpl<_InfoSensors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoSensorsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoSensors&&(identical(other.sensors, sensors) || other.sensors == sensors)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensors,took);

@override
String toString() {
  return 'InfoSensors(sensors: $sensors, took: $took)';
}


}

/// @nodoc
abstract mixin class _$InfoSensorsCopyWith<$Res> implements $InfoSensorsCopyWith<$Res> {
  factory _$InfoSensorsCopyWith(_InfoSensors value, $Res Function(_InfoSensors) _then) = __$InfoSensorsCopyWithImpl;
@override @useResult
$Res call({
 SensorsData sensors, double took
});


@override $SensorsDataCopyWith<$Res> get sensors;

}
/// @nodoc
class __$InfoSensorsCopyWithImpl<$Res>
    implements _$InfoSensorsCopyWith<$Res> {
  __$InfoSensorsCopyWithImpl(this._self, this._then);

  final _InfoSensors _self;
  final $Res Function(_InfoSensors) _then;

/// Create a copy of InfoSensors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensors = null,Object? took = null,}) {
  return _then(_InfoSensors(
sensors: null == sensors ? _self.sensors : sensors // ignore: cast_nullable_to_non_nullable
as SensorsData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of InfoSensors
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorsDataCopyWith<$Res> get sensors {
  
  return $SensorsDataCopyWith<$Res>(_self.sensors, (value) {
    return _then(_self.copyWith(sensors: value));
  });
}
}


/// @nodoc
mixin _$SensorsData {

 List<SensorData> get list;@JsonKey(name: 'cpu_temp') double? get cpuTemp;@JsonKey(name: 'hot_limit') double get hotLimit; String get unit;
/// Create a copy of SensorsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorsDataCopyWith<SensorsData> get copyWith => _$SensorsDataCopyWithImpl<SensorsData>(this as SensorsData, _$identity);

  /// Serializes this SensorsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorsData&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp)&&(identical(other.hotLimit, hotLimit) || other.hotLimit == hotLimit)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),cpuTemp,hotLimit,unit);

@override
String toString() {
  return 'SensorsData(list: $list, cpuTemp: $cpuTemp, hotLimit: $hotLimit, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $SensorsDataCopyWith<$Res>  {
  factory $SensorsDataCopyWith(SensorsData value, $Res Function(SensorsData) _then) = _$SensorsDataCopyWithImpl;
@useResult
$Res call({
 List<SensorData> list,@JsonKey(name: 'cpu_temp') double? cpuTemp,@JsonKey(name: 'hot_limit') double hotLimit, String unit
});




}
/// @nodoc
class _$SensorsDataCopyWithImpl<$Res>
    implements $SensorsDataCopyWith<$Res> {
  _$SensorsDataCopyWithImpl(this._self, this._then);

  final SensorsData _self;
  final $Res Function(SensorsData) _then;

/// Create a copy of SensorsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? cpuTemp = freezed,Object? hotLimit = null,Object? unit = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<SensorData>,cpuTemp: freezed == cpuTemp ? _self.cpuTemp : cpuTemp // ignore: cast_nullable_to_non_nullable
as double?,hotLimit: null == hotLimit ? _self.hotLimit : hotLimit // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorsData].
extension SensorsDataPatterns on SensorsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorsData value)  $default,){
final _that = this;
switch (_that) {
case _SensorsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorsData value)?  $default,){
final _that = this;
switch (_that) {
case _SensorsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SensorData> list, @JsonKey(name: 'cpu_temp')  double? cpuTemp, @JsonKey(name: 'hot_limit')  double hotLimit,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorsData() when $default != null:
return $default(_that.list,_that.cpuTemp,_that.hotLimit,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SensorData> list, @JsonKey(name: 'cpu_temp')  double? cpuTemp, @JsonKey(name: 'hot_limit')  double hotLimit,  String unit)  $default,) {final _that = this;
switch (_that) {
case _SensorsData():
return $default(_that.list,_that.cpuTemp,_that.hotLimit,_that.unit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SensorData> list, @JsonKey(name: 'cpu_temp')  double? cpuTemp, @JsonKey(name: 'hot_limit')  double hotLimit,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _SensorsData() when $default != null:
return $default(_that.list,_that.cpuTemp,_that.hotLimit,_that.unit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SensorsData implements SensorsData {
  const _SensorsData({required final  List<SensorData> list, @JsonKey(name: 'cpu_temp') required this.cpuTemp, @JsonKey(name: 'hot_limit') required this.hotLimit, required this.unit}): _list = list;
  factory _SensorsData.fromJson(Map<String, dynamic> json) => _$SensorsDataFromJson(json);

 final  List<SensorData> _list;
@override List<SensorData> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey(name: 'cpu_temp') final  double? cpuTemp;
@override@JsonKey(name: 'hot_limit') final  double hotLimit;
@override final  String unit;

/// Create a copy of SensorsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorsDataCopyWith<_SensorsData> get copyWith => __$SensorsDataCopyWithImpl<_SensorsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorsData&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp)&&(identical(other.hotLimit, hotLimit) || other.hotLimit == hotLimit)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),cpuTemp,hotLimit,unit);

@override
String toString() {
  return 'SensorsData(list: $list, cpuTemp: $cpuTemp, hotLimit: $hotLimit, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$SensorsDataCopyWith<$Res> implements $SensorsDataCopyWith<$Res> {
  factory _$SensorsDataCopyWith(_SensorsData value, $Res Function(_SensorsData) _then) = __$SensorsDataCopyWithImpl;
@override @useResult
$Res call({
 List<SensorData> list,@JsonKey(name: 'cpu_temp') double? cpuTemp,@JsonKey(name: 'hot_limit') double hotLimit, String unit
});




}
/// @nodoc
class __$SensorsDataCopyWithImpl<$Res>
    implements _$SensorsDataCopyWith<$Res> {
  __$SensorsDataCopyWithImpl(this._self, this._then);

  final _SensorsData _self;
  final $Res Function(_SensorsData) _then;

/// Create a copy of SensorsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? cpuTemp = freezed,Object? hotLimit = null,Object? unit = null,}) {
  return _then(_SensorsData(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<SensorData>,cpuTemp: freezed == cpuTemp ? _self.cpuTemp : cpuTemp // ignore: cast_nullable_to_non_nullable
as double?,hotLimit: null == hotLimit ? _self.hotLimit : hotLimit // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SensorData {

 String? get name; String get path; String get source; List<TempData> get temps;
/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorDataCopyWith<SensorData> get copyWith => _$SensorDataCopyWithImpl<SensorData>(this as SensorData, _$identity);

  /// Serializes this SensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorData&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.temps, temps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,path,source,const DeepCollectionEquality().hash(temps));

@override
String toString() {
  return 'SensorData(name: $name, path: $path, source: $source, temps: $temps)';
}


}

/// @nodoc
abstract mixin class $SensorDataCopyWith<$Res>  {
  factory $SensorDataCopyWith(SensorData value, $Res Function(SensorData) _then) = _$SensorDataCopyWithImpl;
@useResult
$Res call({
 String? name, String path, String source, List<TempData> temps
});




}
/// @nodoc
class _$SensorDataCopyWithImpl<$Res>
    implements $SensorDataCopyWith<$Res> {
  _$SensorDataCopyWithImpl(this._self, this._then);

  final SensorData _self;
  final $Res Function(SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? path = null,Object? source = null,Object? temps = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,temps: null == temps ? _self.temps : temps // ignore: cast_nullable_to_non_nullable
as List<TempData>,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorData].
extension SensorDataPatterns on SensorData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorData value)  $default,){
final _that = this;
switch (_that) {
case _SensorData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorData value)?  $default,){
final _that = this;
switch (_that) {
case _SensorData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String path,  String source,  List<TempData> temps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorData() when $default != null:
return $default(_that.name,_that.path,_that.source,_that.temps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String path,  String source,  List<TempData> temps)  $default,) {final _that = this;
switch (_that) {
case _SensorData():
return $default(_that.name,_that.path,_that.source,_that.temps);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String path,  String source,  List<TempData> temps)?  $default,) {final _that = this;
switch (_that) {
case _SensorData() when $default != null:
return $default(_that.name,_that.path,_that.source,_that.temps);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SensorData implements SensorData {
  const _SensorData({required this.name, required this.path, required this.source, required final  List<TempData> temps}): _temps = temps;
  factory _SensorData.fromJson(Map<String, dynamic> json) => _$SensorDataFromJson(json);

@override final  String? name;
@override final  String path;
@override final  String source;
 final  List<TempData> _temps;
@override List<TempData> get temps {
  if (_temps is EqualUnmodifiableListView) return _temps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_temps);
}


/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorDataCopyWith<_SensorData> get copyWith => __$SensorDataCopyWithImpl<_SensorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorData&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other._temps, _temps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,path,source,const DeepCollectionEquality().hash(_temps));

@override
String toString() {
  return 'SensorData(name: $name, path: $path, source: $source, temps: $temps)';
}


}

/// @nodoc
abstract mixin class _$SensorDataCopyWith<$Res> implements $SensorDataCopyWith<$Res> {
  factory _$SensorDataCopyWith(_SensorData value, $Res Function(_SensorData) _then) = __$SensorDataCopyWithImpl;
@override @useResult
$Res call({
 String? name, String path, String source, List<TempData> temps
});




}
/// @nodoc
class __$SensorDataCopyWithImpl<$Res>
    implements _$SensorDataCopyWith<$Res> {
  __$SensorDataCopyWithImpl(this._self, this._then);

  final _SensorData _self;
  final $Res Function(_SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? path = null,Object? source = null,Object? temps = null,}) {
  return _then(_SensorData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,temps: null == temps ? _self._temps : temps // ignore: cast_nullable_to_non_nullable
as List<TempData>,
  ));
}


}


/// @nodoc
mixin _$TempData {

 String? get name; num get value; num? get max; num? get crit; String get sensor;
/// Create a copy of TempData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TempDataCopyWith<TempData> get copyWith => _$TempDataCopyWithImpl<TempData>(this as TempData, _$identity);

  /// Serializes this TempData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TempData&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.max, max) || other.max == max)&&(identical(other.crit, crit) || other.crit == crit)&&(identical(other.sensor, sensor) || other.sensor == sensor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value,max,crit,sensor);

@override
String toString() {
  return 'TempData(name: $name, value: $value, max: $max, crit: $crit, sensor: $sensor)';
}


}

/// @nodoc
abstract mixin class $TempDataCopyWith<$Res>  {
  factory $TempDataCopyWith(TempData value, $Res Function(TempData) _then) = _$TempDataCopyWithImpl;
@useResult
$Res call({
 String? name, num value, num? max, num? crit, String sensor
});




}
/// @nodoc
class _$TempDataCopyWithImpl<$Res>
    implements $TempDataCopyWith<$Res> {
  _$TempDataCopyWithImpl(this._self, this._then);

  final TempData _self;
  final $Res Function(TempData) _then;

/// Create a copy of TempData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? value = null,Object? max = freezed,Object? crit = freezed,Object? sensor = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as num?,crit: freezed == crit ? _self.crit : crit // ignore: cast_nullable_to_non_nullable
as num?,sensor: null == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TempData].
extension TempDataPatterns on TempData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TempData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TempData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TempData value)  $default,){
final _that = this;
switch (_that) {
case _TempData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TempData value)?  $default,){
final _that = this;
switch (_that) {
case _TempData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  num value,  num? max,  num? crit,  String sensor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TempData() when $default != null:
return $default(_that.name,_that.value,_that.max,_that.crit,_that.sensor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  num value,  num? max,  num? crit,  String sensor)  $default,) {final _that = this;
switch (_that) {
case _TempData():
return $default(_that.name,_that.value,_that.max,_that.crit,_that.sensor);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  num value,  num? max,  num? crit,  String sensor)?  $default,) {final _that = this;
switch (_that) {
case _TempData() when $default != null:
return $default(_that.name,_that.value,_that.max,_that.crit,_that.sensor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TempData implements TempData {
  const _TempData({required this.name, required this.value, required this.max, required this.crit, required this.sensor});
  factory _TempData.fromJson(Map<String, dynamic> json) => _$TempDataFromJson(json);

@override final  String? name;
@override final  num value;
@override final  num? max;
@override final  num? crit;
@override final  String sensor;

/// Create a copy of TempData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TempDataCopyWith<_TempData> get copyWith => __$TempDataCopyWithImpl<_TempData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TempDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TempData&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.max, max) || other.max == max)&&(identical(other.crit, crit) || other.crit == crit)&&(identical(other.sensor, sensor) || other.sensor == sensor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value,max,crit,sensor);

@override
String toString() {
  return 'TempData(name: $name, value: $value, max: $max, crit: $crit, sensor: $sensor)';
}


}

/// @nodoc
abstract mixin class _$TempDataCopyWith<$Res> implements $TempDataCopyWith<$Res> {
  factory _$TempDataCopyWith(_TempData value, $Res Function(_TempData) _then) = __$TempDataCopyWithImpl;
@override @useResult
$Res call({
 String? name, num value, num? max, num? crit, String sensor
});




}
/// @nodoc
class __$TempDataCopyWithImpl<$Res>
    implements _$TempDataCopyWith<$Res> {
  __$TempDataCopyWithImpl(this._self, this._then);

  final _TempData _self;
  final $Res Function(_TempData) _then;

/// Create a copy of TempData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? value = null,Object? max = freezed,Object? crit = freezed,Object? sensor = null,}) {
  return _then(_TempData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as num?,crit: freezed == crit ? _self.crit : crit // ignore: cast_nullable_to_non_nullable
as num?,sensor: null == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
