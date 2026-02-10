// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_domains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopDomains {

 List<QueryStat> get topQueries; List<QueryStat> get topAds;// v6-only fields
 int? get totalQueries; int? get blockedQueries;
/// Create a copy of TopDomains
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopDomainsCopyWith<TopDomains> get copyWith => _$TopDomainsCopyWithImpl<TopDomains>(this as TopDomains, _$identity);

  /// Serializes this TopDomains to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopDomains&&const DeepCollectionEquality().equals(other.topQueries, topQueries)&&const DeepCollectionEquality().equals(other.topAds, topAds)&&(identical(other.totalQueries, totalQueries) || other.totalQueries == totalQueries)&&(identical(other.blockedQueries, blockedQueries) || other.blockedQueries == blockedQueries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(topQueries),const DeepCollectionEquality().hash(topAds),totalQueries,blockedQueries);

@override
String toString() {
  return 'TopDomains(topQueries: $topQueries, topAds: $topAds, totalQueries: $totalQueries, blockedQueries: $blockedQueries)';
}


}

/// @nodoc
abstract mixin class $TopDomainsCopyWith<$Res>  {
  factory $TopDomainsCopyWith(TopDomains value, $Res Function(TopDomains) _then) = _$TopDomainsCopyWithImpl;
@useResult
$Res call({
 List<QueryStat> topQueries, List<QueryStat> topAds, int? totalQueries, int? blockedQueries
});




}
/// @nodoc
class _$TopDomainsCopyWithImpl<$Res>
    implements $TopDomainsCopyWith<$Res> {
  _$TopDomainsCopyWithImpl(this._self, this._then);

  final TopDomains _self;
  final $Res Function(TopDomains) _then;

/// Create a copy of TopDomains
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topQueries = null,Object? topAds = null,Object? totalQueries = freezed,Object? blockedQueries = freezed,}) {
  return _then(_self.copyWith(
topQueries: null == topQueries ? _self.topQueries : topQueries // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,topAds: null == topAds ? _self.topAds : topAds // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,totalQueries: freezed == totalQueries ? _self.totalQueries : totalQueries // ignore: cast_nullable_to_non_nullable
as int?,blockedQueries: freezed == blockedQueries ? _self.blockedQueries : blockedQueries // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopDomains].
extension TopDomainsPatterns on TopDomains {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopDomains value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopDomains() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopDomains value)  $default,){
final _that = this;
switch (_that) {
case _TopDomains():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopDomains value)?  $default,){
final _that = this;
switch (_that) {
case _TopDomains() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QueryStat> topQueries,  List<QueryStat> topAds,  int? totalQueries,  int? blockedQueries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopDomains() when $default != null:
return $default(_that.topQueries,_that.topAds,_that.totalQueries,_that.blockedQueries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QueryStat> topQueries,  List<QueryStat> topAds,  int? totalQueries,  int? blockedQueries)  $default,) {final _that = this;
switch (_that) {
case _TopDomains():
return $default(_that.topQueries,_that.topAds,_that.totalQueries,_that.blockedQueries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QueryStat> topQueries,  List<QueryStat> topAds,  int? totalQueries,  int? blockedQueries)?  $default,) {final _that = this;
switch (_that) {
case _TopDomains() when $default != null:
return $default(_that.topQueries,_that.topAds,_that.totalQueries,_that.blockedQueries);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _TopDomains implements TopDomains {
  const _TopDomains({required final  List<QueryStat> topQueries, required final  List<QueryStat> topAds, this.totalQueries, this.blockedQueries}): _topQueries = topQueries,_topAds = topAds;
  factory _TopDomains.fromJson(Map<String, dynamic> json) => _$TopDomainsFromJson(json);

 final  List<QueryStat> _topQueries;
@override List<QueryStat> get topQueries {
  if (_topQueries is EqualUnmodifiableListView) return _topQueries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topQueries);
}

 final  List<QueryStat> _topAds;
@override List<QueryStat> get topAds {
  if (_topAds is EqualUnmodifiableListView) return _topAds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topAds);
}

// v6-only fields
@override final  int? totalQueries;
@override final  int? blockedQueries;

/// Create a copy of TopDomains
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopDomainsCopyWith<_TopDomains> get copyWith => __$TopDomainsCopyWithImpl<_TopDomains>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopDomainsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopDomains&&const DeepCollectionEquality().equals(other._topQueries, _topQueries)&&const DeepCollectionEquality().equals(other._topAds, _topAds)&&(identical(other.totalQueries, totalQueries) || other.totalQueries == totalQueries)&&(identical(other.blockedQueries, blockedQueries) || other.blockedQueries == blockedQueries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_topQueries),const DeepCollectionEquality().hash(_topAds),totalQueries,blockedQueries);

@override
String toString() {
  return 'TopDomains(topQueries: $topQueries, topAds: $topAds, totalQueries: $totalQueries, blockedQueries: $blockedQueries)';
}


}

/// @nodoc
abstract mixin class _$TopDomainsCopyWith<$Res> implements $TopDomainsCopyWith<$Res> {
  factory _$TopDomainsCopyWith(_TopDomains value, $Res Function(_TopDomains) _then) = __$TopDomainsCopyWithImpl;
@override @useResult
$Res call({
 List<QueryStat> topQueries, List<QueryStat> topAds, int? totalQueries, int? blockedQueries
});




}
/// @nodoc
class __$TopDomainsCopyWithImpl<$Res>
    implements _$TopDomainsCopyWith<$Res> {
  __$TopDomainsCopyWithImpl(this._self, this._then);

  final _TopDomains _self;
  final $Res Function(_TopDomains) _then;

/// Create a copy of TopDomains
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topQueries = null,Object? topAds = null,Object? totalQueries = freezed,Object? blockedQueries = freezed,}) {
  return _then(_TopDomains(
topQueries: null == topQueries ? _self._topQueries : topQueries // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,topAds: null == topAds ? _self._topAds : topAds // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,totalQueries: freezed == totalQueries ? _self.totalQueries : totalQueries // ignore: cast_nullable_to_non_nullable
as int?,blockedQueries: freezed == blockedQueries ? _self.blockedQueries : blockedQueries // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$QueryStat {

 String get domain; int get count;
/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryStatCopyWith<QueryStat> get copyWith => _$QueryStatCopyWithImpl<QueryStat>(this as QueryStat, _$identity);

  /// Serializes this QueryStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryStat&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,count);

@override
String toString() {
  return 'QueryStat(domain: $domain, count: $count)';
}


}

/// @nodoc
abstract mixin class $QueryStatCopyWith<$Res>  {
  factory $QueryStatCopyWith(QueryStat value, $Res Function(QueryStat) _then) = _$QueryStatCopyWithImpl;
@useResult
$Res call({
 String domain, int count
});




}
/// @nodoc
class _$QueryStatCopyWithImpl<$Res>
    implements $QueryStatCopyWith<$Res> {
  _$QueryStatCopyWithImpl(this._self, this._then);

  final QueryStat _self;
  final $Res Function(QueryStat) _then;

/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = null,Object? count = null,}) {
  return _then(_self.copyWith(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QueryStat].
extension QueryStatPatterns on QueryStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueryStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueryStat value)  $default,){
final _that = this;
switch (_that) {
case _QueryStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueryStat value)?  $default,){
final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domain,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
return $default(_that.domain,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domain,  int count)  $default,) {final _that = this;
switch (_that) {
case _QueryStat():
return $default(_that.domain,_that.count);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domain,  int count)?  $default,) {final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
return $default(_that.domain,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueryStat implements QueryStat {
  const _QueryStat({required this.domain, required this.count});
  factory _QueryStat.fromJson(Map<String, dynamic> json) => _$QueryStatFromJson(json);

@override final  String domain;
@override final  int count;

/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryStatCopyWith<_QueryStat> get copyWith => __$QueryStatCopyWithImpl<_QueryStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueryStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryStat&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,count);

@override
String toString() {
  return 'QueryStat(domain: $domain, count: $count)';
}


}

/// @nodoc
abstract mixin class _$QueryStatCopyWith<$Res> implements $QueryStatCopyWith<$Res> {
  factory _$QueryStatCopyWith(_QueryStat value, $Res Function(_QueryStat) _then) = __$QueryStatCopyWithImpl;
@override @useResult
$Res call({
 String domain, int count
});




}
/// @nodoc
class __$QueryStatCopyWithImpl<$Res>
    implements _$QueryStatCopyWith<$Res> {
  __$QueryStatCopyWithImpl(this._self, this._then);

  final _QueryStat _self;
  final $Res Function(_QueryStat) _then;

/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = null,Object? count = null,}) {
  return _then(_QueryStat(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
