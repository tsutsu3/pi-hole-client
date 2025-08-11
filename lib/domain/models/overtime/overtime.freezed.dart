// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overtime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OverTime {

 List<HistoryEntry> get domainsOverTime; List<HistoryEntry> get adsOverTime; List<Client> get clients; List<ClientOverTimeEntry> get overTime;
/// Create a copy of OverTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverTimeCopyWith<OverTime> get copyWith => _$OverTimeCopyWithImpl<OverTime>(this as OverTime, _$identity);

  /// Serializes this OverTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverTime&&const DeepCollectionEquality().equals(other.domainsOverTime, domainsOverTime)&&const DeepCollectionEquality().equals(other.adsOverTime, adsOverTime)&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.overTime, overTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(domainsOverTime),const DeepCollectionEquality().hash(adsOverTime),const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(overTime));

@override
String toString() {
  return 'OverTime(domainsOverTime: $domainsOverTime, adsOverTime: $adsOverTime, clients: $clients, overTime: $overTime)';
}


}

/// @nodoc
abstract mixin class $OverTimeCopyWith<$Res>  {
  factory $OverTimeCopyWith(OverTime value, $Res Function(OverTime) _then) = _$OverTimeCopyWithImpl;
@useResult
$Res call({
 List<HistoryEntry> domainsOverTime, List<HistoryEntry> adsOverTime, List<Client> clients, List<ClientOverTimeEntry> overTime
});




}
/// @nodoc
class _$OverTimeCopyWithImpl<$Res>
    implements $OverTimeCopyWith<$Res> {
  _$OverTimeCopyWithImpl(this._self, this._then);

  final OverTime _self;
  final $Res Function(OverTime) _then;

/// Create a copy of OverTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainsOverTime = null,Object? adsOverTime = null,Object? clients = null,Object? overTime = null,}) {
  return _then(_self.copyWith(
domainsOverTime: null == domainsOverTime ? _self.domainsOverTime : domainsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,adsOverTime: null == adsOverTime ? _self.adsOverTime : adsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>,overTime: null == overTime ? _self.overTime : overTime // ignore: cast_nullable_to_non_nullable
as List<ClientOverTimeEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [OverTime].
extension OverTimePatterns on OverTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverTime value)  $default,){
final _that = this;
switch (_that) {
case _OverTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverTime value)?  $default,){
final _that = this;
switch (_that) {
case _OverTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryEntry> domainsOverTime,  List<HistoryEntry> adsOverTime,  List<Client> clients,  List<ClientOverTimeEntry> overTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverTime() when $default != null:
return $default(_that.domainsOverTime,_that.adsOverTime,_that.clients,_that.overTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryEntry> domainsOverTime,  List<HistoryEntry> adsOverTime,  List<Client> clients,  List<ClientOverTimeEntry> overTime)  $default,) {final _that = this;
switch (_that) {
case _OverTime():
return $default(_that.domainsOverTime,_that.adsOverTime,_that.clients,_that.overTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryEntry> domainsOverTime,  List<HistoryEntry> adsOverTime,  List<Client> clients,  List<ClientOverTimeEntry> overTime)?  $default,) {final _that = this;
switch (_that) {
case _OverTime() when $default != null:
return $default(_that.domainsOverTime,_that.adsOverTime,_that.clients,_that.overTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _OverTime implements OverTime {
   _OverTime({required final  List<HistoryEntry> domainsOverTime, required final  List<HistoryEntry> adsOverTime, required final  List<Client> clients, required final  List<ClientOverTimeEntry> overTime}): _domainsOverTime = domainsOverTime,_adsOverTime = adsOverTime,_clients = clients,_overTime = overTime;
  factory _OverTime.fromJson(Map<String, dynamic> json) => _$OverTimeFromJson(json);

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

 final  List<Client> _clients;
@override List<Client> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}

 final  List<ClientOverTimeEntry> _overTime;
@override List<ClientOverTimeEntry> get overTime {
  if (_overTime is EqualUnmodifiableListView) return _overTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overTime);
}


/// Create a copy of OverTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverTimeCopyWith<_OverTime> get copyWith => __$OverTimeCopyWithImpl<_OverTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverTimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverTime&&const DeepCollectionEquality().equals(other._domainsOverTime, _domainsOverTime)&&const DeepCollectionEquality().equals(other._adsOverTime, _adsOverTime)&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._overTime, _overTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_domainsOverTime),const DeepCollectionEquality().hash(_adsOverTime),const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_overTime));

@override
String toString() {
  return 'OverTime(domainsOverTime: $domainsOverTime, adsOverTime: $adsOverTime, clients: $clients, overTime: $overTime)';
}


}

/// @nodoc
abstract mixin class _$OverTimeCopyWith<$Res> implements $OverTimeCopyWith<$Res> {
  factory _$OverTimeCopyWith(_OverTime value, $Res Function(_OverTime) _then) = __$OverTimeCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryEntry> domainsOverTime, List<HistoryEntry> adsOverTime, List<Client> clients, List<ClientOverTimeEntry> overTime
});




}
/// @nodoc
class __$OverTimeCopyWithImpl<$Res>
    implements _$OverTimeCopyWith<$Res> {
  __$OverTimeCopyWithImpl(this._self, this._then);

  final _OverTime _self;
  final $Res Function(_OverTime) _then;

/// Create a copy of OverTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainsOverTime = null,Object? adsOverTime = null,Object? clients = null,Object? overTime = null,}) {
  return _then(_OverTime(
domainsOverTime: null == domainsOverTime ? _self._domainsOverTime : domainsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,adsOverTime: null == adsOverTime ? _self._adsOverTime : adsOverTime // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,clients: null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>,overTime: null == overTime ? _self._overTime : overTime // ignore: cast_nullable_to_non_nullable
as List<ClientOverTimeEntry>,
  ));
}


}

// dart format on
