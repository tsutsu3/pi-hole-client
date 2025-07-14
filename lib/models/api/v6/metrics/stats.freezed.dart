// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatsSummary {
  Queries get queries;
  Clients get clients;
  Gravity get gravity;
  double get took;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatsSummaryCopyWith<StatsSummary> get copyWith =>
      _$StatsSummaryCopyWithImpl<StatsSummary>(
          this as StatsSummary, _$identity);

  /// Serializes this StatsSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatsSummary &&
            (identical(other.queries, queries) || other.queries == queries) &&
            (identical(other.clients, clients) || other.clients == clients) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, queries, clients, gravity, took);

  @override
  String toString() {
    return 'StatsSummary(queries: $queries, clients: $clients, gravity: $gravity, took: $took)';
  }
}

/// @nodoc
abstract mixin class $StatsSummaryCopyWith<$Res> {
  factory $StatsSummaryCopyWith(
          StatsSummary value, $Res Function(StatsSummary) _then) =
      _$StatsSummaryCopyWithImpl;
  @useResult
  $Res call({Queries queries, Clients clients, Gravity gravity, double took});

  $QueriesCopyWith<$Res> get queries;
  $ClientsCopyWith<$Res> get clients;
  $GravityCopyWith<$Res> get gravity;
}

/// @nodoc
class _$StatsSummaryCopyWithImpl<$Res> implements $StatsSummaryCopyWith<$Res> {
  _$StatsSummaryCopyWithImpl(this._self, this._then);

  final StatsSummary _self;
  final $Res Function(StatsSummary) _then;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queries = null,
    Object? clients = null,
    Object? gravity = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      queries: null == queries
          ? _self.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as Queries,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as Gravity,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueriesCopyWith<$Res> get queries {
    return $QueriesCopyWith<$Res>(_self.queries, (value) {
      return _then(_self.copyWith(queries: value));
    });
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res> get clients {
    return $ClientsCopyWith<$Res>(_self.clients, (value) {
      return _then(_self.copyWith(clients: value));
    });
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityCopyWith<$Res> get gravity {
    return $GravityCopyWith<$Res>(_self.gravity, (value) {
      return _then(_self.copyWith(gravity: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StatsSummary].
extension StatsSummaryPatterns on StatsSummary {
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
    TResult Function(_StatsSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsSummary() when $default != null:
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
    TResult Function(_StatsSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsSummary():
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
    TResult? Function(_StatsSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsSummary() when $default != null:
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
            Queries queries, Clients clients, Gravity gravity, double took)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsSummary() when $default != null:
        return $default(
            _that.queries, _that.clients, _that.gravity, _that.took);
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
            Queries queries, Clients clients, Gravity gravity, double took)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsSummary():
        return $default(
            _that.queries, _that.clients, _that.gravity, _that.took);
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
            Queries queries, Clients clients, Gravity gravity, double took)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsSummary() when $default != null:
        return $default(
            _that.queries, _that.clients, _that.gravity, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StatsSummary implements StatsSummary {
  const _StatsSummary(
      {required this.queries,
      required this.clients,
      required this.gravity,
      required this.took});
  factory _StatsSummary.fromJson(Map<String, dynamic> json) =>
      _$StatsSummaryFromJson(json);

  @override
  final Queries queries;
  @override
  final Clients clients;
  @override
  final Gravity gravity;
  @override
  final double took;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatsSummaryCopyWith<_StatsSummary> get copyWith =>
      __$StatsSummaryCopyWithImpl<_StatsSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatsSummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatsSummary &&
            (identical(other.queries, queries) || other.queries == queries) &&
            (identical(other.clients, clients) || other.clients == clients) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, queries, clients, gravity, took);

  @override
  String toString() {
    return 'StatsSummary(queries: $queries, clients: $clients, gravity: $gravity, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$StatsSummaryCopyWith<$Res>
    implements $StatsSummaryCopyWith<$Res> {
  factory _$StatsSummaryCopyWith(
          _StatsSummary value, $Res Function(_StatsSummary) _then) =
      __$StatsSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({Queries queries, Clients clients, Gravity gravity, double took});

  @override
  $QueriesCopyWith<$Res> get queries;
  @override
  $ClientsCopyWith<$Res> get clients;
  @override
  $GravityCopyWith<$Res> get gravity;
}

/// @nodoc
class __$StatsSummaryCopyWithImpl<$Res>
    implements _$StatsSummaryCopyWith<$Res> {
  __$StatsSummaryCopyWithImpl(this._self, this._then);

  final _StatsSummary _self;
  final $Res Function(_StatsSummary) _then;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? queries = null,
    Object? clients = null,
    Object? gravity = null,
    Object? took = null,
  }) {
    return _then(_StatsSummary(
      queries: null == queries
          ? _self.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as Queries,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as Gravity,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueriesCopyWith<$Res> get queries {
    return $QueriesCopyWith<$Res>(_self.queries, (value) {
      return _then(_self.copyWith(queries: value));
    });
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res> get clients {
    return $ClientsCopyWith<$Res>(_self.clients, (value) {
      return _then(_self.copyWith(clients: value));
    });
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityCopyWith<$Res> get gravity {
    return $GravityCopyWith<$Res>(_self.gravity, (value) {
      return _then(_self.copyWith(gravity: value));
    });
  }
}

/// @nodoc
mixin _$Queries {
  int get total;
  int get blocked;
  @JsonKey(name: 'percent_blocked')
  double get percentBlocked;
  @JsonKey(name: 'unique_domains')
  int get uniqueDomains;
  int get forwarded;
  int get cached;
  Types get types;
  Status get status;
  Replies get replies;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueriesCopyWith<Queries> get copyWith =>
      _$QueriesCopyWithImpl<Queries>(this as Queries, _$identity);

  /// Serializes this Queries to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Queries &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.percentBlocked, percentBlocked) ||
                other.percentBlocked == percentBlocked) &&
            (identical(other.uniqueDomains, uniqueDomains) ||
                other.uniqueDomains == uniqueDomains) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.types, types) || other.types == types) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.replies, replies) || other.replies == replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, blocked, percentBlocked,
      uniqueDomains, forwarded, cached, types, status, replies);

  @override
  String toString() {
    return 'Queries(total: $total, blocked: $blocked, percentBlocked: $percentBlocked, uniqueDomains: $uniqueDomains, forwarded: $forwarded, cached: $cached, types: $types, status: $status, replies: $replies)';
  }
}

/// @nodoc
abstract mixin class $QueriesCopyWith<$Res> {
  factory $QueriesCopyWith(Queries value, $Res Function(Queries) _then) =
      _$QueriesCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int blocked,
      @JsonKey(name: 'percent_blocked') double percentBlocked,
      @JsonKey(name: 'unique_domains') int uniqueDomains,
      int forwarded,
      int cached,
      Types types,
      Status status,
      Replies replies});

  $TypesCopyWith<$Res> get types;
  $StatusCopyWith<$Res> get status;
  $RepliesCopyWith<$Res> get replies;
}

/// @nodoc
class _$QueriesCopyWithImpl<$Res> implements $QueriesCopyWith<$Res> {
  _$QueriesCopyWithImpl(this._self, this._then);

  final Queries _self;
  final $Res Function(Queries) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? blocked = null,
    Object? percentBlocked = null,
    Object? uniqueDomains = null,
    Object? forwarded = null,
    Object? cached = null,
    Object? types = null,
    Object? status = null,
    Object? replies = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      percentBlocked: null == percentBlocked
          ? _self.percentBlocked
          : percentBlocked // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueDomains: null == uniqueDomains
          ? _self.uniqueDomains
          : uniqueDomains // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _self.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as Types,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as Replies,
    ));
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypesCopyWith<$Res> get types {
    return $TypesCopyWith<$Res>(_self.types, (value) {
      return _then(_self.copyWith(types: value));
    });
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepliesCopyWith<$Res> get replies {
    return $RepliesCopyWith<$Res>(_self.replies, (value) {
      return _then(_self.copyWith(replies: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Queries].
extension QueriesPatterns on Queries {
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
    TResult Function(_Queries value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
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
    TResult Function(_Queries value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries():
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
    TResult? Function(_Queries value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
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
            int total,
            int blocked,
            @JsonKey(name: 'percent_blocked') double percentBlocked,
            @JsonKey(name: 'unique_domains') int uniqueDomains,
            int forwarded,
            int cached,
            Types types,
            Status status,
            Replies replies)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
        return $default(
            _that.total,
            _that.blocked,
            _that.percentBlocked,
            _that.uniqueDomains,
            _that.forwarded,
            _that.cached,
            _that.types,
            _that.status,
            _that.replies);
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
            int total,
            int blocked,
            @JsonKey(name: 'percent_blocked') double percentBlocked,
            @JsonKey(name: 'unique_domains') int uniqueDomains,
            int forwarded,
            int cached,
            Types types,
            Status status,
            Replies replies)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries():
        return $default(
            _that.total,
            _that.blocked,
            _that.percentBlocked,
            _that.uniqueDomains,
            _that.forwarded,
            _that.cached,
            _that.types,
            _that.status,
            _that.replies);
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
            int total,
            int blocked,
            @JsonKey(name: 'percent_blocked') double percentBlocked,
            @JsonKey(name: 'unique_domains') int uniqueDomains,
            int forwarded,
            int cached,
            Types types,
            Status status,
            Replies replies)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
        return $default(
            _that.total,
            _that.blocked,
            _that.percentBlocked,
            _that.uniqueDomains,
            _that.forwarded,
            _that.cached,
            _that.types,
            _that.status,
            _that.replies);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Queries implements Queries {
  const _Queries(
      {required this.total,
      required this.blocked,
      @JsonKey(name: 'percent_blocked') required this.percentBlocked,
      @JsonKey(name: 'unique_domains') required this.uniqueDomains,
      required this.forwarded,
      required this.cached,
      required this.types,
      required this.status,
      required this.replies});
  factory _Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);

  @override
  final int total;
  @override
  final int blocked;
  @override
  @JsonKey(name: 'percent_blocked')
  final double percentBlocked;
  @override
  @JsonKey(name: 'unique_domains')
  final int uniqueDomains;
  @override
  final int forwarded;
  @override
  final int cached;
  @override
  final Types types;
  @override
  final Status status;
  @override
  final Replies replies;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueriesCopyWith<_Queries> get copyWith =>
      __$QueriesCopyWithImpl<_Queries>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueriesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Queries &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.percentBlocked, percentBlocked) ||
                other.percentBlocked == percentBlocked) &&
            (identical(other.uniqueDomains, uniqueDomains) ||
                other.uniqueDomains == uniqueDomains) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.types, types) || other.types == types) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.replies, replies) || other.replies == replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, blocked, percentBlocked,
      uniqueDomains, forwarded, cached, types, status, replies);

  @override
  String toString() {
    return 'Queries(total: $total, blocked: $blocked, percentBlocked: $percentBlocked, uniqueDomains: $uniqueDomains, forwarded: $forwarded, cached: $cached, types: $types, status: $status, replies: $replies)';
  }
}

/// @nodoc
abstract mixin class _$QueriesCopyWith<$Res> implements $QueriesCopyWith<$Res> {
  factory _$QueriesCopyWith(_Queries value, $Res Function(_Queries) _then) =
      __$QueriesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int blocked,
      @JsonKey(name: 'percent_blocked') double percentBlocked,
      @JsonKey(name: 'unique_domains') int uniqueDomains,
      int forwarded,
      int cached,
      Types types,
      Status status,
      Replies replies});

  @override
  $TypesCopyWith<$Res> get types;
  @override
  $StatusCopyWith<$Res> get status;
  @override
  $RepliesCopyWith<$Res> get replies;
}

/// @nodoc
class __$QueriesCopyWithImpl<$Res> implements _$QueriesCopyWith<$Res> {
  __$QueriesCopyWithImpl(this._self, this._then);

  final _Queries _self;
  final $Res Function(_Queries) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? blocked = null,
    Object? percentBlocked = null,
    Object? uniqueDomains = null,
    Object? forwarded = null,
    Object? cached = null,
    Object? types = null,
    Object? status = null,
    Object? replies = null,
  }) {
    return _then(_Queries(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      percentBlocked: null == percentBlocked
          ? _self.percentBlocked
          : percentBlocked // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueDomains: null == uniqueDomains
          ? _self.uniqueDomains
          : uniqueDomains // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _self.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as Types,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as Replies,
    ));
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypesCopyWith<$Res> get types {
    return $TypesCopyWith<$Res>(_self.types, (value) {
      return _then(_self.copyWith(types: value));
    });
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepliesCopyWith<$Res> get replies {
    return $RepliesCopyWith<$Res>(_self.replies, (value) {
      return _then(_self.copyWith(replies: value));
    });
  }
}

/// @nodoc
mixin _$Types {
  @JsonKey(name: 'A')
  int get a;
  @JsonKey(name: 'AAAA')
  int get aaaa;
  @JsonKey(name: 'ANY')
  int get any;
  @JsonKey(name: 'SRV')
  int get srv;
  @JsonKey(name: 'SOA')
  int get soa;
  @JsonKey(name: 'PTR')
  int get ptr;
  @JsonKey(name: 'TXT')
  int get txt;
  @JsonKey(name: 'NAPTR')
  int get naptr;
  @JsonKey(name: 'MX')
  int get mx;
  @JsonKey(name: 'DS')
  int get ds;
  @JsonKey(name: 'RRSIG')
  int get rrsig;
  @JsonKey(name: 'DNSKEY')
  int get dnskey;
  @JsonKey(name: 'NS')
  int get ns;
  @JsonKey(name: 'SVCB')
  int get svcb;
  @JsonKey(name: 'HTTPS')
  int get https;
  @JsonKey(name: 'OTHER')
  int get other;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TypesCopyWith<Types> get copyWith =>
      _$TypesCopyWithImpl<Types>(this as Types, _$identity);

  /// Serializes this Types to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Types &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.aaaa, aaaa) || other.aaaa == aaaa) &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.srv, srv) || other.srv == srv) &&
            (identical(other.soa, soa) || other.soa == soa) &&
            (identical(other.ptr, ptr) || other.ptr == ptr) &&
            (identical(other.txt, txt) || other.txt == txt) &&
            (identical(other.naptr, naptr) || other.naptr == naptr) &&
            (identical(other.mx, mx) || other.mx == mx) &&
            (identical(other.ds, ds) || other.ds == ds) &&
            (identical(other.rrsig, rrsig) || other.rrsig == rrsig) &&
            (identical(other.dnskey, dnskey) || other.dnskey == dnskey) &&
            (identical(other.ns, ns) || other.ns == ns) &&
            (identical(other.svcb, svcb) || other.svcb == svcb) &&
            (identical(other.https, https) || other.https == https) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, aaaa, any, srv, soa, ptr, txt,
      naptr, mx, ds, rrsig, dnskey, ns, svcb, https, other);

  @override
  String toString() {
    return 'Types(a: $a, aaaa: $aaaa, any: $any, srv: $srv, soa: $soa, ptr: $ptr, txt: $txt, naptr: $naptr, mx: $mx, ds: $ds, rrsig: $rrsig, dnskey: $dnskey, ns: $ns, svcb: $svcb, https: $https, other: $other)';
  }
}

/// @nodoc
abstract mixin class $TypesCopyWith<$Res> {
  factory $TypesCopyWith(Types value, $Res Function(Types) _then) =
      _$TypesCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'A') int a,
      @JsonKey(name: 'AAAA') int aaaa,
      @JsonKey(name: 'ANY') int any,
      @JsonKey(name: 'SRV') int srv,
      @JsonKey(name: 'SOA') int soa,
      @JsonKey(name: 'PTR') int ptr,
      @JsonKey(name: 'TXT') int txt,
      @JsonKey(name: 'NAPTR') int naptr,
      @JsonKey(name: 'MX') int mx,
      @JsonKey(name: 'DS') int ds,
      @JsonKey(name: 'RRSIG') int rrsig,
      @JsonKey(name: 'DNSKEY') int dnskey,
      @JsonKey(name: 'NS') int ns,
      @JsonKey(name: 'SVCB') int svcb,
      @JsonKey(name: 'HTTPS') int https,
      @JsonKey(name: 'OTHER') int other});
}

