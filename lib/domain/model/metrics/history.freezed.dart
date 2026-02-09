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

 List<HistoryEntry> get domainsOverTime; List<HistoryEntry> get adsOverTime;
/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryCopyWith<History> get copyWith => _$HistoryCopyWithImpl<History>(this as History, _$identity);

  /// Serializes this History to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is History&&const DeepCollectionEquality().equals(other.domainsOverTime, domainsOverTime)&&const DeepCollectionEquality().equals(other.adsOverTime, adsOverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(domainsOverTime),const DeepCollectionEquality().hash(adsOverTime));

@override
String toString() {
  return 'History(domainsOverTime: $domainsOverTime, adsOverTime: $adsOverTime)';
}


}

/// @nodoc
abstract mixin class $HistoryCopyWith<$Res>  {
  factory $HistoryCopyWith(History value, $Res Function(History) _then) = _$HistoryCopyWithImpl;
@useResult
$Res call({
 List<HistoryEntry> domainsOverTime, List<HistoryEntry> adsOverTime
});




}
/// @nodoc
class _$HistoryCopyWithImpl<$Res>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._self, this._then);

  final History _self;
  final $Res Function(History) _then;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainsOverTime = null,Object? adsOverTime = null,}) {
  return _then(_self.copyWith(
domainsOverTime: null == domainsOverTime ? _self.domainsOverTime : domainsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,adsOverTime: null == adsOverTime ? _self.adsOverTime : adsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _History value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _History() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _History value)  $default,){
final _that = this;
switch (_that) {
case _History():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _History value)?  $default,){
final _that = this;
switch (_that) {
case _History() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryEntry> domainsOverTime,  List<HistoryEntry> adsOverTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _History() when $default != null:
return $default(_that.domainsOverTime,_that.adsOverTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryEntry> domainsOverTime,  List<HistoryEntry> adsOverTime)  $default,) {final _that = this;
switch (_that) {
case _History():
return $default(_that.domainsOverTime,_that.adsOverTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryEntry> domainsOverTime,  List<HistoryEntry> adsOverTime)?  $default,) {final _that = this;
switch (_that) {
case _History() when $default != null:
return $default(_that.domainsOverTime,_that.adsOverTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _History implements History {
  const _History({required final  List<HistoryEntry> domainsOverTime, required final  List<HistoryEntry> adsOverTime}): _domainsOverTime = domainsOverTime,_adsOverTime = adsOverTime;
  factory _History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);

 final  List<HistoryEntry> _domainsOverTime;
@override List<HistoryEntry> get domainsOverTime {
  if (_domainsOverTime is EqualUnmodifiableListView) return _domainsOverTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domainsOverTime);
}

 final  List<HistoryEntry> _adsOverTime;
@override List<HistoryEntry> get adsOverTime {
  if (_adsOverTime is EqualUnmodifiableListView) return _adsOverTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adsOverTime);
}


/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryCopyWith<_History> get copyWith => __$HistoryCopyWithImpl<_History>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _History&&const DeepCollectionEquality().equals(other._domainsOverTime, _domainsOverTime)&&const DeepCollectionEquality().equals(other._adsOverTime, _adsOverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_domainsOverTime),const DeepCollectionEquality().hash(_adsOverTime));

@override
String toString() {
  return 'History(domainsOverTime: $domainsOverTime, adsOverTime: $adsOverTime)';
}


}

/// @nodoc
abstract mixin class _$HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) _then) = __$HistoryCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryEntry> domainsOverTime, List<HistoryEntry> adsOverTime
});




}
/// @nodoc
class __$HistoryCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(this._self, this._then);

  final _History _self;
  final $Res Function(_History) _then;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainsOverTime = null,Object? adsOverTime = null,}) {
  return _then(_History(
domainsOverTime: null == domainsOverTime ? _self._domainsOverTime : domainsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,adsOverTime: null == adsOverTime ? _self._adsOverTime : adsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,
  ));
}


}


/// @nodoc
mixin _$HistoryEntry {

 DateTime get timestamp; int get count;// v5: total queries, v6: total or blocked depending on context
// v6-only fields
 int? get blocked; int? get cached; int? get forwarded;
/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEntryCopyWith<HistoryEntry> get copyWith => _$HistoryEntryCopyWithImpl<HistoryEntry>(this as HistoryEntry, _$identity);

  /// Serializes this HistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEntry&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.count, count) || other.count == count)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.forwarded, forwarded) || other.forwarded == forwarded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,count,blocked,cached,forwarded);

@override
String toString() {
  return 'HistoryEntry(timestamp: $timestamp, count: $count, blocked: $blocked, cached: $cached, forwarded: $forwarded)';
}


}

/// @nodoc
abstract mixin class $HistoryEntryCopyWith<$Res>  {
  factory $HistoryEntryCopyWith(HistoryEntry value, $Res Function(HistoryEntry) _then) = _$HistoryEntryCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, int count, int? blocked, int? cached, int? forwarded
});




}
/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._self, this._then);

  final HistoryEntry _self;
  final $Res Function(HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? count = null,Object? blocked = freezed,Object? cached = freezed,Object? forwarded = freezed,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as int?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as int?,forwarded: freezed == forwarded ? _self.forwarded : forwarded // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  int count,  int? blocked,  int? cached,  int? forwarded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.timestamp,_that.count,_that.blocked,_that.cached,_that.forwarded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  int count,  int? blocked,  int? cached,  int? forwarded)  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry():
return $default(_that.timestamp,_that.count,_that.blocked,_that.cached,_that.forwarded);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  int count,  int? blocked,  int? cached,  int? forwarded)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.timestamp,_that.count,_that.blocked,_that.cached,_that.forwarded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEntry implements HistoryEntry {
  const _HistoryEntry({required this.timestamp, required this.count, this.blocked, this.cached, this.forwarded});
  factory _HistoryEntry.fromJson(Map<String, dynamic> json) => _$HistoryEntryFromJson(json);

@override final  DateTime timestamp;
@override final  int count;
// v5: total queries, v6: total or blocked depending on context
// v6-only fields
@override final  int? blocked;
@override final  int? cached;
@override final  int? forwarded;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEntryCopyWith<_HistoryEntry> get copyWith => __$HistoryEntryCopyWithImpl<_HistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEntry&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.count, count) || other.count == count)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.forwarded, forwarded) || other.forwarded == forwarded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,count,blocked,cached,forwarded);

@override
String toString() {
  return 'HistoryEntry(timestamp: $timestamp, count: $count, blocked: $blocked, cached: $cached, forwarded: $forwarded)';
}


}

/// @nodoc
abstract mixin class _$HistoryEntryCopyWith<$Res> implements $HistoryEntryCopyWith<$Res> {
  factory _$HistoryEntryCopyWith(_HistoryEntry value, $Res Function(_HistoryEntry) _then) = __$HistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, int count, int? blocked, int? cached, int? forwarded
});




}
/// @nodoc
class __$HistoryEntryCopyWithImpl<$Res>
    implements _$HistoryEntryCopyWith<$Res> {
  __$HistoryEntryCopyWithImpl(this._self, this._then);

  final _HistoryEntry _self;
  final $Res Function(_HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? count = null,Object? blocked = freezed,Object? cached = freezed,Object? forwarded = freezed,}) {
  return _then(_HistoryEntry(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as int?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as int?,forwarded: freezed == forwarded ? _self.forwarded : forwarded // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
