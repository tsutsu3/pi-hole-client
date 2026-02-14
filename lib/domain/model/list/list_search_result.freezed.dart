// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListSearchResult {

 List<Domain> get domains; List<GravityMatch> get gravityMatches; ListSearchMeta get meta;
/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListSearchResultCopyWith<ListSearchResult> get copyWith => _$ListSearchResultCopyWithImpl<ListSearchResult>(this as ListSearchResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListSearchResult&&const DeepCollectionEquality().equals(other.domains, domains)&&const DeepCollectionEquality().equals(other.gravityMatches, gravityMatches)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(domains),const DeepCollectionEquality().hash(gravityMatches),meta);

@override
String toString() {
  return 'ListSearchResult(domains: $domains, gravityMatches: $gravityMatches, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ListSearchResultCopyWith<$Res>  {
  factory $ListSearchResultCopyWith(ListSearchResult value, $Res Function(ListSearchResult) _then) = _$ListSearchResultCopyWithImpl;
@useResult
$Res call({
 List<Domain> domains, List<GravityMatch> gravityMatches, ListSearchMeta meta
});


$ListSearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$ListSearchResultCopyWithImpl<$Res>
    implements $ListSearchResultCopyWith<$Res> {
  _$ListSearchResultCopyWithImpl(this._self, this._then);

  final ListSearchResult _self;
  final $Res Function(ListSearchResult) _then;

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domains = null,Object? gravityMatches = null,Object? meta = null,}) {
  return _then(_self.copyWith(
domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<Domain>,gravityMatches: null == gravityMatches ? _self.gravityMatches : gravityMatches // ignore: cast_nullable_to_non_nullable
as List<GravityMatch>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ListSearchMeta,
  ));
}
/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListSearchMetaCopyWith<$Res> get meta {
  
  return $ListSearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListSearchResult].
extension ListSearchResultPatterns on ListSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _ListSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Domain> domains,  List<GravityMatch> gravityMatches,  ListSearchMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
return $default(_that.domains,_that.gravityMatches,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Domain> domains,  List<GravityMatch> gravityMatches,  ListSearchMeta meta)  $default,) {final _that = this;
switch (_that) {
case _ListSearchResult():
return $default(_that.domains,_that.gravityMatches,_that.meta);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Domain> domains,  List<GravityMatch> gravityMatches,  ListSearchMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
return $default(_that.domains,_that.gravityMatches,_that.meta);case _:
  return null;

}
}

}

/// @nodoc


class _ListSearchResult implements ListSearchResult {
  const _ListSearchResult({required final  List<Domain> domains, required final  List<GravityMatch> gravityMatches, required this.meta}): _domains = domains,_gravityMatches = gravityMatches;
  

 final  List<Domain> _domains;
@override List<Domain> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}

 final  List<GravityMatch> _gravityMatches;
@override List<GravityMatch> get gravityMatches {
  if (_gravityMatches is EqualUnmodifiableListView) return _gravityMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gravityMatches);
}

@override final  ListSearchMeta meta;

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListSearchResultCopyWith<_ListSearchResult> get copyWith => __$ListSearchResultCopyWithImpl<_ListSearchResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListSearchResult&&const DeepCollectionEquality().equals(other._domains, _domains)&&const DeepCollectionEquality().equals(other._gravityMatches, _gravityMatches)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_domains),const DeepCollectionEquality().hash(_gravityMatches),meta);

@override
String toString() {
  return 'ListSearchResult(domains: $domains, gravityMatches: $gravityMatches, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ListSearchResultCopyWith<$Res> implements $ListSearchResultCopyWith<$Res> {
  factory _$ListSearchResultCopyWith(_ListSearchResult value, $Res Function(_ListSearchResult) _then) = __$ListSearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<Domain> domains, List<GravityMatch> gravityMatches, ListSearchMeta meta
});