/// @nodoc
class _$TypesCopyWithImpl<$Res> implements $TypesCopyWith<$Res> {
  _$TypesCopyWithImpl(this._self, this._then);

  final Types _self;
  final $Res Function(Types) _then;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? aaaa = null,
    Object? any = null,
    Object? srv = null,
    Object? soa = null,
    Object? ptr = null,
    Object? txt = null,
    Object? naptr = null,
    Object? mx = null,
    Object? ds = null,
    Object? rrsig = null,
    Object? dnskey = null,
    Object? ns = null,
    Object? svcb = null,
    Object? https = null,
    Object? other = null,
  }) {
    return _then(_self.copyWith(
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      aaaa: null == aaaa
          ? _self.aaaa
          : aaaa // ignore: cast_nullable_to_non_nullable
              as int,
      any: null == any
          ? _self.any
          : any // ignore: cast_nullable_to_non_nullable
              as int,
      srv: null == srv
          ? _self.srv
          : srv // ignore: cast_nullable_to_non_nullable
              as int,
      soa: null == soa
          ? _self.soa
          : soa // ignore: cast_nullable_to_non_nullable
              as int,
      ptr: null == ptr
          ? _self.ptr
          : ptr // ignore: cast_nullable_to_non_nullable
              as int,
      txt: null == txt
          ? _self.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as int,
      naptr: null == naptr
          ? _self.naptr
          : naptr // ignore: cast_nullable_to_non_nullable
              as int,
      mx: null == mx
          ? _self.mx
          : mx // ignore: cast_nullable_to_non_nullable
              as int,
      ds: null == ds
          ? _self.ds
          : ds // ignore: cast_nullable_to_non_nullable
              as int,
      rrsig: null == rrsig
          ? _self.rrsig
          : rrsig // ignore: cast_nullable_to_non_nullable
              as int,
      dnskey: null == dnskey
          ? _self.dnskey
          : dnskey // ignore: cast_nullable_to_non_nullable
              as int,
      ns: null == ns
          ? _self.ns
          : ns // ignore: cast_nullable_to_non_nullable
              as int,
      svcb: null == svcb
          ? _self.svcb
          : svcb // ignore: cast_nullable_to_non_nullable
              as int,
      https: null == https
          ? _self.https
          : https // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Types].
extension TypesPatterns on Types {
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
    TResult Function(_Types value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Types() when $default != null:
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
    TResult Function(_Types value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Types():
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
    TResult? Function(_Types value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Types() when $default != null:
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
            @JsonKey(name: 'A') int a,
            @JsonKey(name: 'AAAA') int aaaa,
            @JsonKey(name: 'ANY') int any,
            @JsonKey(name: 'SRV') int srv,
            @JsonKey(name: 'SOA') int soa,
            @JsonKey(name: 'PTR') int ptr,
            @JsonKey(name: 'TXT') int txt,
            @JsonKey(name: 'NAPTR') int naptr,
            @JsonKey(name: 'MX') int mx,
            @JsonKey(name: 'DS') int ds,
            @JsonKey(name: 'RRSIG') int rrsig,
            @JsonKey(name: 'DNSKEY') int dnskey,
            @JsonKey(name: 'NS') int ns,
            @JsonKey(name: 'SVCB') int svcb,
            @JsonKey(name: 'HTTPS') int https,
            @JsonKey(name: 'OTHER') int other)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Types() when $default != null:
        return $default(
            _that.a,
            _that.aaaa,
            _that.any,
            _that.srv,
            _that.soa,
            _that.ptr,
            _that.txt,
            _that.naptr,
            _that.mx,
            _that.ds,
            _that.rrsig,
            _that.dnskey,
            _that.ns,
            _that.svcb,
            _that.https,
            _that.other);
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
            @JsonKey(name: 'A') int a,
            @JsonKey(name: 'AAAA') int aaaa,
            @JsonKey(name: 'ANY') int any,
            @JsonKey(name: 'SRV') int srv,
            @JsonKey(name: 'SOA') int soa,
            @JsonKey(name: 'PTR') int ptr,
            @JsonKey(name: 'TXT') int txt,
            @JsonKey(name: 'NAPTR') int naptr,
            @JsonKey(name: 'MX') int mx,
            @JsonKey(name: 'DS') int ds,
            @JsonKey(name: 'RRSIG') int rrsig,
            @JsonKey(name: 'DNSKEY') int dnskey,
            @JsonKey(name: 'NS') int ns,
            @JsonKey(name: 'SVCB') int svcb,
            @JsonKey(name: 'HTTPS') int https,
            @JsonKey(name: 'OTHER') int other)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Types():
        return $default(
            _that.a,
            _that.aaaa,
            _that.any,
            _that.srv,
            _that.soa,
            _that.ptr,
            _that.txt,
            _that.naptr,
            _that.mx,
            _that.ds,
            _that.rrsig,
            _that.dnskey,
            _that.ns,
            _that.svcb,
            _that.https,
            _that.other);
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
            @JsonKey(name: 'A') int a,
            @JsonKey(name: 'AAAA') int aaaa,
            @JsonKey(name: 'ANY') int any,
            @JsonKey(name: 'SRV') int srv,
            @JsonKey(name: 'SOA') int soa,
            @JsonKey(name: 'PTR') int ptr,
            @JsonKey(name: 'TXT') int txt,
            @JsonKey(name: 'NAPTR') int naptr,
            @JsonKey(name: 'MX') int mx,
            @JsonKey(name: 'DS') int ds,
            @JsonKey(name: 'RRSIG') int rrsig,
            @JsonKey(name: 'DNSKEY') int dnskey,
            @JsonKey(name: 'NS') int ns,
            @JsonKey(name: 'SVCB') int svcb,
            @JsonKey(name: 'HTTPS') int https,
            @JsonKey(name: 'OTHER') int other)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Types() when $default != null:
        return $default(
            _that.a,
            _that.aaaa,
            _that.any,
            _that.srv,
            _that.soa,
            _that.ptr,
            _that.txt,
            _that.naptr,
            _that.mx,
            _that.ds,
            _that.rrsig,
            _that.dnskey,
            _that.ns,
            _that.svcb,
            _that.https,
            _that.other);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Types implements Types {
  const _Types(
      {@JsonKey(name: 'A') required this.a,
      @JsonKey(name: 'AAAA') required this.aaaa,
      @JsonKey(name: 'ANY') required this.any,
      @JsonKey(name: 'SRV') required this.srv,
      @JsonKey(name: 'SOA') required this.soa,
      @JsonKey(name: 'PTR') required this.ptr,
      @JsonKey(name: 'TXT') required this.txt,
      @JsonKey(name: 'NAPTR') required this.naptr,
      @JsonKey(name: 'MX') required this.mx,
      @JsonKey(name: 'DS') required this.ds,
      @JsonKey(name: 'RRSIG') required this.rrsig,
      @JsonKey(name: 'DNSKEY') required this.dnskey,
      @JsonKey(name: 'NS') required this.ns,
      @JsonKey(name: 'SVCB') required this.svcb,
      @JsonKey(name: 'HTTPS') required this.https,
      @JsonKey(name: 'OTHER') required this.other});
  factory _Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  @override
  @JsonKey(name: 'A')
  final int a;
  @override
  @JsonKey(name: 'AAAA')
  final int aaaa;
  @override
  @JsonKey(name: 'ANY')
  final int any;
  @override
  @JsonKey(name: 'SRV')
  final int srv;
  @override
  @JsonKey(name: 'SOA')
  final int soa;
  @override
  @JsonKey(name: 'PTR')
  final int ptr;
  @override
  @JsonKey(name: 'TXT')
  final int txt;
  @override
  @JsonKey(name: 'NAPTR')
  final int naptr;
  @override
  @JsonKey(name: 'MX')
  final int mx;
  @override
  @JsonKey(name: 'DS')
  final int ds;
  @override
  @JsonKey(name: 'RRSIG')
  final int rrsig;
  @override
  @JsonKey(name: 'DNSKEY')
  final int dnskey;
  @override
  @JsonKey(name: 'NS')
  final int ns;
  @override
  @JsonKey(name: 'SVCB')
  final int svcb;
  @override
  @JsonKey(name: 'HTTPS')
  final int https;
  @override
  @JsonKey(name: 'OTHER')
  final int other;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TypesCopyWith<_Types> get copyWith =>
      __$TypesCopyWithImpl<_Types>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TypesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Types &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.aaaa, aaaa) || other.aaaa == aaaa) &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.srv, srv) || other.srv == srv) &&
            (identical(other.soa, soa) || other.soa == soa) &&
            (identical(other.ptr, ptr) || other.ptr == ptr) &&
            (identical(other.txt, txt) || other.txt == txt) &&
            (identical(other.naptr, naptr) || other.naptr == naptr) &&
            (identical(other.mx, mx) || other.mx == mx) &&
            (identical(other.ds, ds) || other.ds == ds) &&
            (identical(other.rrsig, rrsig) || other.rrsig == rrsig) &&
            (identical(other.dnskey, dnskey) || other.dnskey == dnskey) &&
            (identical(other.ns, ns) || other.ns == ns) &&
            (identical(other.svcb, svcb) || other.svcb == svcb) &&
            (identical(other.https, https) || other.https == https) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, aaaa, any, srv, soa, ptr, txt,
      naptr, mx, ds, rrsig, dnskey, ns, svcb, https, other);

  @override
  String toString() {
    return 'Types(a: $a, aaaa: $aaaa, any: $any, srv: $srv, soa: $soa, ptr: $ptr, txt: $txt, naptr: $naptr, mx: $mx, ds: $ds, rrsig: $rrsig, dnskey: $dnskey, ns: $ns, svcb: $svcb, https: $https, other: $other)';
  }
}

