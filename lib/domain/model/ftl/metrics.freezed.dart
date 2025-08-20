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

 DnsCache get cache; DnsReplies get replies;
/// Create a copy of InfoDnsMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoDnsMetricsCopyWith<InfoDnsMetrics> get copyWith => _$InfoDnsMetricsCopyWithImpl<InfoDnsMetrics>(this as InfoDnsMetrics, _$identity);

  /// Serializes this InfoDnsMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoDnsMetrics&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.replies, replies) || other.replies == replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cache,replies);

@override
String toString() {
  return 'InfoDnsMetrics(cache: $cache, replies: $replies)';
}


}

/// @nodoc
abstract mixin class $InfoDnsMetricsCopyWith<$Res>  {
  factory $InfoDnsMetricsCopyWith(InfoDnsMetrics value, $Res Function(InfoDnsMetrics) _then) = _$InfoDnsMetricsCopyWithImpl;
@useResult
$Res call({
 DnsCache cache, DnsReplies replies
});


$DnsCacheCopyWith<$Res> get cache;$DnsRepliesCopyWith<$Res> get replies;

}
/// @nodoc
class _$InfoDnsMetricsCopyWithImpl<$Res>
    implements $InfoDnsMetricsCopyWith<$Res> {
  _$InfoDnsMetricsCopyWithImpl(this._self, this._then);

  final InfoDnsMetrics _self;
  final $Res Function(InfoDnsMetrics) _then;

/// Create a copy of InfoDnsMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cache = null,Object? replies = null,}) {
  return _then(_self.copyWith(
cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as DnsCache,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of InfoDnsMetrics
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoDnsMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoDnsMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoDnsMetrics value)  $default,){
final _that = this;
switch (_that) {
case _InfoDnsMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoDnsMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _InfoDnsMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DnsCache cache,  DnsReplies replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoDnsMetrics() when $default != null:
return $default(_that.cache,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DnsCache cache,  DnsReplies replies)  $default,) {final _that = this;
switch (_that) {
case _InfoDnsMetrics():
return $default(_that.cache,_that.replies);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DnsCache cache,  DnsReplies replies)?  $default,) {final _that = this;
switch (_that) {
case _InfoDnsMetrics() when $default != null:
return $default(_that.cache,_that.replies);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoDnsMetrics implements InfoDnsMetrics {
  const _InfoDnsMetrics({required this.cache, required this.replies});
  factory _InfoDnsMetrics.fromJson(Map<String, dynamic> json) => _$InfoDnsMetricsFromJson(json);

@override final  DnsCache cache;
@override final  DnsReplies replies;

/// Create a copy of InfoDnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoDnsMetricsCopyWith<_InfoDnsMetrics> get copyWith => __$InfoDnsMetricsCopyWithImpl<_InfoDnsMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoDnsMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoDnsMetrics&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.replies, replies) || other.replies == replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cache,replies);

@override
String toString() {
  return 'InfoDnsMetrics(cache: $cache, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$InfoDnsMetricsCopyWith<$Res> implements $InfoDnsMetricsCopyWith<$Res> {
  factory _$InfoDnsMetricsCopyWith(_InfoDnsMetrics value, $Res Function(_InfoDnsMetrics) _then) = __$InfoDnsMetricsCopyWithImpl;
@override @useResult
$Res call({
 DnsCache cache, DnsReplies replies
});


@override $DnsCacheCopyWith<$Res> get cache;@override $DnsRepliesCopyWith<$Res> get replies;

}
/// @nodoc
class __$InfoDnsMetricsCopyWithImpl<$Res>
    implements _$InfoDnsMetricsCopyWith<$Res> {
  __$InfoDnsMetricsCopyWithImpl(this._self, this._then);

  final _InfoDnsMetrics _self;
  final $Res Function(_InfoDnsMetrics) _then;

/// Create a copy of InfoDnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cache = null,Object? replies = null,}) {
  return _then(_InfoDnsMetrics(
cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as DnsCache,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of InfoDnsMetrics
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

 int get size; int get records; int get inserted; int get evicted; int get expired; int get immortal; List<DnsTypePercentage> get typePercentages;
/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<DnsCache> get copyWith => _$DnsCacheCopyWithImpl<DnsCache>(this as DnsCache, _$identity);

  /// Serializes this DnsCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsCache&&(identical(other.size, size) || other.size == size)&&(identical(other.records, records) || other.records == records)&&(identical(other.inserted, inserted) || other.inserted == inserted)&&(identical(other.evicted, evicted) || other.evicted == evicted)&&(identical(other.expired, expired) || other.expired == expired)&&(identical(other.immortal, immortal) || other.immortal == immortal)&&const DeepCollectionEquality().equals(other.typePercentages, typePercentages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,records,inserted,evicted,expired,immortal,const DeepCollectionEquality().hash(typePercentages));

@override
String toString() {
  return 'DnsCache(size: $size, records: $records, inserted: $inserted, evicted: $evicted, expired: $expired, immortal: $immortal, typePercentages: $typePercentages)';
}


}

/// @nodoc
abstract mixin class $DnsCacheCopyWith<$Res>  {
  factory $DnsCacheCopyWith(DnsCache value, $Res Function(DnsCache) _then) = _$DnsCacheCopyWithImpl;
@useResult
$Res call({
 int size, int records, int inserted, int evicted, int expired, int immortal, List<DnsTypePercentage> typePercentages
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
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? records = null,Object? inserted = null,Object? evicted = null,Object? expired = null,Object? immortal = null,Object? typePercentages = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as int,inserted: null == inserted ? _self.inserted : inserted // ignore: cast_nullable_to_non_nullable
as int,evicted: null == evicted ? _self.evicted : evicted // ignore: cast_nullable_to_non_nullable
as int,expired: null == expired ? _self.expired : expired // ignore: cast_nullable_to_non_nullable
as int,immortal: null == immortal ? _self.immortal : immortal // ignore: cast_nullable_to_non_nullable
as int,typePercentages: null == typePercentages ? _self.typePercentages : typePercentages // ignore: cast_nullable_to_non_nullable
as List<DnsTypePercentage>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size,  int records,  int inserted,  int evicted,  int expired,  int immortal,  List<DnsTypePercentage> typePercentages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
return $default(_that.size,_that.records,_that.inserted,_that.evicted,_that.expired,_that.immortal,_that.typePercentages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size,  int records,  int inserted,  int evicted,  int expired,  int immortal,  List<DnsTypePercentage> typePercentages)  $default,) {final _that = this;
switch (_that) {
case _DnsCache():
return $default(_that.size,_that.records,_that.inserted,_that.evicted,_that.expired,_that.immortal,_that.typePercentages);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size,  int records,  int inserted,  int evicted,  int expired,  int immortal,  List<DnsTypePercentage> typePercentages)?  $default,) {final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
return $default(_that.size,_that.records,_that.inserted,_that.evicted,_that.expired,_that.immortal,_that.typePercentages);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsCache implements DnsCache {
  const _DnsCache({required this.size, required this.records, required this.inserted, required this.evicted, required this.expired, required this.immortal, required final  List<DnsTypePercentage> typePercentages}): _typePercentages = typePercentages;
  factory _DnsCache.fromJson(Map<String, dynamic> json) => _$DnsCacheFromJson(json);

@override final  int size;
@override final  int records;
@override final  int inserted;
@override final  int evicted;
@override final  int expired;
@override final  int immortal;
 final  List<DnsTypePercentage> _typePercentages;
@override List<DnsTypePercentage> get typePercentages {
  if (_typePercentages is EqualUnmodifiableListView) return _typePercentages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typePercentages);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsCache&&(identical(other.size, size) || other.size == size)&&(identical(other.records, records) || other.records == records)&&(identical(other.inserted, inserted) || other.inserted == inserted)&&(identical(other.evicted, evicted) || other.evicted == evicted)&&(identical(other.expired, expired) || other.expired == expired)&&(identical(other.immortal, immortal) || other.immortal == immortal)&&const DeepCollectionEquality().equals(other._typePercentages, _typePercentages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,records,inserted,evicted,expired,immortal,const DeepCollectionEquality().hash(_typePercentages));

@override
String toString() {
  return 'DnsCache(size: $size, records: $records, inserted: $inserted, evicted: $evicted, expired: $expired, immortal: $immortal, typePercentages: $typePercentages)';
}


}

/// @nodoc
abstract mixin class _$DnsCacheCopyWith<$Res> implements $DnsCacheCopyWith<$Res> {
  factory _$DnsCacheCopyWith(_DnsCache value, $Res Function(_DnsCache) _then) = __$DnsCacheCopyWithImpl;
@override @useResult
$Res call({
 int size, int records, int inserted, int evicted, int expired, int immortal, List<DnsTypePercentage> typePercentages
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
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? records = null,Object? inserted = null,Object? evicted = null,Object? expired = null,Object? immortal = null,Object? typePercentages = null,}) {
  return _then(_DnsCache(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as int,inserted: null == inserted ? _self.inserted : inserted // ignore: cast_nullable_to_non_nullable
as int,evicted: null == evicted ? _self.evicted : evicted // ignore: cast_nullable_to_non_nullable
as int,expired: null == expired ? _self.expired : expired // ignore: cast_nullable_to_non_nullable
as int,immortal: null == immortal ? _self.immortal : immortal // ignore: cast_nullable_to_non_nullable
as int,typePercentages: null == typePercentages ? _self._typePercentages : typePercentages // ignore: cast_nullable_to_non_nullable
as List<DnsTypePercentage>,
  ));
}


}


/// @nodoc
mixin _$DnsTypePercentage {

 DnsRecordType get type; bool get isStale; double get percentage;
/// Create a copy of DnsTypePercentage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsTypePercentageCopyWith<DnsTypePercentage> get copyWith => _$DnsTypePercentageCopyWithImpl<DnsTypePercentage>(this as DnsTypePercentage, _$identity);

  /// Serializes this DnsTypePercentage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsTypePercentage&&(identical(other.type, type) || other.type == type)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,isStale,percentage);

@override
String toString() {
  return 'DnsTypePercentage(type: $type, isStale: $isStale, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $DnsTypePercentageCopyWith<$Res>  {
  factory $DnsTypePercentageCopyWith(DnsTypePercentage value, $Res Function(DnsTypePercentage) _then) = _$DnsTypePercentageCopyWithImpl;
@useResult
$Res call({
 DnsRecordType type, bool isStale, double percentage
});




}
/// @nodoc
class _$DnsTypePercentageCopyWithImpl<$Res>
    implements $DnsTypePercentageCopyWith<$Res> {
  _$DnsTypePercentageCopyWithImpl(this._self, this._then);

  final DnsTypePercentage _self;
  final $Res Function(DnsTypePercentage) _then;

/// Create a copy of DnsTypePercentage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? isStale = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsTypePercentage].
extension DnsTypePercentagePatterns on DnsTypePercentage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsTypePercentage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsTypePercentage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsTypePercentage value)  $default,){
final _that = this;
switch (_that) {
case _DnsTypePercentage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsTypePercentage value)?  $default,){
final _that = this;
switch (_that) {
case _DnsTypePercentage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DnsRecordType type,  bool isStale,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsTypePercentage() when $default != null:
return $default(_that.type,_that.isStale,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DnsRecordType type,  bool isStale,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _DnsTypePercentage():
return $default(_that.type,_that.isStale,_that.percentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DnsRecordType type,  bool isStale,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _DnsTypePercentage() when $default != null:
return $default(_that.type,_that.isStale,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsTypePercentage implements DnsTypePercentage {
  const _DnsTypePercentage({required this.type, required this.isStale, required this.percentage});
  factory _DnsTypePercentage.fromJson(Map<String, dynamic> json) => _$DnsTypePercentageFromJson(json);

@override final  DnsRecordType type;
@override final  bool isStale;
@override final  double percentage;

/// Create a copy of DnsTypePercentage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsTypePercentageCopyWith<_DnsTypePercentage> get copyWith => __$DnsTypePercentageCopyWithImpl<_DnsTypePercentage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsTypePercentageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsTypePercentage&&(identical(other.type, type) || other.type == type)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,isStale,percentage);

@override
String toString() {
  return 'DnsTypePercentage(type: $type, isStale: $isStale, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$DnsTypePercentageCopyWith<$Res> implements $DnsTypePercentageCopyWith<$Res> {
  factory _$DnsTypePercentageCopyWith(_DnsTypePercentage value, $Res Function(_DnsTypePercentage) _then) = __$DnsTypePercentageCopyWithImpl;
@override @useResult
$Res call({
 DnsRecordType type, bool isStale, double percentage
});




}
/// @nodoc
class __$DnsTypePercentageCopyWithImpl<$Res>
    implements _$DnsTypePercentageCopyWith<$Res> {
  __$DnsTypePercentageCopyWithImpl(this._self, this._then);

  final _DnsTypePercentage _self;
  final $Res Function(_DnsTypePercentage) _then;

/// Create a copy of DnsTypePercentage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? isStale = null,Object? percentage = null,}) {
  return _then(_DnsTypePercentage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DnsReplies {

 int get forwarded; int get unanswered; int get local; int get optimized; int get auth; int get sum; double get forwardedPercentage; double get unansweredPercentage; double get localPercentage; double get optimizedPercentage; double get authPercentage;
/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsRepliesCopyWith<DnsReplies> get copyWith => _$DnsRepliesCopyWithImpl<DnsReplies>(this as DnsReplies, _$identity);

  /// Serializes this DnsReplies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsReplies&&(identical(other.forwarded, forwarded) || other.forwarded == forwarded)&&(identical(other.unanswered, unanswered) || other.unanswered == unanswered)&&(identical(other.local, local) || other.local == local)&&(identical(other.optimized, optimized) || other.optimized == optimized)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.forwardedPercentage, forwardedPercentage) || other.forwardedPercentage == forwardedPercentage)&&(identical(other.unansweredPercentage, unansweredPercentage) || other.unansweredPercentage == unansweredPercentage)&&(identical(other.localPercentage, localPercentage) || other.localPercentage == localPercentage)&&(identical(other.optimizedPercentage, optimizedPercentage) || other.optimizedPercentage == optimizedPercentage)&&(identical(other.authPercentage, authPercentage) || other.authPercentage == authPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forwarded,unanswered,local,optimized,auth,sum,forwardedPercentage,unansweredPercentage,localPercentage,optimizedPercentage,authPercentage);

@override
String toString() {
  return 'DnsReplies(forwarded: $forwarded, unanswered: $unanswered, local: $local, optimized: $optimized, auth: $auth, sum: $sum, forwardedPercentage: $forwardedPercentage, unansweredPercentage: $unansweredPercentage, localPercentage: $localPercentage, optimizedPercentage: $optimizedPercentage, authPercentage: $authPercentage)';
}


}

/// @nodoc
abstract mixin class $DnsRepliesCopyWith<$Res>  {
  factory $DnsRepliesCopyWith(DnsReplies value, $Res Function(DnsReplies) _then) = _$DnsRepliesCopyWithImpl;
@useResult
$Res call({
 int forwarded, int unanswered, int local, int optimized, int auth, int sum, double forwardedPercentage, double unansweredPercentage, double localPercentage, double optimizedPercentage, double authPercentage
});




}
/// @nodoc
class _$DnsRepliesCopyWithImpl<$Res>
    implements $DnsRepliesCopyWith<$Res> {
  _$DnsRepliesCopyWithImpl(this._self, this._then);

  final DnsReplies _self;
  final $Res Function(DnsReplies) _then;

/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? forwarded = null,Object? unanswered = null,Object? local = null,Object? optimized = null,Object? auth = null,Object? sum = null,Object? forwardedPercentage = null,Object? unansweredPercentage = null,Object? localPercentage = null,Object? optimizedPercentage = null,Object? authPercentage = null,}) {
  return _then(_self.copyWith(
forwarded: null == forwarded ? _self.forwarded : forwarded // ignore: cast_nullable_to_non_nullable
as int,unanswered: null == unanswered ? _self.unanswered : unanswered // ignore: cast_nullable_to_non_nullable
as int,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as int,optimized: null == optimized ? _self.optimized : optimized // ignore: cast_nullable_to_non_nullable
as int,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,forwardedPercentage: null == forwardedPercentage ? _self.forwardedPercentage : forwardedPercentage // ignore: cast_nullable_to_non_nullable
as double,unansweredPercentage: null == unansweredPercentage ? _self.unansweredPercentage : unansweredPercentage // ignore: cast_nullable_to_non_nullable
as double,localPercentage: null == localPercentage ? _self.localPercentage : localPercentage // ignore: cast_nullable_to_non_nullable
as double,optimizedPercentage: null == optimizedPercentage ? _self.optimizedPercentage : optimizedPercentage // ignore: cast_nullable_to_non_nullable
as double,authPercentage: null == authPercentage ? _self.authPercentage : authPercentage // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsReplies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsReplies value)  $default,){
final _that = this;
switch (_that) {
case _DnsReplies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsReplies value)?  $default,){
final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int forwarded,  int unanswered,  int local,  int optimized,  int auth,  int sum,  double forwardedPercentage,  double unansweredPercentage,  double localPercentage,  double optimizedPercentage,  double authPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
return $default(_that.forwarded,_that.unanswered,_that.local,_that.optimized,_that.auth,_that.sum,_that.forwardedPercentage,_that.unansweredPercentage,_that.localPercentage,_that.optimizedPercentage,_that.authPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int forwarded,  int unanswered,  int local,  int optimized,  int auth,  int sum,  double forwardedPercentage,  double unansweredPercentage,  double localPercentage,  double optimizedPercentage,  double authPercentage)  $default,) {final _that = this;
switch (_that) {
case _DnsReplies():
return $default(_that.forwarded,_that.unanswered,_that.local,_that.optimized,_that.auth,_that.sum,_that.forwardedPercentage,_that.unansweredPercentage,_that.localPercentage,_that.optimizedPercentage,_that.authPercentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int forwarded,  int unanswered,  int local,  int optimized,  int auth,  int sum,  double forwardedPercentage,  double unansweredPercentage,  double localPercentage,  double optimizedPercentage,  double authPercentage)?  $default,) {final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
return $default(_that.forwarded,_that.unanswered,_that.local,_that.optimized,_that.auth,_that.sum,_that.forwardedPercentage,_that.unansweredPercentage,_that.localPercentage,_that.optimizedPercentage,_that.authPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DnsReplies implements DnsReplies {
  const _DnsReplies({required this.forwarded, required this.unanswered, required this.local, required this.optimized, required this.auth, required this.sum, required this.forwardedPercentage, required this.unansweredPercentage, required this.localPercentage, required this.optimizedPercentage, required this.authPercentage});
  factory _DnsReplies.fromJson(Map<String, dynamic> json) => _$DnsRepliesFromJson(json);

@override final  int forwarded;
@override final  int unanswered;
@override final  int local;
@override final  int optimized;
@override final  int auth;
@override final  int sum;
@override final  double forwardedPercentage;
@override final  double unansweredPercentage;
@override final  double localPercentage;
@override final  double optimizedPercentage;
@override final  double authPercentage;

/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsRepliesCopyWith<_DnsReplies> get copyWith => __$DnsRepliesCopyWithImpl<_DnsReplies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsRepliesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsReplies&&(identical(other.forwarded, forwarded) || other.forwarded == forwarded)&&(identical(other.unanswered, unanswered) || other.unanswered == unanswered)&&(identical(other.local, local) || other.local == local)&&(identical(other.optimized, optimized) || other.optimized == optimized)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.forwardedPercentage, forwardedPercentage) || other.forwardedPercentage == forwardedPercentage)&&(identical(other.unansweredPercentage, unansweredPercentage) || other.unansweredPercentage == unansweredPercentage)&&(identical(other.localPercentage, localPercentage) || other.localPercentage == localPercentage)&&(identical(other.optimizedPercentage, optimizedPercentage) || other.optimizedPercentage == optimizedPercentage)&&(identical(other.authPercentage, authPercentage) || other.authPercentage == authPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forwarded,unanswered,local,optimized,auth,sum,forwardedPercentage,unansweredPercentage,localPercentage,optimizedPercentage,authPercentage);

@override
String toString() {
  return 'DnsReplies(forwarded: $forwarded, unanswered: $unanswered, local: $local, optimized: $optimized, auth: $auth, sum: $sum, forwardedPercentage: $forwardedPercentage, unansweredPercentage: $unansweredPercentage, localPercentage: $localPercentage, optimizedPercentage: $optimizedPercentage, authPercentage: $authPercentage)';
}


}

/// @nodoc
abstract mixin class _$DnsRepliesCopyWith<$Res> implements $DnsRepliesCopyWith<$Res> {
  factory _$DnsRepliesCopyWith(_DnsReplies value, $Res Function(_DnsReplies) _then) = __$DnsRepliesCopyWithImpl;
@override @useResult
$Res call({
 int forwarded, int unanswered, int local, int optimized, int auth, int sum, double forwardedPercentage, double unansweredPercentage, double localPercentage, double optimizedPercentage, double authPercentage
});




}
/// @nodoc
class __$DnsRepliesCopyWithImpl<$Res>
    implements _$DnsRepliesCopyWith<$Res> {
  __$DnsRepliesCopyWithImpl(this._self, this._then);

  final _DnsReplies _self;
  final $Res Function(_DnsReplies) _then;

/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? forwarded = null,Object? unanswered = null,Object? local = null,Object? optimized = null,Object? auth = null,Object? sum = null,Object? forwardedPercentage = null,Object? unansweredPercentage = null,Object? localPercentage = null,Object? optimizedPercentage = null,Object? authPercentage = null,}) {
  return _then(_DnsReplies(
forwarded: null == forwarded ? _self.forwarded : forwarded // ignore: cast_nullable_to_non_nullable
as int,unanswered: null == unanswered ? _self.unanswered : unanswered // ignore: cast_nullable_to_non_nullable
as int,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as int,optimized: null == optimized ? _self.optimized : optimized // ignore: cast_nullable_to_non_nullable
as int,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,forwardedPercentage: null == forwardedPercentage ? _self.forwardedPercentage : forwardedPercentage // ignore: cast_nullable_to_non_nullable
as double,unansweredPercentage: null == unansweredPercentage ? _self.unansweredPercentage : unansweredPercentage // ignore: cast_nullable_to_non_nullable
as double,localPercentage: null == localPercentage ? _self.localPercentage : localPercentage // ignore: cast_nullable_to_non_nullable
as double,optimizedPercentage: null == optimizedPercentage ? _self.optimizedPercentage : optimizedPercentage // ignore: cast_nullable_to_non_nullable
as double,authPercentage: null == authPercentage ? _self.authPercentage : authPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
