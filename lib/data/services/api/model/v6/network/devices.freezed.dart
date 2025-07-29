// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Devices {
  List<DeviceData> get devices;
  double get took;

  /// Create a copy of Devices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DevicesCopyWith<Devices> get copyWith =>
      _$DevicesCopyWithImpl<Devices>(this as Devices, _$identity);

  /// Serializes this Devices to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Devices &&
            const DeepCollectionEquality().equals(other.devices, devices) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(devices), took);

  @override
  String toString() {
    return 'Devices(devices: $devices, took: $took)';
  }
}

/// @nodoc
abstract mixin class $DevicesCopyWith<$Res> {
  factory $DevicesCopyWith(Devices value, $Res Function(Devices) _then) =
      _$DevicesCopyWithImpl;
  @useResult
  $Res call({List<DeviceData> devices, double took});
}

/// @nodoc
class _$DevicesCopyWithImpl<$Res> implements $DevicesCopyWith<$Res> {
  _$DevicesCopyWithImpl(this._self, this._then);

  final Devices _self;
  final $Res Function(Devices) _then;

  /// Create a copy of Devices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      devices: null == devices
          ? _self.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [Devices].
extension DevicesPatterns on Devices {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Devices value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Devices() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Devices value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Devices():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Devices value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Devices() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<DeviceData> devices, double took)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Devices() when $default != null:
        return $default(_that.devices, _that.took);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<DeviceData> devices, double took) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Devices():
        return $default(_that.devices, _that.took);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<DeviceData> devices, double took)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Devices() when $default != null:
        return $default(_that.devices, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Devices implements Devices {
  const _Devices({required final List<DeviceData> devices, required this.took})
      : _devices = devices;
  factory _Devices.fromJson(Map<String, dynamic> json) =>
      _$DevicesFromJson(json);

  final List<DeviceData> _devices;
  @override
  List<DeviceData> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final double took;

  /// Create a copy of Devices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DevicesCopyWith<_Devices> get copyWith =>
      __$DevicesCopyWithImpl<_Devices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DevicesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Devices &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_devices), took);

  @override
  String toString() {
    return 'Devices(devices: $devices, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$DevicesCopyWith<$Res> implements $DevicesCopyWith<$Res> {
  factory _$DevicesCopyWith(_Devices value, $Res Function(_Devices) _then) =
      __$DevicesCopyWithImpl;
  @override
  @useResult
  $Res call({List<DeviceData> devices, double took});
}

/// @nodoc
class __$DevicesCopyWithImpl<$Res> implements _$DevicesCopyWith<$Res> {
  __$DevicesCopyWithImpl(this._self, this._then);

  final _Devices _self;
  final $Res Function(_Devices) _then;

