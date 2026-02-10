// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DomainLists {

 List<Domain> get allowExact; List<Domain> get allowRegex; List<Domain> get denyExact; List<Domain> get denyRegex;
/// Create a copy of DomainLists
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainListsCopyWith<DomainLists> get copyWith => _$DomainListsCopyWithImpl<DomainLists>(this as DomainLists, _$identity);

  /// Serializes this DomainLists to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainLists&&const DeepCollectionEquality().equals(other.allowExact, allowExact)&&const DeepCollectionEquality().equals(other.allowRegex, allowRegex)&&const DeepCollectionEquality().equals(other.denyExact, denyExact)&&const DeepCollectionEquality().equals(other.denyRegex, denyRegex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allowExact),const DeepCollectionEquality().hash(allowRegex),const DeepCollectionEquality().hash(denyExact),const DeepCollectionEquality().hash(denyRegex));

@override
String toString() {
  return 'DomainLists(allowExact: $allowExact, allowRegex: $allowRegex, denyExact: $denyExact, denyRegex: $denyRegex)';
}


}

/// @nodoc
abstract mixin class $DomainListsCopyWith<$Res>  {
  factory $DomainListsCopyWith(DomainLists value, $Res Function(DomainLists) _then) = _$DomainListsCopyWithImpl;
@useResult
$Res call({
 List<Domain> allowExact, List<Domain> allowRegex, List<Domain> denyExact, List<Domain> denyRegex
});




}
/// @nodoc
class _$DomainListsCopyWithImpl<$Res>
    implements $DomainListsCopyWith<$Res> {
  _$DomainListsCopyWithImpl(this._self, this._then);

  final DomainLists _self;
  final $Res Function(DomainLists) _then;

/// Create a copy of DomainLists
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowExact = null,Object? allowRegex = null,Object? denyExact = null,Object? denyRegex = null,}) {
  return _then(_self.copyWith(
allowExact: null == allowExact ? _self.allowExact : allowExact // ignore: cast_nullable_to_non_nullable
as List<Domain>,allowRegex: null == allowRegex ? _self.allowRegex : allowRegex // ignore: cast_nullable_to_non_nullable
as List<Domain>,denyExact: null == denyExact ? _self.denyExact : denyExact // ignore: cast_nullable_to_non_nullable
as List<Domain>,denyRegex: null == denyRegex ? _self.denyRegex : denyRegex // ignore: cast_nullable_to_non_nullable
as List<Domain>,
  ));
}

}


/// Adds pattern-matching-related methods to [DomainLists].
extension DomainListsPatterns on DomainLists {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DomainLists value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DomainLists() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DomainLists value)  $default,){
final _that = this;
switch (_that) {
case _DomainLists():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DomainLists value)?  $default,){
final _that = this;
switch (_that) {
case _DomainLists() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Domain> allowExact,  List<Domain> allowRegex,  List<Domain> denyExact,  List<Domain> denyRegex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DomainLists() when $default != null:
return $default(_that.allowExact,_that.allowRegex,_that.denyExact,_that.denyRegex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Domain> allowExact,  List<Domain> allowRegex,  List<Domain> denyExact,  List<Domain> denyRegex)  $default,) {final _that = this;
switch (_that) {
case _DomainLists():
return $default(_that.allowExact,_that.allowRegex,_that.denyExact,_that.denyRegex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Domain> allowExact,  List<Domain> allowRegex,  List<Domain> denyExact,  List<Domain> denyRegex)?  $default,) {final _that = this;
switch (_that) {
case _DomainLists() when $default != null:
return $default(_that.allowExact,_that.allowRegex,_that.denyExact,_that.denyRegex);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DomainLists implements DomainLists {
  const _DomainLists({required final  List<Domain> allowExact, required final  List<Domain> allowRegex, required final  List<Domain> denyExact, required final  List<Domain> denyRegex}): _allowExact = allowExact,_allowRegex = allowRegex,_denyExact = denyExact,_denyRegex = denyRegex;
  factory _DomainLists.fromJson(Map<String, dynamic> json) => _$DomainListsFromJson(json);

 final  List<Domain> _allowExact;
@override List<Domain> get allowExact {
  if (_allowExact is EqualUnmodifiableListView) return _allowExact;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowExact);
}

 final  List<Domain> _allowRegex;
@override List<Domain> get allowRegex {
  if (_allowRegex is EqualUnmodifiableListView) return _allowRegex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowRegex);
}

 final  List<Domain> _denyExact;
@override List<Domain> get denyExact {
  if (_denyExact is EqualUnmodifiableListView) return _denyExact;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_denyExact);
}

 final  List<Domain> _denyRegex;
@override List<Domain> get denyRegex {
  if (_denyRegex is EqualUnmodifiableListView) return _denyRegex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_denyRegex);
}


/// Create a copy of DomainLists
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainListsCopyWith<_DomainLists> get copyWith => __$DomainListsCopyWithImpl<_DomainLists>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainListsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DomainLists&&const DeepCollectionEquality().equals(other._allowExact, _allowExact)&&const DeepCollectionEquality().equals(other._allowRegex, _allowRegex)&&const DeepCollectionEquality().equals(other._denyExact, _denyExact)&&const DeepCollectionEquality().equals(other._denyRegex, _denyRegex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allowExact),const DeepCollectionEquality().hash(_allowRegex),const DeepCollectionEquality().hash(_denyExact),const DeepCollectionEquality().hash(_denyRegex));

