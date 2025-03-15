// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sensors {
  List<SensorData> get list;
  @JsonKey(name: 'cpu_temp')
  num? get cpuTemp;
  @JsonKey(name: 'hot_limit')
  num get hotLimit;
  String get unit;

  /// Create a copy of Sensors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorsCopyWith<Sensors> get copyWith =>
      _$SensorsCopyWithImpl<Sensors>(this as Sensors, _$identity);

  /// Serializes this Sensors to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sensors &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp) &&
            (identical(other.hotLimit, hotLimit) ||
                other.hotLimit == hotLimit) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(list), cpuTemp, hotLimit, unit);

  @override
  String toString() {
    return 'Sensors(list: $list, cpuTemp: $cpuTemp, hotLimit: $hotLimit, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $SensorsCopyWith<$Res> {
  factory $SensorsCopyWith(Sensors value, $Res Function(Sensors) _then) =
      _$SensorsCopyWithImpl;
  @useResult
  $Res call(
      {List<SensorData> list,
      @JsonKey(name: 'cpu_temp') num? cpuTemp,
      @JsonKey(name: 'hot_limit') num hotLimit,
      String unit});
}

/// @nodoc
class _$SensorsCopyWithImpl<$Res> implements $SensorsCopyWith<$Res> {
  _$SensorsCopyWithImpl(this._self, this._then);

  final Sensors _self;
  final $Res Function(Sensors) _then;

  /// Create a copy of Sensors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? cpuTemp = freezed,
    Object? hotLimit = null,
    Object? unit = null,
  }) {
    return _then(_self.copyWith(
      list: null == list
          ? _self.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SensorData>,
      cpuTemp: freezed == cpuTemp
          ? _self.cpuTemp
          : cpuTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      hotLimit: null == hotLimit
          ? _self.hotLimit
          : hotLimit // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Sensors implements Sensors {
  const _Sensors(
      {required final List<SensorData> list,
      @JsonKey(name: 'cpu_temp') required this.cpuTemp,
      @JsonKey(name: 'hot_limit') required this.hotLimit,
      required this.unit})
      : _list = list;
  factory _Sensors.fromJson(Map<String, dynamic> json) =>
      _$SensorsFromJson(json);

  final List<SensorData> _list;
  @override
  List<SensorData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey(name: 'cpu_temp')
  final num? cpuTemp;
  @override
  @JsonKey(name: 'hot_limit')
  final num hotLimit;
  @override
  final String unit;

  /// Create a copy of Sensors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SensorsCopyWith<_Sensors> get copyWith =>
      __$SensorsCopyWithImpl<_Sensors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SensorsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sensors &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp) &&
            (identical(other.hotLimit, hotLimit) ||
                other.hotLimit == hotLimit) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_list), cpuTemp, hotLimit, unit);

  @override
  String toString() {
    return 'Sensors(list: $list, cpuTemp: $cpuTemp, hotLimit: $hotLimit, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$SensorsCopyWith<$Res> implements $SensorsCopyWith<$Res> {
  factory _$SensorsCopyWith(_Sensors value, $Res Function(_Sensors) _then) =
      __$SensorsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<SensorData> list,
      @JsonKey(name: 'cpu_temp') num? cpuTemp,
      @JsonKey(name: 'hot_limit') num hotLimit,
      String unit});
}

/// @nodoc
class __$SensorsCopyWithImpl<$Res> implements _$SensorsCopyWith<$Res> {
  __$SensorsCopyWithImpl(this._self, this._then);

  final _Sensors _self;
  final $Res Function(_Sensors) _then;

  /// Create a copy of Sensors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? list = null,
    Object? cpuTemp = freezed,
    Object? hotLimit = null,
    Object? unit = null,
  }) {
    return _then(_Sensors(
      list: null == list
          ? _self._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SensorData>,
      cpuTemp: freezed == cpuTemp
          ? _self.cpuTemp
          : cpuTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      hotLimit: null == hotLimit
          ? _self.hotLimit
          : hotLimit // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SensorData {
  String? get name;
  String get path;
  String get source;
  List<TempData> get temps;

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorDataCopyWith<SensorData> get copyWith =>
      _$SensorDataCopyWithImpl<SensorData>(this as SensorData, _$identity);

  /// Serializes this SensorData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.temps, temps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, path, source,
      const DeepCollectionEquality().hash(temps));

  @override
  String toString() {
    return 'SensorData(name: $name, path: $path, source: $source, temps: $temps)';
  }
}

/// @nodoc
abstract mixin class $SensorDataCopyWith<$Res> {
  factory $SensorDataCopyWith(
          SensorData value, $Res Function(SensorData) _then) =
      _$SensorDataCopyWithImpl;
  @useResult
  $Res call({String? name, String path, String source, List<TempData> temps});
}

/// @nodoc
class _$SensorDataCopyWithImpl<$Res> implements $SensorDataCopyWith<$Res> {
  _$SensorDataCopyWithImpl(this._self, this._then);

  final SensorData _self;
  final $Res Function(SensorData) _then;

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = null,
    Object? source = null,
    Object? temps = null,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      temps: null == temps
          ? _self.temps
          : temps // ignore: cast_nullable_to_non_nullable
              as List<TempData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SensorData implements SensorData {
  const _SensorData(
      {required this.name,
      required this.path,
      required this.source,
      required final List<TempData> temps})
      : _temps = temps;
  factory _SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);

  @override
  final String? name;
  @override
  final String path;
  @override
  final String source;
  final List<TempData> _temps;
  @override
  List<TempData> get temps {
    if (_temps is EqualUnmodifiableListView) return _temps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temps);
  }

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SensorDataCopyWith<_SensorData> get copyWith =>
      __$SensorDataCopyWithImpl<_SensorData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SensorDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SensorData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._temps, _temps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, path, source,
      const DeepCollectionEquality().hash(_temps));

  @override
  String toString() {
    return 'SensorData(name: $name, path: $path, source: $source, temps: $temps)';
  }
}