  /// Create a copy of Devices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? devices = null,
    Object? took = null,
  }) {
    return _then(_Devices(
      devices: null == devices
          ? _self._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$DeviceData {
  int get id;
  String get hwaddr;
  String get interface;
  int get firstSeen;
  int get lastQuery;
  int get numQueries;
  List<DeviceIp> get ips;
  String? get macVendor;

  /// Create a copy of DeviceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceDataCopyWith<DeviceData> get copyWith =>
      _$DeviceDataCopyWithImpl<DeviceData>(this as DeviceData, _$identity);

  /// Serializes this DeviceData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr) &&
            (identical(other.interface, interface) ||
                other.interface == interface) &&
            (identical(other.firstSeen, firstSeen) ||
                other.firstSeen == firstSeen) &&
            (identical(other.lastQuery, lastQuery) ||
                other.lastQuery == lastQuery) &&
            (identical(other.numQueries, numQueries) ||
                other.numQueries == numQueries) &&
            const DeepCollectionEquality().equals(other.ips, ips) &&
            (identical(other.macVendor, macVendor) ||
                other.macVendor == macVendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hwaddr,
      interface,
      firstSeen,
      lastQuery,
      numQueries,
      const DeepCollectionEquality().hash(ips),
      macVendor);

  @override
  String toString() {
    return 'DeviceData(id: $id, hwaddr: $hwaddr, interface: $interface, firstSeen: $firstSeen, lastQuery: $lastQuery, numQueries: $numQueries, ips: $ips, macVendor: $macVendor)';
  }
}

/// @nodoc
abstract mixin class $DeviceDataCopyWith<$Res> {
  factory $DeviceDataCopyWith(
          DeviceData value, $Res Function(DeviceData) _then) =
      _$DeviceDataCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String hwaddr,
      String interface,
      int firstSeen,
      int lastQuery,
      int numQueries,
      List<DeviceIp> ips,
      String? macVendor});
}

/// @nodoc
class _$DeviceDataCopyWithImpl<$Res> implements $DeviceDataCopyWith<$Res> {
  _$DeviceDataCopyWithImpl(this._self, this._then);

  final DeviceData _self;
  final $Res Function(DeviceData) _then;

  /// Create a copy of DeviceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hwaddr = null,
    Object? interface = null,
    Object? firstSeen = null,
    Object? lastQuery = null,
    Object? numQueries = null,
    Object? ips = null,
    Object? macVendor = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hwaddr: null == hwaddr
          ? _self.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      interface: null == interface
          ? _self.interface
          : interface // ignore: cast_nullable_to_non_nullable
              as String,
      firstSeen: null == firstSeen
          ? _self.firstSeen
          : firstSeen // ignore: cast_nullable_to_non_nullable
              as int,
      lastQuery: null == lastQuery
          ? _self.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as int,
      numQueries: null == numQueries
          ? _self.numQueries
          : numQueries // ignore: cast_nullable_to_non_nullable
              as int,
      ips: null == ips
          ? _self.ips
          : ips // ignore: cast_nullable_to_non_nullable
              as List<DeviceIp>,
      macVendor: freezed == macVendor
          ? _self.macVendor
          : macVendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceData].
extension DeviceDataPatterns on DeviceData {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceData() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceData():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeviceData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceData() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String hwaddr,
            String interface,
            int firstSeen,
            int lastQuery,
            int numQueries,
            List<DeviceIp> ips,
            String? macVendor)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceData() when $default != null:
        return $default(
            _that.id,
            _that.hwaddr,
            _that.interface,
            _that.firstSeen,
            _that.lastQuery,
            _that.numQueries,
            _that.ips,
            _that.macVendor);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String hwaddr,
            String interface,
            int firstSeen,
            int lastQuery,
            int numQueries,
            List<DeviceIp> ips,
            String? macVendor)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceData():
        return $default(
            _that.id,
            _that.hwaddr,
            _that.interface,
            _that.firstSeen,
            _that.lastQuery,
            _that.numQueries,
            _that.ips,
            _that.macVendor);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String hwaddr,
            String interface,
            int firstSeen,
            int lastQuery,
            int numQueries,
            List<DeviceIp> ips,
            String? macVendor)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceData() when $default != null:
        return $default(
            _that.id,
            _that.hwaddr,
            _that.interface,
            _that.firstSeen,
            _that.lastQuery,
            _that.numQueries,
            _that.ips,
            _that.macVendor);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DeviceData implements DeviceData {
  const _DeviceData(
      {required this.id,
      required this.hwaddr,
      required this.interface,
      required this.firstSeen,
      required this.lastQuery,
      required this.numQueries,
      required final List<DeviceIp> ips,
      this.macVendor})
      : _ips = ips;
  factory _DeviceData.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataFromJson(json);

  @override
  final int id;
  @override
  final String hwaddr;
  @override
  final String interface;
  @override
  final int firstSeen;
  @override
  final int lastQuery;
  @override
  final int numQueries;
  final List<DeviceIp> _ips;
  @override
  List<DeviceIp> get ips {
    if (_ips is EqualUnmodifiableListView) return _ips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ips);
  }

  @override
  final String? macVendor;

  /// Create a copy of DeviceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceDataCopyWith<_DeviceData> get copyWith =>
      __$DeviceDataCopyWithImpl<_DeviceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr) &&
            (identical(other.interface, interface) ||
                other.interface == interface) &&
            (identical(other.firstSeen, firstSeen) ||
                other.firstSeen == firstSeen) &&
            (identical(other.lastQuery, lastQuery) ||
                other.lastQuery == lastQuery) &&
            (identical(other.numQueries, numQueries) ||
                other.numQueries == numQueries) &&
            const DeepCollectionEquality().equals(other._ips, _ips) &&
            (identical(other.macVendor, macVendor) ||
                other.macVendor == macVendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hwaddr,
      interface,
      firstSeen,
      lastQuery,
      numQueries,
      const DeepCollectionEquality().hash(_ips),
      macVendor);

  @override
  String toString() {
    return 'DeviceData(id: $id, hwaddr: $hwaddr, interface: $interface, firstSeen: $firstSeen, lastQuery: $lastQuery, numQueries: $numQueries, ips: $ips, macVendor: $macVendor)';
  }
}

/// @nodoc
abstract mixin class _$DeviceDataCopyWith<$Res>
    implements $DeviceDataCopyWith<$Res> {
  factory _$DeviceDataCopyWith(
          _DeviceData value, $Res Function(_DeviceData) _then) =
      __$DeviceDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String hwaddr,
      String interface,
      int firstSeen,
      int lastQuery,
      int numQueries,
      List<DeviceIp> ips,
      String? macVendor});
}

/// @nodoc
class __$DeviceDataCopyWithImpl<$Res> implements _$DeviceDataCopyWith<$Res> {
  __$DeviceDataCopyWithImpl(this._self, this._then);

  final _DeviceData _self;
  final $Res Function(_DeviceData) _then;

