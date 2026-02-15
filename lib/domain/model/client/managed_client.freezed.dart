// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'managed_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagedClient {

 int get id; String get client; List<int> get groups; DateTime get dateAdded; DateTime get dateModified; String? get name; String? get comment;
/// Create a copy of ManagedClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedClientCopyWith<ManagedClient> get copyWith => _$ManagedClientCopyWithImpl<ManagedClient>(this as ManagedClient, _$identity);

  /// Serializes this ManagedClient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedClient&&(identical(other.id, id) || other.id == id)&&(identical(other.client, client) || other.client == client)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,client,const DeepCollectionEquality().hash(groups),dateAdded,dateModified,name,comment);

@override
String toString() {
  return 'ManagedClient(id: $id, client: $client, groups: $groups, dateAdded: $dateAdded, dateModified: $dateModified, name: $name, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ManagedClientCopyWith<$Res>  {
  factory $ManagedClientCopyWith(ManagedClient value, $Res Function(ManagedClient) _then) = _$ManagedClientCopyWithImpl;
@useResult
$Res call({
 int id, String client, List<int> groups, DateTime dateAdded, DateTime dateModified, String? name, String? comment
});




}
/// @nodoc
class _$ManagedClientCopyWithImpl<$Res>
    implements $ManagedClientCopyWith<$Res> {
  _$ManagedClientCopyWithImpl(this._self, this._then);

  final ManagedClient _self;
  final $Res Function(ManagedClient) _then;

/// Create a copy of ManagedClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? client = null,Object? groups = null,Object? dateAdded = null,Object? dateModified = null,Object? name = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as DateTime,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagedClient].
extension ManagedClientPatterns on ManagedClient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedClient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedClient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedClient value)  $default,){
final _that = this;
switch (_that) {
case _ManagedClient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedClient value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedClient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String client,  List<int> groups,  DateTime dateAdded,  DateTime dateModified,  String? name,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedClient() when $default != null:
return $default(_that.id,_that.client,_that.groups,_that.dateAdded,_that.dateModified,_that.name,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String client,  List<int> groups,  DateTime dateAdded,  DateTime dateModified,  String? name,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _ManagedClient():
return $default(_that.id,_that.client,_that.groups,_that.dateAdded,_that.dateModified,_that.name,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String client,  List<int> groups,  DateTime dateAdded,  DateTime dateModified,  String? name,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _ManagedClient() when $default != null:
return $default(_that.id,_that.client,_that.groups,_that.dateAdded,_that.dateModified,_that.name,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagedClient implements ManagedClient {
  const _ManagedClient({required this.id, required this.client, required final  List<int> groups, required this.dateAdded, required this.dateModified, this.name, this.comment}): _groups = groups;
  factory _ManagedClient.fromJson(Map<String, dynamic> json) => _$ManagedClientFromJson(json);

@override final  int id;
@override final  String client;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  DateTime dateAdded;
@override final  DateTime dateModified;
@override final  String? name;
@override final  String? comment;

/// Create a copy of ManagedClient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedClientCopyWith<_ManagedClient> get copyWith => __$ManagedClientCopyWithImpl<_ManagedClient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagedClientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedClient&&(identical(other.id, id) || other.id == id)&&(identical(other.client, client) || other.client == client)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,client,const DeepCollectionEquality().hash(_groups),dateAdded,dateModified,name,comment);

@override
String toString() {
  return 'ManagedClient(id: $id, client: $client, groups: $groups, dateAdded: $dateAdded, dateModified: $dateModified, name: $name, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$ManagedClientCopyWith<$Res> implements $ManagedClientCopyWith<$Res> {
  factory _$ManagedClientCopyWith(_ManagedClient value, $Res Function(_ManagedClient) _then) = __$ManagedClientCopyWithImpl;
@override @useResult
$Res call({
 int id, String client, List<int> groups, DateTime dateAdded, DateTime dateModified, String? name, String? comment
});




}
/// @nodoc
class __$ManagedClientCopyWithImpl<$Res>
    implements _$ManagedClientCopyWith<$Res> {
  __$ManagedClientCopyWithImpl(this._self, this._then);

  final _ManagedClient _self;
  final $Res Function(_ManagedClient) _then;

/// Create a copy of ManagedClient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? client = null,Object? groups = null,Object? dateAdded = null,Object? dateModified = null,Object? name = freezed,Object? comment = freezed,}) {
  return _then(_ManagedClient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as DateTime,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