/// @nodoc
abstract mixin class _$TypesCopyWith<$Res> implements $TypesCopyWith<$Res> {
  factory _$TypesCopyWith(_Types value, $Res Function(_Types) _then) =
      __$TypesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'A') int a,
      @JsonKey(name: 'AAAA') int aaaa,
      @JsonKey(name: 'ANY') int any,
      @JsonKey(name: 'SRV') int srv,
      @JsonKey(name: 'SOA') int soa,
      @JsonKey(name: 'PTR') int ptr,
      @JsonKey(name: 'TXT') int txt,
      @JsonKey(name: 'NAPTR') int naptr,
      @JsonKey(name: 'MX') int mx,
      @JsonKey(name: 'DS') int ds,
      @JsonKey(name: 'RRSIG') int rrsig,
      @JsonKey(name: 'DNSKEY') int dnskey,
      @JsonKey(name: 'NS') int ns,
      @JsonKey(name: 'SVCB') int svcb,
      @JsonKey(name: 'HTTPS') int https,
      @JsonKey(name: 'OTHER') int other});
}

/// @nodoc
class __$TypesCopyWithImpl<$Res> implements _$TypesCopyWith<$Res> {
  __$TypesCopyWithImpl(this._self, this._then);

  final _Types _self;
  final $Res Function(_Types) _then;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? a = null,
    Object? aaaa = null,
    Object? any = null,
    Object? srv = null,
    Object? soa = null,
    Object? ptr = null,
    Object? txt = null,
    Object? naptr = null,
    Object? mx = null,
    Object? ds = null,
    Object? rrsig = null,
    Object? dnskey = null,
    Object? ns = null,
    Object? svcb = null,
    Object? https = null,
    Object? other = null,
  }) {
    return _then(_Types(
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      aaaa: null == aaaa
          ? _self.aaaa
          : aaaa // ignore: cast_nullable_to_non_nullable
              as int,
      any: null == any
          ? _self.any
          : any // ignore: cast_nullable_to_non_nullable
              as int,
      srv: null == srv
          ? _self.srv
          : srv // ignore: cast_nullable_to_non_nullable
              as int,
      soa: null == soa
          ? _self.soa
          : soa // ignore: cast_nullable_to_non_nullable
              as int,
      ptr: null == ptr
          ? _self.ptr
          : ptr // ignore: cast_nullable_to_non_nullable
              as int,
      txt: null == txt
          ? _self.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as int,
      naptr: null == naptr
          ? _self.naptr
          : naptr // ignore: cast_nullable_to_non_nullable
              as int,
      mx: null == mx
          ? _self.mx
          : mx // ignore: cast_nullable_to_non_nullable
              as int,
      ds: null == ds
          ? _self.ds
          : ds // ignore: cast_nullable_to_non_nullable
              as int,
      rrsig: null == rrsig
          ? _self.rrsig
          : rrsig // ignore: cast_nullable_to_non_nullable
              as int,
      dnskey: null == dnskey
          ? _self.dnskey
          : dnskey // ignore: cast_nullable_to_non_nullable
              as int,
      ns: null == ns
          ? _self.ns
          : ns // ignore: cast_nullable_to_non_nullable
              as int,
      svcb: null == svcb
          ? _self.svcb
          : svcb // ignore: cast_nullable_to_non_nullable
              as int,
      https: null == https
          ? _self.https
          : https // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Status {
  @JsonKey(name: 'UNKNOWN')
  int get unknown;
  @JsonKey(name: 'GRAVITY')
  int get gravity;
  @JsonKey(name: 'FORWARDED')
  int get forwarded;
  @JsonKey(name: 'CACHE')
  int get cache;
  @JsonKey(name: 'REGEX')
  int get regex;
  @JsonKey(name: 'DENYLIST')
  int get denylist;
  @JsonKey(name: 'EXTERNAL_BLOCKED_IP')
  int get externalBlockedIp;
  @JsonKey(name: 'EXTERNAL_BLOCKED_NULL')
  int get externalBlockedNull;
  @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA')
  int get externalBlockedNxra;
  @JsonKey(name: 'GRAVITY_CNAME')
  int get gravityCname;
  @JsonKey(name: 'REGEX_CNAME')
  int get regexCname;
  @JsonKey(name: 'DENYLIST_CNAME')
  int get denylistCname;
  @JsonKey(name: 'RETRIED')
  int get retried;
  @JsonKey(name: 'RETRIED_DNSSEC')
  int get retriedDnssec;
  @JsonKey(name: 'IN_PROGRESS')
  int get inProgress;
  @JsonKey(name: 'DBBUSY')
  int get dbbusy;
  @JsonKey(name: 'SPECIAL_DOMAIN')
  int get specialDomain;
  @JsonKey(name: 'CACHE_STALE')
  int get cacheStale;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatusCopyWith<Status> get copyWith =>
      _$StatusCopyWithImpl<Status>(this as Status, _$identity);

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Status &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.cache, cache) || other.cache == cache) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.denylist, denylist) ||
                other.denylist == denylist) &&
            (identical(other.externalBlockedIp, externalBlockedIp) ||
                other.externalBlockedIp == externalBlockedIp) &&
            (identical(other.externalBlockedNull, externalBlockedNull) ||
                other.externalBlockedNull == externalBlockedNull) &&
            (identical(other.externalBlockedNxra, externalBlockedNxra) ||
                other.externalBlockedNxra == externalBlockedNxra) &&
            (identical(other.gravityCname, gravityCname) ||
                other.gravityCname == gravityCname) &&
            (identical(other.regexCname, regexCname) ||
                other.regexCname == regexCname) &&
            (identical(other.denylistCname, denylistCname) ||
                other.denylistCname == denylistCname) &&
            (identical(other.retried, retried) || other.retried == retried) &&
            (identical(other.retriedDnssec, retriedDnssec) ||
                other.retriedDnssec == retriedDnssec) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.dbbusy, dbbusy) || other.dbbusy == dbbusy) &&
            (identical(other.specialDomain, specialDomain) ||
                other.specialDomain == specialDomain) &&
            (identical(other.cacheStale, cacheStale) ||
                other.cacheStale == cacheStale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      unknown,
      gravity,
      forwarded,
      cache,
      regex,
      denylist,
      externalBlockedIp,
      externalBlockedNull,
      externalBlockedNxra,
      gravityCname,
      regexCname,
      denylistCname,
      retried,
      retriedDnssec,
      inProgress,
      dbbusy,
      specialDomain,
      cacheStale);

  @override
  String toString() {
    return 'Status(unknown: $unknown, gravity: $gravity, forwarded: $forwarded, cache: $cache, regex: $regex, denylist: $denylist, externalBlockedIp: $externalBlockedIp, externalBlockedNull: $externalBlockedNull, externalBlockedNxra: $externalBlockedNxra, gravityCname: $gravityCname, regexCname: $regexCname, denylistCname: $denylistCname, retried: $retried, retriedDnssec: $retriedDnssec, inProgress: $inProgress, dbbusy: $dbbusy, specialDomain: $specialDomain, cacheStale: $cacheStale)';
  }
}

