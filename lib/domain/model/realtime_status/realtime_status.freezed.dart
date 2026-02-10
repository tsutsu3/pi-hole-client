// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RealtimeStatus {

 Summary get summary; DnsBlockingStatus get status; TopDomains get topDomains; TopClients get topClients; List<DestinationStat> get forwardDestinations;
/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeStatusCopyWith<RealtimeStatus> get copyWith => _$RealtimeStatusCopyWithImpl<RealtimeStatus>(this as RealtimeStatus, _$identity);

  /// Serializes this RealtimeStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeStatus&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.status, status) || other.status == status)&&(identical(other.topDomains, topDomains) || other.topDomains == topDomains)&&(identical(other.topClients, topClients) || other.topClients == topClients)&&const DeepCollectionEquality().equals(other.forwardDestinations, forwardDestinations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,status,topDomains,topClients,const DeepCollectionEquality().hash(forwardDestinations));

@override
String toString() {
  return 'RealtimeStatus(summary: $summary, status: $status, topDomains: $topDomains, topClients: $topClients, forwardDestinations: $forwardDestinations)';
}


}

/// @nodoc
abstract mixin class $RealtimeStatusCopyWith<$Res>  {
  factory $RealtimeStatusCopyWith(RealtimeStatus value, $Res Function(RealtimeStatus) _then) = _$RealtimeStatusCopyWithImpl;
@useResult
$Res call({
 Summary summary, DnsBlockingStatus status, TopDomains topDomains, TopClients topClients, List<DestinationStat> forwardDestinations
});


$SummaryCopyWith<$Res> get summary;$TopDomainsCopyWith<$Res> get topDomains;$TopClientsCopyWith<$Res> get topClients;

}
/// @nodoc
class _$RealtimeStatusCopyWithImpl<$Res>
    implements $RealtimeStatusCopyWith<$Res> {
  _$RealtimeStatusCopyWithImpl(this._self, this._then);

  final RealtimeStatus _self;
  final $Res Function(RealtimeStatus) _then;

/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? status = null,Object? topDomains = null,Object? topClients = null,Object? forwardDestinations = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DnsBlockingStatus,topDomains: null == topDomains ? _self.topDomains : topDomains // ignore: cast_nullable_to_non_nullable
as TopDomains,topClients: null == topClients ? _self.topClients : topClients // ignore: cast_nullable_to_non_nullable
as TopClients,forwardDestinations: null == forwardDestinations ? _self.forwardDestinations : forwardDestinations // ignore: cast_nullable_to_non_nullable
as List<DestinationStat>,
  ));
}
/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res> get summary {
  
  return $SummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopDomainsCopyWith<$Res> get topDomains {
  
  return $TopDomainsCopyWith<$Res>(_self.topDomains, (value) {
    return _then(_self.copyWith(topDomains: value));
  });
}/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopClientsCopyWith<$Res> get topClients {
  
  return $TopClientsCopyWith<$Res>(_self.topClients, (value) {
    return _then(_self.copyWith(topClients: value));
  });
}
}


/// Adds pattern-matching-related methods to [RealtimeStatus].
extension RealtimeStatusPatterns on RealtimeStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeStatus value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeStatus value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Summary summary,  DnsBlockingStatus status,  TopDomains topDomains,  TopClients topClients,  List<DestinationStat> forwardDestinations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeStatus() when $default != null:
return $default(_that.summary,_that.status,_that.topDomains,_that.topClients,_that.forwardDestinations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Summary summary,  DnsBlockingStatus status,  TopDomains topDomains,  TopClients topClients,  List<DestinationStat> forwardDestinations)  $default,) {final _that = this;
switch (_that) {
case _RealtimeStatus():
return $default(_that.summary,_that.status,_that.topDomains,_that.topClients,_that.forwardDestinations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Summary summary,  DnsBlockingStatus status,  TopDomains topDomains,  TopClients topClients,  List<DestinationStat> forwardDestinations)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeStatus() when $default != null:
return $default(_that.summary,_that.status,_that.topDomains,_that.topClients,_that.forwardDestinations);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RealtimeStatus implements RealtimeStatus {
   _RealtimeStatus({required this.summary, required this.status, required this.topDomains, required this.topClients, required final  List<DestinationStat> forwardDestinations}): _forwardDestinations = forwardDestinations;
  factory _RealtimeStatus.fromJson(Map<String, dynamic> json) => _$RealtimeStatusFromJson(json);

@override final  Summary summary;
@override final  DnsBlockingStatus status;
@override final  TopDomains topDomains;
@override final  TopClients topClients;
 final  List<DestinationStat> _forwardDestinations;
@override List<DestinationStat> get forwardDestinations {
  if (_forwardDestinations is EqualUnmodifiableListView) return _forwardDestinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forwardDestinations);
}


/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeStatusCopyWith<_RealtimeStatus> get copyWith => __$RealtimeStatusCopyWithImpl<_RealtimeStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeStatus&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.status, status) || other.status == status)&&(identical(other.topDomains, topDomains) || other.topDomains == topDomains)&&(identical(other.topClients, topClients) || other.topClients == topClients)&&const DeepCollectionEquality().equals(other._forwardDestinations, _forwardDestinations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,status,topDomains,topClients,const DeepCollectionEquality().hash(_forwardDestinations));

@override
String toString() {
  return 'RealtimeStatus(summary: $summary, status: $status, topDomains: $topDomains, topClients: $topClients, forwardDestinations: $forwardDestinations)';
}


}

/// @nodoc
abstract mixin class _$RealtimeStatusCopyWith<$Res> implements $RealtimeStatusCopyWith<$Res> {
  factory _$RealtimeStatusCopyWith(_RealtimeStatus value, $Res Function(_RealtimeStatus) _then) = __$RealtimeStatusCopyWithImpl;
@override @useResult
$Res call({
 Summary summary, DnsBlockingStatus status, TopDomains topDomains, TopClients topClients, List<DestinationStat> forwardDestinations
});


@override $SummaryCopyWith<$Res> get summary;@override $TopDomainsCopyWith<$Res> get topDomains;@override $TopClientsCopyWith<$Res> get topClients;

}
/// @nodoc
class __$RealtimeStatusCopyWithImpl<$Res>
    implements _$RealtimeStatusCopyWith<$Res> {
  __$RealtimeStatusCopyWithImpl(this._self, this._then);

  final _RealtimeStatus _self;
  final $Res Function(_RealtimeStatus) _then;

/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? status = null,Object? topDomains = null,Object? topClients = null,Object? forwardDestinations = null,}) {
  return _then(_RealtimeStatus(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DnsBlockingStatus,topDomains: null == topDomains ? _self.topDomains : topDomains // ignore: cast_nullable_to_non_nullable
as TopDomains,topClients: null == topClients ? _self.topClients : topClients // ignore: cast_nullable_to_non_nullable
as TopClients,forwardDestinations: null == forwardDestinations ? _self._forwardDestinations : forwardDestinations // ignore: cast_nullable_to_non_nullable
as List<DestinationStat>,
  ));
}

/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res> get summary {
  
  return $SummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopDomainsCopyWith<$Res> get topDomains {
  
  return $TopDomainsCopyWith<$Res>(_self.topDomains, (value) {
    return _then(_self.copyWith(topDomains: value));
  });
}/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopClientsCopyWith<$Res> get topClients {
  
  return $TopClientsCopyWith<$Res>(_self.topClients, (value) {
    return _then(_self.copyWith(topClients: value));
  });
}
}

// dart format on
