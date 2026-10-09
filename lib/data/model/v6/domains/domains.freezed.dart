// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Domains {

 List<DomainData> get domains; double get took; Processed? get processed;
/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainsCopyWith<Domains> get copyWith => _$DomainsCopyWithImpl<Domains>(this as Domains, _$identity);

  /// Serializes this Domains to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Domains;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Domains&&const DeepCollectionEquality().equals(other.domains, _this.domains)&&(identical(other.took, _this.took) || other.took == _this.took)&&(identical(other.processed, _this.processed) || other.processed == _this.processed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Domains;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.domains),_this.took,_this.processed);
}

@override
String toString() {
  final _this = this as Domains;
  return 'Domains(domains: ${_this.domains}, took: ${_this.took}, processed: ${_this.processed})';
}


}

/// @nodoc
abstract mixin class $DomainsCopyWith<$Res>  {
  factory $DomainsCopyWith(Domains value, $Res Function(Domains) _then) = _$DomainsCopyWithImpl;
@useResult
$Res call({
 List<DomainData> domains, double took, Processed? processed
});


$ProcessedCopyWith<$Res>? get processed;

}
/// @nodoc
class _$DomainsCopyWithImpl<$Res>
    implements $DomainsCopyWith<$Res> {
  _$DomainsCopyWithImpl(this._self, this._then);

  final Domains _self;
  final $Res Function(Domains) _then;

/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domains = null,Object? took = null,Object? processed = freezed,}) {
  return _then(Domains(
domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<DomainData>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,processed: freezed == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as Processed?,
  ));
}
/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessedCopyWith<$Res>? get processed {
    if (_self.processed == null) {
    return null;
  }

  return $ProcessedCopyWith<$Res>(_self.processed!, (value) {
    return _then(_self.copyWith(processed: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DomainData> domains,  double took,  Processed? processed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Domains() when $default != null:
return $default(_that.domains,_that.took,_that.processed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DomainData> domains,  double took,  Processed? processed)  $default,) {final _that = this;
switch (_that) {
case _Domains():
return $default(_that.domains,_that.took,_that.processed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DomainData> domains,  double took,  Processed? processed)?  $default,) {final _that = this;
switch (_that) {
case _Domains() when $default != null:
return $default(_that.domains,_that.took,_that.processed);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Domains implements Domains {
  const _Domains({required  List<DomainData> domains, required this.took, this.processed}): _domains = domains;
  factory _Domains.fromJson(Map<String, dynamic> json) => _$DomainsFromJson(json);

 final  List<DomainData> _domains;
@override List<DomainData> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}

@override final  double took;
@override final  Processed? processed;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Domains&&const DeepCollectionEquality().equals(other.domains, _domains)&&(identical(other.took, took) || other.took == took)&&(identical(other.processed, processed) || other.processed == processed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_domains),took,processed);
}

@override
String toString() {
    return 'Domains(domains: $domains, took: $took, processed: $processed)';
}


}

/// @nodoc
abstract mixin class _$DomainsCopyWith<$Res> implements $DomainsCopyWith<$Res> {
  factory _$DomainsCopyWith(_Domains value, $Res Function(_Domains) _then) = __$DomainsCopyWithImpl;
@override @useResult
$Res call({
 List<DomainData> domains, double took, Processed? processed
});


@override $ProcessedCopyWith<$Res>? get processed;

}
/// @nodoc
class __$DomainsCopyWithImpl<$Res>
    implements _$DomainsCopyWith<$Res> {
  __$DomainsCopyWithImpl(this._self, this._then);

  final _Domains _self;
  final $Res Function(_Domains) _then;

/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domains = null,Object? took = null,Object? processed = freezed,}) {
  return _then(_Domains(
domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<DomainData>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,processed: freezed == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as Processed?,
  ));
}

/// Create a copy of Domains
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessedCopyWith<$Res>? get processed {
    if (_self.processed == null) {
    return null;
  }

  return $ProcessedCopyWith<$Res>(_self.processed!, (value) {
    return _then(_self.copyWith(processed: value));
  });
}
}


/// @nodoc
mixin _$DomainData {

 String get domain; String get unicode; String get type; String get kind; List<int> get groups; bool get enabled; int get id;@JsonKey(name: 'date_added') int get dateAdded;@JsonKey(name: 'date_modified') int get dateModified; String? get comment;
/// Create a copy of DomainData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainDataCopyWith<DomainData> get copyWith => _$DomainDataCopyWithImpl<DomainData>(this as DomainData, _$identity);

  /// Serializes this DomainData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DomainData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainData&&(identical(other.domain, _this.domain) || other.domain == _this.domain)&&(identical(other.unicode, _this.unicode) || other.unicode == _this.unicode)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.groups, _this.groups)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.dateAdded, _this.dateAdded) || other.dateAdded == _this.dateAdded)&&(identical(other.dateModified, _this.dateModified) || other.dateModified == _this.dateModified)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DomainData;
  return Object.hash(runtimeType,_this.domain,_this.unicode,_this.type,_this.kind,const DeepCollectionEquality().hash(_this.groups),_this.enabled,_this.id,_this.dateAdded,_this.dateModified,_this.comment);
}

@override
String toString() {
  final _this = this as DomainData;
  return 'DomainData(domain: ${_this.domain}, unicode: ${_this.unicode}, type: ${_this.type}, kind: ${_this.kind}, groups: ${_this.groups}, enabled: ${_this.enabled}, id: ${_this.id}, dateAdded: ${_this.dateAdded}, dateModified: ${_this.dateModified}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $DomainDataCopyWith<$Res>  {
  factory $DomainDataCopyWith(DomainData value, $Res Function(DomainData) _then) = _$DomainDataCopyWithImpl;
@useResult
$Res call({
 String domain, String unicode, String type, String kind, List<int> groups, bool enabled, int id,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, String? comment
});




}
/// @nodoc
class _$DomainDataCopyWithImpl<$Res>
    implements $DomainDataCopyWith<$Res> {
  _$DomainDataCopyWithImpl(this._self, this._then);

  final DomainData _self;
  final $Res Function(DomainData) _then;

/// Create a copy of DomainData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = null,Object? unicode = null,Object? type = null,Object? kind = null,Object? groups = null,Object? enabled = null,Object? id = null,Object? dateAdded = null,Object? dateModified = null,Object? comment = freezed,}) {
  return _then(DomainData(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,unicode: null == unicode ? _self.unicode : unicode // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DomainData].
extension DomainDataPatterns on DomainData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DomainData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DomainData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DomainData value)  $default,){
final _that = this;
switch (_that) {
case _DomainData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DomainData value)?  $default,){
final _that = this;
switch (_that) {
case _DomainData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domain,  String unicode,  String type,  String kind,  List<int> groups,  bool enabled,  int id, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DomainData() when $default != null:
return $default(_that.domain,_that.unicode,_that.type,_that.kind,_that.groups,_that.enabled,_that.id,_that.dateAdded,_that.dateModified,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domain,  String unicode,  String type,  String kind,  List<int> groups,  bool enabled,  int id, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _DomainData():
return $default(_that.domain,_that.unicode,_that.type,_that.kind,_that.groups,_that.enabled,_that.id,_that.dateAdded,_that.dateModified,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domain,  String unicode,  String type,  String kind,  List<int> groups,  bool enabled,  int id, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _DomainData() when $default != null:
return $default(_that.domain,_that.unicode,_that.type,_that.kind,_that.groups,_that.enabled,_that.id,_that.dateAdded,_that.dateModified,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DomainData implements DomainData {
  const _DomainData({required this.domain, required this.unicode, required this.type, required this.kind, required  List<int> groups, required this.enabled, required this.id, @JsonKey(name: 'date_added') required this.dateAdded, @JsonKey(name: 'date_modified') required this.dateModified, this.comment}): _groups = groups;
  factory _DomainData.fromJson(Map<String, dynamic> json) => _$DomainDataFromJson(json);

@override final  String domain;
@override final  String unicode;
@override final  String type;
@override final  String kind;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  bool enabled;
@override final  int id;
@override@JsonKey(name: 'date_added') final  int dateAdded;
@override@JsonKey(name: 'date_modified') final  int dateModified;
@override final  String? comment;

/// Create a copy of DomainData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainDataCopyWith<_DomainData> get copyWith => __$DomainDataCopyWithImpl<_DomainData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DomainData&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.unicode, unicode) || other.unicode == unicode)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.groups, _groups)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.id, id) || other.id == id)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,domain,unicode,type,kind,const DeepCollectionEquality().hash(_groups),enabled,id,dateAdded,dateModified,comment);
}

@override
String toString() {
    return 'DomainData(domain: $domain, unicode: $unicode, type: $type, kind: $kind, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$DomainDataCopyWith<$Res> implements $DomainDataCopyWith<$Res> {
  factory _$DomainDataCopyWith(_DomainData value, $Res Function(_DomainData) _then) = __$DomainDataCopyWithImpl;
@override @useResult
$Res call({
 String domain, String unicode, String type, String kind, List<int> groups, bool enabled, int id,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, String? comment
});




}
/// @nodoc
class __$DomainDataCopyWithImpl<$Res>
    implements _$DomainDataCopyWith<$Res> {
  __$DomainDataCopyWithImpl(this._self, this._then);

  final _DomainData _self;
  final $Res Function(_DomainData) _then;

/// Create a copy of DomainData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = null,Object? unicode = null,Object? type = null,Object? kind = null,Object? groups = null,Object? enabled = null,Object? id = null,Object? dateAdded = null,Object? dateModified = null,Object? comment = freezed,}) {
  return _then(_DomainData(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,unicode: null == unicode ? _self.unicode : unicode // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Processed {

 List<ProcessedItem> get success; List<ProcessedError> get errors;
/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedCopyWith<Processed> get copyWith => _$ProcessedCopyWithImpl<Processed>(this as Processed, _$identity);

  /// Serializes this Processed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Processed;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processed&&const DeepCollectionEquality().equals(other.success, _this.success)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Processed;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.success),const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as Processed;
  return 'Processed(success: ${_this.success}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $ProcessedCopyWith<$Res>  {
  factory $ProcessedCopyWith(Processed value, $Res Function(Processed) _then) = _$ProcessedCopyWithImpl;
@useResult
$Res call({
 List<ProcessedItem> success, List<ProcessedError> errors
});




}
/// @nodoc
class _$ProcessedCopyWithImpl<$Res>
    implements $ProcessedCopyWith<$Res> {
  _$ProcessedCopyWithImpl(this._self, this._then);

  final Processed _self;
  final $Res Function(Processed) _then;

/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? errors = null,}) {
  return _then(Processed(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as List<ProcessedItem>,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<ProcessedError>,
  ));
}

}


/// Adds pattern-matching-related methods to [Processed].
extension ProcessedPatterns on Processed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Processed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Processed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Processed value)  $default,){
final _that = this;
switch (_that) {
case _Processed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Processed value)?  $default,){
final _that = this;
switch (_that) {
case _Processed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProcessedItem> success,  List<ProcessedError> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Processed() when $default != null:
return $default(_that.success,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProcessedItem> success,  List<ProcessedError> errors)  $default,) {final _that = this;
switch (_that) {
case _Processed():
return $default(_that.success,_that.errors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProcessedItem> success,  List<ProcessedError> errors)?  $default,) {final _that = this;
switch (_that) {
case _Processed() when $default != null:
return $default(_that.success,_that.errors);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Processed implements Processed {
  const _Processed({required  List<ProcessedItem> success, required  List<ProcessedError> errors}): _success = success,_errors = errors;
  factory _Processed.fromJson(Map<String, dynamic> json) => _$ProcessedFromJson(json);

 final  List<ProcessedItem> _success;
@override List<ProcessedItem> get success {
  if (_success is EqualUnmodifiableListView) return _success;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_success);
}

 final  List<ProcessedError> _errors;
@override List<ProcessedError> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedCopyWith<_Processed> get copyWith => __$ProcessedCopyWithImpl<_Processed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processed&&const DeepCollectionEquality().equals(other.success, _success)&&const DeepCollectionEquality().equals(other.errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_success),const DeepCollectionEquality().hash(_errors));
}

@override
String toString() {
    return 'Processed(success: $success, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ProcessedCopyWith<$Res> implements $ProcessedCopyWith<$Res> {
  factory _$ProcessedCopyWith(_Processed value, $Res Function(_Processed) _then) = __$ProcessedCopyWithImpl;
@override @useResult
$Res call({
 List<ProcessedItem> success, List<ProcessedError> errors
});




}
/// @nodoc
class __$ProcessedCopyWithImpl<$Res>
    implements _$ProcessedCopyWith<$Res> {
  __$ProcessedCopyWithImpl(this._self, this._then);

  final _Processed _self;
  final $Res Function(_Processed) _then;

/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? errors = null,}) {
  return _then(_Processed(
success: null == success ? _self._success : success // ignore: cast_nullable_to_non_nullable
as List<ProcessedItem>,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<ProcessedError>,
  ));
}


}


/// @nodoc
mixin _$ProcessedItem {

 String get item;
/// Create a copy of ProcessedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedItemCopyWith<ProcessedItem> get copyWith => _$ProcessedItemCopyWithImpl<ProcessedItem>(this as ProcessedItem, _$identity);

  /// Serializes this ProcessedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProcessedItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessedItem&&(identical(other.item, _this.item) || other.item == _this.item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProcessedItem;
  return Object.hash(runtimeType,_this.item);
}

@override
String toString() {
  final _this = this as ProcessedItem;
  return 'ProcessedItem(item: ${_this.item})';
}


}

/// @nodoc
abstract mixin class $ProcessedItemCopyWith<$Res>  {
  factory $ProcessedItemCopyWith(ProcessedItem value, $Res Function(ProcessedItem) _then) = _$ProcessedItemCopyWithImpl;
@useResult
$Res call({
 String item
});




}
/// @nodoc
class _$ProcessedItemCopyWithImpl<$Res>
    implements $ProcessedItemCopyWith<$Res> {
  _$ProcessedItemCopyWithImpl(this._self, this._then);

  final ProcessedItem _self;
  final $Res Function(ProcessedItem) _then;

/// Create a copy of ProcessedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(ProcessedItem(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessedItem].
extension ProcessedItemPatterns on ProcessedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessedItem value)  $default,){
final _that = this;
switch (_that) {
case _ProcessedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessedItem value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessedItem() when $default != null:
return $default(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String item)  $default,) {final _that = this;
switch (_that) {
case _ProcessedItem():
return $default(_that.item);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String item)?  $default,) {final _that = this;
switch (_that) {
case _ProcessedItem() when $default != null:
return $default(_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessedItem implements ProcessedItem {
  const _ProcessedItem({required this.item});
  factory _ProcessedItem.fromJson(Map<String, dynamic> json) => _$ProcessedItemFromJson(json);

@override final  String item;

/// Create a copy of ProcessedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedItemCopyWith<_ProcessedItem> get copyWith => __$ProcessedItemCopyWithImpl<_ProcessedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessedItem&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item);
}

@override
String toString() {
    return 'ProcessedItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$ProcessedItemCopyWith<$Res> implements $ProcessedItemCopyWith<$Res> {
  factory _$ProcessedItemCopyWith(_ProcessedItem value, $Res Function(_ProcessedItem) _then) = __$ProcessedItemCopyWithImpl;
@override @useResult
$Res call({
 String item
});




}
/// @nodoc
class __$ProcessedItemCopyWithImpl<$Res>
    implements _$ProcessedItemCopyWith<$Res> {
  __$ProcessedItemCopyWithImpl(this._self, this._then);

  final _ProcessedItem _self;
  final $Res Function(_ProcessedItem) _then;

/// Create a copy of ProcessedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_ProcessedItem(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProcessedError {

 String get item; String get error;
/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedErrorCopyWith<ProcessedError> get copyWith => _$ProcessedErrorCopyWithImpl<ProcessedError>(this as ProcessedError, _$identity);

  /// Serializes this ProcessedError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProcessedError;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessedError&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.error, _this.error) || other.error == _this.error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProcessedError;
  return Object.hash(runtimeType,_this.item,_this.error);
}

@override
String toString() {
  final _this = this as ProcessedError;
  return 'ProcessedError(item: ${_this.item}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $ProcessedErrorCopyWith<$Res>  {
  factory $ProcessedErrorCopyWith(ProcessedError value, $Res Function(ProcessedError) _then) = _$ProcessedErrorCopyWithImpl;
@useResult
$Res call({
 String item, String error
});




}
/// @nodoc
class _$ProcessedErrorCopyWithImpl<$Res>
    implements $ProcessedErrorCopyWith<$Res> {
  _$ProcessedErrorCopyWithImpl(this._self, this._then);

  final ProcessedError _self;
  final $Res Function(ProcessedError) _then;

/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? error = null,}) {
  return _then(ProcessedError(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessedError].
extension ProcessedErrorPatterns on ProcessedError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessedError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessedError value)  $default,){
final _that = this;
switch (_that) {
case _ProcessedError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessedError value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String item,  String error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
return $default(_that.item,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String item,  String error)  $default,) {final _that = this;
switch (_that) {
case _ProcessedError():
return $default(_that.item,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String item,  String error)?  $default,) {final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
return $default(_that.item,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessedError implements ProcessedError {
  const _ProcessedError({required this.item, required this.error});
  factory _ProcessedError.fromJson(Map<String, dynamic> json) => _$ProcessedErrorFromJson(json);

@override final  String item;
@override final  String error;

/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedErrorCopyWith<_ProcessedError> get copyWith => __$ProcessedErrorCopyWithImpl<_ProcessedError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedErrorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessedError&&(identical(other.item, item) || other.item == item)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item,error);
}

@override
String toString() {
    return 'ProcessedError(item: $item, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProcessedErrorCopyWith<$Res> implements $ProcessedErrorCopyWith<$Res> {
  factory _$ProcessedErrorCopyWith(_ProcessedError value, $Res Function(_ProcessedError) _then) = __$ProcessedErrorCopyWithImpl;
@override @useResult
$Res call({
 String item, String error
});




}
/// @nodoc
class __$ProcessedErrorCopyWithImpl<$Res>
    implements _$ProcessedErrorCopyWith<$Res> {
  __$ProcessedErrorCopyWithImpl(this._self, this._then);

  final _ProcessedError _self;
  final $Res Function(_ProcessedError) _then;

/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? error = null,}) {
  return _then(_ProcessedError(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
