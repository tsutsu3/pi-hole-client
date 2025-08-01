// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'over_time_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OverTimeData {
  @JsonKey(name: 'domains_over_time')
  Map<String, int> get domainsOverTime;
  @JsonKey(name: 'ads_over_time')
  Map<String, int> get adsOverTime;
  @MapOrEmptyListConverter()
  List<Client> get clients;
  @JsonKey(name: 'over_time')
  @MapListOrEmptyListConverter()
  Map<String, List<int>> get overTime;

  /// Create a copy of OverTimeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OverTimeDataCopyWith<OverTimeData> get copyWith =>
      _$OverTimeDataCopyWithImpl<OverTimeData>(
          this as OverTimeData, _$identity);

  /// Serializes this OverTimeData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OverTimeData &&
            const DeepCollectionEquality()
                .equals(other.domainsOverTime, domainsOverTime) &&
            const DeepCollectionEquality()
                .equals(other.adsOverTime, adsOverTime) &&
            const DeepCollectionEquality().equals(other.clients, clients) &&
            const DeepCollectionEquality().equals(other.overTime, overTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(domainsOverTime),
      const DeepCollectionEquality().hash(adsOverTime),
      const DeepCollectionEquality().hash(clients),
      const DeepCollectionEquality().hash(overTime));

  @override
  String toString() {
    return 'OverTimeData(domainsOverTime: $domainsOverTime, adsOverTime: $adsOverTime, clients: $clients, overTime: $overTime)';
  }
}

/// @nodoc
abstract mixin class $OverTimeDataCopyWith<$Res> {
  factory $OverTimeDataCopyWith(
          OverTimeData value, $Res Function(OverTimeData) _then) =
      _$OverTimeDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_over_time') Map<String, int> domainsOverTime,
      @JsonKey(name: 'ads_over_time') Map<String, int> adsOverTime,
      @MapOrEmptyListConverter() List<Client> clients,
      @JsonKey(name: 'over_time')
      @MapListOrEmptyListConverter()
      Map<String, List<int>> overTime});
}

/// @nodoc
class _$OverTimeDataCopyWithImpl<$Res> implements $OverTimeDataCopyWith<$Res> {
  _$OverTimeDataCopyWithImpl(this._self, this._then);

  final OverTimeData _self;
  final $Res Function(OverTimeData) _then;