/// @nodoc
abstract mixin class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) _then) =
      _$StatusCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'GRAVITY') int gravity,
      @JsonKey(name: 'FORWARDED') int forwarded,
      @JsonKey(name: 'CACHE') int cache,
      @JsonKey(name: 'REGEX') int regex,
      @JsonKey(name: 'DENYLIST') int denylist,
      @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
      @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
      @JsonKey(name: 'REGEX_CNAME') int regexCname,
      @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
      @JsonKey(name: 'RETRIED') int retried,
      @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
      @JsonKey(name: 'IN_PROGRESS') int inProgress,
      @JsonKey(name: 'DBBUSY') int dbbusy,
      @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
      @JsonKey(name: 'CACHE_STALE') int cacheStale});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._self, this._then);

  final Status _self;
  final $Res Function(Status) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = null,
    Object? gravity = null,
    Object? forwarded = null,
    Object? cache = null,
    Object? regex = null,
    Object? denylist = null,
    Object? externalBlockedIp = null,
    Object? externalBlockedNull = null,
    Object? externalBlockedNxra = null,
    Object? gravityCname = null,
    Object? regexCname = null,
    Object? denylistCname = null,
    Object? retried = null,
    Object? retriedDnssec = null,
    Object? inProgress = null,
    Object? dbbusy = null,
    Object? specialDomain = null,
    Object? cacheStale = null,
  }) {
    return _then(_self.copyWith(
      unknown: null == unknown
          ? _self.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cache: null == cache
          ? _self.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as int,
      regex: null == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as int,
      denylist: null == denylist
          ? _self.denylist
          : denylist // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedIp: null == externalBlockedIp
          ? _self.externalBlockedIp
          : externalBlockedIp // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNull: null == externalBlockedNull
          ? _self.externalBlockedNull
          : externalBlockedNull // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNxra: null == externalBlockedNxra
          ? _self.externalBlockedNxra
          : externalBlockedNxra // ignore: cast_nullable_to_non_nullable
              as int,
      gravityCname: null == gravityCname
          ? _self.gravityCname
          : gravityCname // ignore: cast_nullable_to_non_nullable
              as int,
      regexCname: null == regexCname
          ? _self.regexCname
          : regexCname // ignore: cast_nullable_to_non_nullable
              as int,
      denylistCname: null == denylistCname
          ? _self.denylistCname
          : denylistCname // ignore: cast_nullable_to_non_nullable
              as int,
      retried: null == retried
          ? _self.retried
          : retried // ignore: cast_nullable_to_non_nullable
              as int,
      retriedDnssec: null == retriedDnssec
          ? _self.retriedDnssec
          : retriedDnssec // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _self.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      dbbusy: null == dbbusy
          ? _self.dbbusy
          : dbbusy // ignore: cast_nullable_to_non_nullable
              as int,
      specialDomain: null == specialDomain
          ? _self.specialDomain
          : specialDomain // ignore: cast_nullable_to_non_nullable
              as int,
      cacheStale: null == cacheStale
          ? _self.cacheStale
          : cacheStale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Status].
extension StatusPatterns on Status {
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
    TResult Function(_Status value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
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
    TResult Function(_Status value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status():
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
    TResult? Function(_Status value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
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
            @JsonKey(name: 'UNKNOWN') int unknown,
            @JsonKey(name: 'GRAVITY') int gravity,
            @JsonKey(name: 'FORWARDED') int forwarded,
            @JsonKey(name: 'CACHE') int cache,
            @JsonKey(name: 'REGEX') int regex,
            @JsonKey(name: 'DENYLIST') int denylist,
            @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
            @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
            @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
            @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
            @JsonKey(name: 'REGEX_CNAME') int regexCname,
            @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
            @JsonKey(name: 'RETRIED') int retried,
            @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
            @JsonKey(name: 'IN_PROGRESS') int inProgress,
            @JsonKey(name: 'DBBUSY') int dbbusy,
            @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
            @JsonKey(name: 'CACHE_STALE') int cacheStale)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
        return $default(
            _that.unknown,
            _that.gravity,
            _that.forwarded,
            _that.cache,
            _that.regex,
            _that.denylist,
            _that.externalBlockedIp,
            _that.externalBlockedNull,
            _that.externalBlockedNxra,
            _that.gravityCname,
            _that.regexCname,
            _that.denylistCname,
            _that.retried,
            _that.retriedDnssec,
            _that.inProgress,
            _that.dbbusy,
            _that.specialDomain,
            _that.cacheStale);
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
            @JsonKey(name: 'UNKNOWN') int unknown,
            @JsonKey(name: 'GRAVITY') int gravity,
            @JsonKey(name: 'FORWARDED') int forwarded,
            @JsonKey(name: 'CACHE') int cache,
            @JsonKey(name: 'REGEX') int regex,
            @JsonKey(name: 'DENYLIST') int denylist,
            @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
            @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
            @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
            @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
            @JsonKey(name: 'REGEX_CNAME') int regexCname,
            @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
            @JsonKey(name: 'RETRIED') int retried,
            @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
            @JsonKey(name: 'IN_PROGRESS') int inProgress,
            @JsonKey(name: 'DBBUSY') int dbbusy,
            @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
            @JsonKey(name: 'CACHE_STALE') int cacheStale)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status():
        return $default(
            _that.unknown,
            _that.gravity,
            _that.forwarded,
            _that.cache,
            _that.regex,
            _that.denylist,
            _that.externalBlockedIp,
            _that.externalBlockedNull,
            _that.externalBlockedNxra,
            _that.gravityCname,
            _that.regexCname,
            _that.denylistCname,
            _that.retried,
            _that.retriedDnssec,
            _that.inProgress,
            _that.dbbusy,
            _that.specialDomain,
            _that.cacheStale);
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
            @JsonKey(name: 'UNKNOWN') int unknown,
            @JsonKey(name: 'GRAVITY') int gravity,
            @JsonKey(name: 'FORWARDED') int forwarded,
            @JsonKey(name: 'CACHE') int cache,
            @JsonKey(name: 'REGEX') int regex,
            @JsonKey(name: 'DENYLIST') int denylist,
            @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
            @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
            @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
            @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
            @JsonKey(name: 'REGEX_CNAME') int regexCname,
            @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
            @JsonKey(name: 'RETRIED') int retried,
            @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
            @JsonKey(name: 'IN_PROGRESS') int inProgress,
            @JsonKey(name: 'DBBUSY') int dbbusy,
            @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
            @JsonKey(name: 'CACHE_STALE') int cacheStale)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
        return $default(
            _that.unknown,
            _that.gravity,
            _that.forwarded,
            _that.cache,
            _that.regex,
            _that.denylist,
            _that.externalBlockedIp,
            _that.externalBlockedNull,
            _that.externalBlockedNxra,
            _that.gravityCname,
            _that.regexCname,
            _that.denylistCname,
            _that.retried,
            _that.retriedDnssec,
            _that.inProgress,
            _that.dbbusy,
            _that.specialDomain,
            _that.cacheStale);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Status implements Status {
  const _Status(
      {@JsonKey(name: 'UNKNOWN') required this.unknown,
      @JsonKey(name: 'GRAVITY') required this.gravity,
      @JsonKey(name: 'FORWARDED') required this.forwarded,
      @JsonKey(name: 'CACHE') required this.cache,
      @JsonKey(name: 'REGEX') required this.regex,
      @JsonKey(name: 'DENYLIST') required this.denylist,
      @JsonKey(name: 'EXTERNAL_BLOCKED_IP') required this.externalBlockedIp,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') required this.externalBlockedNull,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') required this.externalBlockedNxra,
      @JsonKey(name: 'GRAVITY_CNAME') required this.gravityCname,
      @JsonKey(name: 'REGEX_CNAME') required this.regexCname,
      @JsonKey(name: 'DENYLIST_CNAME') required this.denylistCname,
      @JsonKey(name: 'RETRIED') required this.retried,
      @JsonKey(name: 'RETRIED_DNSSEC') required this.retriedDnssec,
      @JsonKey(name: 'IN_PROGRESS') required this.inProgress,
      @JsonKey(name: 'DBBUSY') required this.dbbusy,
      @JsonKey(name: 'SPECIAL_DOMAIN') required this.specialDomain,
      @JsonKey(name: 'CACHE_STALE') required this.cacheStale});
  factory _Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  @override
  @JsonKey(name: 'UNKNOWN')
  final int unknown;
  @override
  @JsonKey(name: 'GRAVITY')
  final int gravity;
  @override
  @JsonKey(name: 'FORWARDED')
  final int forwarded;
  @override
  @JsonKey(name: 'CACHE')
  final int cache;
  @override
  @JsonKey(name: 'REGEX')
  final int regex;
  @override
  @JsonKey(name: 'DENYLIST')
  final int denylist;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_IP')
  final int externalBlockedIp;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_NULL')
  final int externalBlockedNull;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA')
  final int externalBlockedNxra;
  @override
  @JsonKey(name: 'GRAVITY_CNAME')
  final int gravityCname;
  @override
  @JsonKey(name: 'REGEX_CNAME')
  final int regexCname;
  @override
  @JsonKey(name: 'DENYLIST_CNAME')
  final int denylistCname;
  @override
  @JsonKey(name: 'RETRIED')
  final int retried;
  @override
  @JsonKey(name: 'RETRIED_DNSSEC')
  final int retriedDnssec;
  @override
  @JsonKey(name: 'IN_PROGRESS')
  final int inProgress;
  @override
  @JsonKey(name: 'DBBUSY')
  final int dbbusy;
  @override
  @JsonKey(name: 'SPECIAL_DOMAIN')
  final int specialDomain;
  @override
  @JsonKey(name: 'CACHE_STALE')
  final int cacheStale;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatusCopyWith<_Status> get copyWith =>
      __$StatusCopyWithImpl<_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Status &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.cache, cache) || other.cache == cache) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.denylist, denylist) ||
                other.denylist == denylist) &&
            (identical(other.externalBlockedIp, externalBlockedIp) ||
                other.externalBlockedIp == externalBlockedIp) &&
            (identical(other.externalBlockedNull, externalBlockedNull) ||
                other.externalBlockedNull == externalBlockedNull) &&
            (identical(other.externalBlockedNxra, externalBlockedNxra) ||
                other.externalBlockedNxra == externalBlockedNxra) &&
            (identical(other.gravityCname, gravityCname) ||
                other.gravityCname == gravityCname) &&
            (identical(other.regexCname, regexCname) ||
                other.regexCname == regexCname) &&
            (identical(other.denylistCname, denylistCname) ||
                other.denylistCname == denylistCname) &&
            (identical(other.retried, retried) || other.retried == retried) &&
            (identical(other.retriedDnssec, retriedDnssec) ||
                other.retriedDnssec == retriedDnssec) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.dbbusy, dbbusy) || other.dbbusy == dbbusy) &&
            (identical(other.specialDomain, specialDomain) ||
                other.specialDomain == specialDomain) &&
            (identical(other.cacheStale, cacheStale) ||
                other.cacheStale == cacheStale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      unknown,
      gravity,
      forwarded,
      cache,
      regex,
      denylist,
      externalBlockedIp,
      externalBlockedNull,
      externalBlockedNxra,
      gravityCname,
      regexCname,
      denylistCname,
      retried,
      retriedDnssec,
      inProgress,
      dbbusy,
      specialDomain,
      cacheStale);

  @override
  String toString() {
    return 'Status(unknown: $unknown, gravity: $gravity, forwarded: $forwarded, cache: $cache, regex: $regex, denylist: $denylist, externalBlockedIp: $externalBlockedIp, externalBlockedNull: $externalBlockedNull, externalBlockedNxra: $externalBlockedNxra, gravityCname: $gravityCname, regexCname: $regexCname, denylistCname: $denylistCname, retried: $retried, retriedDnssec: $retriedDnssec, inProgress: $inProgress, dbbusy: $dbbusy, specialDomain: $specialDomain, cacheStale: $cacheStale)';
  }
}

/// @nodoc
abstract mixin class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) _then) =
      __$StatusCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'GRAVITY') int gravity,
      @JsonKey(name: 'FORWARDED') int forwarded,
      @JsonKey(name: 'CACHE') int cache,
      @JsonKey(name: 'REGEX') int regex,
      @JsonKey(name: 'DENYLIST') int denylist,
      @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
      @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
      @JsonKey(name: 'REGEX_CNAME') int regexCname,
      @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
      @JsonKey(name: 'RETRIED') int retried,
      @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
      @JsonKey(name: 'IN_PROGRESS') int inProgress,
      @JsonKey(name: 'DBBUSY') int dbbusy,
      @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
      @JsonKey(name: 'CACHE_STALE') int cacheStale});
}