@override $ListSearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$ListSearchResultCopyWithImpl<$Res>
    implements _$ListSearchResultCopyWith<$Res> {
  __$ListSearchResultCopyWithImpl(this._self, this._then);

  final _ListSearchResult _self;
  final $Res Function(_ListSearchResult) _then;

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domains = null,Object? gravityMatches = null,Object? meta = null,}) {
  return _then(_ListSearchResult(
domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<Domain>,gravityMatches: null == gravityMatches ? _self._gravityMatches : gravityMatches // ignore: cast_nullable_to_non_nullable
as List<GravityMatch>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ListSearchMeta,
  ));
}

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListSearchMetaCopyWith<$Res> get meta {
  
  return $ListSearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc
mixin _$GravityMatch {

 Adlist get adlist; String get matchedDomain;
/// Create a copy of GravityMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GravityMatchCopyWith<GravityMatch> get copyWith => _$GravityMatchCopyWithImpl<GravityMatch>(this as GravityMatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GravityMatch&&(identical(other.adlist, adlist) || other.adlist == adlist)&&(identical(other.matchedDomain, matchedDomain) || other.matchedDomain == matchedDomain));
}


@override
int get hashCode => Object.hash(runtimeType,adlist,matchedDomain);

@override
String toString() {
  return 'GravityMatch(adlist: $adlist, matchedDomain: $matchedDomain)';
}


}

/// @nodoc
abstract mixin class $GravityMatchCopyWith<$Res>  {
  factory $GravityMatchCopyWith(GravityMatch value, $Res Function(GravityMatch) _then) = _$GravityMatchCopyWithImpl;
@useResult
$Res call({
 Adlist adlist, String matchedDomain
});


$AdlistCopyWith<$Res> get adlist;

}
/// @nodoc
class _$GravityMatchCopyWithImpl<$Res>
    implements $GravityMatchCopyWith<$Res> {
  _$GravityMatchCopyWithImpl(this._self, this._then);

  final GravityMatch _self;
  final $Res Function(GravityMatch) _then;

/// Create a copy of GravityMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adlist = null,Object? matchedDomain = null,}) {
  return _then(_self.copyWith(
adlist: null == adlist ? _self.adlist : adlist // ignore: cast_nullable_to_non_nullable
as Adlist,matchedDomain: null == matchedDomain ? _self.matchedDomain : matchedDomain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of GravityMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdlistCopyWith<$Res> get adlist {
  
  return $AdlistCopyWith<$Res>(_self.adlist, (value) {
    return _then(_self.copyWith(adlist: value));
  });
}
}


/// Adds pattern-matching-related methods to [GravityMatch].
extension GravityMatchPatterns on GravityMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GravityMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GravityMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GravityMatch value)  $default,){
final _that = this;
switch (_that) {
case _GravityMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GravityMatch value)?  $default,){
final _that = this;
switch (_that) {
case _GravityMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Adlist adlist,  String matchedDomain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GravityMatch() when $default != null:
return $default(_that.adlist,_that.matchedDomain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Adlist adlist,  String matchedDomain)  $default,) {final _that = this;
switch (_that) {
case _GravityMatch():
return $default(_that.adlist,_that.matchedDomain);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Adlist adlist,  String matchedDomain)?  $default,) {final _that = this;
switch (_that) {
case _GravityMatch() when $default != null:
return $default(_that.adlist,_that.matchedDomain);case _:
  return null;

}
}

}

/// @nodoc


class _GravityMatch implements GravityMatch {
  const _GravityMatch({required this.adlist, required this.matchedDomain});
  

@override final  Adlist adlist;
@override final  String matchedDomain;

/// Create a copy of GravityMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GravityMatchCopyWith<_GravityMatch> get copyWith => __$GravityMatchCopyWithImpl<_GravityMatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GravityMatch&&(identical(other.adlist, adlist) || other.adlist == adlist)&&(identical(other.matchedDomain, matchedDomain) || other.matchedDomain == matchedDomain));
}