  /// Create a copy of OverTimeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainsOverTime = null,
    Object? adsOverTime = null,
    Object? clients = null,
    Object? overTime = null,
  }) {
    return _then(_self.copyWith(
      domainsOverTime: null == domainsOverTime
          ? _self.domainsOverTime
          : domainsOverTime // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      adsOverTime: null == adsOverTime
          ? _self.adsOverTime
          : adsOverTime // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      overTime: null == overTime
          ? _self.overTime
          : overTime // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OverTimeData].
extension OverTimeDataPatterns on OverTimeData {
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
    TResult Function(_OverTimeData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OverTimeData() when $default != null:
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
    TResult Function(_OverTimeData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OverTimeData():
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
    TResult? Function(_OverTimeData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OverTimeData() when $default != null:
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
            @JsonKey(name: 'domains_over_time')
            Map<String, int> domainsOverTime,
            @JsonKey(name: 'ads_over_time') Map<String, int> adsOverTime,
            @MapOrEmptyListConverter() List<Client> clients,
            @JsonKey(name: 'over_time')
            @MapListOrEmptyListConverter()
            Map<String, List<int>> overTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OverTimeData() when $default != null:
        return $default(_that.domainsOverTime, _that.adsOverTime, _that.clients,
            _that.overTime);
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
            @JsonKey(name: 'domains_over_time')
            Map<String, int> domainsOverTime,
            @JsonKey(name: 'ads_over_time') Map<String, int> adsOverTime,
            @MapOrEmptyListConverter() List<Client> clients,
            @JsonKey(name: 'over_time')
            @MapListOrEmptyListConverter()
            Map<String, List<int>> overTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OverTimeData():
        return $default(_that.domainsOverTime, _that.adsOverTime, _that.clients,
            _that.overTime);
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
            @JsonKey(name: 'domains_over_time')
            Map<String, int> domainsOverTime,
            @JsonKey(name: 'ads_over_time') Map<String, int> adsOverTime,
            @MapOrEmptyListConverter() List<Client> clients,
            @JsonKey(name: 'over_time')
            @MapListOrEmptyListConverter()
            Map<String, List<int>> overTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OverTimeData() when $default != null:
        return $default(_that.domainsOverTime, _that.adsOverTime, _that.clients,
            _that.overTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _OverTimeData implements OverTimeData {
  const _OverTimeData(
      {@JsonKey(name: 'domains_over_time')
      required final Map<String, int> domainsOverTime,
      @JsonKey(name: 'ads_over_time')
      required final Map<String, int> adsOverTime,
      @MapOrEmptyListConverter() required final List<Client> clients,
      @JsonKey(name: 'over_time')
      @MapListOrEmptyListConverter()
      required final Map<String, List<int>> overTime})
      : _domainsOverTime = domainsOverTime,
        _adsOverTime = adsOverTime,
        _clients = clients,
        _overTime = overTime;
  factory _OverTimeData.fromJson(Map<String, dynamic> json) =>
      _$OverTimeDataFromJson(json);

  final Map<String, int> _domainsOverTime;
  @override
  @JsonKey(name: 'domains_over_time')
  Map<String, int> get domainsOverTime {
    if (_domainsOverTime is EqualUnmodifiableMapView) return _domainsOverTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_domainsOverTime);
  }

  final Map<String, int> _adsOverTime;
  @override
  @JsonKey(name: 'ads_over_time')
  Map<String, int> get adsOverTime {
    if (_adsOverTime is EqualUnmodifiableMapView) return _adsOverTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_adsOverTime);
  }

  final List<Client> _clients;
  @override
  @MapOrEmptyListConverter()
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  final Map<String, List<int>> _overTime;
  @override
  @JsonKey(name: 'over_time')
  @MapListOrEmptyListConverter()
  Map<String, List<int>> get overTime {
    if (_overTime is EqualUnmodifiableMapView) return _overTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_overTime);
  }

  /// Create a copy of OverTimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OverTimeDataCopyWith<_OverTimeData> get copyWith =>
      __$OverTimeDataCopyWithImpl<_OverTimeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OverTimeDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OverTimeData &&
            const DeepCollectionEquality()
                .equals(other._domainsOverTime, _domainsOverTime) &&
            const DeepCollectionEquality()
                .equals(other._adsOverTime, _adsOverTime) &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            const DeepCollectionEquality().equals(other._overTime, _overTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_domainsOverTime),
      const DeepCollectionEquality().hash(_adsOverTime),
      const DeepCollectionEquality().hash(_clients),
      const DeepCollectionEquality().hash(_overTime));

  @override
  String toString() {
    return 'OverTimeData(domainsOverTime: $domainsOverTime, adsOverTime: $adsOverTime, clients: $clients, overTime: $overTime)';
  }
}

/// @nodoc
abstract mixin class _$OverTimeDataCopyWith<$Res>
    implements $OverTimeDataCopyWith<$Res> {
  factory _$OverTimeDataCopyWith(
          _OverTimeData value, $Res Function(_OverTimeData) _then) =
      __$OverTimeDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_over_time') Map<String, int> domainsOverTime,
      @JsonKey(name: 'ads_over_time') Map<String, int> adsOverTime,
      @MapOrEmptyListConverter() List<Client> clients,
      @JsonKey(name: 'over_time')
      @MapListOrEmptyListConverter()
      Map<String, List<int>> overTime});
}

/// @nodoc
class __$OverTimeDataCopyWithImpl<$Res>
    implements _$OverTimeDataCopyWith<$Res> {
  __$OverTimeDataCopyWithImpl(this._self, this._then);

  final _OverTimeData _self;
  final $Res Function(_OverTimeData) _then;

  /// Create a copy of OverTimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domainsOverTime = null,
    Object? adsOverTime = null,
    Object? clients = null,
    Object? overTime = null,
  }) {
    return _then(_OverTimeData(
      domainsOverTime: null == domainsOverTime
          ? _self._domainsOverTime
          : domainsOverTime // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      adsOverTime: null == adsOverTime
          ? _self._adsOverTime
          : adsOverTime // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      clients: null == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      overTime: null == overTime
          ? _self._overTime
          : overTime // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ));
  }
}

/// @nodoc
mixin _$Client {
  String get name;
  String get ip;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientCopyWith<Client> get copyWith =>
      _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Client &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ip, ip) || other.ip == ip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, ip);

  @override
  String toString() {
    return 'Client(name: $name, ip: $ip)';
  }
}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) =
      _$ClientCopyWithImpl;
  @useResult
  $Res call({String name, String ip});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res> implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ip = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Client].
extension ClientPatterns on Client {
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
    TResult Function(_Client value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
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
    TResult Function(_Client value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
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
    TResult? Function(_Client value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
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
    TResult Function(String name, String ip)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.name, _that.ip);
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
    TResult Function(String name, String ip) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
        return $default(_that.name, _that.ip);
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
    TResult? Function(String name, String ip)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.name, _that.ip);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Client implements Client {
  const _Client({required this.name, required this.ip});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @override
  final String name;
  @override
  final String ip;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientCopyWith<_Client> get copyWith =>
      __$ClientCopyWithImpl<_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Client &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ip, ip) || other.ip == ip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, ip);

  @override
  String toString() {
    return 'Client(name: $name, ip: $ip)';
  }
}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) =
      __$ClientCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String ip});
}

/// @nodoc
class __$ClientCopyWithImpl<$Res> implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? ip = null,
  }) {
    return _then(_Client(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