/// @nodoc
class __$StatusCopyWithImpl<$Res> implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(this._self, this._then);

  final _Status _self;
  final $Res Function(_Status) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unknown = null,
    Object? gravity = null,
    Object? forwarded = null,
    Object? cache = null,
    Object? regex = null,
    Object? denylist = null,
    Object? externalBlockedIp = null,
    Object? externalBlockedNull = null,
    Object? externalBlockedNxra = null,
    Object? gravityCname = null,
    Object? regexCname = null,
    Object? denylistCname = null,
    Object? retried = null,
    Object? retriedDnssec = null,
    Object? inProgress = null,
    Object? dbbusy = null,
    Object? specialDomain = null,
    Object? cacheStale = null,
  }) {
    return _then(_Status(
      unknown: null == unknown
          ? _self.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cache: null == cache
          ? _self.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as int,
      regex: null == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as int,
      denylist: null == denylist
          ? _self.denylist
          : denylist // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedIp: null == externalBlockedIp
          ? _self.externalBlockedIp
          : externalBlockedIp // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNull: null == externalBlockedNull
          ? _self.externalBlockedNull
          : externalBlockedNull // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNxra: null == externalBlockedNxra
          ? _self.externalBlockedNxra
          : externalBlockedNxra // ignore: cast_nullable_to_non_nullable
              as int,
      gravityCname: null == gravityCname
          ? _self.gravityCname
          : gravityCname // ignore: cast_nullable_to_non_nullable
              as int,
      regexCname: null == regexCname
          ? _self.regexCname
          : regexCname // ignore: cast_nullable_to_non_nullable
              as int,
      denylistCname: null == denylistCname
          ? _self.denylistCname
          : denylistCname // ignore: cast_nullable_to_non_nullable
              as int,
      retried: null == retried
          ? _self.retried
          : retried // ignore: cast_nullable_to_non_nullable
              as int,
      retriedDnssec: null == retriedDnssec
          ? _self.retriedDnssec
          : retriedDnssec // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _self.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      dbbusy: null == dbbusy
          ? _self.dbbusy
          : dbbusy // ignore: cast_nullable_to_non_nullable
              as int,
      specialDomain: null == specialDomain
          ? _self.specialDomain
          : specialDomain // ignore: cast_nullable_to_non_nullable
              as int,
      cacheStale: null == cacheStale
          ? _self.cacheStale
          : cacheStale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Replies {
  @JsonKey(name: 'UNKNOWN')
  int get unknown;
  @JsonKey(name: 'NODATA')
  int get nodata;
  @JsonKey(name: 'NXDOMAIN')
  int get nxdomain;
  @JsonKey(name: 'CNAME')
  int get cname;
  @JsonKey(name: 'IP')
  int get ip;
  @JsonKey(name: 'DOMAIN')
  int get domain;
  @JsonKey(name: 'RRNAME')
  int get rrname;
  @JsonKey(name: 'SERVFAIL')
  int get servfail;
  @JsonKey(name: 'REFUSED')
  int get refused;
  @JsonKey(name: 'NOTIMP')
  int get notimp;
  @JsonKey(name: 'OTHER')
  int get other;
  @JsonKey(name: 'DNSSEC')
  int get dnssec;
  @JsonKey(name: 'NONE')
  int get none;
  @JsonKey(name: 'BLOB')
  int get blob;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepliesCopyWith<Replies> get copyWith =>
      _$RepliesCopyWithImpl<Replies>(this as Replies, _$identity);

  /// Serializes this Replies to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Replies &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.nodata, nodata) || other.nodata == nodata) &&
            (identical(other.nxdomain, nxdomain) ||
                other.nxdomain == nxdomain) &&
            (identical(other.cname, cname) || other.cname == cname) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.rrname, rrname) || other.rrname == rrname) &&
            (identical(other.servfail, servfail) ||
                other.servfail == servfail) &&
            (identical(other.refused, refused) || other.refused == refused) &&
            (identical(other.notimp, notimp) || other.notimp == notimp) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.dnssec, dnssec) || other.dnssec == dnssec) &&
            (identical(other.none, none) || other.none == none) &&
            (identical(other.blob, blob) || other.blob == blob));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unknown, nodata, nxdomain, cname,
      ip, domain, rrname, servfail, refused, notimp, other, dnssec, none, blob);

  @override
  String toString() {
    return 'Replies(unknown: $unknown, nodata: $nodata, nxdomain: $nxdomain, cname: $cname, ip: $ip, domain: $domain, rrname: $rrname, servfail: $servfail, refused: $refused, notimp: $notimp, other: $other, dnssec: $dnssec, none: $none, blob: $blob)';
  }
}

/// @nodoc
abstract mixin class $RepliesCopyWith<$Res> {
  factory $RepliesCopyWith(Replies value, $Res Function(Replies) _then) =
      _$RepliesCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'NODATA') int nodata,
      @JsonKey(name: 'NXDOMAIN') int nxdomain,
      @JsonKey(name: 'CNAME') int cname,
      @JsonKey(name: 'IP') int ip,
      @JsonKey(name: 'DOMAIN') int domain,
      @JsonKey(name: 'RRNAME') int rrname,
      @JsonKey(name: 'SERVFAIL') int servfail,
      @JsonKey(name: 'REFUSED') int refused,
      @JsonKey(name: 'NOTIMP') int notimp,
      @JsonKey(name: 'OTHER') int other,
      @JsonKey(name: 'DNSSEC') int dnssec,
      @JsonKey(name: 'NONE') int none,
      @JsonKey(name: 'BLOB') int blob});
}

/// @nodoc
class _$RepliesCopyWithImpl<$Res> implements $RepliesCopyWith<$Res> {
  _$RepliesCopyWithImpl(this._self, this._then);

  final Replies _self;
  final $Res Function(Replies) _then;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = null,
    Object? nodata = null,
    Object? nxdomain = null,
    Object? cname = null,
    Object? ip = null,
    Object? domain = null,
    Object? rrname = null,
    Object? servfail = null,
    Object? refused = null,
    Object? notimp = null,
    Object? other = null,
    Object? dnssec = null,
    Object? none = null,
    Object? blob = null,
  }) {
    return _then(_self.copyWith(
      unknown: null == unknown
          ? _self.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      nodata: null == nodata
          ? _self.nodata
          : nodata // ignore: cast_nullable_to_non_nullable
              as int,
      nxdomain: null == nxdomain
          ? _self.nxdomain
          : nxdomain // ignore: cast_nullable_to_non_nullable
              as int,
      cname: null == cname
          ? _self.cname
          : cname // ignore: cast_nullable_to_non_nullable
              as int,
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as int,
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as int,
      rrname: null == rrname
          ? _self.rrname
          : rrname // ignore: cast_nullable_to_non_nullable
              as int,
      servfail: null == servfail
          ? _self.servfail
          : servfail // ignore: cast_nullable_to_non_nullable
              as int,
      refused: null == refused
          ? _self.refused
          : refused // ignore: cast_nullable_to_non_nullable
              as int,
      notimp: null == notimp
          ? _self.notimp
          : notimp // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
      dnssec: null == dnssec
          ? _self.dnssec
          : dnssec // ignore: cast_nullable_to_non_nullable
              as int,
      none: null == none
          ? _self.none
          : none // ignore: cast_nullable_to_non_nullable
              as int,
      blob: null == blob
          ? _self.blob
          : blob // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Replies].
extension RepliesPatterns on Replies {
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
    TResult Function(_Replies value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Replies() when $default != null:
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
    TResult Function(_Replies value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Replies():
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
    TResult? Function(_Replies value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Replies() when $default != null:
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
            @JsonKey(name: 'UNKNOWN') int unknown,
            @JsonKey(name: 'NODATA') int nodata,
            @JsonKey(name: 'NXDOMAIN') int nxdomain,
            @JsonKey(name: 'CNAME') int cname,
            @JsonKey(name: 'IP') int ip,
            @JsonKey(name: 'DOMAIN') int domain,
            @JsonKey(name: 'RRNAME') int rrname,
            @JsonKey(name: 'SERVFAIL') int servfail,
            @JsonKey(name: 'REFUSED') int refused,
            @JsonKey(name: 'NOTIMP') int notimp,
            @JsonKey(name: 'OTHER') int other,
            @JsonKey(name: 'DNSSEC') int dnssec,
            @JsonKey(name: 'NONE') int none,
            @JsonKey(name: 'BLOB') int blob)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Replies() when $default != null:
        return $default(
            _that.unknown,
            _that.nodata,
            _that.nxdomain,
            _that.cname,
            _that.ip,
            _that.domain,
            _that.rrname,
            _that.servfail,
            _that.refused,
            _that.notimp,
            _that.other,
            _that.dnssec,
            _that.none,
            _that.blob);
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
            @JsonKey(name: 'UNKNOWN') int unknown,
            @JsonKey(name: 'NODATA') int nodata,
            @JsonKey(name: 'NXDOMAIN') int nxdomain,
            @JsonKey(name: 'CNAME') int cname,
            @JsonKey(name: 'IP') int ip,
            @JsonKey(name: 'DOMAIN') int domain,
            @JsonKey(name: 'RRNAME') int rrname,
            @JsonKey(name: 'SERVFAIL') int servfail,
            @JsonKey(name: 'REFUSED') int refused,
            @JsonKey(name: 'NOTIMP') int notimp,
            @JsonKey(name: 'OTHER') int other,
            @JsonKey(name: 'DNSSEC') int dnssec,
            @JsonKey(name: 'NONE') int none,
            @JsonKey(name: 'BLOB') int blob)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Replies():
        return $default(
            _that.unknown,
            _that.nodata,
            _that.nxdomain,
            _that.cname,
            _that.ip,
            _that.domain,
            _that.rrname,
            _that.servfail,
            _that.refused,
            _that.notimp,
            _that.other,
            _that.dnssec,
            _that.none,
            _that.blob);
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
            @JsonKey(name: 'UNKNOWN') int unknown,
            @JsonKey(name: 'NODATA') int nodata,
            @JsonKey(name: 'NXDOMAIN') int nxdomain,
            @JsonKey(name: 'CNAME') int cname,
            @JsonKey(name: 'IP') int ip,
            @JsonKey(name: 'DOMAIN') int domain,
            @JsonKey(name: 'RRNAME') int rrname,
            @JsonKey(name: 'SERVFAIL') int servfail,
            @JsonKey(name: 'REFUSED') int refused,
            @JsonKey(name: 'NOTIMP') int notimp,
            @JsonKey(name: 'OTHER') int other,
            @JsonKey(name: 'DNSSEC') int dnssec,
            @JsonKey(name: 'NONE') int none,
            @JsonKey(name: 'BLOB') int blob)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Replies() when $default != null:
        return $default(
            _that.unknown,
            _that.nodata,
            _that.nxdomain,
            _that.cname,
            _that.ip,
            _that.domain,
            _that.rrname,
            _that.servfail,
            _that.refused,
            _that.notimp,
            _that.other,
            _that.dnssec,
            _that.none,
            _that.blob);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Replies implements Replies {
  const _Replies(
      {@JsonKey(name: 'UNKNOWN') required this.unknown,
      @JsonKey(name: 'NODATA') required this.nodata,
      @JsonKey(name: 'NXDOMAIN') required this.nxdomain,
      @JsonKey(name: 'CNAME') required this.cname,
      @JsonKey(name: 'IP') required this.ip,
      @JsonKey(name: 'DOMAIN') required this.domain,
      @JsonKey(name: 'RRNAME') required this.rrname,
      @JsonKey(name: 'SERVFAIL') required this.servfail,
      @JsonKey(name: 'REFUSED') required this.refused,
      @JsonKey(name: 'NOTIMP') required this.notimp,
      @JsonKey(name: 'OTHER') required this.other,
      @JsonKey(name: 'DNSSEC') required this.dnssec,
      @JsonKey(name: 'NONE') required this.none,
      @JsonKey(name: 'BLOB') required this.blob});
  factory _Replies.fromJson(Map<String, dynamic> json) =>
      _$RepliesFromJson(json);

  @override
  @JsonKey(name: 'UNKNOWN')
  final int unknown;
  @override
  @JsonKey(name: 'NODATA')
  final int nodata;
  @override
  @JsonKey(name: 'NXDOMAIN')
  final int nxdomain;
  @override
  @JsonKey(name: 'CNAME')
  final int cname;
  @override
  @JsonKey(name: 'IP')
  final int ip;
  @override
  @JsonKey(name: 'DOMAIN')
  final int domain;
  @override
  @JsonKey(name: 'RRNAME')
  final int rrname;
  @override
  @JsonKey(name: 'SERVFAIL')
  final int servfail;
  @override
  @JsonKey(name: 'REFUSED')
  final int refused;
  @override
  @JsonKey(name: 'NOTIMP')
  final int notimp;
  @override
  @JsonKey(name: 'OTHER')
  final int other;
  @override
  @JsonKey(name: 'DNSSEC')
  final int dnssec;
  @override
  @JsonKey(name: 'NONE')
  final int none;
  @override
  @JsonKey(name: 'BLOB')
  final int blob;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepliesCopyWith<_Replies> get copyWith =>
      __$RepliesCopyWithImpl<_Replies>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepliesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Replies &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.nodata, nodata) || other.nodata == nodata) &&
            (identical(other.nxdomain, nxdomain) ||
                other.nxdomain == nxdomain) &&
            (identical(other.cname, cname) || other.cname == cname) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.rrname, rrname) || other.rrname == rrname) &&
            (identical(other.servfail, servfail) ||
                other.servfail == servfail) &&
            (identical(other.refused, refused) || other.refused == refused) &&
            (identical(other.notimp, notimp) || other.notimp == notimp) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.dnssec, dnssec) || other.dnssec == dnssec) &&
            (identical(other.none, none) || other.none == none) &&
            (identical(other.blob, blob) || other.blob == blob));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unknown, nodata, nxdomain, cname,
      ip, domain, rrname, servfail, refused, notimp, other, dnssec, none, blob);

  @override
  String toString() {
    return 'Replies(unknown: $unknown, nodata: $nodata, nxdomain: $nxdomain, cname: $cname, ip: $ip, domain: $domain, rrname: $rrname, servfail: $servfail, refused: $refused, notimp: $notimp, other: $other, dnssec: $dnssec, none: $none, blob: $blob)';
  }
}