@override
String toString() {
  return 'DomainLists(allowExact: $allowExact, allowRegex: $allowRegex, denyExact: $denyExact, denyRegex: $denyRegex)';
}


}

/// @nodoc
abstract mixin class _$DomainListsCopyWith<$Res> implements $DomainListsCopyWith<$Res> {
  factory _$DomainListsCopyWith(_DomainLists value, $Res Function(_DomainLists) _then) = __$DomainListsCopyWithImpl;
@override @useResult
$Res call({
 List<Domain> allowExact, List<Domain> allowRegex, List<Domain> denyExact, List<Domain> denyRegex
});




}
/// @nodoc
class __$DomainListsCopyWithImpl<$Res>
    implements _$DomainListsCopyWith<$Res> {
  __$DomainListsCopyWithImpl(this._self, this._then);

  final _DomainLists _self;
  final $Res Function(_DomainLists) _then;

/// Create a copy of DomainLists
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowExact = null,Object? allowRegex = null,Object? denyExact = null,Object? denyRegex = null,}) {
  return _then(_DomainLists(
allowExact: null == allowExact ? _self._allowExact : allowExact // ignore: cast_nullable_to_non_nullable
as List<Domain>,allowRegex: null == allowRegex ? _self._allowRegex : allowRegex // ignore: cast_nullable_to_non_nullable
as List<Domain>,denyExact: null == denyExact ? _self._denyExact : denyExact // ignore: cast_nullable_to_non_nullable
as List<Domain>,denyRegex: null == denyRegex ? _self._denyRegex : denyRegex // ignore: cast_nullable_to_non_nullable
as List<Domain>,
  ));
}


}


/// @nodoc
mixin _$Domain {

 int get id; String get name; DomainType get type; DomainKind get kind; String? get comment; List<int> get groups; bool get enabled; DateTime get dateAdded; DateTime get dateModified;
/// Create a copy of Domain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainCopyWith<Domain> get copyWith => _$DomainCopyWithImpl<Domain>(this as Domain, _$identity);

  /// Serializes this Domain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Domain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,kind,comment,const DeepCollectionEquality().hash(groups),enabled,dateAdded,dateModified);

@override
String toString() {
  return 'Domain(id: $id, name: $name, type: $type, kind: $kind, comment: $comment, groups: $groups, enabled: $enabled, dateAdded: $dateAdded, dateModified: $dateModified)';
}


}

/// @nodoc
abstract mixin class $DomainCopyWith<$Res>  {
  factory $DomainCopyWith(Domain value, $Res Function(Domain) _then) = _$DomainCopyWithImpl;
@useResult
$Res call({
 int id, String name, DomainType type, DomainKind kind, String? comment, List<int> groups, bool enabled, DateTime dateAdded, DateTime dateModified
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? kind = null,Object? comment = freezed,Object? groups = null,Object? enabled = null,Object? dateAdded = null,Object? dateModified = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DomainType,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DomainKind,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  DomainType type,  DomainKind kind,  String? comment,  List<int> groups,  bool enabled,  DateTime dateAdded,  DateTime dateModified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Domain() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.kind,_that.comment,_that.groups,_that.enabled,_that.dateAdded,_that.dateModified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  DomainType type,  DomainKind kind,  String? comment,  List<int> groups,  bool enabled,  DateTime dateAdded,  DateTime dateModified)  $default,) {final _that = this;
switch (_that) {
case _Domain():
return $default(_that.id,_that.name,_that.type,_that.kind,_that.comment,_that.groups,_that.enabled,_that.dateAdded,_that.dateModified);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  DomainType type,  DomainKind kind,  String? comment,  List<int> groups,  bool enabled,  DateTime dateAdded,  DateTime dateModified)?  $default,) {final _that = this;
switch (_that) {
case _Domain() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.kind,_that.comment,_that.groups,_that.enabled,_that.dateAdded,_that.dateModified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Domain implements Domain {
  const _Domain({required this.id, required this.name, required this.type, required this.kind, required this.comment, required final  List<int> groups, required this.enabled, required this.dateAdded, required this.dateModified}): _groups = groups;
  factory _Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

@override final  int id;
@override final  String name;
@override final  DomainType type;
@override final  DomainKind kind;
@override final  String? comment;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  bool enabled;
@override final  DateTime dateAdded;
@override final  DateTime dateModified;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Domain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,kind,comment,const DeepCollectionEquality().hash(_groups),enabled,dateAdded,dateModified);

@override
String toString() {
  return 'Domain(id: $id, name: $name, type: $type, kind: $kind, comment: $comment, groups: $groups, enabled: $enabled, dateAdded: $dateAdded, dateModified: $dateModified)';
}


}

/// @nodoc
abstract mixin class _$DomainCopyWith<$Res> implements $DomainCopyWith<$Res> {
  factory _$DomainCopyWith(_Domain value, $Res Function(_Domain) _then) = __$DomainCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, DomainType type, DomainKind kind, String? comment, List<int> groups, bool enabled, DateTime dateAdded, DateTime dateModified
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? kind = null,Object? comment = freezed,Object? groups = null,Object? enabled = null,Object? dateAdded = null,Object? dateModified = null,}) {
  return _then(_Domain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DomainType,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DomainKind,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