  /// Create a copy of DeviceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? hwaddr = null,
    Object? interface = null,
    Object? firstSeen = null,
    Object? lastQuery = null,
    Object? numQueries = null,
    Object? ips = null,
    Object? macVendor = freezed,
  }) {
    return _then(_DeviceData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hwaddr: null == hwaddr
          ? _self.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      interface: null == interface
          ? _self.interface
          : interface // ignore: cast_nullable_to_non_nullable
              as String,
      firstSeen: null == firstSeen
          ? _self.firstSeen
          : firstSeen // ignore: cast_nullable_to_non_nullable
              as int,
      lastQuery: null == lastQuery
          ? _self.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as int,
      numQueries: null == numQueries
          ? _self.numQueries
          : numQueries // ignore: cast_nullable_to_non_nullable
              as int,
      ips: null == ips
          ? _self._ips
          : ips // ignore: cast_nullable_to_non_nullable
              as List<DeviceIp>,
      macVendor: freezed == macVendor
          ? _self.macVendor
          : macVendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$DeviceIp {
  String get ip;
  int get lastSeen;
  int get nameUpdated;
  String? get name;

  /// Create a copy of DeviceIp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceIpCopyWith<DeviceIp> get copyWith =>
      _$DeviceIpCopyWithImpl<DeviceIp>(this as DeviceIp, _$identity);

  /// Serializes this DeviceIp to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceIp &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.nameUpdated, nameUpdated) ||
                other.nameUpdated == nameUpdated) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, lastSeen, nameUpdated, name);

  @override
  String toString() {
    return 'DeviceIp(ip: $ip, lastSeen: $lastSeen, nameUpdated: $nameUpdated, name: $name)';
  }
}

/// @nodoc
abstract mixin class $DeviceIpCopyWith<$Res> {
  factory $DeviceIpCopyWith(DeviceIp value, $Res Function(DeviceIp) _then) =
      _$DeviceIpCopyWithImpl;
  @useResult
  $Res call({String ip, int lastSeen, int nameUpdated, String? name});
}

/// @nodoc
class _$DeviceIpCopyWithImpl<$Res> implements $DeviceIpCopyWith<$Res> {
  _$DeviceIpCopyWithImpl(this._self, this._then);

  final DeviceIp _self;
  final $Res Function(DeviceIp) _then;

  /// Create a copy of DeviceIp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? lastSeen = null,
    Object? nameUpdated = null,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int,
      nameUpdated: null == nameUpdated
          ? _self.nameUpdated
          : nameUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceIp].
extension DeviceIpPatterns on DeviceIp {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceIp value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceIp() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceIp value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceIp():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeviceIp value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceIp() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String ip, int lastSeen, int nameUpdated, String? name)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceIp() when $default != null:
        return $default(
            _that.ip, _that.lastSeen, _that.nameUpdated, _that.name);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String ip, int lastSeen, int nameUpdated, String? name)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceIp():
        return $default(
            _that.ip, _that.lastSeen, _that.nameUpdated, _that.name);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String ip, int lastSeen, int nameUpdated, String? name)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceIp() when $default != null:
        return $default(
            _that.ip, _that.lastSeen, _that.nameUpdated, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceIp implements DeviceIp {
  const _DeviceIp(
      {required this.ip,
      required this.lastSeen,
      required this.nameUpdated,
      this.name});
  factory _DeviceIp.fromJson(Map<String, dynamic> json) =>
      _$DeviceIpFromJson(json);

  @override
  final String ip;
  @override
  final int lastSeen;
  @override
  final int nameUpdated;
  @override
  final String? name;

  /// Create a copy of DeviceIp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceIpCopyWith<_DeviceIp> get copyWith =>
      __$DeviceIpCopyWithImpl<_DeviceIp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceIpToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceIp &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.nameUpdated, nameUpdated) ||
                other.nameUpdated == nameUpdated) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, lastSeen, nameUpdated, name);

  @override
  String toString() {
    return 'DeviceIp(ip: $ip, lastSeen: $lastSeen, nameUpdated: $nameUpdated, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$DeviceIpCopyWith<$Res>
    implements $DeviceIpCopyWith<$Res> {
  factory _$DeviceIpCopyWith(_DeviceIp value, $Res Function(_DeviceIp) _then) =
      __$DeviceIpCopyWithImpl;
  @override
  @useResult
  $Res call({String ip, int lastSeen, int nameUpdated, String? name});
}

/// @nodoc
class __$DeviceIpCopyWithImpl<$Res> implements _$DeviceIpCopyWith<$Res> {
  __$DeviceIpCopyWithImpl(this._self, this._then);

  final _DeviceIp _self;
  final $Res Function(_DeviceIp) _then;

  /// Create a copy of DeviceIp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ip = null,
    Object? lastSeen = null,
    Object? nameUpdated = null,
    Object? name = freezed,
  }) {
    return _then(_DeviceIp(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int,
      nameUpdated: null == nameUpdated
          ? _self.nameUpdated
          : nameUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
