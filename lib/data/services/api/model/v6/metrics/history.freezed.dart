// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$History {
  List<HistoryData> get history;
  double get took;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryCopyWith<History> get copyWith =>
      _$HistoryCopyWithImpl<History>(this as History, _$identity);

  /// Serializes this History to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is History &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(history), took);

  @override
  String toString() {
    return 'History(history: $history, took: $took)';
  }
}

/// @nodoc
abstract mixin class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) _then) =
      _$HistoryCopyWithImpl;
  @useResult
  $Res call({List<HistoryData> history, double took});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res> implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._self, this._then);

  final History _self;
  final $Res Function(History) _then;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [History].
extension HistoryPatterns on History {
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
    TResult Function(_History value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _History() when $default != null:
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
    TResult Function(_History value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _History():
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
    TResult? Function(_History value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _History() when $default != null:
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
    TResult Function(List<HistoryData> history, double took)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _History() when $default != null:
        return $default(_that.history, _that.took);
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
    TResult Function(List<HistoryData> history, double took) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _History():
        return $default(_that.history, _that.took);
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
    TResult? Function(List<HistoryData> history, double took)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _History() when $default != null:
        return $default(_that.history, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _History implements History {
  const _History({required final List<HistoryData> history, required this.took})
      : _history = history;
  factory _History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  final List<HistoryData> _history;
  @override
  List<HistoryData> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final double took;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryCopyWith<_History> get copyWith =>
      __$HistoryCopyWithImpl<_History>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _History &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_history), took);

  @override
  String toString() {
    return 'History(history: $history, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) _then) =
      __$HistoryCopyWithImpl;
  @override
  @useResult
  $Res call({List<HistoryData> history, double took});
}

/// @nodoc
class __$HistoryCopyWithImpl<$Res> implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(this._self, this._then);

  final _History _self;
  final $Res Function(_History) _then;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_History(
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$HistoryData {
  double get timestamp;
  int get total;
  int get cached;
  int get blocked;
  int get forwarded;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryDataCopyWith<HistoryData> get copyWith =>
      _$HistoryDataCopyWithImpl<HistoryData>(this as HistoryData, _$identity);

  /// Serializes this HistoryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryData &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, total, cached, blocked, forwarded);

  @override
  String toString() {
    return 'HistoryData(timestamp: $timestamp, total: $total, cached: $cached, blocked: $blocked, forwarded: $forwarded)';
  }
}

/// @nodoc
abstract mixin class $HistoryDataCopyWith<$Res> {
  factory $HistoryDataCopyWith(
          HistoryData value, $Res Function(HistoryData) _then) =
      _$HistoryDataCopyWithImpl;
  @useResult
  $Res call(
      {double timestamp, int total, int cached, int blocked, int forwarded});
}

/// @nodoc
class _$HistoryDataCopyWithImpl<$Res> implements $HistoryDataCopyWith<$Res> {
  _$HistoryDataCopyWithImpl(this._self, this._then);

  final HistoryData _self;
  final $Res Function(HistoryData) _then;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? total = null,
    Object? cached = null,
    Object? blocked = null,
    Object? forwarded = null,
  }) {
    return _then(_self.copyWith(
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _self.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [HistoryData].
extension HistoryDataPatterns on HistoryData {
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
    TResult Function(_HistoryData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryData() when $default != null:
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
    TResult Function(_HistoryData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryData():
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
    TResult? Function(_HistoryData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryData() when $default != null:
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
    TResult Function(double timestamp, int total, int cached, int blocked,
            int forwarded)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryData() when $default != null:
        return $default(_that.timestamp, _that.total, _that.cached,
            _that.blocked, _that.forwarded);
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
            double timestamp, int total, int cached, int blocked, int forwarded)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryData():
        return $default(_that.timestamp, _that.total, _that.cached,
            _that.blocked, _that.forwarded);
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
    TResult? Function(double timestamp, int total, int cached, int blocked,
            int forwarded)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryData() when $default != null:
        return $default(_that.timestamp, _that.total, _that.cached,
            _that.blocked, _that.forwarded);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HistoryData implements HistoryData {
  const _HistoryData(
      {required this.timestamp,
      required this.total,
      required this.cached,
      required this.blocked,
      required this.forwarded});
  factory _HistoryData.fromJson(Map<String, dynamic> json) =>
      _$HistoryDataFromJson(json);

  @override
  final double timestamp;
  @override
  final int total;
  @override
  final int cached;
  @override
  final int blocked;
  @override
  final int forwarded;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryDataCopyWith<_HistoryData> get copyWith =>
      __$HistoryDataCopyWithImpl<_HistoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HistoryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryData &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, total, cached, blocked, forwarded);

  @override
  String toString() {
    return 'HistoryData(timestamp: $timestamp, total: $total, cached: $cached, blocked: $blocked, forwarded: $forwarded)';
  }
}

/// @nodoc
abstract mixin class _$HistoryDataCopyWith<$Res>
    implements $HistoryDataCopyWith<$Res> {
  factory _$HistoryDataCopyWith(
          _HistoryData value, $Res Function(_HistoryData) _then) =
      __$HistoryDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double timestamp, int total, int cached, int blocked, int forwarded});
}

/// @nodoc
class __$HistoryDataCopyWithImpl<$Res> implements _$HistoryDataCopyWith<$Res> {
  __$HistoryDataCopyWithImpl(this._self, this._then);

  final _HistoryData _self;
  final $Res Function(_HistoryData) _then;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timestamp = null,
    Object? total = null,
    Object? cached = null,
    Object? blocked = null,
    Object? forwarded = null,
  }) {
    return _then(_HistoryData(
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _self.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$HistoryClients {
  Map<String, Client> get clients;
  List<HistoryEntry> get history;
  double get took;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryClientsCopyWith<HistoryClients> get copyWith =>
      _$HistoryClientsCopyWithImpl<HistoryClients>(
          this as HistoryClients, _$identity);

  /// Serializes this HistoryClients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryClients &&
            const DeepCollectionEquality().equals(other.clients, clients) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clients),
      const DeepCollectionEquality().hash(history),
      took);

  @override
  String toString() {
    return 'HistoryClients(clients: $clients, history: $history, took: $took)';
  }
}

/// @nodoc
abstract mixin class $HistoryClientsCopyWith<$Res> {
  factory $HistoryClientsCopyWith(
          HistoryClients value, $Res Function(HistoryClients) _then) =
      _$HistoryClientsCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Client> clients, List<HistoryEntry> history, double took});
}

/// @nodoc
class _$HistoryClientsCopyWithImpl<$Res>
    implements $HistoryClientsCopyWith<$Res> {
  _$HistoryClientsCopyWithImpl(this._self, this._then);

  final HistoryClients _self;
  final $Res Function(HistoryClients) _then;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = null,
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Map<String, Client>,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [HistoryClients].
extension HistoryClientsPatterns on HistoryClients {
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
    TResult Function(_HistoryClients value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryClients() when $default != null:
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
    TResult Function(_HistoryClients value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryClients():
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
    TResult? Function(_HistoryClients value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryClients() when $default != null:
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
    TResult Function(Map<String, Client> clients, List<HistoryEntry> history,
            double took)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryClients() when $default != null:
        return $default(_that.clients, _that.history, _that.took);
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
    TResult Function(Map<String, Client> clients, List<HistoryEntry> history,
            double took)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryClients():
        return $default(_that.clients, _that.history, _that.took);
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
    TResult? Function(Map<String, Client> clients, List<HistoryEntry> history,
            double took)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryClients() when $default != null:
        return $default(_that.clients, _that.history, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _HistoryClients implements HistoryClients {
  const _HistoryClients(
      {required final Map<String, Client> clients,
      required final List<HistoryEntry> history,
      required this.took})
      : _clients = clients,
        _history = history;
  factory _HistoryClients.fromJson(Map<String, dynamic> json) =>
      _$HistoryClientsFromJson(json);

  final Map<String, Client> _clients;
  @override
  Map<String, Client> get clients {
    if (_clients is EqualUnmodifiableMapView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clients);
  }

  final List<HistoryEntry> _history;
  @override
  List<HistoryEntry> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final double took;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryClientsCopyWith<_HistoryClients> get copyWith =>
      __$HistoryClientsCopyWithImpl<_HistoryClients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HistoryClientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryClients &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_clients),
      const DeepCollectionEquality().hash(_history),
      took);

  @override
  String toString() {
    return 'HistoryClients(clients: $clients, history: $history, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$HistoryClientsCopyWith<$Res>
    implements $HistoryClientsCopyWith<$Res> {
  factory _$HistoryClientsCopyWith(
          _HistoryClients value, $Res Function(_HistoryClients) _then) =
      __$HistoryClientsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, Client> clients, List<HistoryEntry> history, double took});
}

/// @nodoc
class __$HistoryClientsCopyWithImpl<$Res>
    implements _$HistoryClientsCopyWith<$Res> {
  __$HistoryClientsCopyWithImpl(this._self, this._then);

  final _HistoryClients _self;
  final $Res Function(_HistoryClients) _then;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clients = null,
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_HistoryClients(
      clients: null == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Map<String, Client>,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Client {
  String? get name; // Nullable since "name" can be null
  int get total;

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
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, total);

  @override
  String toString() {
    return 'Client(name: $name, total: $total)';
  }
}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) =
      _$ClientCopyWithImpl;
  @useResult
  $Res call({String? name, int total});
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
    Object? name = freezed,
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
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
    TResult Function(String? name, int total)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.name, _that.total);
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
    TResult Function(String? name, int total) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
        return $default(_that.name, _that.total);
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
    TResult? Function(String? name, int total)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.name, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Client implements Client {
  const _Client({required this.name, required this.total});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @override
  final String? name;
// Nullable since "name" can be null
  @override
  final int total;

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
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, total);

  @override
  String toString() {
    return 'Client(name: $name, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) =
      __$ClientCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, int total});
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
    Object? name = freezed,
    Object? total = null,
  }) {
    return _then(_Client(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$HistoryEntry {
  double get timestamp;
  Map<String, int> get data;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryEntryCopyWith<HistoryEntry> get copyWith =>
      _$HistoryEntryCopyWithImpl<HistoryEntry>(
          this as HistoryEntry, _$identity);

  /// Serializes this HistoryEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryEntry &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'HistoryEntry(timestamp: $timestamp, data: $data)';
  }
}

/// @nodoc
abstract mixin class $HistoryEntryCopyWith<$Res> {
  factory $HistoryEntryCopyWith(
          HistoryEntry value, $Res Function(HistoryEntry) _then) =
      _$HistoryEntryCopyWithImpl;
  @useResult
  $Res call({double timestamp, Map<String, int> data});
}

/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res> implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._self, this._then);

  final HistoryEntry _self;
  final $Res Function(HistoryEntry) _then;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HistoryEntry].
extension HistoryEntryPatterns on HistoryEntry {
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
    TResult Function(_HistoryEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryEntry() when $default != null:
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
    TResult Function(_HistoryEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryEntry():
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
    TResult? Function(_HistoryEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryEntry() when $default != null:
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
    TResult Function(double timestamp, Map<String, int> data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryEntry() when $default != null:
        return $default(_that.timestamp, _that.data);
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
    TResult Function(double timestamp, Map<String, int> data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryEntry():
        return $default(_that.timestamp, _that.data);
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
    TResult? Function(double timestamp, Map<String, int> data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryEntry() when $default != null:
        return $default(_that.timestamp, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HistoryEntry implements HistoryEntry {
  const _HistoryEntry(
      {required this.timestamp, required final Map<String, int> data})
      : _data = data;
  factory _HistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntryFromJson(json);

  @override
  final double timestamp;
  final Map<String, int> _data;
  @override
  Map<String, int> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryEntryCopyWith<_HistoryEntry> get copyWith =>
      __$HistoryEntryCopyWithImpl<_HistoryEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HistoryEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryEntry &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'HistoryEntry(timestamp: $timestamp, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$HistoryEntryCopyWith<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  factory _$HistoryEntryCopyWith(
          _HistoryEntry value, $Res Function(_HistoryEntry) _then) =
      __$HistoryEntryCopyWithImpl;
  @override
  @useResult
  $Res call({double timestamp, Map<String, int> data});
}

/// @nodoc
class __$HistoryEntryCopyWithImpl<$Res>
    implements _$HistoryEntryCopyWith<$Res> {
  __$HistoryEntryCopyWithImpl(this._self, this._then);

  final _HistoryEntry _self;
  final $Res Function(_HistoryEntry) _then;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timestamp = null,
    Object? data = null,
  }) {
    return _then(_HistoryEntry(
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

// dart format on
