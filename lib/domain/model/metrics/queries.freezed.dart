// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Logs {

 List<Log> get logs; int? get cursor; int? get recordsTotal; int? get recordsFiltered;
/// Create a copy of Logs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogsCopyWith<Logs> get copyWith => _$LogsCopyWithImpl<Logs>(this as Logs, _$identity);

  /// Serializes this Logs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Logs&&const DeepCollectionEquality().equals(other.logs, logs)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.recordsTotal, recordsTotal) || other.recordsTotal == recordsTotal)&&(identical(other.recordsFiltered, recordsFiltered) || other.recordsFiltered == recordsFiltered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logs),cursor,recordsTotal,recordsFiltered);

@override
String toString() {
  return 'Logs(logs: $logs, cursor: $cursor, recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered)';
}


}

/// @nodoc
abstract mixin class $LogsCopyWith<$Res>  {
  factory $LogsCopyWith(Logs value, $Res Function(Logs) _then) = _$LogsCopyWithImpl;
@useResult
$Res call({
 List<Log> logs, int? cursor, int? recordsTotal, int? recordsFiltered
});




}
/// @nodoc
class _$LogsCopyWithImpl<$Res>
    implements $LogsCopyWith<$Res> {
  _$LogsCopyWithImpl(this._self, this._then);

  final Logs _self;
  final $Res Function(Logs) _then;

/// Create a copy of Logs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,Object? cursor = freezed,Object? recordsTotal = freezed,Object? recordsFiltered = freezed,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<Log>,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int?,recordsTotal: freezed == recordsTotal ? _self.recordsTotal : recordsTotal // ignore: cast_nullable_to_non_nullable
as int?,recordsFiltered: freezed == recordsFiltered ? _self.recordsFiltered : recordsFiltered // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Logs].
extension LogsPatterns on Logs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Logs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Logs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Logs value)  $default,){
final _that = this;
switch (_that) {
case _Logs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Logs value)?  $default,){
final _that = this;
switch (_that) {
case _Logs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Log> logs,  int? cursor,  int? recordsTotal,  int? recordsFiltered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Logs() when $default != null:
return $default(_that.logs,_that.cursor,_that.recordsTotal,_that.recordsFiltered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Log> logs,  int? cursor,  int? recordsTotal,  int? recordsFiltered)  $default,) {final _that = this;
switch (_that) {
case _Logs():
return $default(_that.logs,_that.cursor,_that.recordsTotal,_that.recordsFiltered);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Log> logs,  int? cursor,  int? recordsTotal,  int? recordsFiltered)?  $default,) {final _that = this;
switch (_that) {
case _Logs() when $default != null:
return $default(_that.logs,_that.cursor,_that.recordsTotal,_that.recordsFiltered);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Logs implements Logs {
  const _Logs({required final  List<Log> logs, this.cursor, this.recordsTotal, this.recordsFiltered}): _logs = logs;
  factory _Logs.fromJson(Map<String, dynamic> json) => _$LogsFromJson(json);

 final  List<Log> _logs;
@override List<Log> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

@override final  int? cursor;
@override final  int? recordsTotal;
@override final  int? recordsFiltered;

/// Create a copy of Logs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogsCopyWith<_Logs> get copyWith => __$LogsCopyWithImpl<_Logs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logs&&const DeepCollectionEquality().equals(other._logs, _logs)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.recordsTotal, recordsTotal) || other.recordsTotal == recordsTotal)&&(identical(other.recordsFiltered, recordsFiltered) || other.recordsFiltered == recordsFiltered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs),cursor,recordsTotal,recordsFiltered);

@override
String toString() {
  return 'Logs(logs: $logs, cursor: $cursor, recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered)';
}


}

/// @nodoc
abstract mixin class _$LogsCopyWith<$Res> implements $LogsCopyWith<$Res> {
  factory _$LogsCopyWith(_Logs value, $Res Function(_Logs) _then) = __$LogsCopyWithImpl;
@override @useResult
$Res call({
 List<Log> logs, int? cursor, int? recordsTotal, int? recordsFiltered
});




}
/// @nodoc
class __$LogsCopyWithImpl<$Res>
    implements _$LogsCopyWith<$Res> {
  __$LogsCopyWithImpl(this._self, this._then);

  final _Logs _self;
  final $Res Function(_Logs) _then;

/// Create a copy of Logs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,Object? cursor = freezed,Object? recordsTotal = freezed,Object? recordsFiltered = freezed,}) {
  return _then(_Logs(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<Log>,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int?,recordsTotal: freezed == recordsTotal ? _self.recordsTotal : recordsTotal // ignore: cast_nullable_to_non_nullable
as int?,recordsFiltered: freezed == recordsFiltered ? _self.recordsFiltered : recordsFiltered // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Log {

 DateTime get dateTime; DnsRecordType get type; String get url; String get device; BigInt get replyTime; QueryStatusType? get status; ReplyType? get replyType; int? get id; String? get answeredBy;// v6-only fields
 String? get cname; String? get dnssec; int? get listId; String? get edeCode; String? get edeText;
/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogCopyWith<Log> get copyWith => _$LogCopyWithImpl<Log>(this as Log, _$identity);

  /// Serializes this Log to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Log&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.device, device) || other.device == device)&&(identical(other.replyTime, replyTime) || other.replyTime == replyTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.replyType, replyType) || other.replyType == replyType)&&(identical(other.id, id) || other.id == id)&&(identical(other.answeredBy, answeredBy) || other.answeredBy == answeredBy)&&(identical(other.cname, cname) || other.cname == cname)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.edeCode, edeCode) || other.edeCode == edeCode)&&(identical(other.edeText, edeText) || other.edeText == edeText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,type,url,device,replyTime,status,replyType,id,answeredBy,cname,dnssec,listId,edeCode,edeText);

@override
String toString() {
  return 'Log(dateTime: $dateTime, type: $type, url: $url, device: $device, replyTime: $replyTime, status: $status, replyType: $replyType, id: $id, answeredBy: $answeredBy, cname: $cname, dnssec: $dnssec, listId: $listId, edeCode: $edeCode, edeText: $edeText)';
}


}

/// @nodoc
abstract mixin class $LogCopyWith<$Res>  {
  factory $LogCopyWith(Log value, $Res Function(Log) _then) = _$LogCopyWithImpl;
@useResult
$Res call({
 DateTime dateTime, DnsRecordType type, String url, String device, BigInt replyTime, QueryStatusType? status, ReplyType? replyType, int? id, String? answeredBy, String? cname, String? dnssec, int? listId, String? edeCode, String? edeText
});




}
/// @nodoc
class _$LogCopyWithImpl<$Res>
    implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._self, this._then);

  final Log _self;
  final $Res Function(Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = null,Object? type = null,Object? url = null,Object? device = null,Object? replyTime = null,Object? status = freezed,Object? replyType = freezed,Object? id = freezed,Object? answeredBy = freezed,Object? cname = freezed,Object? dnssec = freezed,Object? listId = freezed,Object? edeCode = freezed,Object? edeText = freezed,}) {
  return _then(_self.copyWith(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,replyTime: null == replyTime ? _self.replyTime : replyTime // ignore: cast_nullable_to_non_nullable
as BigInt,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QueryStatusType?,replyType: freezed == replyType ? _self.replyType : replyType // ignore: cast_nullable_to_non_nullable
as ReplyType?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,answeredBy: freezed == answeredBy ? _self.answeredBy : answeredBy // ignore: cast_nullable_to_non_nullable
as String?,cname: freezed == cname ? _self.cname : cname // ignore: cast_nullable_to_non_nullable
as String?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as String?,listId: freezed == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as int?,edeCode: freezed == edeCode ? _self.edeCode : edeCode // ignore: cast_nullable_to_non_nullable
as String?,edeText: freezed == edeText ? _self.edeText : edeText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Log].
extension LogPatterns on Log {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Log value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Log() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Log value)  $default,){
final _that = this;
switch (_that) {
case _Log():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Log value)?  $default,){
final _that = this;
switch (_that) {
case _Log() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime dateTime,  DnsRecordType type,  String url,  String device,  BigInt replyTime,  QueryStatusType? status,  ReplyType? replyType,  int? id,  String? answeredBy,  String? cname,  String? dnssec,  int? listId,  String? edeCode,  String? edeText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.dateTime,_that.type,_that.url,_that.device,_that.replyTime,_that.status,_that.replyType,_that.id,_that.answeredBy,_that.cname,_that.dnssec,_that.listId,_that.edeCode,_that.edeText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime dateTime,  DnsRecordType type,  String url,  String device,  BigInt replyTime,  QueryStatusType? status,  ReplyType? replyType,  int? id,  String? answeredBy,  String? cname,  String? dnssec,  int? listId,  String? edeCode,  String? edeText)  $default,) {final _that = this;
switch (_that) {
case _Log():
return $default(_that.dateTime,_that.type,_that.url,_that.device,_that.replyTime,_that.status,_that.replyType,_that.id,_that.answeredBy,_that.cname,_that.dnssec,_that.listId,_that.edeCode,_that.edeText);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime dateTime,  DnsRecordType type,  String url,  String device,  BigInt replyTime,  QueryStatusType? status,  ReplyType? replyType,  int? id,  String? answeredBy,  String? cname,  String? dnssec,  int? listId,  String? edeCode,  String? edeText)?  $default,) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.dateTime,_that.type,_that.url,_that.device,_that.replyTime,_that.status,_that.replyType,_that.id,_that.answeredBy,_that.cname,_that.dnssec,_that.listId,_that.edeCode,_that.edeText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Log implements Log {
  const _Log({required this.dateTime, required this.type, required this.url, required this.device, required this.replyTime, this.status, this.replyType, this.id, this.answeredBy, this.cname, this.dnssec, this.listId, this.edeCode, this.edeText});
  factory _Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

@override final  DateTime dateTime;
@override final  DnsRecordType type;
@override final  String url;
@override final  String device;
@override final  BigInt replyTime;
@override final  QueryStatusType? status;
@override final  ReplyType? replyType;
@override final  int? id;
@override final  String? answeredBy;
// v6-only fields
@override final  String? cname;
@override final  String? dnssec;
@override final  int? listId;
@override final  String? edeCode;
@override final  String? edeText;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogCopyWith<_Log> get copyWith => __$LogCopyWithImpl<_Log>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Log&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.device, device) || other.device == device)&&(identical(other.replyTime, replyTime) || other.replyTime == replyTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.replyType, replyType) || other.replyType == replyType)&&(identical(other.id, id) || other.id == id)&&(identical(other.answeredBy, answeredBy) || other.answeredBy == answeredBy)&&(identical(other.cname, cname) || other.cname == cname)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.edeCode, edeCode) || other.edeCode == edeCode)&&(identical(other.edeText, edeText) || other.edeText == edeText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,type,url,device,replyTime,status,replyType,id,answeredBy,cname,dnssec,listId,edeCode,edeText);

