// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Domains {

@MapOrEmptyListConverter() List<Domain> get data;
/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainsCopyWith<Domains> get copyWith => _$DomainsCopyWithImpl<Domains>(this as Domains, _$identity);

  /// Serializes this Domains to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Domains&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Domains(data: $data)';
}


}

/// @nodoc
abstract mixin class $DomainsCopyWith<$Res>  {
  factory $DomainsCopyWith(Domains value, $Res Function(Domains) _then) = _$DomainsCopyWithImpl;
@useResult
$Res call({
@MapOrEmptyListConverter() List<Domain> data
});




}
/// @nodoc
class _$DomainsCopyWithImpl<$Res>
    implements $DomainsCopyWith<$Res> {
  _$DomainsCopyWithImpl(this._self, this._then);

  final Domains _self;
  final $Res Function(Domains) _then;

/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Domain>,
  ));
}

}


/// Adds pattern-matching-related methods to [Domains].
extension DomainsPatterns on Domains {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Domains value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Domains() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Domains value)  $default,){
final _that = this;
switch (_that) {
case _Domains():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Domains value)?  $default,){
final _that = this;
switch (_that) {
case _Domains() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MapOrEmptyListConverter()  List<Domain> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Domains() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MapOrEmptyListConverter()  List<Domain> data)  $default,) {final _that = this;
switch (_that) {
case _Domains():
return $default(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MapOrEmptyListConverter()  List<Domain> data)?  $default,) {final _that = this;
switch (_that) {
case _Domains() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Domains implements Domains {
  const _Domains({@MapOrEmptyListConverter() required final  List<Domain> data}): _data = data;
  factory _Domains.fromJson(Map<String, dynamic> json) => _$DomainsFromJson(json);

 final  List<Domain> _data;
@override@MapOrEmptyListConverter() List<Domain> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainsCopyWith<_Domains> get copyWith => __$DomainsCopyWithImpl<_Domains>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Domains&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'Domains(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DomainsCopyWith<$Res> implements $DomainsCopyWith<$Res> {
  factory _$DomainsCopyWith(_Domains value, $Res Function(_Domains) _then) = __$DomainsCopyWithImpl;
@override @useResult
$Res call({
@MapOrEmptyListConverter() List<Domain> data
});




}
/// @nodoc
class __$DomainsCopyWithImpl<$Res>
    implements _$DomainsCopyWith<$Res> {
  __$DomainsCopyWithImpl(this._self, this._then);

  final _Domains _self;
  final $Res Function(_Domains) _then;

/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Domains(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Domain>,
  ));
}


}


/// @nodoc
mixin _$Domain {

 int get id; int get type; String get domain; int get enabled;@JsonKey(name: 'date_added') int get dateAdded;@JsonKey(name: 'date_modified') int get dateModified; String get comment; List<int> get groups;
/// Create a copy of Domain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainCopyWith<Domain> get copyWith => _$DomainCopyWithImpl<Domain>(this as Domain, _$identity);

  /// Serializes this Domain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Domain&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.groups, groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,domain,enabled,dateAdded,dateModified,comment,const DeepCollectionEquality().hash(groups));

@override
String toString() {
  return 'Domain(id: $id, type: $type, domain: $domain, enabled: $enabled, dateAdded: $dateAdded, dateModified: $dateModified, comment: $comment, groups: $groups)';
}


}

/// @nodoc
abstract mixin class $DomainCopyWith<$Res>  {
  factory $DomainCopyWith(Domain value, $Res Function(Domain) _then) = _$DomainCopyWithImpl;
@useResult
$Res call({
 int id, int type, String domain, int enabled,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, String comment, List<int> groups
});




}
/// @nodoc
class _$DomainCopyWithImpl<$Res>
    implements $DomainCopyWith<$Res> {
  _$DomainCopyWithImpl(this._self, this._then);

  final Domain _self;
  final $Res Function(Domain) _then;

/// Create a copy of Domain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? domain = null,Object? enabled = null,Object? dateAdded = null,Object? dateModified = null,Object? comment = null,Object? groups = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as int,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [Domain].
extension DomainPatterns on Domain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Domain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Domain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Domain value)  $default,){
final _that = this;
switch (_that) {
case _Domain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Domain value)?  $default,){
final _that = this;
switch (_that) {
case _Domain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int type,  String domain,  int enabled, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String comment,  List<int> groups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Domain() when $default != null:
return $default(_that.id,_that.type,_that.domain,_that.enabled,_that.dateAdded,_that.dateModified,_that.comment,_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int type,  String domain,  int enabled, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String comment,  List<int> groups)  $default,) {final _that = this;
switch (_that) {
case _Domain():
return $default(_that.id,_that.type,_that.domain,_that.enabled,_that.dateAdded,_that.dateModified,_that.comment,_that.groups);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int type,  String domain,  int enabled, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String comment,  List<int> groups)?  $default,) {final _that = this;
switch (_that) {
case _Domain() when $default != null:
return $default(_that.id,_that.type,_that.domain,_that.enabled,_that.dateAdded,_that.dateModified,_that.comment,_that.groups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Domain implements Domain {
  const _Domain({required this.id, required this.type, required this.domain, required this.enabled, @JsonKey(name: 'date_added') required this.dateAdded, @JsonKey(name: 'date_modified') required this.dateModified, required this.comment, required final  List<int> groups}): _groups = groups;
  factory _Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

@override final  int id;
@override final  int type;
@override final  String domain;
@override final  int enabled;
@override@JsonKey(name: 'date_added') final  int dateAdded;
@override@JsonKey(name: 'date_modified') final  int dateModified;
@override final  String comment;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}


/// Create a copy of Domain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainCopyWith<_Domain> get copyWith => __$DomainCopyWithImpl<_Domain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Domain&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._groups, _groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,domain,enabled,dateAdded,dateModified,comment,const DeepCollectionEquality().hash(_groups));

@override
String toString() {
  return 'Domain(id: $id, type: $type, domain: $domain, enabled: $enabled, dateAdded: $dateAdded, dateModified: $dateModified, comment: $comment, groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$DomainCopyWith<$Res> implements $DomainCopyWith<$Res> {
  factory _$DomainCopyWith(_Domain value, $Res Function(_Domain) _then) = __$DomainCopyWithImpl;
@override @useResult
$Res call({
 int id, int type, String domain, int enabled,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, String comment, List<int> groups
});




}
/// @nodoc
class __$DomainCopyWithImpl<$Res>
    implements _$DomainCopyWith<$Res> {
  __$DomainCopyWithImpl(this._self, this._then);

  final _Domain _self;
  final $Res Function(_Domain) _then;

/// Create a copy of Domain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? domain = null,Object? enabled = null,Object? dateAdded = null,Object? dateModified = null,Object? comment = null,Object? groups = null,}) {
  return _then(_Domain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as int,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$DomainResponse {

 bool get success; String? get message;
/// Create a copy of DomainResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainResponseCopyWith<DomainResponse> get copyWith => _$DomainResponseCopyWithImpl<DomainResponse>(this as DomainResponse, _$identity);

  /// Serializes this DomainResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'DomainResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $DomainResponseCopyWith<$Res>  {
  factory $DomainResponseCopyWith(DomainResponse value, $Res Function(DomainResponse) _then) = _$DomainResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String? message
});




}
/// @nodoc
class _$DomainResponseCopyWithImpl<$Res>
    implements $DomainResponseCopyWith<$Res> {
  _$DomainResponseCopyWithImpl(this._self, this._then);

  final DomainResponse _self;
  final $Res Function(DomainResponse) _then;

/// Create a copy of DomainResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DomainResponse].
extension DomainResponsePatterns on DomainResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DomainResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DomainResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DomainResponse value)  $default,){
final _that = this;
switch (_that) {
case _DomainResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DomainResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DomainResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DomainResponse() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? message)  $default,) {final _that = this;
switch (_that) {
case _DomainResponse():
return $default(_that.success,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _DomainResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DomainResponse implements DomainResponse {
  const _DomainResponse({required this.success, this.message});
  factory _DomainResponse.fromJson(Map<String, dynamic> json) => _$DomainResponseFromJson(json);

@override final  bool success;
@override final  String? message;

/// Create a copy of DomainResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainResponseCopyWith<_DomainResponse> get copyWith => __$DomainResponseCopyWithImpl<_DomainResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DomainResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'DomainResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DomainResponseCopyWith<$Res> implements $DomainResponseCopyWith<$Res> {
  factory _$DomainResponseCopyWith(_DomainResponse value, $Res Function(_DomainResponse) _then) = __$DomainResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? message
});




}
/// @nodoc
class __$DomainResponseCopyWithImpl<$Res>
    implements _$DomainResponseCopyWith<$Res> {
  __$DomainResponseCopyWithImpl(this._self, this._then);

  final _DomainResponse _self;
  final $Res Function(_DomainResponse) _then;

/// Create a copy of DomainResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = freezed,}) {
  return _then(_DomainResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