/// @nodoc
abstract mixin class _$SensorDataCopyWith<$Res>
    implements $SensorDataCopyWith<$Res> {
  factory _$SensorDataCopyWith(
          _SensorData value, $Res Function(_SensorData) _then) =
      __$SensorDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, String path, String source, List<TempData> temps});
}

/// @nodoc
class __$SensorDataCopyWithImpl<$Res> implements _$SensorDataCopyWith<$Res> {
  __$SensorDataCopyWithImpl(this._self, this._then);

  final _SensorData _self;
  final $Res Function(_SensorData) _then;

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? path = null,
    Object? source = null,
    Object? temps = null,
  }) {
    return _then(_SensorData(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      temps: null == temps
          ? _self._temps
          : temps // ignore: cast_nullable_to_non_nullable
              as List<TempData>,
    ));
  }
}

/// @nodoc
mixin _$TempData {
  String? get name;
  num get value;
  num? get max;
  num? get crit;
  String get sensor;

  /// Create a copy of TempData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TempDataCopyWith<TempData> get copyWith =>
      _$TempDataCopyWithImpl<TempData>(this as TempData, _$identity);

  /// Serializes this TempData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TempData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.crit, crit) || other.crit == crit) &&
            (identical(other.sensor, sensor) || other.sensor == sensor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, max, crit, sensor);

  @override
  String toString() {
    return 'TempData(name: $name, value: $value, max: $max, crit: $crit, sensor: $sensor)';
  }
}

/// @nodoc
abstract mixin class $TempDataCopyWith<$Res> {
  factory $TempDataCopyWith(TempData value, $Res Function(TempData) _then) =
      _$TempDataCopyWithImpl;
  @useResult
  $Res call({String? name, num value, num? max, num? crit, String sensor});
}

/// @nodoc
class _$TempDataCopyWithImpl<$Res> implements $TempDataCopyWith<$Res> {
  _$TempDataCopyWithImpl(this._self, this._then);

  final TempData _self;
  final $Res Function(TempData) _then;

  /// Create a copy of TempData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = null,
    Object? max = freezed,
    Object? crit = freezed,
    Object? sensor = null,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as num?,
      crit: freezed == crit
          ? _self.crit
          : crit // ignore: cast_nullable_to_non_nullable
              as num?,
      sensor: null == sensor
          ? _self.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TempData implements TempData {
  const _TempData(
      {required this.name,
      required this.value,
      required this.max,
      required this.crit,
      required this.sensor});
  factory _TempData.fromJson(Map<String, dynamic> json) =>
      _$TempDataFromJson(json);

  @override
  final String? name;
  @override
  final num value;
  @override
  final num? max;
  @override
  final num? crit;
  @override
  final String sensor;

  /// Create a copy of TempData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TempDataCopyWith<_TempData> get copyWith =>
      __$TempDataCopyWithImpl<_TempData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TempDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TempData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.crit, crit) || other.crit == crit) &&
            (identical(other.sensor, sensor) || other.sensor == sensor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, max, crit, sensor);

  @override
  String toString() {
    return 'TempData(name: $name, value: $value, max: $max, crit: $crit, sensor: $sensor)';
  }
}

/// @nodoc
abstract mixin class _$TempDataCopyWith<$Res>
    implements $TempDataCopyWith<$Res> {
  factory _$TempDataCopyWith(_TempData value, $Res Function(_TempData) _then) =
      __$TempDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, num value, num? max, num? crit, String sensor});
}

/// @nodoc
class __$TempDataCopyWithImpl<$Res> implements _$TempDataCopyWith<$Res> {
  __$TempDataCopyWithImpl(this._self, this._then);

  final _TempData _self;
  final $Res Function(_TempData) _then;

  /// Create a copy of TempData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? value = null,
    Object? max = freezed,
    Object? crit = freezed,
    Object? sensor = null,
  }) {
    return _then(_TempData(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as num?,
      crit: freezed == crit
          ? _self.crit
          : crit // ignore: cast_nullable_to_non_nullable
              as num?,
      sensor: null == sensor
          ? _self.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