@override
String toString() {
  return 'Log(dateTime: $dateTime, type: $type, url: $url, device: $device, replyTime: $replyTime, status: $status, replyType: $replyType, id: $id, answeredBy: $answeredBy, cname: $cname, dnssec: $dnssec, listId: $listId, edeCode: $edeCode, edeText: $edeText)';
}


}

/// @nodoc
abstract mixin class _$LogCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$LogCopyWith(_Log value, $Res Function(_Log) _then) = __$LogCopyWithImpl;
@override @useResult
$Res call({
 DateTime dateTime, DnsRecordType type, String url, String device, BigInt replyTime, QueryStatusType? status, ReplyType? replyType, int? id, String? answeredBy, String? cname, String? dnssec, int? listId, String? edeCode, String? edeText
});




}
/// @nodoc
class __$LogCopyWithImpl<$Res>
    implements _$LogCopyWith<$Res> {
  __$LogCopyWithImpl(this._self, this._then);

  final _Log _self;
  final $Res Function(_Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = null,Object? type = null,Object? url = null,Object? device = null,Object? replyTime = null,Object? status = freezed,Object? replyType = freezed,Object? id = freezed,Object? answeredBy = freezed,Object? cname = freezed,Object? dnssec = freezed,Object? listId = freezed,Object? edeCode = freezed,Object? edeText = freezed,}) {
  return _then(_Log(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,replyTime: null == replyTime ? _self.replyTime : replyTime // ignore: cast_nullable_to_non_nullable
as BigInt,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QueryStatusType?,replyType: freezed == replyType ? _self.replyType : replyType // ignore: cast_nullable_to_non_nullable
as ReplyType?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,answeredBy: freezed == answeredBy ? _self.answeredBy : answeredBy // ignore: cast_nullable_to_non_nullable
as String?,cname: freezed == cname ? _self.cname : cname // ignore: cast_nullable_to_non_nullable
as String?,dnssec: freezed == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as String?,listId: freezed == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as int?,edeCode: freezed == edeCode ? _self.edeCode : edeCode // ignore: cast_nullable_to_non_nullable
as String?,edeText: freezed == edeText ? _self.edeText : edeText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
