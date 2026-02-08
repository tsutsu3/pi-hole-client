// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_clients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopClients {

 List<SourceStat> get topSources; List<SourceStat> get topSourcesBlocked;// v6-only fields
 int? get totalQueries; int? get blockedQueries;
/// Create a copy of TopClients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopClientsCopyWith<TopClients> get copyWith => _$TopClientsCopyWithImpl<TopClients>(this as TopClients, _$identity);

  /// Serializes this TopClients to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopClients&&const DeepCollectionEquality().equals(other.topSources, topSources)&&const DeepCollectionEquality().equals(other.topSourcesBlocked, topSourcesBlocked)&&(identical(other.totalQueries, totalQueries) || other.totalQueries == totalQueries)&&(identical(other.blockedQueries, blockedQueries) || other.blockedQueries == blockedQueries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(topSources),const DeepCollectionEquality().hash(topSourcesBlocked),totalQueries,blockedQueries);

@override
String toString() {
  return 'TopClients(topSources: $topSources, topSourcesBlocked: $topSourcesBlocked, totalQueries: $totalQueries, blockedQueries: $blockedQueries)';
}


}

/// @nodoc
abstract mixin class $TopClientsCopyWith<$Res>  {
  factory $TopClientsCopyWith(TopClients value, $Res Function(TopClients) _then) = _$TopClientsCopyWithImpl;
@useResult
$Res call({
 List<SourceStat> topSources, List<SourceStat> topSourcesBlocked, int? totalQueries, int? blockedQueries
});




}
/// @nodoc
class _$TopClientsCopyWithImpl<$Res>
    implements $TopClientsCopyWith<$Res> {
  _$TopClientsCopyWithImpl(this._self, this._then);

  final TopClients _self;
  final $Res Function(TopClients) _then;

/// Create a copy of TopClients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topSources = null,Object? topSourcesBlocked = null,Object? totalQueries = freezed,Object? blockedQueries = freezed,}) {
  return _then(_self.copyWith(
topSources: null == topSources ? _self.topSources : topSources // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,topSourcesBlocked: null == topSourcesBlocked ? _self.topSourcesBlocked : topSourcesBlocked // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,totalQueries: freezed == totalQueries ? _self.totalQueries : totalQueries // ignore: cast_nullable_to_non_nullable
as int?,blockedQueries: freezed == blockedQueries ? _self.blockedQueries : blockedQueries // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopClients].
extension TopClientsPatterns on TopClients {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopClients value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopClients() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopClients value)  $default,){
final _that = this;
switch (_that) {
case _TopClients():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopClients value)?  $default,){
final _that = this;
switch (_that) {
case _TopClients() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SourceStat> topSources,  List<SourceStat> topSourcesBlocked,  int? totalQueries,  int? blockedQueries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopClients() when $default != null:
return $default(_that.topSources,_that.topSourcesBlocked,_that.totalQueries,_that.blockedQueries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SourceStat> topSources,  List<SourceStat> topSourcesBlocked,  int? totalQueries,  int? blockedQueries)  $default,) {final _that = this;
switch (_that) {
case _TopClients():
return $default(_that.topSources,_that.topSourcesBlocked,_that.totalQueries,_that.blockedQueries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SourceStat> topSources,  List<SourceStat> topSourcesBlocked,  int? totalQueries,  int? blockedQueries)?  $default,) {final _that = this;
switch (_that) {
case _TopClients() when $default != null:
return $default(_that.topSources,_that.topSourcesBlocked,_that.totalQueries,_that.blockedQueries);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _TopClients implements TopClients {
  const _TopClients({required final  List<SourceStat> topSources, required final  List<SourceStat> topSourcesBlocked, this.totalQueries, this.blockedQueries}): _topSources = topSources,_topSourcesBlocked = topSourcesBlocked;
  factory _TopClients.fromJson(Map<String, dynamic> json) => _$TopClientsFromJson(json);

 final  List<SourceStat> _topSources;
@override List<SourceStat> get topSources {
  if (_topSources is EqualUnmodifiableListView) return _topSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSources);
}

 final  List<SourceStat> _topSourcesBlocked;
@override List<SourceStat> get topSourcesBlocked {
  if (_topSourcesBlocked is EqualUnmodifiableListView) return _topSourcesBlocked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSourcesBlocked);
}

// v6-only fields
@override final  int? totalQueries;
@override final  int? blockedQueries;

/// Create a copy of TopClients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopClientsCopyWith<_TopClients> get copyWith => __$TopClientsCopyWithImpl<_TopClients>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopClientsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopClients&&const DeepCollectionEquality().equals(other._topSources, _topSources)&&const DeepCollectionEquality().equals(other._topSourcesBlocked, _topSourcesBlocked)&&(identical(other.totalQueries, totalQueries) || other.totalQueries == totalQueries)&&(identical(other.blockedQueries, blockedQueries) || other.blockedQueries == blockedQueries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_topSources),const DeepCollectionEquality().hash(_topSourcesBlocked),totalQueries,blockedQueries);

@override
String toString() {
  return 'TopClients(topSources: $topSources, topSourcesBlocked: $topSourcesBlocked, totalQueries: $totalQueries, blockedQueries: $blockedQueries)';
}


}

/// @nodoc
abstract mixin class _$TopClientsCopyWith<$Res> implements $TopClientsCopyWith<$Res> {
  factory _$TopClientsCopyWith(_TopClients value, $Res Function(_TopClients) _then) = __$TopClientsCopyWithImpl;
@override @useResult
$Res call({
 List<SourceStat> topSources, List<SourceStat> topSourcesBlocked, int? totalQueries, int? blockedQueries
});




}
/// @nodoc
class __$TopClientsCopyWithImpl<$Res>
    implements _$TopClientsCopyWith<$Res> {
  __$TopClientsCopyWithImpl(this._self, this._then);

  final _TopClients _self;
  final $Res Function(_TopClients) _then;

/// Create a copy of TopClients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topSources = null,Object? topSourcesBlocked = null,Object? totalQueries = freezed,Object? blockedQueries = freezed,}) {
  return _then(_TopClients(
topSources: null == topSources ? _self._topSources : topSources // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,topSourcesBlocked: null == topSourcesBlocked ? _self._topSourcesBlocked : topSourcesBlocked // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,totalQueries: freezed == totalQueries ? _self.totalQueries : totalQueries // ignore: cast_nullable_to_non_nullable
as int?,blockedQueries: freezed == blockedQueries ? _self.blockedQueries : blockedQueries // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SourceStat {

 String get source; int get count;
/// Create a copy of SourceStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceStatCopyWith<SourceStat> get copyWith => _$SourceStatCopyWithImpl<SourceStat>(this as SourceStat, _$identity);

  /// Serializes this SourceStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceStat&&(identical(other.source, source) || other.source == source)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,count);

@override
String toString() {
  return 'SourceStat(source: $source, count: $count)';
}


}

/// @nodoc
abstract mixin class $SourceStatCopyWith<$Res>  {
  factory $SourceStatCopyWith(SourceStat value, $Res Function(SourceStat) _then) = _$SourceStatCopyWithImpl;
@useResult
$Res call({
 String source, int count
});




}
/// @nodoc
class _$SourceStatCopyWithImpl<$Res>
    implements $SourceStatCopyWith<$Res> {
  _$SourceStatCopyWithImpl(this._self, this._then);

  final SourceStat _self;
  final $Res Function(SourceStat) _then;

/// Create a copy of SourceStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? count = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceStat].
extension SourceStatPatterns on SourceStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceStat value)  $default,){
final _that = this;
switch (_that) {
case _SourceStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceStat value)?  $default,){
final _that = this;
switch (_that) {
case _SourceStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceStat() when $default != null:
return $default(_that.source,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  int count)  $default,) {final _that = this;
switch (_that) {
case _SourceStat():
return $default(_that.source,_that.count);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  int count)?  $default,) {final _that = this;
switch (_that) {
case _SourceStat() when $default != null:
return $default(_that.source,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceStat implements SourceStat {
  const _SourceStat({required this.source, required this.count});
  factory _SourceStat.fromJson(Map<String, dynamic> json) => _$SourceStatFromJson(json);

@override final  String source;
@override final  int count;

/// Create a copy of SourceStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceStatCopyWith<_SourceStat> get copyWith => __$SourceStatCopyWithImpl<_SourceStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceStat&&(identical(other.source, source) || other.source == source)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,count);

@override
String toString() {
  return 'SourceStat(source: $source, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SourceStatCopyWith<$Res> implements $SourceStatCopyWith<$Res> {
  factory _$SourceStatCopyWith(_SourceStat value, $Res Function(_SourceStat) _then) = __$SourceStatCopyWithImpl;
@override @useResult
$Res call({
 String source, int count
});




}
/// @nodoc
class __$SourceStatCopyWithImpl<$Res>
    implements _$SourceStatCopyWith<$Res> {
  __$SourceStatCopyWithImpl(this._self, this._then);

  final _SourceStat _self;
  final $Res Function(_SourceStat) _then;

/// Create a copy of SourceStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? count = null,}) {
  return _then(_SourceStat(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
