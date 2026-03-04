// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gravity_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GravitySnapshot {

 GravityStatus get status; List<String> get logs; List<FtlMessage> get messages; DateTime? get startedAt; DateTime? get completedAt;
/// Create a copy of GravitySnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GravitySnapshotCopyWith<GravitySnapshot> get copyWith => _$GravitySnapshotCopyWithImpl<GravitySnapshot>(this as GravitySnapshot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GravitySnapshot&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.logs, logs)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(logs),const DeepCollectionEquality().hash(messages),startedAt,completedAt);

@override
String toString() {
  return 'GravitySnapshot(status: $status, logs: $logs, messages: $messages, startedAt: $startedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $GravitySnapshotCopyWith<$Res>  {
  factory $GravitySnapshotCopyWith(GravitySnapshot value, $Res Function(GravitySnapshot) _then) = _$GravitySnapshotCopyWithImpl;
@useResult
$Res call({
 GravityStatus status, List<String> logs, List<FtlMessage> messages, DateTime? startedAt, DateTime? completedAt
});




}
/// @nodoc
class _$GravitySnapshotCopyWithImpl<$Res>
    implements $GravitySnapshotCopyWith<$Res> {
  _$GravitySnapshotCopyWithImpl(this._self, this._then);

  final GravitySnapshot _self;
  final $Res Function(GravitySnapshot) _then;

/// Create a copy of GravitySnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? logs = null,Object? messages = null,Object? startedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GravityStatus,logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<String>,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<FtlMessage>,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GravitySnapshot].
extension GravitySnapshotPatterns on GravitySnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GravitySnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GravitySnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GravitySnapshot value)  $default,){
final _that = this;
switch (_that) {
case _GravitySnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GravitySnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _GravitySnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GravityStatus status,  List<String> logs,  List<FtlMessage> messages,  DateTime? startedAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GravitySnapshot() when $default != null:
return $default(_that.status,_that.logs,_that.messages,_that.startedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GravityStatus status,  List<String> logs,  List<FtlMessage> messages,  DateTime? startedAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _GravitySnapshot():
return $default(_that.status,_that.logs,_that.messages,_that.startedAt,_that.completedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GravityStatus status,  List<String> logs,  List<FtlMessage> messages,  DateTime? startedAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _GravitySnapshot() when $default != null:
return $default(_that.status,_that.logs,_that.messages,_that.startedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc


class _GravitySnapshot implements GravitySnapshot {
  const _GravitySnapshot({required this.status, required final  List<String> logs, required final  List<FtlMessage> messages, this.startedAt, this.completedAt}): _logs = logs,_messages = messages;
  

@override final  GravityStatus status;
 final  List<String> _logs;
@override List<String> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

 final  List<FtlMessage> _messages;
@override List<FtlMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  DateTime? startedAt;
@override final  DateTime? completedAt;

/// Create a copy of GravitySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GravitySnapshotCopyWith<_GravitySnapshot> get copyWith => __$GravitySnapshotCopyWithImpl<_GravitySnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GravitySnapshot&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._logs, _logs)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_logs),const DeepCollectionEquality().hash(_messages),startedAt,completedAt);

@override
String toString() {
  return 'GravitySnapshot(status: $status, logs: $logs, messages: $messages, startedAt: $startedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$GravitySnapshotCopyWith<$Res> implements $GravitySnapshotCopyWith<$Res> {
  factory _$GravitySnapshotCopyWith(_GravitySnapshot value, $Res Function(_GravitySnapshot) _then) = __$GravitySnapshotCopyWithImpl;
@override @useResult
$Res call({
 GravityStatus status, List<String> logs, List<FtlMessage> messages, DateTime? startedAt, DateTime? completedAt
});




}
/// @nodoc
class __$GravitySnapshotCopyWithImpl<$Res>
    implements _$GravitySnapshotCopyWith<$Res> {
  __$GravitySnapshotCopyWithImpl(this._self, this._then);

  final _GravitySnapshot _self;
  final $Res Function(_GravitySnapshot) _then;

/// Create a copy of GravitySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? logs = null,Object? messages = null,Object? startedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_GravitySnapshot(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GravityStatus,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<String>,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<FtlMessage>,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