/// @nodoc
abstract mixin class _$RepliesCopyWith<$Res> implements $RepliesCopyWith<$Res> {
  factory _$RepliesCopyWith(_Replies value, $Res Function(_Replies) _then) =
      __$RepliesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'NODATA') int nodata,
      @JsonKey(name: 'NXDOMAIN') int nxdomain,
      @JsonKey(name: 'CNAME') int cname,
      @JsonKey(name: 'IP') int ip,
      @JsonKey(name: 'DOMAIN') int domain,
      @JsonKey(name: 'RRNAME') int rrname,
      @JsonKey(name: 'SERVFAIL') int servfail,
      @JsonKey(name: 'REFUSED') int refused,
      @JsonKey(name: 'NOTIMP') int notimp,
      @JsonKey(name: 'OTHER') int other,
      @JsonKey(name: 'DNSSEC') int dnssec,
      @JsonKey(name: 'NONE') int none,
      @JsonKey(name: 'BLOB') int blob});
}

/// @nodoc
class __$RepliesCopyWithImpl<$Res> implements _$RepliesCopyWith<$Res> {
  __$RepliesCopyWithImpl(this._self, this._then);

  final _Replies _self;
  final $Res Function(_Replies) _then;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unknown = null,
    Object? nodata = null,
    Object? nxdomain = null,
    Object? cname = null,
    Object? ip = null,
    Object? domain = null,
    Object? rrname = null,
    Object? servfail = null,
    Object? refused = null,
    Object? notimp = null,
    Object? other = null,
    Object? dnssec = null,
    Object? none = null,
    Object? blob = null,
  }) {
    return _then(_Replies(
      unknown: null == unknown
          ? _self.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      nodata: null == nodata
          ? _self.nodata
          : nodata // ignore: cast_nullable_to_non_nullable
              as int,
      nxdomain: null == nxdomain
          ? _self.nxdomain
          : nxdomain // ignore: cast_nullable_to_non_nullable
              as int,
      cname: null == cname
          ? _self.cname
          : cname // ignore: cast_nullable_to_non_nullable
              as int,
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as int,
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as int,
      rrname: null == rrname
          ? _self.rrname
          : rrname // ignore: cast_nullable_to_non_nullable
              as int,
      servfail: null == servfail
          ? _self.servfail
          : servfail // ignore: cast_nullable_to_non_nullable
              as int,
      refused: null == refused
          ? _self.refused
          : refused // ignore: cast_nullable_to_non_nullable
              as int,
      notimp: null == notimp
          ? _self.notimp
          : notimp // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
      dnssec: null == dnssec
          ? _self.dnssec
          : dnssec // ignore: cast_nullable_to_non_nullable
              as int,
      none: null == none
          ? _self.none
          : none // ignore: cast_nullable_to_non_nullable
              as int,
      blob: null == blob
          ? _self.blob
          : blob // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Clients {
  int get active;
  int get total;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<Clients> get copyWith =>
      _$ClientsCopyWithImpl<Clients>(this as Clients, _$identity);

  /// Serializes this Clients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Clients &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, active, total);

  @override
  String toString() {
    return 'Clients(active: $active, total: $total)';
  }
}

/// @nodoc
abstract mixin class $ClientsCopyWith<$Res> {
  factory $ClientsCopyWith(Clients value, $Res Function(Clients) _then) =
      _$ClientsCopyWithImpl;
  @useResult
  $Res call({int active, int total});
}

/// @nodoc
class _$ClientsCopyWithImpl<$Res> implements $ClientsCopyWith<$Res> {
  _$ClientsCopyWithImpl(this._self, this._then);

  final Clients _self;
  final $Res Function(Clients) _then;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Clients].
extension ClientsPatterns on Clients {
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
    TResult Function(_Clients value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
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
    TResult Function(_Clients value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients():
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
    TResult? Function(_Clients value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
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
    TResult Function(int active, int total)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
        return $default(_that.active, _that.total);
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
    TResult Function(int active, int total) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients():
        return $default(_that.active, _that.total);
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
    TResult? Function(int active, int total)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
        return $default(_that.active, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Clients implements Clients {
  const _Clients({required this.active, required this.total});
  factory _Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);

  @override
  final int active;
  @override
  final int total;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientsCopyWith<_Clients> get copyWith =>
      __$ClientsCopyWithImpl<_Clients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Clients &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, active, total);

  @override
  String toString() {
    return 'Clients(active: $active, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$ClientsCopyWith<$Res> implements $ClientsCopyWith<$Res> {
  factory _$ClientsCopyWith(_Clients value, $Res Function(_Clients) _then) =
      __$ClientsCopyWithImpl;
  @override
  @useResult
  $Res call({int active, int total});
}

/// @nodoc
class __$ClientsCopyWithImpl<$Res> implements _$ClientsCopyWith<$Res> {
  __$ClientsCopyWithImpl(this._self, this._then);

  final _Clients _self;
  final $Res Function(_Clients) _then;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? active = null,
    Object? total = null,
  }) {
    return _then(_Clients(
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Gravity {
  @JsonKey(name: 'domains_being_blocked')
  int get domainsBeingBlocked;
  @JsonKey(name: 'last_update')
  int get lastUpdate;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GravityCopyWith<Gravity> get copyWith =>
      _$GravityCopyWithImpl<Gravity>(this as Gravity, _$identity);

  /// Serializes this Gravity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Gravity &&
            (identical(other.domainsBeingBlocked, domainsBeingBlocked) ||
                other.domainsBeingBlocked == domainsBeingBlocked) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domainsBeingBlocked, lastUpdate);

  @override
  String toString() {
    return 'Gravity(domainsBeingBlocked: $domainsBeingBlocked, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class $GravityCopyWith<$Res> {
  factory $GravityCopyWith(Gravity value, $Res Function(Gravity) _then) =
      _$GravityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
      @JsonKey(name: 'last_update') int lastUpdate});
}

/// @nodoc
class _$GravityCopyWithImpl<$Res> implements $GravityCopyWith<$Res> {
  _$GravityCopyWithImpl(this._self, this._then);

  final Gravity _self;
  final $Res Function(Gravity) _then;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainsBeingBlocked = null,
    Object? lastUpdate = null,
  }) {
    return _then(_self.copyWith(
      domainsBeingBlocked: null == domainsBeingBlocked
          ? _self.domainsBeingBlocked
          : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Gravity].
extension GravityPatterns on Gravity {
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
    TResult Function(_Gravity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Gravity() when $default != null:
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
    TResult Function(_Gravity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Gravity():
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
    TResult? Function(_Gravity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Gravity() when $default != null:
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
            @JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
            @JsonKey(name: 'last_update') int lastUpdate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Gravity() when $default != null:
        return $default(_that.domainsBeingBlocked, _that.lastUpdate);
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
            @JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
            @JsonKey(name: 'last_update') int lastUpdate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Gravity():
        return $default(_that.domainsBeingBlocked, _that.lastUpdate);
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
            @JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
            @JsonKey(name: 'last_update') int lastUpdate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Gravity() when $default != null:
        return $default(_that.domainsBeingBlocked, _that.lastUpdate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Gravity implements Gravity {
  const _Gravity(
      {@JsonKey(name: 'domains_being_blocked')
      required this.domainsBeingBlocked,
      @JsonKey(name: 'last_update') required this.lastUpdate});
  factory _Gravity.fromJson(Map<String, dynamic> json) =>
      _$GravityFromJson(json);

  @override
  @JsonKey(name: 'domains_being_blocked')
  final int domainsBeingBlocked;
  @override
  @JsonKey(name: 'last_update')
  final int lastUpdate;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GravityCopyWith<_Gravity> get copyWith =>
      __$GravityCopyWithImpl<_Gravity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GravityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Gravity &&
            (identical(other.domainsBeingBlocked, domainsBeingBlocked) ||
                other.domainsBeingBlocked == domainsBeingBlocked) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domainsBeingBlocked, lastUpdate);

  @override
  String toString() {
    return 'Gravity(domainsBeingBlocked: $domainsBeingBlocked, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class _$GravityCopyWith<$Res> implements $GravityCopyWith<$Res> {
  factory _$GravityCopyWith(_Gravity value, $Res Function(_Gravity) _then) =
      __$GravityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
      @JsonKey(name: 'last_update') int lastUpdate});
}

/// @nodoc
class __$GravityCopyWithImpl<$Res> implements _$GravityCopyWith<$Res> {
  __$GravityCopyWithImpl(this._self, this._then);

  final _Gravity _self;
  final $Res Function(_Gravity) _then;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domainsBeingBlocked = null,
    Object? lastUpdate = null,
  }) {
    return _then(_Gravity(
      domainsBeingBlocked: null == domainsBeingBlocked
          ? _self.domainsBeingBlocked
          : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$StatsTopDomains {
  List<Domain> get domains;
  @JsonKey(name: 'total_queries')
  int get totalQueries;
  @JsonKey(name: 'blocked_queries')
  int get blockedQueries;
  double get took;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatsTopDomainsCopyWith<StatsTopDomains> get copyWith =>
      _$StatsTopDomainsCopyWithImpl<StatsTopDomains>(
          this as StatsTopDomains, _$identity);

  /// Serializes this StatsTopDomains to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatsTopDomains &&
            const DeepCollectionEquality().equals(other.domains, domains) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.blockedQueries, blockedQueries) ||
                other.blockedQueries == blockedQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(domains),
      totalQueries,
      blockedQueries,
      took);

  @override
  String toString() {
    return 'StatsTopDomains(domains: $domains, totalQueries: $totalQueries, blockedQueries: $blockedQueries, took: $took)';
  }
}

/// @nodoc
abstract mixin class $StatsTopDomainsCopyWith<$Res> {
  factory $StatsTopDomainsCopyWith(
          StatsTopDomains value, $Res Function(StatsTopDomains) _then) =
      _$StatsTopDomainsCopyWithImpl;
  @useResult
  $Res call(
      {List<Domain> domains,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class _$StatsTopDomainsCopyWithImpl<$Res>
    implements $StatsTopDomainsCopyWith<$Res> {
  _$StatsTopDomainsCopyWithImpl(this._self, this._then);

  final StatsTopDomains _self;
  final $Res Function(StatsTopDomains) _then;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      domains: null == domains
          ? _self.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      totalQueries: null == totalQueries
          ? _self.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _self.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [StatsTopDomains].
extension StatsTopDomainsPatterns on StatsTopDomains {
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
    TResult Function(_StatsTopDomains value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsTopDomains() when $default != null:
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
    TResult Function(_StatsTopDomains value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopDomains():
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
    TResult? Function(_StatsTopDomains value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopDomains() when $default != null:
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
            List<Domain> domains,
            @JsonKey(name: 'total_queries') int totalQueries,
            @JsonKey(name: 'blocked_queries') int blockedQueries,
            double took)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsTopDomains() when $default != null:
        return $default(_that.domains, _that.totalQueries, _that.blockedQueries,
            _that.took);
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
            List<Domain> domains,
            @JsonKey(name: 'total_queries') int totalQueries,
            @JsonKey(name: 'blocked_queries') int blockedQueries,
            double took)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopDomains():
        return $default(_that.domains, _that.totalQueries, _that.blockedQueries,
            _that.took);
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
            List<Domain> domains,
            @JsonKey(name: 'total_queries') int totalQueries,
            @JsonKey(name: 'blocked_queries') int blockedQueries,
            double took)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopDomains() when $default != null:
        return $default(_that.domains, _that.totalQueries, _that.blockedQueries,
            _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StatsTopDomains implements StatsTopDomains {
  const _StatsTopDomains(
      {required final List<Domain> domains,
      @JsonKey(name: 'total_queries') required this.totalQueries,
      @JsonKey(name: 'blocked_queries') required this.blockedQueries,
      required this.took})
      : _domains = domains;
  factory _StatsTopDomains.fromJson(Map<String, dynamic> json) =>
      _$StatsTopDomainsFromJson(json);

  final List<Domain> _domains;
  @override
  List<Domain> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  @JsonKey(name: 'total_queries')
  final int totalQueries;
  @override
  @JsonKey(name: 'blocked_queries')
  final int blockedQueries;
  @override
  final double took;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatsTopDomainsCopyWith<_StatsTopDomains> get copyWith =>
      __$StatsTopDomainsCopyWithImpl<_StatsTopDomains>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatsTopDomainsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatsTopDomains &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.blockedQueries, blockedQueries) ||
                other.blockedQueries == blockedQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_domains),
      totalQueries,
      blockedQueries,
      took);

  @override
  String toString() {
    return 'StatsTopDomains(domains: $domains, totalQueries: $totalQueries, blockedQueries: $blockedQueries, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$StatsTopDomainsCopyWith<$Res>
    implements $StatsTopDomainsCopyWith<$Res> {
  factory _$StatsTopDomainsCopyWith(
          _StatsTopDomains value, $Res Function(_StatsTopDomains) _then) =
      __$StatsTopDomainsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Domain> domains,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class __$StatsTopDomainsCopyWithImpl<$Res>
    implements _$StatsTopDomainsCopyWith<$Res> {
  __$StatsTopDomainsCopyWithImpl(this._self, this._then);

  final _StatsTopDomains _self;
  final $Res Function(_StatsTopDomains) _then;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domains = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_StatsTopDomains(
      domains: null == domains
          ? _self._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      totalQueries: null == totalQueries
          ? _self.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _self.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Domain {
  String get domain;
  int get count;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DomainCopyWith<Domain> get copyWith =>
      _$DomainCopyWithImpl<Domain>(this as Domain, _$identity);

  /// Serializes this Domain to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Domain &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domain, count);

  @override
  String toString() {
    return 'Domain(domain: $domain, count: $count)';
  }
}

/// @nodoc
abstract mixin class $DomainCopyWith<$Res> {
  factory $DomainCopyWith(Domain value, $Res Function(Domain) _then) =
      _$DomainCopyWithImpl;
  @useResult
  $Res call({String domain, int count});
}

/// @nodoc
class _$DomainCopyWithImpl<$Res> implements $DomainCopyWith<$Res> {
  _$DomainCopyWithImpl(this._self, this._then);

  final Domain _self;
  final $Res Function(Domain) _then;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Domain].
extension DomainPatterns on Domain {
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
    TResult Function(_Domain value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Domain() when $default != null:
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
    TResult Function(_Domain value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domain():
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
    TResult? Function(_Domain value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domain() when $default != null:
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
    TResult Function(String domain, int count)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Domain() when $default != null:
        return $default(_that.domain, _that.count);
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
    TResult Function(String domain, int count) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domain():
        return $default(_that.domain, _that.count);
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
    TResult? Function(String domain, int count)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domain() when $default != null:
        return $default(_that.domain, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Domain implements Domain {
  const _Domain({required this.domain, required this.count});
  factory _Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  @override
  final String domain;
  @override
  final int count;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DomainCopyWith<_Domain> get copyWith =>
      __$DomainCopyWithImpl<_Domain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DomainToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Domain &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domain, count);

  @override
  String toString() {
    return 'Domain(domain: $domain, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$DomainCopyWith<$Res> implements $DomainCopyWith<$Res> {
  factory _$DomainCopyWith(_Domain value, $Res Function(_Domain) _then) =
      __$DomainCopyWithImpl;
  @override
  @useResult
  $Res call({String domain, int count});
}

/// @nodoc
class __$DomainCopyWithImpl<$Res> implements _$DomainCopyWith<$Res> {
  __$DomainCopyWithImpl(this._self, this._then);

  final _Domain _self;
  final $Res Function(_Domain) _then;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domain = null,
    Object? count = null,
  }) {
    return _then(_Domain(
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$StatsTopClients {
  List<Client> get clients;
  @JsonKey(name: 'total_queries')
  int get totalQueries;
  @JsonKey(name: 'blocked_queries')
  int get blockedQueries;
  double get took;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatsTopClientsCopyWith<StatsTopClients> get copyWith =>
      _$StatsTopClientsCopyWithImpl<StatsTopClients>(
          this as StatsTopClients, _$identity);

  /// Serializes this StatsTopClients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatsTopClients &&
            const DeepCollectionEquality().equals(other.clients, clients) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.blockedQueries, blockedQueries) ||
                other.blockedQueries == blockedQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clients),
      totalQueries,
      blockedQueries,
      took);

  @override
  String toString() {
    return 'StatsTopClients(clients: $clients, totalQueries: $totalQueries, blockedQueries: $blockedQueries, took: $took)';
  }
}

/// @nodoc
abstract mixin class $StatsTopClientsCopyWith<$Res> {
  factory $StatsTopClientsCopyWith(
          StatsTopClients value, $Res Function(StatsTopClients) _then) =
      _$StatsTopClientsCopyWithImpl;
  @useResult
  $Res call(
      {List<Client> clients,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class _$StatsTopClientsCopyWithImpl<$Res>
    implements $StatsTopClientsCopyWith<$Res> {
  _$StatsTopClientsCopyWithImpl(this._self, this._then);

  final StatsTopClients _self;
  final $Res Function(StatsTopClients) _then;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      totalQueries: null == totalQueries
          ? _self.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _self.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [StatsTopClients].
extension StatsTopClientsPatterns on StatsTopClients {
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
    TResult Function(_StatsTopClients value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsTopClients() when $default != null:
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
    TResult Function(_StatsTopClients value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopClients():
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
    TResult? Function(_StatsTopClients value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopClients() when $default != null:
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
            List<Client> clients,
            @JsonKey(name: 'total_queries') int totalQueries,
            @JsonKey(name: 'blocked_queries') int blockedQueries,
            double took)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsTopClients() when $default != null:
        return $default(_that.clients, _that.totalQueries, _that.blockedQueries,
            _that.took);
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
            List<Client> clients,
            @JsonKey(name: 'total_queries') int totalQueries,
            @JsonKey(name: 'blocked_queries') int blockedQueries,
            double took)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopClients():
        return $default(_that.clients, _that.totalQueries, _that.blockedQueries,
            _that.took);
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
            List<Client> clients,
            @JsonKey(name: 'total_queries') int totalQueries,
            @JsonKey(name: 'blocked_queries') int blockedQueries,
            double took)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsTopClients() when $default != null:
        return $default(_that.clients, _that.totalQueries, _that.blockedQueries,
            _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StatsTopClients implements StatsTopClients {
  const _StatsTopClients(
      {required final List<Client> clients,
      @JsonKey(name: 'total_queries') required this.totalQueries,
      @JsonKey(name: 'blocked_queries') required this.blockedQueries,
      required this.took})
      : _clients = clients;
  factory _StatsTopClients.fromJson(Map<String, dynamic> json) =>
      _$StatsTopClientsFromJson(json);

  final List<Client> _clients;
  @override
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  @override
  @JsonKey(name: 'total_queries')
  final int totalQueries;
  @override
  @JsonKey(name: 'blocked_queries')
  final int blockedQueries;
  @override
  final double took;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatsTopClientsCopyWith<_StatsTopClients> get copyWith =>
      __$StatsTopClientsCopyWithImpl<_StatsTopClients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatsTopClientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatsTopClients &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.blockedQueries, blockedQueries) ||
                other.blockedQueries == blockedQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_clients),
      totalQueries,
      blockedQueries,
      took);

  @override
  String toString() {
    return 'StatsTopClients(clients: $clients, totalQueries: $totalQueries, blockedQueries: $blockedQueries, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$StatsTopClientsCopyWith<$Res>
    implements $StatsTopClientsCopyWith<$Res> {
  factory _$StatsTopClientsCopyWith(
          _StatsTopClients value, $Res Function(_StatsTopClients) _then) =
      __$StatsTopClientsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Client> clients,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class __$StatsTopClientsCopyWithImpl<$Res>
    implements _$StatsTopClientsCopyWith<$Res> {
  __$StatsTopClientsCopyWithImpl(this._self, this._then);

  final _StatsTopClients _self;
  final $Res Function(_StatsTopClients) _then;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clients = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_StatsTopClients(
      clients: null == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      totalQueries: null == totalQueries
          ? _self.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _self.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Client {
  String get ip;
  String get name;
  int get count;

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
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, name, count);

  @override
  String toString() {
    return 'Client(ip: $ip, name: $name, count: $count)';
  }
}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) =
      _$ClientCopyWithImpl;
  @useResult
  $Res call({String ip, String name, int count});
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
    Object? ip = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
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
    TResult Function(String ip, String name, int count)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.ip, _that.name, _that.count);
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
    TResult Function(String ip, String name, int count) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
        return $default(_that.ip, _that.name, _that.count);
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
    TResult? Function(String ip, String name, int count)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.ip, _that.name, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Client implements Client {
  const _Client({required this.ip, required this.name, required this.count});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @override
  final String ip;
  @override
  final String name;
  @override
  final int count;

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
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, name, count);

  @override
  String toString() {
    return 'Client(ip: $ip, name: $name, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) =
      __$ClientCopyWithImpl;
  @override
  @useResult
  $Res call({String ip, String name, int count});
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
    Object? ip = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_Client(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$StatsUpstreams {
  List<Upstream> get upstreams;
  @JsonKey(name: 'forwarded_queries')
  int get forwardedQueries;
  @JsonKey(name: 'total_queries')
  int get totalQueries;
  double get took;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatsUpstreamsCopyWith<StatsUpstreams> get copyWith =>
      _$StatsUpstreamsCopyWithImpl<StatsUpstreams>(
          this as StatsUpstreams, _$identity);

  /// Serializes this StatsUpstreams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatsUpstreams &&
            const DeepCollectionEquality().equals(other.upstreams, upstreams) &&
            (identical(other.forwardedQueries, forwardedQueries) ||
                other.forwardedQueries == forwardedQueries) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(upstreams),
      forwardedQueries,
      totalQueries,
      took);

  @override
  String toString() {
    return 'StatsUpstreams(upstreams: $upstreams, forwardedQueries: $forwardedQueries, totalQueries: $totalQueries, took: $took)';
  }
}

/// @nodoc
abstract mixin class $StatsUpstreamsCopyWith<$Res> {
  factory $StatsUpstreamsCopyWith(
          StatsUpstreams value, $Res Function(StatsUpstreams) _then) =
      _$StatsUpstreamsCopyWithImpl;
  @useResult
  $Res call(
      {List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') int forwardedQueries,
      @JsonKey(name: 'total_queries') int totalQueries,
      double took});
}

/// @nodoc
class _$StatsUpstreamsCopyWithImpl<$Res>
    implements $StatsUpstreamsCopyWith<$Res> {
  _$StatsUpstreamsCopyWithImpl(this._self, this._then);

  final StatsUpstreams _self;
  final $Res Function(StatsUpstreams) _then;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upstreams = null,
    Object? forwardedQueries = null,
    Object? totalQueries = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      upstreams: null == upstreams
          ? _self.upstreams
          : upstreams // ignore: cast_nullable_to_non_nullable
              as List<Upstream>,
      forwardedQueries: null == forwardedQueries
          ? _self.forwardedQueries
          : forwardedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      totalQueries: null == totalQueries
          ? _self.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [StatsUpstreams].
extension StatsUpstreamsPatterns on StatsUpstreams {
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
    TResult Function(_StatsUpstreams value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsUpstreams() when $default != null:
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
    TResult Function(_StatsUpstreams value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsUpstreams():
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
    TResult? Function(_StatsUpstreams value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsUpstreams() when $default != null:
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
            List<Upstream> upstreams,
            @JsonKey(name: 'forwarded_queries') int forwardedQueries,
            @JsonKey(name: 'total_queries') int totalQueries,
            double took)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatsUpstreams() when $default != null:
        return $default(_that.upstreams, _that.forwardedQueries,
            _that.totalQueries, _that.took);
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
            List<Upstream> upstreams,
            @JsonKey(name: 'forwarded_queries') int forwardedQueries,
            @JsonKey(name: 'total_queries') int totalQueries,
            double took)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsUpstreams():
        return $default(_that.upstreams, _that.forwardedQueries,
            _that.totalQueries, _that.took);
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
            List<Upstream> upstreams,
            @JsonKey(name: 'forwarded_queries') int forwardedQueries,
            @JsonKey(name: 'total_queries') int totalQueries,
            double took)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatsUpstreams() when $default != null:
        return $default(_that.upstreams, _that.forwardedQueries,
            _that.totalQueries, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StatsUpstreams implements StatsUpstreams {
  const _StatsUpstreams(
      {required final List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') required this.forwardedQueries,
      @JsonKey(name: 'total_queries') required this.totalQueries,
      required this.took})
      : _upstreams = upstreams;
  factory _StatsUpstreams.fromJson(Map<String, dynamic> json) =>
      _$StatsUpstreamsFromJson(json);

  final List<Upstream> _upstreams;
  @override
  List<Upstream> get upstreams {
    if (_upstreams is EqualUnmodifiableListView) return _upstreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upstreams);
  }

  @override
  @JsonKey(name: 'forwarded_queries')
  final int forwardedQueries;
  @override
  @JsonKey(name: 'total_queries')
  final int totalQueries;
  @override
  final double took;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatsUpstreamsCopyWith<_StatsUpstreams> get copyWith =>
      __$StatsUpstreamsCopyWithImpl<_StatsUpstreams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatsUpstreamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatsUpstreams &&
            const DeepCollectionEquality()
                .equals(other._upstreams, _upstreams) &&
            (identical(other.forwardedQueries, forwardedQueries) ||
                other.forwardedQueries == forwardedQueries) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_upstreams),
      forwardedQueries,
      totalQueries,
      took);

  @override
  String toString() {
    return 'StatsUpstreams(upstreams: $upstreams, forwardedQueries: $forwardedQueries, totalQueries: $totalQueries, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$StatsUpstreamsCopyWith<$Res>
    implements $StatsUpstreamsCopyWith<$Res> {
  factory _$StatsUpstreamsCopyWith(
          _StatsUpstreams value, $Res Function(_StatsUpstreams) _then) =
      __$StatsUpstreamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') int forwardedQueries,
      @JsonKey(name: 'total_queries') int totalQueries,
      double took});
}

/// @nodoc
class __$StatsUpstreamsCopyWithImpl<$Res>
    implements _$StatsUpstreamsCopyWith<$Res> {
  __$StatsUpstreamsCopyWithImpl(this._self, this._then);

  final _StatsUpstreams _self;
  final $Res Function(_StatsUpstreams) _then;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? upstreams = null,
    Object? forwardedQueries = null,
    Object? totalQueries = null,
    Object? took = null,
  }) {
    return _then(_StatsUpstreams(
      upstreams: null == upstreams
          ? _self._upstreams
          : upstreams // ignore: cast_nullable_to_non_nullable
              as List<Upstream>,
      forwardedQueries: null == forwardedQueries
          ? _self.forwardedQueries
          : forwardedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      totalQueries: null == totalQueries
          ? _self.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Upstream {
  String get ip;
  String get name;
  int get port;
  int get count;
  Statistics get statistics;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpstreamCopyWith<Upstream> get copyWith =>
      _$UpstreamCopyWithImpl<Upstream>(this as Upstream, _$identity);

  /// Serializes this Upstream to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Upstream &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ip, name, port, count, statistics);

  @override
  String toString() {
    return 'Upstream(ip: $ip, name: $name, port: $port, count: $count, statistics: $statistics)';
  }
}

/// @nodoc
abstract mixin class $UpstreamCopyWith<$Res> {
  factory $UpstreamCopyWith(Upstream value, $Res Function(Upstream) _then) =
      _$UpstreamCopyWithImpl;
  @useResult
  $Res call(
      {String ip, String name, int port, int count, Statistics statistics});

  $StatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$UpstreamCopyWithImpl<$Res> implements $UpstreamCopyWith<$Res> {
  _$UpstreamCopyWithImpl(this._self, this._then);

  final Upstream _self;
  final $Res Function(Upstream) _then;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? name = null,
    Object? port = null,
    Object? count = null,
    Object? statistics = null,
  }) {
    return _then(_self.copyWith(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _self.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
    ));
  }

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatisticsCopyWith<$Res> get statistics {
    return $StatisticsCopyWith<$Res>(_self.statistics, (value) {
      return _then(_self.copyWith(statistics: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Upstream].
extension UpstreamPatterns on Upstream {
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
    TResult Function(_Upstream value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Upstream() when $default != null:
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
    TResult Function(_Upstream value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Upstream():
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
    TResult? Function(_Upstream value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Upstream() when $default != null:
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
            String ip, String name, int port, int count, Statistics statistics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Upstream() when $default != null:
        return $default(
            _that.ip, _that.name, _that.port, _that.count, _that.statistics);
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
            String ip, String name, int port, int count, Statistics statistics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Upstream():
        return $default(
            _that.ip, _that.name, _that.port, _that.count, _that.statistics);
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
            String ip, String name, int port, int count, Statistics statistics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Upstream() when $default != null:
        return $default(
            _that.ip, _that.name, _that.port, _that.count, _that.statistics);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Upstream implements Upstream {
  const _Upstream(
      {required this.ip,
      required this.name,
      required this.port,
      required this.count,
      required this.statistics});
  factory _Upstream.fromJson(Map<String, dynamic> json) =>
      _$UpstreamFromJson(json);

  @override
  final String ip;
  @override
  final String name;
  @override
  final int port;
  @override
  final int count;
  @override
  final Statistics statistics;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpstreamCopyWith<_Upstream> get copyWith =>
      __$UpstreamCopyWithImpl<_Upstream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpstreamToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Upstream &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ip, name, port, count, statistics);

  @override
  String toString() {
    return 'Upstream(ip: $ip, name: $name, port: $port, count: $count, statistics: $statistics)';
  }
}

/// @nodoc
abstract mixin class _$UpstreamCopyWith<$Res>
    implements $UpstreamCopyWith<$Res> {
  factory _$UpstreamCopyWith(_Upstream value, $Res Function(_Upstream) _then) =
      __$UpstreamCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String ip, String name, int port, int count, Statistics statistics});

  @override
  $StatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$UpstreamCopyWithImpl<$Res> implements _$UpstreamCopyWith<$Res> {
  __$UpstreamCopyWithImpl(this._self, this._then);

  final _Upstream _self;
  final $Res Function(_Upstream) _then;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ip = null,
    Object? name = null,
    Object? port = null,
    Object? count = null,
    Object? statistics = null,
  }) {
    return _then(_Upstream(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _self.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
    ));
  }

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatisticsCopyWith<$Res> get statistics {
    return $StatisticsCopyWith<$Res>(_self.statistics, (value) {
      return _then(_self.copyWith(statistics: value));
    });
  }
}

/// @nodoc
mixin _$Statistics {
  double get response;
  double get variance;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatisticsCopyWith<Statistics> get copyWith =>
      _$StatisticsCopyWithImpl<Statistics>(this as Statistics, _$identity);

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Statistics &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.variance, variance) ||
                other.variance == variance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response, variance);

  @override
  String toString() {
    return 'Statistics(response: $response, variance: $variance)';
  }
}

/// @nodoc
abstract mixin class $StatisticsCopyWith<$Res> {
  factory $StatisticsCopyWith(
          Statistics value, $Res Function(Statistics) _then) =
      _$StatisticsCopyWithImpl;
  @useResult
  $Res call({double response, double variance});
}

/// @nodoc
class _$StatisticsCopyWithImpl<$Res> implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._self, this._then);

  final Statistics _self;
  final $Res Function(Statistics) _then;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? variance = null,
  }) {
    return _then(_self.copyWith(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _self.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [Statistics].
extension StatisticsPatterns on Statistics {
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
    TResult Function(_Statistics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Statistics() when $default != null:
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
    TResult Function(_Statistics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Statistics():
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
    TResult? Function(_Statistics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Statistics() when $default != null:
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
    TResult Function(double response, double variance)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Statistics() when $default != null:
        return $default(_that.response, _that.variance);
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
    TResult Function(double response, double variance) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Statistics():
        return $default(_that.response, _that.variance);
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
    TResult? Function(double response, double variance)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Statistics() when $default != null:
        return $default(_that.response, _that.variance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Statistics implements Statistics {
  const _Statistics({required this.response, required this.variance});
  factory _Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  @override
  final double response;
  @override
  final double variance;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatisticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Statistics &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.variance, variance) ||
                other.variance == variance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response, variance);

  @override
  String toString() {
    return 'Statistics(response: $response, variance: $variance)';
  }
}

/// @nodoc
abstract mixin class _$StatisticsCopyWith<$Res>
    implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(
          _Statistics value, $Res Function(_Statistics) _then) =
      __$StatisticsCopyWithImpl;
  @override
  @useResult
  $Res call({double response, double variance});
}

/// @nodoc
class __$StatisticsCopyWithImpl<$Res> implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(this._self, this._then);

  final _Statistics _self;
  final $Res Function(_Statistics) _then;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
    Object? variance = null,
  }) {
    return _then(_Statistics(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _self.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