@override
int get hashCode => Object.hash(runtimeType,adlist,matchedDomain);

@override
String toString() {
  return 'GravityMatch(adlist: $adlist, matchedDomain: $matchedDomain)';
}


}

/// @nodoc
abstract mixin class _$GravityMatchCopyWith<$Res> implements $GravityMatchCopyWith<$Res> {
  factory _$GravityMatchCopyWith(_GravityMatch value, $Res Function(_GravityMatch) _then) = __$GravityMatchCopyWithImpl;
@override @useResult
$Res call({
 Adlist adlist, String matchedDomain
});


@override $AdlistCopyWith<$Res> get adlist;

}
/// @nodoc
class __$GravityMatchCopyWithImpl<$Res>
    implements _$GravityMatchCopyWith<$Res> {
  __$GravityMatchCopyWithImpl(this._self, this._then);

  final _GravityMatch _self;
  final $Res Function(_GravityMatch) _then;

/// Create a copy of GravityMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adlist = null,Object? matchedDomain = null,}) {
  return _then(_GravityMatch(
adlist: null == adlist ? _self.adlist : adlist // ignore: cast_nullable_to_non_nullable
as Adlist,matchedDomain: null == matchedDomain ? _self.matchedDomain : matchedDomain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of GravityMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdlistCopyWith<$Res> get adlist {
  
  return $AdlistCopyWith<$Res>(_self.adlist, (value) {
    return _then(_self.copyWith(adlist: value));
  });
}
}

/// @nodoc
mixin _$ListSearchMeta {

 int get domainsExact; int get domainsRegex; int get gravityAllow; int get gravityBlock; int get total;
/// Create a copy of ListSearchMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListSearchMetaCopyWith<ListSearchMeta> get copyWith => _$ListSearchMetaCopyWithImpl<ListSearchMeta>(this as ListSearchMeta, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListSearchMeta&&(identical(other.domainsExact, domainsExact) || other.domainsExact == domainsExact)&&(identical(other.domainsRegex, domainsRegex) || other.domainsRegex == domainsRegex)&&(identical(other.gravityAllow, gravityAllow) || other.gravityAllow == gravityAllow)&&(identical(other.gravityBlock, gravityBlock) || other.gravityBlock == gravityBlock)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,domainsExact,domainsRegex,gravityAllow,gravityBlock,total);

@override
String toString() {
  return 'ListSearchMeta(domainsExact: $domainsExact, domainsRegex: $domainsRegex, gravityAllow: $gravityAllow, gravityBlock: $gravityBlock, total: $total)';
}


}

/// @nodoc
abstract mixin class $ListSearchMetaCopyWith<$Res>  {
  factory $ListSearchMetaCopyWith(ListSearchMeta value, $Res Function(ListSearchMeta) _then) = _$ListSearchMetaCopyWithImpl;
@useResult
$Res call({
 int domainsExact, int domainsRegex, int gravityAllow, int gravityBlock, int total
});




}
/// @nodoc
class _$ListSearchMetaCopyWithImpl<$Res>
    implements $ListSearchMetaCopyWith<$Res> {
  _$ListSearchMetaCopyWithImpl(this._self, this._then);

  final ListSearchMeta _self;
  final $Res Function(ListSearchMeta) _then;

/// Create a copy of ListSearchMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainsExact = null,Object? domainsRegex = null,Object? gravityAllow = null,Object? gravityBlock = null,Object? total = null,}) {
  return _then(_self.copyWith(
domainsExact: null == domainsExact ? _self.domainsExact : domainsExact // ignore: cast_nullable_to_non_nullable
as int,domainsRegex: null == domainsRegex ? _self.domainsRegex : domainsRegex // ignore: cast_nullable_to_non_nullable
as int,gravityAllow: null == gravityAllow ? _self.gravityAllow : gravityAllow // ignore: cast_nullable_to_non_nullable
as int,gravityBlock: null == gravityBlock ? _self.gravityBlock : gravityBlock // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListSearchMeta].
extension ListSearchMetaPatterns on ListSearchMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListSearchMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListSearchMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListSearchMeta value)  $default,){
final _that = this;
switch (_that) {
case _ListSearchMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListSearchMeta value)?  $default,){
final _that = this;
switch (_that) {
case _ListSearchMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int domainsExact,  int domainsRegex,  int gravityAllow,  int gravityBlock,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListSearchMeta() when $default != null:
return $default(_that.domainsExact,_that.domainsRegex,_that.gravityAllow,_that.gravityBlock,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int domainsExact,  int domainsRegex,  int gravityAllow,  int gravityBlock,  int total)  $default,) {final _that = this;
switch (_that) {
case _ListSearchMeta():
return $default(_that.domainsExact,_that.domainsRegex,_that.gravityAllow,_that.gravityBlock,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int domainsExact,  int domainsRegex,  int gravityAllow,  int gravityBlock,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ListSearchMeta() when $default != null:
return $default(_that.domainsExact,_that.domainsRegex,_that.gravityAllow,_that.gravityBlock,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _ListSearchMeta implements ListSearchMeta {
  const _ListSearchMeta({required this.domainsExact, required this.domainsRegex, required this.gravityAllow, required this.gravityBlock, required this.total});
  

@override final  int domainsExact;
@override final  int domainsRegex;
@override final  int gravityAllow;
@override final  int gravityBlock;
@override final  int total;

/// Create a copy of ListSearchMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListSearchMetaCopyWith<_ListSearchMeta> get copyWith => __$ListSearchMetaCopyWithImpl<_ListSearchMeta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListSearchMeta&&(identical(other.domainsExact, domainsExact) || other.domainsExact == domainsExact)&&(identical(other.domainsRegex, domainsRegex) || other.domainsRegex == domainsRegex)&&(identical(other.gravityAllow, gravityAllow) || other.gravityAllow == gravityAllow)&&(identical(other.gravityBlock, gravityBlock) || other.gravityBlock == gravityBlock)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,domainsExact,domainsRegex,gravityAllow,gravityBlock,total);

@override
String toString() {
  return 'ListSearchMeta(domainsExact: $domainsExact, domainsRegex: $domainsRegex, gravityAllow: $gravityAllow, gravityBlock: $gravityBlock, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ListSearchMetaCopyWith<$Res> implements $ListSearchMetaCopyWith<$Res> {
  factory _$ListSearchMetaCopyWith(_ListSearchMeta value, $Res Function(_ListSearchMeta) _then) = __$ListSearchMetaCopyWithImpl;
@override @useResult
$Res call({
 int domainsExact, int domainsRegex, int gravityAllow, int gravityBlock, int total
});




}
/// @nodoc
class __$ListSearchMetaCopyWithImpl<$Res>
    implements _$ListSearchMetaCopyWith<$Res> {
  __$ListSearchMetaCopyWithImpl(this._self, this._then);

  final _ListSearchMeta _self;
  final $Res Function(_ListSearchMeta) _then;

/// Create a copy of ListSearchMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainsExact = null,Object? domainsRegex = null,Object? gravityAllow = null,Object? gravityBlock = null,Object? total = null,}) {
  return _then(_ListSearchMeta(
domainsExact: null == domainsExact ? _self.domainsExact : domainsExact // ignore: cast_nullable_to_non_nullable
as int,domainsRegex: null == domainsRegex ? _self.domainsRegex : domainsRegex // ignore: cast_nullable_to_non_nullable
as int,gravityAllow: null == gravityAllow ? _self.gravityAllow : gravityAllow // ignore: cast_nullable_to_non_nullable
as int,gravityBlock: null == gravityBlock ? _self.gravityBlock : gravityBlock // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
