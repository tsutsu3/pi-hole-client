// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Search {

 SearchData get search; double get took;
/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCopyWith<Search> get copyWith => _$SearchCopyWithImpl<Search>(this as Search, _$identity);

  /// Serializes this Search to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Search&&(identical(other.search, search) || other.search == search)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,search,took);

@override
String toString() {
  return 'Search(search: $search, took: $took)';
}


}

/// @nodoc
abstract mixin class $SearchCopyWith<$Res>  {
  factory $SearchCopyWith(Search value, $Res Function(Search) _then) = _$SearchCopyWithImpl;
@useResult
$Res call({
 SearchData search, double took
});


$SearchDataCopyWith<$Res> get search;

}
/// @nodoc
class _$SearchCopyWithImpl<$Res>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._self, this._then);

  final Search _self;
  final $Res Function(Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,Object? took = null,}) {
  return _then(_self.copyWith(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as SearchData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchDataCopyWith<$Res> get search {
  
  return $SearchDataCopyWith<$Res>(_self.search, (value) {
    return _then(_self.copyWith(search: value));
  });
}
}


/// Adds pattern-matching-related methods to [Search].
extension SearchPatterns on Search {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Search value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Search() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Search value)  $default,){
final _that = this;
switch (_that) {
case _Search():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Search value)?  $default,){
final _that = this;
switch (_that) {
case _Search() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchData search,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Search() when $default != null:
return $default(_that.search,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchData search,  double took)  $default,) {final _that = this;
switch (_that) {
case _Search():
return $default(_that.search,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchData search,  double took)?  $default,) {final _that = this;
switch (_that) {
case _Search() when $default != null:
return $default(_that.search,_that.took);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Search implements Search {
  const _Search({required this.search, required this.took});
  factory _Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

@override final  SearchData search;
@override final  double took;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&(identical(other.search, search) || other.search == search)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,search,took);

@override
String toString() {
  return 'Search(search: $search, took: $took)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@override @useResult
$Res call({
 SearchData search, double took
});


@override $SearchDataCopyWith<$Res> get search;

}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,Object? took = null,}) {
  return _then(_Search(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as SearchData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchDataCopyWith<$Res> get search {
  
  return $SearchDataCopyWith<$Res>(_self.search, (value) {
    return _then(_self.copyWith(search: value));
  });
}
}


/// @nodoc
mixin _$SearchData {

 List<DomainEntry> get domains; List<GravityEntry> get gravity; SearchParameters get parameters; SearchResults get results;
/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchDataCopyWith<SearchData> get copyWith => _$SearchDataCopyWithImpl<SearchData>(this as SearchData, _$identity);

  /// Serializes this SearchData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchData&&const DeepCollectionEquality().equals(other.domains, domains)&&const DeepCollectionEquality().equals(other.gravity, gravity)&&(identical(other.parameters, parameters) || other.parameters == parameters)&&(identical(other.results, results) || other.results == results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(domains),const DeepCollectionEquality().hash(gravity),parameters,results);

@override
String toString() {
  return 'SearchData(domains: $domains, gravity: $gravity, parameters: $parameters, results: $results)';
}


}

/// @nodoc
abstract mixin class $SearchDataCopyWith<$Res>  {
  factory $SearchDataCopyWith(SearchData value, $Res Function(SearchData) _then) = _$SearchDataCopyWithImpl;
@useResult
$Res call({
 List<DomainEntry> domains, List<GravityEntry> gravity, SearchParameters parameters, SearchResults results
});


$SearchParametersCopyWith<$Res> get parameters;$SearchResultsCopyWith<$Res> get results;

}
/// @nodoc
class _$SearchDataCopyWithImpl<$Res>
    implements $SearchDataCopyWith<$Res> {
  _$SearchDataCopyWithImpl(this._self, this._then);

  final SearchData _self;
  final $Res Function(SearchData) _then;

/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domains = null,Object? gravity = null,Object? parameters = null,Object? results = null,}) {
  return _then(_self.copyWith(
domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<DomainEntry>,gravity: null == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as List<GravityEntry>,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as SearchParameters,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as SearchResults,
  ));
}
/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchParametersCopyWith<$Res> get parameters {
  
  return $SearchParametersCopyWith<$Res>(_self.parameters, (value) {
    return _then(_self.copyWith(parameters: value));
  });
}/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<$Res> get results {
  
  return $SearchResultsCopyWith<$Res>(_self.results, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchData].
extension SearchDataPatterns on SearchData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchData value)  $default,){
final _that = this;
switch (_that) {
case _SearchData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchData value)?  $default,){
final _that = this;
switch (_that) {
case _SearchData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DomainEntry> domains,  List<GravityEntry> gravity,  SearchParameters parameters,  SearchResults results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchData() when $default != null:
return $default(_that.domains,_that.gravity,_that.parameters,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DomainEntry> domains,  List<GravityEntry> gravity,  SearchParameters parameters,  SearchResults results)  $default,) {final _that = this;
switch (_that) {
case _SearchData():
return $default(_that.domains,_that.gravity,_that.parameters,_that.results);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DomainEntry> domains,  List<GravityEntry> gravity,  SearchParameters parameters,  SearchResults results)?  $default,) {final _that = this;
switch (_that) {
case _SearchData() when $default != null:
return $default(_that.domains,_that.gravity,_that.parameters,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchData implements SearchData {
  const _SearchData({required final  List<DomainEntry> domains, required final  List<GravityEntry> gravity, required this.parameters, required this.results}): _domains = domains,_gravity = gravity;
  factory _SearchData.fromJson(Map<String, dynamic> json) => _$SearchDataFromJson(json);

 final  List<DomainEntry> _domains;
@override List<DomainEntry> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}

 final  List<GravityEntry> _gravity;
@override List<GravityEntry> get gravity {
  if (_gravity is EqualUnmodifiableListView) return _gravity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gravity);
}

@override final  SearchParameters parameters;
@override final  SearchResults results;

/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchDataCopyWith<_SearchData> get copyWith => __$SearchDataCopyWithImpl<_SearchData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchData&&const DeepCollectionEquality().equals(other._domains, _domains)&&const DeepCollectionEquality().equals(other._gravity, _gravity)&&(identical(other.parameters, parameters) || other.parameters == parameters)&&(identical(other.results, results) || other.results == results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_domains),const DeepCollectionEquality().hash(_gravity),parameters,results);

@override
String toString() {
  return 'SearchData(domains: $domains, gravity: $gravity, parameters: $parameters, results: $results)';
}


}

/// @nodoc
abstract mixin class _$SearchDataCopyWith<$Res> implements $SearchDataCopyWith<$Res> {
  factory _$SearchDataCopyWith(_SearchData value, $Res Function(_SearchData) _then) = __$SearchDataCopyWithImpl;
@override @useResult
$Res call({
 List<DomainEntry> domains, List<GravityEntry> gravity, SearchParameters parameters, SearchResults results
});


@override $SearchParametersCopyWith<$Res> get parameters;@override $SearchResultsCopyWith<$Res> get results;

}
/// @nodoc
class __$SearchDataCopyWithImpl<$Res>
    implements _$SearchDataCopyWith<$Res> {
  __$SearchDataCopyWithImpl(this._self, this._then);

  final _SearchData _self;
  final $Res Function(_SearchData) _then;

/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domains = null,Object? gravity = null,Object? parameters = null,Object? results = null,}) {
  return _then(_SearchData(
domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<DomainEntry>,gravity: null == gravity ? _self._gravity : gravity // ignore: cast_nullable_to_non_nullable
as List<GravityEntry>,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as SearchParameters,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as SearchResults,
  ));
}

/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchParametersCopyWith<$Res> get parameters {
  
  return $SearchParametersCopyWith<$Res>(_self.parameters, (value) {
    return _then(_self.copyWith(parameters: value));
  });
}/// Create a copy of SearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<$Res> get results {
  
  return $SearchResultsCopyWith<$Res>(_self.results, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}


/// @nodoc
mixin _$DomainEntry {

 String get domain; bool get enabled; DomainType get type; DomainKind get kind; int get id;@JsonKey(name: 'date_added') int get dateAdded;@JsonKey(name: 'date_modified') int get dateModified; List<int> get groups; String? get comment;
/// Create a copy of DomainEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainEntryCopyWith<DomainEntry> get copyWith => _$DomainEntryCopyWithImpl<DomainEntry>(this as DomainEntry, _$identity);

  /// Serializes this DomainEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainEntry&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,enabled,type,kind,id,dateAdded,dateModified,const DeepCollectionEquality().hash(groups),comment);

@override
String toString() {
  return 'DomainEntry(domain: $domain, enabled: $enabled, type: $type, kind: $kind, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, groups: $groups, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $DomainEntryCopyWith<$Res>  {
  factory $DomainEntryCopyWith(DomainEntry value, $Res Function(DomainEntry) _then) = _$DomainEntryCopyWithImpl;
@useResult
$Res call({
 String domain, bool enabled, DomainType type, DomainKind kind, int id,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, List<int> groups, String? comment
});




}
/// @nodoc
class _$DomainEntryCopyWithImpl<$Res>
    implements $DomainEntryCopyWith<$Res> {
  _$DomainEntryCopyWithImpl(this._self, this._then);

  final DomainEntry _self;
  final $Res Function(DomainEntry) _then;

/// Create a copy of DomainEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = null,Object? enabled = null,Object? type = null,Object? kind = null,Object? id = null,Object? dateAdded = null,Object? dateModified = null,Object? groups = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DomainType,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DomainKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DomainEntry].
extension DomainEntryPatterns on DomainEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DomainEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DomainEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DomainEntry value)  $default,){
final _that = this;
switch (_that) {
case _DomainEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DomainEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DomainEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domain,  bool enabled,  DomainType type,  DomainKind kind,  int id, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  List<int> groups,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DomainEntry() when $default != null:
return $default(_that.domain,_that.enabled,_that.type,_that.kind,_that.id,_that.dateAdded,_that.dateModified,_that.groups,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domain,  bool enabled,  DomainType type,  DomainKind kind,  int id, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  List<int> groups,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _DomainEntry():
return $default(_that.domain,_that.enabled,_that.type,_that.kind,_that.id,_that.dateAdded,_that.dateModified,_that.groups,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domain,  bool enabled,  DomainType type,  DomainKind kind,  int id, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  List<int> groups,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _DomainEntry() when $default != null:
return $default(_that.domain,_that.enabled,_that.type,_that.kind,_that.id,_that.dateAdded,_that.dateModified,_that.groups,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DomainEntry implements DomainEntry {
  const _DomainEntry({required this.domain, required this.enabled, required this.type, required this.kind, required this.id, @JsonKey(name: 'date_added') required this.dateAdded, @JsonKey(name: 'date_modified') required this.dateModified, required final  List<int> groups, this.comment}): _groups = groups;
  factory _DomainEntry.fromJson(Map<String, dynamic> json) => _$DomainEntryFromJson(json);

@override final  String domain;
@override final  bool enabled;
@override final  DomainType type;
@override final  DomainKind kind;
@override final  int id;
@override@JsonKey(name: 'date_added') final  int dateAdded;
@override@JsonKey(name: 'date_modified') final  int dateModified;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  String? comment;

/// Create a copy of DomainEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainEntryCopyWith<_DomainEntry> get copyWith => __$DomainEntryCopyWithImpl<_DomainEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DomainEntry&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,enabled,type,kind,id,dateAdded,dateModified,const DeepCollectionEquality().hash(_groups),comment);

@override
String toString() {
  return 'DomainEntry(domain: $domain, enabled: $enabled, type: $type, kind: $kind, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, groups: $groups, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$DomainEntryCopyWith<$Res> implements $DomainEntryCopyWith<$Res> {
  factory _$DomainEntryCopyWith(_DomainEntry value, $Res Function(_DomainEntry) _then) = __$DomainEntryCopyWithImpl;
@override @useResult
$Res call({
 String domain, bool enabled, DomainType type, DomainKind kind, int id,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, List<int> groups, String? comment
});




}
/// @nodoc
class __$DomainEntryCopyWithImpl<$Res>
    implements _$DomainEntryCopyWith<$Res> {
  __$DomainEntryCopyWithImpl(this._self, this._then);

  final _DomainEntry _self;
  final $Res Function(_DomainEntry) _then;

/// Create a copy of DomainEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = null,Object? enabled = null,Object? type = null,Object? kind = null,Object? id = null,Object? dateAdded = null,Object? dateModified = null,Object? groups = null,Object? comment = freezed,}) {
  return _then(_DomainEntry(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DomainType,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DomainKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GravityEntry {

 String get domain; String get address; bool get enabled; int get id; GravityType get type;@JsonKey(name: 'date_added') int get dateAdded;@JsonKey(name: 'date_modified') int get dateModified;@JsonKey(name: 'date_updated') int get dateUpdated; int get number;@JsonKey(name: 'invalid_domains') int get invalidDomains;@JsonKey(name: 'abp_entries') int get abpEntries; int get status; List<int> get groups; String? get comment;
/// Create a copy of GravityEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GravityEntryCopyWith<GravityEntry> get copyWith => _$GravityEntryCopyWithImpl<GravityEntry>(this as GravityEntry, _$identity);

  /// Serializes this GravityEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GravityEntry&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.address, address) || other.address == address)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&(identical(other.number, number) || other.number == number)&&(identical(other.invalidDomains, invalidDomains) || other.invalidDomains == invalidDomains)&&(identical(other.abpEntries, abpEntries) || other.abpEntries == abpEntries)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,address,enabled,id,type,dateAdded,dateModified,dateUpdated,number,invalidDomains,abpEntries,status,const DeepCollectionEquality().hash(groups),comment);

@override
String toString() {
  return 'GravityEntry(domain: $domain, address: $address, enabled: $enabled, id: $id, type: $type, dateAdded: $dateAdded, dateModified: $dateModified, dateUpdated: $dateUpdated, number: $number, invalidDomains: $invalidDomains, abpEntries: $abpEntries, status: $status, groups: $groups, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $GravityEntryCopyWith<$Res>  {
  factory $GravityEntryCopyWith(GravityEntry value, $Res Function(GravityEntry) _then) = _$GravityEntryCopyWithImpl;
@useResult
$Res call({
 String domain, String address, bool enabled, int id, GravityType type,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified,@JsonKey(name: 'date_updated') int dateUpdated, int number,@JsonKey(name: 'invalid_domains') int invalidDomains,@JsonKey(name: 'abp_entries') int abpEntries, int status, List<int> groups, String? comment
});




}
/// @nodoc
class _$GravityEntryCopyWithImpl<$Res>
    implements $GravityEntryCopyWith<$Res> {
  _$GravityEntryCopyWithImpl(this._self, this._then);

  final GravityEntry _self;
  final $Res Function(GravityEntry) _then;

/// Create a copy of GravityEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = null,Object? address = null,Object? enabled = null,Object? id = null,Object? type = null,Object? dateAdded = null,Object? dateModified = null,Object? dateUpdated = null,Object? number = null,Object? invalidDomains = null,Object? abpEntries = null,Object? status = null,Object? groups = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GravityType,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,dateUpdated: null == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,invalidDomains: null == invalidDomains ? _self.invalidDomains : invalidDomains // ignore: cast_nullable_to_non_nullable
as int,abpEntries: null == abpEntries ? _self.abpEntries : abpEntries // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GravityEntry].
extension GravityEntryPatterns on GravityEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GravityEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GravityEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GravityEntry value)  $default,){
final _that = this;
switch (_that) {
case _GravityEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GravityEntry value)?  $default,){
final _that = this;
switch (_that) {
case _GravityEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domain,  String address,  bool enabled,  int id,  GravityType type, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified, @JsonKey(name: 'date_updated')  int dateUpdated,  int number, @JsonKey(name: 'invalid_domains')  int invalidDomains, @JsonKey(name: 'abp_entries')  int abpEntries,  int status,  List<int> groups,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GravityEntry() when $default != null:
return $default(_that.domain,_that.address,_that.enabled,_that.id,_that.type,_that.dateAdded,_that.dateModified,_that.dateUpdated,_that.number,_that.invalidDomains,_that.abpEntries,_that.status,_that.groups,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domain,  String address,  bool enabled,  int id,  GravityType type, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified, @JsonKey(name: 'date_updated')  int dateUpdated,  int number, @JsonKey(name: 'invalid_domains')  int invalidDomains, @JsonKey(name: 'abp_entries')  int abpEntries,  int status,  List<int> groups,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _GravityEntry():
return $default(_that.domain,_that.address,_that.enabled,_that.id,_that.type,_that.dateAdded,_that.dateModified,_that.dateUpdated,_that.number,_that.invalidDomains,_that.abpEntries,_that.status,_that.groups,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domain,  String address,  bool enabled,  int id,  GravityType type, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified, @JsonKey(name: 'date_updated')  int dateUpdated,  int number, @JsonKey(name: 'invalid_domains')  int invalidDomains, @JsonKey(name: 'abp_entries')  int abpEntries,  int status,  List<int> groups,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _GravityEntry() when $default != null:
return $default(_that.domain,_that.address,_that.enabled,_that.id,_that.type,_that.dateAdded,_that.dateModified,_that.dateUpdated,_that.number,_that.invalidDomains,_that.abpEntries,_that.status,_that.groups,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GravityEntry implements GravityEntry {
  const _GravityEntry({required this.domain, required this.address, required this.enabled, required this.id, required this.type, @JsonKey(name: 'date_added') required this.dateAdded, @JsonKey(name: 'date_modified') required this.dateModified, @JsonKey(name: 'date_updated') required this.dateUpdated, required this.number, @JsonKey(name: 'invalid_domains') required this.invalidDomains, @JsonKey(name: 'abp_entries') required this.abpEntries, required this.status, required final  List<int> groups, this.comment}): _groups = groups;
  factory _GravityEntry.fromJson(Map<String, dynamic> json) => _$GravityEntryFromJson(json);

@override final  String domain;
@override final  String address;
@override final  bool enabled;
@override final  int id;
@override final  GravityType type;
@override@JsonKey(name: 'date_added') final  int dateAdded;
@override@JsonKey(name: 'date_modified') final  int dateModified;
@override@JsonKey(name: 'date_updated') final  int dateUpdated;
@override final  int number;
@override@JsonKey(name: 'invalid_domains') final  int invalidDomains;
@override@JsonKey(name: 'abp_entries') final  int abpEntries;
@override final  int status;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  String? comment;

/// Create a copy of GravityEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GravityEntryCopyWith<_GravityEntry> get copyWith => __$GravityEntryCopyWithImpl<_GravityEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GravityEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GravityEntry&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.address, address) || other.address == address)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&(identical(other.number, number) || other.number == number)&&(identical(other.invalidDomains, invalidDomains) || other.invalidDomains == invalidDomains)&&(identical(other.abpEntries, abpEntries) || other.abpEntries == abpEntries)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,address,enabled,id,type,dateAdded,dateModified,dateUpdated,number,invalidDomains,abpEntries,status,const DeepCollectionEquality().hash(_groups),comment);

@override
String toString() {
  return 'GravityEntry(domain: $domain, address: $address, enabled: $enabled, id: $id, type: $type, dateAdded: $dateAdded, dateModified: $dateModified, dateUpdated: $dateUpdated, number: $number, invalidDomains: $invalidDomains, abpEntries: $abpEntries, status: $status, groups: $groups, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$GravityEntryCopyWith<$Res> implements $GravityEntryCopyWith<$Res> {
  factory _$GravityEntryCopyWith(_GravityEntry value, $Res Function(_GravityEntry) _then) = __$GravityEntryCopyWithImpl;
@override @useResult
$Res call({
 String domain, String address, bool enabled, int id, GravityType type,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified,@JsonKey(name: 'date_updated') int dateUpdated, int number,@JsonKey(name: 'invalid_domains') int invalidDomains,@JsonKey(name: 'abp_entries') int abpEntries, int status, List<int> groups, String? comment
});




}
/// @nodoc
class __$GravityEntryCopyWithImpl<$Res>
    implements _$GravityEntryCopyWith<$Res> {
  __$GravityEntryCopyWithImpl(this._self, this._then);

  final _GravityEntry _self;
  final $Res Function(_GravityEntry) _then;

/// Create a copy of GravityEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = null,Object? address = null,Object? enabled = null,Object? id = null,Object? type = null,Object? dateAdded = null,Object? dateModified = null,Object? dateUpdated = null,Object? number = null,Object? invalidDomains = null,Object? abpEntries = null,Object? status = null,Object? groups = null,Object? comment = freezed,}) {
  return _then(_GravityEntry(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GravityType,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,dateUpdated: null == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,invalidDomains: null == invalidDomains ? _self.invalidDomains : invalidDomains // ignore: cast_nullable_to_non_nullable
as int,abpEntries: null == abpEntries ? _self.abpEntries : abpEntries // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SearchParameters {

 bool get partial; int get N; String get domain; bool get debug;
/// Create a copy of SearchParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchParametersCopyWith<SearchParameters> get copyWith => _$SearchParametersCopyWithImpl<SearchParameters>(this as SearchParameters, _$identity);

  /// Serializes this SearchParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchParameters&&(identical(other.partial, partial) || other.partial == partial)&&(identical(other.N, N) || other.N == N)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.debug, debug) || other.debug == debug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partial,N,domain,debug);

@override
String toString() {
  return 'SearchParameters(partial: $partial, N: $N, domain: $domain, debug: $debug)';
}


}

/// @nodoc
abstract mixin class $SearchParametersCopyWith<$Res>  {
  factory $SearchParametersCopyWith(SearchParameters value, $Res Function(SearchParameters) _then) = _$SearchParametersCopyWithImpl;
@useResult
$Res call({
 bool partial, int N, String domain, bool debug
});




}
/// @nodoc
class _$SearchParametersCopyWithImpl<$Res>
    implements $SearchParametersCopyWith<$Res> {
  _$SearchParametersCopyWithImpl(this._self, this._then);

  final SearchParameters _self;
  final $Res Function(SearchParameters) _then;

/// Create a copy of SearchParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partial = null,Object? N = null,Object? domain = null,Object? debug = null,}) {
  return _then(_self.copyWith(
partial: null == partial ? _self.partial : partial // ignore: cast_nullable_to_non_nullable
as bool,N: null == N ? _self.N : N // ignore: cast_nullable_to_non_nullable
as int,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,debug: null == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchParameters].
extension SearchParametersPatterns on SearchParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchParameters value)  $default,){
final _that = this;
switch (_that) {
case _SearchParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchParameters value)?  $default,){
final _that = this;
switch (_that) {
case _SearchParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool partial,  int N,  String domain,  bool debug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchParameters() when $default != null:
return $default(_that.partial,_that.N,_that.domain,_that.debug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool partial,  int N,  String domain,  bool debug)  $default,) {final _that = this;
switch (_that) {
case _SearchParameters():
return $default(_that.partial,_that.N,_that.domain,_that.debug);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool partial,  int N,  String domain,  bool debug)?  $default,) {final _that = this;
switch (_that) {
case _SearchParameters() when $default != null:
return $default(_that.partial,_that.N,_that.domain,_that.debug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchParameters implements SearchParameters {
  const _SearchParameters({required this.partial, required this.N, required this.domain, required this.debug});
  factory _SearchParameters.fromJson(Map<String, dynamic> json) => _$SearchParametersFromJson(json);

@override final  bool partial;
@override final  int N;
@override final  String domain;
@override final  bool debug;

/// Create a copy of SearchParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchParametersCopyWith<_SearchParameters> get copyWith => __$SearchParametersCopyWithImpl<_SearchParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchParameters&&(identical(other.partial, partial) || other.partial == partial)&&(identical(other.N, N) || other.N == N)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.debug, debug) || other.debug == debug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partial,N,domain,debug);

@override
String toString() {
  return 'SearchParameters(partial: $partial, N: $N, domain: $domain, debug: $debug)';
}


}

/// @nodoc
abstract mixin class _$SearchParametersCopyWith<$Res> implements $SearchParametersCopyWith<$Res> {
  factory _$SearchParametersCopyWith(_SearchParameters value, $Res Function(_SearchParameters) _then) = __$SearchParametersCopyWithImpl;
@override @useResult
$Res call({
 bool partial, int N, String domain, bool debug
});




}
/// @nodoc
class __$SearchParametersCopyWithImpl<$Res>
    implements _$SearchParametersCopyWith<$Res> {
  __$SearchParametersCopyWithImpl(this._self, this._then);

  final _SearchParameters _self;
  final $Res Function(_SearchParameters) _then;

/// Create a copy of SearchParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partial = null,Object? N = null,Object? domain = null,Object? debug = null,}) {
  return _then(_SearchParameters(
partial: null == partial ? _self.partial : partial // ignore: cast_nullable_to_non_nullable
as bool,N: null == N ? _self.N : N // ignore: cast_nullable_to_non_nullable
as int,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,debug: null == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SearchResults {

 DomainMatchCount get domains; GravityMatchCount get gravity; int get total;
/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<SearchResults> get copyWith => _$SearchResultsCopyWithImpl<SearchResults>(this as SearchResults, _$identity);

  /// Serializes this SearchResults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResults&&(identical(other.domains, domains) || other.domains == domains)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domains,gravity,total);

@override
String toString() {
  return 'SearchResults(domains: $domains, gravity: $gravity, total: $total)';
}


}

/// @nodoc
abstract mixin class $SearchResultsCopyWith<$Res>  {
  factory $SearchResultsCopyWith(SearchResults value, $Res Function(SearchResults) _then) = _$SearchResultsCopyWithImpl;
@useResult
$Res call({
 DomainMatchCount domains, GravityMatchCount gravity, int total
});


$DomainMatchCountCopyWith<$Res> get domains;$GravityMatchCountCopyWith<$Res> get gravity;

}
/// @nodoc
class _$SearchResultsCopyWithImpl<$Res>
    implements $SearchResultsCopyWith<$Res> {
  _$SearchResultsCopyWithImpl(this._self, this._then);

  final SearchResults _self;
  final $Res Function(SearchResults) _then;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domains = null,Object? gravity = null,Object? total = null,}) {
  return _then(_self.copyWith(
domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as DomainMatchCount,gravity: null == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as GravityMatchCount,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DomainMatchCountCopyWith<$Res> get domains {
  
  return $DomainMatchCountCopyWith<$Res>(_self.domains, (value) {
    return _then(_self.copyWith(domains: value));
  });
}/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GravityMatchCountCopyWith<$Res> get gravity {
  
  return $GravityMatchCountCopyWith<$Res>(_self.gravity, (value) {
    return _then(_self.copyWith(gravity: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchResults].
extension SearchResultsPatterns on SearchResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResults value)  $default,){
final _that = this;
switch (_that) {
case _SearchResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResults value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DomainMatchCount domains,  GravityMatchCount gravity,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
return $default(_that.domains,_that.gravity,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DomainMatchCount domains,  GravityMatchCount gravity,  int total)  $default,) {final _that = this;
switch (_that) {
case _SearchResults():
return $default(_that.domains,_that.gravity,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DomainMatchCount domains,  GravityMatchCount gravity,  int total)?  $default,) {final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
return $default(_that.domains,_that.gravity,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResults implements SearchResults {
  const _SearchResults({required this.domains, required this.gravity, required this.total});
  factory _SearchResults.fromJson(Map<String, dynamic> json) => _$SearchResultsFromJson(json);

@override final  DomainMatchCount domains;
@override final  GravityMatchCount gravity;
@override final  int total;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultsCopyWith<_SearchResults> get copyWith => __$SearchResultsCopyWithImpl<_SearchResults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResults&&(identical(other.domains, domains) || other.domains == domains)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domains,gravity,total);

@override
String toString() {
  return 'SearchResults(domains: $domains, gravity: $gravity, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SearchResultsCopyWith<$Res> implements $SearchResultsCopyWith<$Res> {
  factory _$SearchResultsCopyWith(_SearchResults value, $Res Function(_SearchResults) _then) = __$SearchResultsCopyWithImpl;
@override @useResult
$Res call({
 DomainMatchCount domains, GravityMatchCount gravity, int total
});


@override $DomainMatchCountCopyWith<$Res> get domains;@override $GravityMatchCountCopyWith<$Res> get gravity;

}
/// @nodoc
class __$SearchResultsCopyWithImpl<$Res>
    implements _$SearchResultsCopyWith<$Res> {
  __$SearchResultsCopyWithImpl(this._self, this._then);

  final _SearchResults _self;
  final $Res Function(_SearchResults) _then;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domains = null,Object? gravity = null,Object? total = null,}) {
  return _then(_SearchResults(
domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as DomainMatchCount,gravity: null == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as GravityMatchCount,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DomainMatchCountCopyWith<$Res> get domains {
  
  return $DomainMatchCountCopyWith<$Res>(_self.domains, (value) {
    return _then(_self.copyWith(domains: value));
  });
}/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GravityMatchCountCopyWith<$Res> get gravity {
  
  return $GravityMatchCountCopyWith<$Res>(_self.gravity, (value) {
    return _then(_self.copyWith(gravity: value));
  });
}
}


/// @nodoc
mixin _$DomainMatchCount {

 int get exact; int get regex;
/// Create a copy of DomainMatchCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainMatchCountCopyWith<DomainMatchCount> get copyWith => _$DomainMatchCountCopyWithImpl<DomainMatchCount>(this as DomainMatchCount, _$identity);

  /// Serializes this DomainMatchCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainMatchCount&&(identical(other.exact, exact) || other.exact == exact)&&(identical(other.regex, regex) || other.regex == regex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exact,regex);

@override
String toString() {
  return 'DomainMatchCount(exact: $exact, regex: $regex)';
}


}

/// @nodoc
abstract mixin class $DomainMatchCountCopyWith<$Res>  {
  factory $DomainMatchCountCopyWith(DomainMatchCount value, $Res Function(DomainMatchCount) _then) = _$DomainMatchCountCopyWithImpl;
@useResult
$Res call({
 int exact, int regex
});




}
/// @nodoc
class _$DomainMatchCountCopyWithImpl<$Res>
    implements $DomainMatchCountCopyWith<$Res> {
  _$DomainMatchCountCopyWithImpl(this._self, this._then);

  final DomainMatchCount _self;
  final $Res Function(DomainMatchCount) _then;

/// Create a copy of DomainMatchCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exact = null,Object? regex = null,}) {
  return _then(_self.copyWith(
exact: null == exact ? _self.exact : exact // ignore: cast_nullable_to_non_nullable
as int,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DomainMatchCount].
extension DomainMatchCountPatterns on DomainMatchCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DomainMatchCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DomainMatchCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DomainMatchCount value)  $default,){
final _that = this;
switch (_that) {
case _DomainMatchCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DomainMatchCount value)?  $default,){
final _that = this;
switch (_that) {
case _DomainMatchCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int exact,  int regex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DomainMatchCount() when $default != null:
return $default(_that.exact,_that.regex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int exact,  int regex)  $default,) {final _that = this;
switch (_that) {
case _DomainMatchCount():
return $default(_that.exact,_that.regex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int exact,  int regex)?  $default,) {final _that = this;
switch (_that) {
case _DomainMatchCount() when $default != null:
return $default(_that.exact,_that.regex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DomainMatchCount implements DomainMatchCount {
  const _DomainMatchCount({required this.exact, required this.regex});
  factory _DomainMatchCount.fromJson(Map<String, dynamic> json) => _$DomainMatchCountFromJson(json);

@override final  int exact;
@override final  int regex;

/// Create a copy of DomainMatchCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DomainMatchCountCopyWith<_DomainMatchCount> get copyWith => __$DomainMatchCountCopyWithImpl<_DomainMatchCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DomainMatchCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DomainMatchCount&&(identical(other.exact, exact) || other.exact == exact)&&(identical(other.regex, regex) || other.regex == regex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exact,regex);

@override
String toString() {
  return 'DomainMatchCount(exact: $exact, regex: $regex)';
}


}

/// @nodoc
abstract mixin class _$DomainMatchCountCopyWith<$Res> implements $DomainMatchCountCopyWith<$Res> {
  factory _$DomainMatchCountCopyWith(_DomainMatchCount value, $Res Function(_DomainMatchCount) _then) = __$DomainMatchCountCopyWithImpl;
@override @useResult
$Res call({
 int exact, int regex
});




}
/// @nodoc
class __$DomainMatchCountCopyWithImpl<$Res>
    implements _$DomainMatchCountCopyWith<$Res> {
  __$DomainMatchCountCopyWithImpl(this._self, this._then);

  final _DomainMatchCount _self;
  final $Res Function(_DomainMatchCount) _then;

/// Create a copy of DomainMatchCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exact = null,Object? regex = null,}) {
  return _then(_DomainMatchCount(
exact: null == exact ? _self.exact : exact // ignore: cast_nullable_to_non_nullable
as int,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GravityMatchCount {

 int get allow; int get block;
/// Create a copy of GravityMatchCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GravityMatchCountCopyWith<GravityMatchCount> get copyWith => _$GravityMatchCountCopyWithImpl<GravityMatchCount>(this as GravityMatchCount, _$identity);

  /// Serializes this GravityMatchCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GravityMatchCount&&(identical(other.allow, allow) || other.allow == allow)&&(identical(other.block, block) || other.block == block));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allow,block);

@override
String toString() {
  return 'GravityMatchCount(allow: $allow, block: $block)';
}


}

/// @nodoc
abstract mixin class $GravityMatchCountCopyWith<$Res>  {
  factory $GravityMatchCountCopyWith(GravityMatchCount value, $Res Function(GravityMatchCount) _then) = _$GravityMatchCountCopyWithImpl;
@useResult
$Res call({
 int allow, int block
});




}
/// @nodoc
class _$GravityMatchCountCopyWithImpl<$Res>
    implements $GravityMatchCountCopyWith<$Res> {
  _$GravityMatchCountCopyWithImpl(this._self, this._then);

  final GravityMatchCount _self;
  final $Res Function(GravityMatchCount) _then;

/// Create a copy of GravityMatchCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allow = null,Object? block = null,}) {
  return _then(_self.copyWith(
allow: null == allow ? _self.allow : allow // ignore: cast_nullable_to_non_nullable
as int,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GravityMatchCount].
extension GravityMatchCountPatterns on GravityMatchCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GravityMatchCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GravityMatchCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GravityMatchCount value)  $default,){
final _that = this;
switch (_that) {
case _GravityMatchCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GravityMatchCount value)?  $default,){
final _that = this;
switch (_that) {
case _GravityMatchCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int allow,  int block)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GravityMatchCount() when $default != null:
return $default(_that.allow,_that.block);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int allow,  int block)  $default,) {final _that = this;
switch (_that) {
case _GravityMatchCount():
return $default(_that.allow,_that.block);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int allow,  int block)?  $default,) {final _that = this;
switch (_that) {
case _GravityMatchCount() when $default != null:
return $default(_that.allow,_that.block);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GravityMatchCount implements GravityMatchCount {
  const _GravityMatchCount({required this.allow, required this.block});
  factory _GravityMatchCount.fromJson(Map<String, dynamic> json) => _$GravityMatchCountFromJson(json);

@override final  int allow;
@override final  int block;

/// Create a copy of GravityMatchCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GravityMatchCountCopyWith<_GravityMatchCount> get copyWith => __$GravityMatchCountCopyWithImpl<_GravityMatchCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GravityMatchCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GravityMatchCount&&(identical(other.allow, allow) || other.allow == allow)&&(identical(other.block, block) || other.block == block));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allow,block);

@override
String toString() {
  return 'GravityMatchCount(allow: $allow, block: $block)';
}


}

/// @nodoc
abstract mixin class _$GravityMatchCountCopyWith<$Res> implements $GravityMatchCountCopyWith<$Res> {
  factory _$GravityMatchCountCopyWith(_GravityMatchCount value, $Res Function(_GravityMatchCount) _then) = __$GravityMatchCountCopyWithImpl;
@override @useResult
$Res call({
 int allow, int block
});




}
/// @nodoc
class __$GravityMatchCountCopyWithImpl<$Res>
    implements _$GravityMatchCountCopyWith<$Res> {
  __$GravityMatchCountCopyWithImpl(this._self, this._then);

  final _GravityMatchCount _self;
  final $Res Function(_GravityMatchCount) _then;

/// Create a copy of GravityMatchCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allow = null,Object? block = null,}) {
  return _then(_GravityMatchCount(
allow: null == allow ? _self.allow : allow // ignore: cast_nullable_to_non_nullable
as int,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
