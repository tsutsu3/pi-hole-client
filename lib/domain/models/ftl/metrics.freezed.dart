// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoDnsMetrics {
  DnsCache get cache;
  DnsReplies get replies;

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoDnsMetricsCopyWith<InfoDnsMetrics> get copyWith =>
      _$InfoDnsMetricsCopyWithImpl<InfoDnsMetrics>(
          this as InfoDnsMetrics, _$identity);

  /// Serializes this InfoDnsMetrics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoDnsMetrics &&
            (identical(other.cache, cache) || other.cache == cache) &&
            (identical(other.replies, replies) || other.replies == replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cache, replies);

  @override
  String toString() {
    return 'InfoDnsMetrics(cache: $cache, replies: $replies)';
  }
}

/// @nodoc
abstract mixin class $InfoDnsMetricsCopyWith<$Res> {
  factory $InfoDnsMetricsCopyWith(
          InfoDnsMetrics value, $Res Function(InfoDnsMetrics) _then) =
      _$InfoDnsMetricsCopyWithImpl;
  @useResult
  $Res call({DnsCache cache, DnsReplies replies});

  $DnsCacheCopyWith<$Res> get cache;
  $DnsRepliesCopyWith<$Res> get replies;
}

/// @nodoc
class _$InfoDnsMetricsCopyWithImpl<$Res>
    implements $InfoDnsMetricsCopyWith<$Res> {
  _$InfoDnsMetricsCopyWithImpl(this._self, this._then);

  final InfoDnsMetrics _self;
  final $Res Function(InfoDnsMetrics) _then;

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cache = null,
    Object? replies = null,
  }) {
    return _then(_self.copyWith(
      cache: null == cache
          ? _self.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as DnsCache,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as DnsReplies,
    ));
  }

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsCacheCopyWith<$Res> get cache {
    return $DnsCacheCopyWith<$Res>(_self.cache, (value) {
      return _then(_self.copyWith(cache: value));
    });
  }

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsRepliesCopyWith<$Res> get replies {
    return $DnsRepliesCopyWith<$Res>(_self.replies, (value) {
      return _then(_self.copyWith(replies: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InfoDnsMetrics].
extension InfoDnsMetricsPatterns on InfoDnsMetrics {
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
    TResult Function(_InfoDnsMetrics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoDnsMetrics() when $default != null:
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
    TResult Function(_InfoDnsMetrics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoDnsMetrics():
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
    TResult? Function(_InfoDnsMetrics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoDnsMetrics() when $default != null:
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
    TResult Function(DnsCache cache, DnsReplies replies)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoDnsMetrics() when $default != null:
        return $default(_that.cache, _that.replies);
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
    TResult Function(DnsCache cache, DnsReplies replies) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoDnsMetrics():
        return $default(_that.cache, _that.replies);
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
    TResult? Function(DnsCache cache, DnsReplies replies)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoDnsMetrics() when $default != null:
        return $default(_that.cache, _that.replies);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoDnsMetrics implements InfoDnsMetrics {
  const _InfoDnsMetrics({required this.cache, required this.replies});
  factory _InfoDnsMetrics.fromJson(Map<String, dynamic> json) =>
      _$InfoDnsMetricsFromJson(json);

  @override
  final DnsCache cache;
  @override
  final DnsReplies replies;

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoDnsMetricsCopyWith<_InfoDnsMetrics> get copyWith =>
      __$InfoDnsMetricsCopyWithImpl<_InfoDnsMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoDnsMetricsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoDnsMetrics &&
            (identical(other.cache, cache) || other.cache == cache) &&
            (identical(other.replies, replies) || other.replies == replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cache, replies);

  @override
  String toString() {
    return 'InfoDnsMetrics(cache: $cache, replies: $replies)';
  }
}

/// @nodoc
abstract mixin class _$InfoDnsMetricsCopyWith<$Res>
    implements $InfoDnsMetricsCopyWith<$Res> {
  factory _$InfoDnsMetricsCopyWith(
          _InfoDnsMetrics value, $Res Function(_InfoDnsMetrics) _then) =
      __$InfoDnsMetricsCopyWithImpl;
  @override
  @useResult
  $Res call({DnsCache cache, DnsReplies replies});

  @override
  $DnsCacheCopyWith<$Res> get cache;
  @override
  $DnsRepliesCopyWith<$Res> get replies;
}

/// @nodoc
class __$InfoDnsMetricsCopyWithImpl<$Res>
    implements _$InfoDnsMetricsCopyWith<$Res> {
  __$InfoDnsMetricsCopyWithImpl(this._self, this._then);

  final _InfoDnsMetrics _self;
  final $Res Function(_InfoDnsMetrics) _then;

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cache = null,
    Object? replies = null,
  }) {
    return _then(_InfoDnsMetrics(
      cache: null == cache
          ? _self.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as DnsCache,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as DnsReplies,
    ));
  }

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsCacheCopyWith<$Res> get cache {
    return $DnsCacheCopyWith<$Res>(_self.cache, (value) {
      return _then(_self.copyWith(cache: value));
    });
  }

  /// Create a copy of InfoDnsMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsRepliesCopyWith<$Res> get replies {
    return $DnsRepliesCopyWith<$Res>(_self.replies, (value) {
      return _then(_self.copyWith(replies: value));
    });
  }
}

/// @nodoc
mixin _$DnsCache {
  int get size;
  int get inserted;
  int get evicted;
  int get expired;
  int get immortal;
  List<DnsCacheEntry> get content;

  /// Create a copy of DnsCache
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DnsCacheCopyWith<DnsCache> get copyWith =>
      _$DnsCacheCopyWithImpl<DnsCache>(this as DnsCache, _$identity);

  /// Serializes this DnsCache to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DnsCache &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.inserted, inserted) ||
                other.inserted == inserted) &&
            (identical(other.evicted, evicted) || other.evicted == evicted) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.immortal, immortal) ||
                other.immortal == immortal) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, inserted, evicted, expired,
      immortal, const DeepCollectionEquality().hash(content));

  @override
  String toString() {
    return 'DnsCache(size: $size, inserted: $inserted, evicted: $evicted, expired: $expired, immortal: $immortal, content: $content)';
  }
}

/// @nodoc
abstract mixin class $DnsCacheCopyWith<$Res> {
  factory $DnsCacheCopyWith(DnsCache value, $Res Function(DnsCache) _then) =
      _$DnsCacheCopyWithImpl;
  @useResult
  $Res call(
      {int size,
      int inserted,
      int evicted,
      int expired,
      int immortal,
      List<DnsCacheEntry> content});
}

/// @nodoc
class _$DnsCacheCopyWithImpl<$Res> implements $DnsCacheCopyWith<$Res> {
  _$DnsCacheCopyWithImpl(this._self, this._then);

  final DnsCache _self;
  final $Res Function(DnsCache) _then;

  /// Create a copy of DnsCache
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? inserted = null,
    Object? evicted = null,
    Object? expired = null,
    Object? immortal = null,
    Object? content = null,
  }) {
    return _then(_self.copyWith(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: null == inserted
          ? _self.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as int,
      evicted: null == evicted
          ? _self.evicted
          : evicted // ignore: cast_nullable_to_non_nullable
              as int,
      expired: null == expired
          ? _self.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int,
      immortal: null == immortal
          ? _self.immortal
          : immortal // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DnsCacheEntry>,
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DnsCache value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsCache() when $default != null:
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
    TResult Function(_DnsCache value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCache():
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
    TResult? Function(_DnsCache value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCache() when $default != null:
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
    TResult Function(int size, int inserted, int evicted, int expired,
            int immortal, List<DnsCacheEntry> content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsCache() when $default != null:
        return $default(_that.size, _that.inserted, _that.evicted,
            _that.expired, _that.immortal, _that.content);
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
    TResult Function(int size, int inserted, int evicted, int expired,
            int immortal, List<DnsCacheEntry> content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCache():
        return $default(_that.size, _that.inserted, _that.evicted,
            _that.expired, _that.immortal, _that.content);
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
    TResult? Function(int size, int inserted, int evicted, int expired,
            int immortal, List<DnsCacheEntry> content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCache() when $default != null:
        return $default(_that.size, _that.inserted, _that.evicted,
            _that.expired, _that.immortal, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsCache extends DnsCache {
  const _DnsCache(
      {required this.size,
      required this.inserted,
      required this.evicted,
      required this.expired,
      required this.immortal,
      required final List<DnsCacheEntry> content})
      : _content = content,
        super._();
  factory _DnsCache.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheFromJson(json);

  @override
  final int size;
  @override
  final int inserted;
  @override
  final int evicted;
  @override
  final int expired;
  @override
  final int immortal;
  final List<DnsCacheEntry> _content;
  @override
  List<DnsCacheEntry> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  /// Create a copy of DnsCache
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DnsCacheCopyWith<_DnsCache> get copyWith =>
      __$DnsCacheCopyWithImpl<_DnsCache>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DnsCacheToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DnsCache &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.inserted, inserted) ||
                other.inserted == inserted) &&
            (identical(other.evicted, evicted) || other.evicted == evicted) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.immortal, immortal) ||
                other.immortal == immortal) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, inserted, evicted, expired,
      immortal, const DeepCollectionEquality().hash(_content));

  @override
  String toString() {
    return 'DnsCache(size: $size, inserted: $inserted, evicted: $evicted, expired: $expired, immortal: $immortal, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$DnsCacheCopyWith<$Res>
    implements $DnsCacheCopyWith<$Res> {
  factory _$DnsCacheCopyWith(_DnsCache value, $Res Function(_DnsCache) _then) =
      __$DnsCacheCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int size,
      int inserted,
      int evicted,
      int expired,
      int immortal,
      List<DnsCacheEntry> content});
}

/// @nodoc
class __$DnsCacheCopyWithImpl<$Res> implements _$DnsCacheCopyWith<$Res> {
  __$DnsCacheCopyWithImpl(this._self, this._then);

  final _DnsCache _self;
  final $Res Function(_DnsCache) _then;

  /// Create a copy of DnsCache
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? size = null,
    Object? inserted = null,
    Object? evicted = null,
    Object? expired = null,
    Object? immortal = null,
    Object? content = null,
  }) {
    return _then(_DnsCache(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: null == inserted
          ? _self.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as int,
      evicted: null == evicted
          ? _self.evicted
          : evicted // ignore: cast_nullable_to_non_nullable
              as int,
      expired: null == expired
          ? _self.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int,
      immortal: null == immortal
          ? _self.immortal
          : immortal // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DnsCacheEntry>,
    ));
  }
}

/// @nodoc
mixin _$DnsCacheEntry {
  int get type;
  String get name;
  DnsCacheCount get count;

  /// Create a copy of DnsCacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DnsCacheEntryCopyWith<DnsCacheEntry> get copyWith =>
      _$DnsCacheEntryCopyWithImpl<DnsCacheEntry>(
          this as DnsCacheEntry, _$identity);

  /// Serializes this DnsCacheEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DnsCacheEntry &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, count);

  @override
  String toString() {
    return 'DnsCacheEntry(type: $type, name: $name, count: $count)';
  }
}

/// @nodoc
abstract mixin class $DnsCacheEntryCopyWith<$Res> {
  factory $DnsCacheEntryCopyWith(
          DnsCacheEntry value, $Res Function(DnsCacheEntry) _then) =
      _$DnsCacheEntryCopyWithImpl;
  @useResult
  $Res call({int type, String name, DnsCacheCount count});

  $DnsCacheCountCopyWith<$Res> get count;
}

/// @nodoc
class _$DnsCacheEntryCopyWithImpl<$Res>
    implements $DnsCacheEntryCopyWith<$Res> {
  _$DnsCacheEntryCopyWithImpl(this._self, this._then);

  final DnsCacheEntry _self;
  final $Res Function(DnsCacheEntry) _then;

  /// Create a copy of DnsCacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as DnsCacheCount,
    ));
  }

  /// Create a copy of DnsCacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsCacheCountCopyWith<$Res> get count {
    return $DnsCacheCountCopyWith<$Res>(_self.count, (value) {
      return _then(_self.copyWith(count: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DnsCacheEntry].
extension DnsCacheEntryPatterns on DnsCacheEntry {
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
    TResult Function(_DnsCacheEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsCacheEntry() when $default != null:
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
    TResult Function(_DnsCacheEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheEntry():
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
    TResult? Function(_DnsCacheEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheEntry() when $default != null:
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
    TResult Function(int type, String name, DnsCacheCount count)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsCacheEntry() when $default != null:
        return $default(_that.type, _that.name, _that.count);
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
    TResult Function(int type, String name, DnsCacheCount count) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheEntry():
        return $default(_that.type, _that.name, _that.count);
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
    TResult? Function(int type, String name, DnsCacheCount count)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheEntry() when $default != null:
        return $default(_that.type, _that.name, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsCacheEntry implements DnsCacheEntry {
  const _DnsCacheEntry(
      {required this.type, required this.name, required this.count});
  factory _DnsCacheEntry.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheEntryFromJson(json);

  @override
  final int type;
  @override
  final String name;
  @override
  final DnsCacheCount count;

  /// Create a copy of DnsCacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DnsCacheEntryCopyWith<_DnsCacheEntry> get copyWith =>
      __$DnsCacheEntryCopyWithImpl<_DnsCacheEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DnsCacheEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DnsCacheEntry &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, count);

  @override
  String toString() {
    return 'DnsCacheEntry(type: $type, name: $name, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$DnsCacheEntryCopyWith<$Res>
    implements $DnsCacheEntryCopyWith<$Res> {
  factory _$DnsCacheEntryCopyWith(
          _DnsCacheEntry value, $Res Function(_DnsCacheEntry) _then) =
      __$DnsCacheEntryCopyWithImpl;
  @override
  @useResult
  $Res call({int type, String name, DnsCacheCount count});

  @override
  $DnsCacheCountCopyWith<$Res> get count;
}

/// @nodoc
class __$DnsCacheEntryCopyWithImpl<$Res>
    implements _$DnsCacheEntryCopyWith<$Res> {
  __$DnsCacheEntryCopyWithImpl(this._self, this._then);

  final _DnsCacheEntry _self;
  final $Res Function(_DnsCacheEntry) _then;

  /// Create a copy of DnsCacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_DnsCacheEntry(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as DnsCacheCount,
    ));
  }

  /// Create a copy of DnsCacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsCacheCountCopyWith<$Res> get count {
    return $DnsCacheCountCopyWith<$Res>(_self.count, (value) {
      return _then(_self.copyWith(count: value));
    });
  }
}

/// @nodoc
mixin _$DnsCacheCount {
  int get valid;
  int get stale;

  /// Create a copy of DnsCacheCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DnsCacheCountCopyWith<DnsCacheCount> get copyWith =>
      _$DnsCacheCountCopyWithImpl<DnsCacheCount>(
          this as DnsCacheCount, _$identity);

  /// Serializes this DnsCacheCount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DnsCacheCount &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.stale, stale) || other.stale == stale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valid, stale);

  @override
  String toString() {
    return 'DnsCacheCount(valid: $valid, stale: $stale)';
  }
}

/// @nodoc
abstract mixin class $DnsCacheCountCopyWith<$Res> {
  factory $DnsCacheCountCopyWith(
          DnsCacheCount value, $Res Function(DnsCacheCount) _then) =
      _$DnsCacheCountCopyWithImpl;
  @useResult
  $Res call({int valid, int stale});
}

/// @nodoc
class _$DnsCacheCountCopyWithImpl<$Res>
    implements $DnsCacheCountCopyWith<$Res> {
  _$DnsCacheCountCopyWithImpl(this._self, this._then);

  final DnsCacheCount _self;
  final $Res Function(DnsCacheCount) _then;

  /// Create a copy of DnsCacheCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? stale = null,
  }) {
    return _then(_self.copyWith(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as int,
      stale: null == stale
          ? _self.stale
          : stale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DnsCacheCount].
extension DnsCacheCountPatterns on DnsCacheCount {
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
    TResult Function(_DnsCacheCount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsCacheCount() when $default != null:
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
    TResult Function(_DnsCacheCount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheCount():
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
    TResult? Function(_DnsCacheCount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheCount() when $default != null:
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
    TResult Function(int valid, int stale)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsCacheCount() when $default != null:
        return $default(_that.valid, _that.stale);
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
    TResult Function(int valid, int stale) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheCount():
        return $default(_that.valid, _that.stale);
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
    TResult? Function(int valid, int stale)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsCacheCount() when $default != null:
        return $default(_that.valid, _that.stale);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DnsCacheCount implements DnsCacheCount {
  const _DnsCacheCount({required this.valid, required this.stale});
  factory _DnsCacheCount.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheCountFromJson(json);

  @override
  final int valid;
  @override
  final int stale;

  /// Create a copy of DnsCacheCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DnsCacheCountCopyWith<_DnsCacheCount> get copyWith =>
      __$DnsCacheCountCopyWithImpl<_DnsCacheCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DnsCacheCountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DnsCacheCount &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.stale, stale) || other.stale == stale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valid, stale);

  @override
  String toString() {
    return 'DnsCacheCount(valid: $valid, stale: $stale)';
  }
}

/// @nodoc
abstract mixin class _$DnsCacheCountCopyWith<$Res>
    implements $DnsCacheCountCopyWith<$Res> {
  factory _$DnsCacheCountCopyWith(
          _DnsCacheCount value, $Res Function(_DnsCacheCount) _then) =
      __$DnsCacheCountCopyWithImpl;
  @override
  @useResult
  $Res call({int valid, int stale});
}

/// @nodoc
class __$DnsCacheCountCopyWithImpl<$Res>
    implements _$DnsCacheCountCopyWith<$Res> {
  __$DnsCacheCountCopyWithImpl(this._self, this._then);

  final _DnsCacheCount _self;
  final $Res Function(_DnsCacheCount) _then;

  /// Create a copy of DnsCacheCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valid = null,
    Object? stale = null,
  }) {
    return _then(_DnsCacheCount(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as int,
      stale: null == stale
          ? _self.stale
          : stale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DnsReplies {
  int get forwarded;
  int get unanswered;
  int get local;
  int get optimized;
  int get auth;
  int get sum;

  /// Create a copy of DnsReplies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DnsRepliesCopyWith<DnsReplies> get copyWith =>
      _$DnsRepliesCopyWithImpl<DnsReplies>(this as DnsReplies, _$identity);

  /// Serializes this DnsReplies to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DnsReplies &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.unanswered, unanswered) ||
                other.unanswered == unanswered) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.optimized, optimized) ||
                other.optimized == optimized) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, forwarded, unanswered, local, optimized, auth, sum);

  @override
  String toString() {
    return 'DnsReplies(forwarded: $forwarded, unanswered: $unanswered, local: $local, optimized: $optimized, auth: $auth, sum: $sum)';
  }
}

/// @nodoc
abstract mixin class $DnsRepliesCopyWith<$Res> {
  factory $DnsRepliesCopyWith(
          DnsReplies value, $Res Function(DnsReplies) _then) =
      _$DnsRepliesCopyWithImpl;
  @useResult
  $Res call(
      {int forwarded,
      int unanswered,
      int local,
      int optimized,
      int auth,
      int sum});
}

/// @nodoc
class _$DnsRepliesCopyWithImpl<$Res> implements $DnsRepliesCopyWith<$Res> {
  _$DnsRepliesCopyWithImpl(this._self, this._then);

  final DnsReplies _self;
  final $Res Function(DnsReplies) _then;

  /// Create a copy of DnsReplies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forwarded = null,
    Object? unanswered = null,
    Object? local = null,
    Object? optimized = null,
    Object? auth = null,
    Object? sum = null,
  }) {
    return _then(_self.copyWith(
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      unanswered: null == unanswered
          ? _self.unanswered
          : unanswered // ignore: cast_nullable_to_non_nullable
              as int,
      local: null == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as int,
      optimized: null == optimized
          ? _self.optimized
          : optimized // ignore: cast_nullable_to_non_nullable
              as int,
      auth: null == auth
          ? _self.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as int,
      sum: null == sum
          ? _self.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DnsReplies].
extension DnsRepliesPatterns on DnsReplies {
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
    TResult Function(_DnsReplies value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsReplies() when $default != null:
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
    TResult Function(_DnsReplies value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsReplies():
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
    TResult? Function(_DnsReplies value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsReplies() when $default != null:
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
    TResult Function(int forwarded, int unanswered, int local, int optimized,
            int auth, int sum)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DnsReplies() when $default != null:
        return $default(_that.forwarded, _that.unanswered, _that.local,
            _that.optimized, _that.auth, _that.sum);
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
    TResult Function(int forwarded, int unanswered, int local, int optimized,
            int auth, int sum)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsReplies():
        return $default(_that.forwarded, _that.unanswered, _that.local,
            _that.optimized, _that.auth, _that.sum);
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
    TResult? Function(int forwarded, int unanswered, int local, int optimized,
            int auth, int sum)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DnsReplies() when $default != null:
        return $default(_that.forwarded, _that.unanswered, _that.local,
            _that.optimized, _that.auth, _that.sum);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DnsReplies extends DnsReplies {
  const _DnsReplies(
      {required this.forwarded,
      required this.unanswered,
      required this.local,
      required this.optimized,
      required this.auth,
      required this.sum})
      : super._();
  factory _DnsReplies.fromJson(Map<String, dynamic> json) =>
      _$DnsRepliesFromJson(json);

  @override
  final int forwarded;
  @override
  final int unanswered;
  @override
  final int local;
  @override
  final int optimized;
  @override
  final int auth;
  @override
  final int sum;

  /// Create a copy of DnsReplies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DnsRepliesCopyWith<_DnsReplies> get copyWith =>
      __$DnsRepliesCopyWithImpl<_DnsReplies>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DnsRepliesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DnsReplies &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.unanswered, unanswered) ||
                other.unanswered == unanswered) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.optimized, optimized) ||
                other.optimized == optimized) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, forwarded, unanswered, local, optimized, auth, sum);

  @override
  String toString() {
    return 'DnsReplies(forwarded: $forwarded, unanswered: $unanswered, local: $local, optimized: $optimized, auth: $auth, sum: $sum)';
  }
}

/// @nodoc
abstract mixin class _$DnsRepliesCopyWith<$Res>
    implements $DnsRepliesCopyWith<$Res> {
  factory _$DnsRepliesCopyWith(
          _DnsReplies value, $Res Function(_DnsReplies) _then) =
      __$DnsRepliesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int forwarded,
      int unanswered,
      int local,
      int optimized,
      int auth,
      int sum});
}

/// @nodoc
class __$DnsRepliesCopyWithImpl<$Res> implements _$DnsRepliesCopyWith<$Res> {
  __$DnsRepliesCopyWithImpl(this._self, this._then);

  final _DnsReplies _self;
  final $Res Function(_DnsReplies) _then;

  /// Create a copy of DnsReplies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? forwarded = null,
    Object? unanswered = null,
    Object? local = null,
    Object? optimized = null,
    Object? auth = null,
    Object? sum = null,
  }) {
    return _then(_DnsReplies(
      forwarded: null == forwarded
          ? _self.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      unanswered: null == unanswered
          ? _self.unanswered
          : unanswered // ignore: cast_nullable_to_non_nullable
              as int,
      local: null == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as int,
      optimized: null == optimized
          ? _self.optimized
          : optimized // ignore: cast_nullable_to_non_nullable
              as int,
      auth: null == auth
          ? _self.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as int,
      sum: null == sum
          ? _self.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
