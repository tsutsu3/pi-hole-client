// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Summary {

 int get domainsBeingBlocked; int get dnsQueriesToday; int get adsBlockedToday; double get adsPercentageToday; int get uniqueDomains; int get queriesForwarded; int get queriesCached; int get clientsEverSeen; int get uniqueClients; int get dnsQueriesAllTypes; ReplyCounts get replies; List<QueryTypeStat> get queryTypes; double? get frequency;
/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCopyWith<Summary> get copyWith => _$SummaryCopyWithImpl<Summary>(this as Summary, _$identity);

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Summary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Summary&&(identical(other.domainsBeingBlocked, _this.domainsBeingBlocked) || other.domainsBeingBlocked == _this.domainsBeingBlocked)&&(identical(other.dnsQueriesToday, _this.dnsQueriesToday) || other.dnsQueriesToday == _this.dnsQueriesToday)&&(identical(other.adsBlockedToday, _this.adsBlockedToday) || other.adsBlockedToday == _this.adsBlockedToday)&&(identical(other.adsPercentageToday, _this.adsPercentageToday) || other.adsPercentageToday == _this.adsPercentageToday)&&(identical(other.uniqueDomains, _this.uniqueDomains) || other.uniqueDomains == _this.uniqueDomains)&&(identical(other.queriesForwarded, _this.queriesForwarded) || other.queriesForwarded == _this.queriesForwarded)&&(identical(other.queriesCached, _this.queriesCached) || other.queriesCached == _this.queriesCached)&&(identical(other.clientsEverSeen, _this.clientsEverSeen) || other.clientsEverSeen == _this.clientsEverSeen)&&(identical(other.uniqueClients, _this.uniqueClients) || other.uniqueClients == _this.uniqueClients)&&(identical(other.dnsQueriesAllTypes, _this.dnsQueriesAllTypes) || other.dnsQueriesAllTypes == _this.dnsQueriesAllTypes)&&(identical(other.replies, _this.replies) || other.replies == _this.replies)&&const DeepCollectionEquality().equals(other.queryTypes, _this.queryTypes)&&(identical(other.frequency, _this.frequency) || other.frequency == _this.frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Summary;
  return Object.hash(runtimeType,_this.domainsBeingBlocked,_this.dnsQueriesToday,_this.adsBlockedToday,_this.adsPercentageToday,_this.uniqueDomains,_this.queriesForwarded,_this.queriesCached,_this.clientsEverSeen,_this.uniqueClients,_this.dnsQueriesAllTypes,_this.replies,const DeepCollectionEquality().hash(_this.queryTypes),_this.frequency);
}

@override
String toString() {
  final _this = this as Summary;
  return 'Summary(domainsBeingBlocked: ${_this.domainsBeingBlocked}, dnsQueriesToday: ${_this.dnsQueriesToday}, adsBlockedToday: ${_this.adsBlockedToday}, adsPercentageToday: ${_this.adsPercentageToday}, uniqueDomains: ${_this.uniqueDomains}, queriesForwarded: ${_this.queriesForwarded}, queriesCached: ${_this.queriesCached}, clientsEverSeen: ${_this.clientsEverSeen}, uniqueClients: ${_this.uniqueClients}, dnsQueriesAllTypes: ${_this.dnsQueriesAllTypes}, replies: ${_this.replies}, queryTypes: ${_this.queryTypes}, frequency: ${_this.frequency})';
}


}

/// @nodoc
abstract mixin class $SummaryCopyWith<$Res>  {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) _then) = _$SummaryCopyWithImpl;
@useResult
$Res call({
 int domainsBeingBlocked, int dnsQueriesToday, int adsBlockedToday, double adsPercentageToday, int uniqueDomains, int queriesForwarded, int queriesCached, int clientsEverSeen, int uniqueClients, int dnsQueriesAllTypes, ReplyCounts replies, List<QueryTypeStat> queryTypes, double? frequency
});


$ReplyCountsCopyWith<$Res> get replies;

}
/// @nodoc
class _$SummaryCopyWithImpl<$Res>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._self, this._then);

  final Summary _self;
  final $Res Function(Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainsBeingBlocked = null,Object? dnsQueriesToday = null,Object? adsBlockedToday = null,Object? adsPercentageToday = null,Object? uniqueDomains = null,Object? queriesForwarded = null,Object? queriesCached = null,Object? clientsEverSeen = null,Object? uniqueClients = null,Object? dnsQueriesAllTypes = null,Object? replies = null,Object? queryTypes = null,Object? frequency = freezed,}) {
  return _then(Summary(
domainsBeingBlocked: null == domainsBeingBlocked ? _self.domainsBeingBlocked : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
as int,dnsQueriesToday: null == dnsQueriesToday ? _self.dnsQueriesToday : dnsQueriesToday // ignore: cast_nullable_to_non_nullable
as int,adsBlockedToday: null == adsBlockedToday ? _self.adsBlockedToday : adsBlockedToday // ignore: cast_nullable_to_non_nullable
as int,adsPercentageToday: null == adsPercentageToday ? _self.adsPercentageToday : adsPercentageToday // ignore: cast_nullable_to_non_nullable
as double,uniqueDomains: null == uniqueDomains ? _self.uniqueDomains : uniqueDomains // ignore: cast_nullable_to_non_nullable
as int,queriesForwarded: null == queriesForwarded ? _self.queriesForwarded : queriesForwarded // ignore: cast_nullable_to_non_nullable
as int,queriesCached: null == queriesCached ? _self.queriesCached : queriesCached // ignore: cast_nullable_to_non_nullable
as int,clientsEverSeen: null == clientsEverSeen ? _self.clientsEverSeen : clientsEverSeen // ignore: cast_nullable_to_non_nullable
as int,uniqueClients: null == uniqueClients ? _self.uniqueClients : uniqueClients // ignore: cast_nullable_to_non_nullable
as int,dnsQueriesAllTypes: null == dnsQueriesAllTypes ? _self.dnsQueriesAllTypes : dnsQueriesAllTypes // ignore: cast_nullable_to_non_nullable
as int,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as ReplyCounts,queryTypes: null == queryTypes ? _self.queryTypes : queryTypes // ignore: cast_nullable_to_non_nullable
as List<QueryTypeStat>,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyCountsCopyWith<$Res> get replies {
  
  return $ReplyCountsCopyWith<$Res>(_self.replies, (value) {
    return _then(_self.copyWith(replies: value));
  });
}
}


/// Adds pattern-matching-related methods to [Summary].
extension SummaryPatterns on Summary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Summary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Summary value)  $default,){
final _that = this;
switch (_that) {
case _Summary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Summary value)?  $default,){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  ReplyCounts replies,  List<QueryTypeStat> queryTypes,  double? frequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replies,_that.queryTypes,_that.frequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  ReplyCounts replies,  List<QueryTypeStat> queryTypes,  double? frequency)  $default,) {final _that = this;
switch (_that) {
case _Summary():
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replies,_that.queryTypes,_that.frequency);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  ReplyCounts replies,  List<QueryTypeStat> queryTypes,  double? frequency)?  $default,) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replies,_that.queryTypes,_that.frequency);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Summary implements Summary {
   _Summary({required this.domainsBeingBlocked, required this.dnsQueriesToday, required this.adsBlockedToday, required this.adsPercentageToday, required this.uniqueDomains, required this.queriesForwarded, required this.queriesCached, required this.clientsEverSeen, required this.uniqueClients, required this.dnsQueriesAllTypes, required this.replies, required  List<QueryTypeStat> queryTypes, this.frequency}): _queryTypes = queryTypes;
  factory _Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);

@override final  int domainsBeingBlocked;
@override final  int dnsQueriesToday;
@override final  int adsBlockedToday;
@override final  double adsPercentageToday;
@override final  int uniqueDomains;
@override final  int queriesForwarded;
@override final  int queriesCached;
@override final  int clientsEverSeen;
@override final  int uniqueClients;
@override final  int dnsQueriesAllTypes;
@override final  ReplyCounts replies;
 final  List<QueryTypeStat> _queryTypes;
@override List<QueryTypeStat> get queryTypes {
  if (_queryTypes is EqualUnmodifiableListView) return _queryTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queryTypes);
}

@override final  double? frequency;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryCopyWith<_Summary> get copyWith => __$SummaryCopyWithImpl<_Summary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Summary&&(identical(other.domainsBeingBlocked, domainsBeingBlocked) || other.domainsBeingBlocked == domainsBeingBlocked)&&(identical(other.dnsQueriesToday, dnsQueriesToday) || other.dnsQueriesToday == dnsQueriesToday)&&(identical(other.adsBlockedToday, adsBlockedToday) || other.adsBlockedToday == adsBlockedToday)&&(identical(other.adsPercentageToday, adsPercentageToday) || other.adsPercentageToday == adsPercentageToday)&&(identical(other.uniqueDomains, uniqueDomains) || other.uniqueDomains == uniqueDomains)&&(identical(other.queriesForwarded, queriesForwarded) || other.queriesForwarded == queriesForwarded)&&(identical(other.queriesCached, queriesCached) || other.queriesCached == queriesCached)&&(identical(other.clientsEverSeen, clientsEverSeen) || other.clientsEverSeen == clientsEverSeen)&&(identical(other.uniqueClients, uniqueClients) || other.uniqueClients == uniqueClients)&&(identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) || other.dnsQueriesAllTypes == dnsQueriesAllTypes)&&(identical(other.replies, replies) || other.replies == replies)&&const DeepCollectionEquality().equals(other.queryTypes, _queryTypes)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,domainsBeingBlocked,dnsQueriesToday,adsBlockedToday,adsPercentageToday,uniqueDomains,queriesForwarded,queriesCached,clientsEverSeen,uniqueClients,dnsQueriesAllTypes,replies,const DeepCollectionEquality().hash(_queryTypes),frequency);
}

@override
String toString() {
    return 'Summary(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replies: $replies, queryTypes: $queryTypes, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) _then) = __$SummaryCopyWithImpl;
@override @useResult
$Res call({
 int domainsBeingBlocked, int dnsQueriesToday, int adsBlockedToday, double adsPercentageToday, int uniqueDomains, int queriesForwarded, int queriesCached, int clientsEverSeen, int uniqueClients, int dnsQueriesAllTypes, ReplyCounts replies, List<QueryTypeStat> queryTypes, double? frequency
});


@override $ReplyCountsCopyWith<$Res> get replies;

}
/// @nodoc
class __$SummaryCopyWithImpl<$Res>
    implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(this._self, this._then);

  final _Summary _self;
  final $Res Function(_Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainsBeingBlocked = null,Object? dnsQueriesToday = null,Object? adsBlockedToday = null,Object? adsPercentageToday = null,Object? uniqueDomains = null,Object? queriesForwarded = null,Object? queriesCached = null,Object? clientsEverSeen = null,Object? uniqueClients = null,Object? dnsQueriesAllTypes = null,Object? replies = null,Object? queryTypes = null,Object? frequency = freezed,}) {
  return _then(_Summary(
domainsBeingBlocked: null == domainsBeingBlocked ? _self.domainsBeingBlocked : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
as int,dnsQueriesToday: null == dnsQueriesToday ? _self.dnsQueriesToday : dnsQueriesToday // ignore: cast_nullable_to_non_nullable
as int,adsBlockedToday: null == adsBlockedToday ? _self.adsBlockedToday : adsBlockedToday // ignore: cast_nullable_to_non_nullable
as int,adsPercentageToday: null == adsPercentageToday ? _self.adsPercentageToday : adsPercentageToday // ignore: cast_nullable_to_non_nullable
as double,uniqueDomains: null == uniqueDomains ? _self.uniqueDomains : uniqueDomains // ignore: cast_nullable_to_non_nullable
as int,queriesForwarded: null == queriesForwarded ? _self.queriesForwarded : queriesForwarded // ignore: cast_nullable_to_non_nullable
as int,queriesCached: null == queriesCached ? _self.queriesCached : queriesCached // ignore: cast_nullable_to_non_nullable
as int,clientsEverSeen: null == clientsEverSeen ? _self.clientsEverSeen : clientsEverSeen // ignore: cast_nullable_to_non_nullable
as int,uniqueClients: null == uniqueClients ? _self.uniqueClients : uniqueClients // ignore: cast_nullable_to_non_nullable
as int,dnsQueriesAllTypes: null == dnsQueriesAllTypes ? _self.dnsQueriesAllTypes : dnsQueriesAllTypes // ignore: cast_nullable_to_non_nullable
as int,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as ReplyCounts,queryTypes: null == queryTypes ? _self._queryTypes : queryTypes // ignore: cast_nullable_to_non_nullable
as List<QueryTypeStat>,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyCountsCopyWith<$Res> get replies {
  
  return $ReplyCountsCopyWith<$Res>(_self.replies, (value) {
    return _then(_self.copyWith(replies: value));
  });
}
}


/// @nodoc
mixin _$ReplyCounts {

 int get unknown; int get nodata; int get nxDomain; int get cname; int get ip; int get domain; int get rrname; int get servfail; int get refused; int get notimp; int get other; int get dnssec; int get none; int get blob; int get total;
/// Create a copy of ReplyCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyCountsCopyWith<ReplyCounts> get copyWith => _$ReplyCountsCopyWithImpl<ReplyCounts>(this as ReplyCounts, _$identity);

  /// Serializes this ReplyCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReplyCounts;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyCounts&&(identical(other.unknown, _this.unknown) || other.unknown == _this.unknown)&&(identical(other.nodata, _this.nodata) || other.nodata == _this.nodata)&&(identical(other.nxDomain, _this.nxDomain) || other.nxDomain == _this.nxDomain)&&(identical(other.cname, _this.cname) || other.cname == _this.cname)&&(identical(other.ip, _this.ip) || other.ip == _this.ip)&&(identical(other.domain, _this.domain) || other.domain == _this.domain)&&(identical(other.rrname, _this.rrname) || other.rrname == _this.rrname)&&(identical(other.servfail, _this.servfail) || other.servfail == _this.servfail)&&(identical(other.refused, _this.refused) || other.refused == _this.refused)&&(identical(other.notimp, _this.notimp) || other.notimp == _this.notimp)&&(identical(other.other, _this.other) || other.other == _this.other)&&(identical(other.dnssec, _this.dnssec) || other.dnssec == _this.dnssec)&&(identical(other.none, _this.none) || other.none == _this.none)&&(identical(other.blob, _this.blob) || other.blob == _this.blob)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReplyCounts;
  return Object.hash(runtimeType,_this.unknown,_this.nodata,_this.nxDomain,_this.cname,_this.ip,_this.domain,_this.rrname,_this.servfail,_this.refused,_this.notimp,_this.other,_this.dnssec,_this.none,_this.blob,_this.total);
}

@override
String toString() {
  final _this = this as ReplyCounts;
  return 'ReplyCounts(unknown: ${_this.unknown}, nodata: ${_this.nodata}, nxDomain: ${_this.nxDomain}, cname: ${_this.cname}, ip: ${_this.ip}, domain: ${_this.domain}, rrname: ${_this.rrname}, servfail: ${_this.servfail}, refused: ${_this.refused}, notimp: ${_this.notimp}, other: ${_this.other}, dnssec: ${_this.dnssec}, none: ${_this.none}, blob: ${_this.blob}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $ReplyCountsCopyWith<$Res>  {
  factory $ReplyCountsCopyWith(ReplyCounts value, $Res Function(ReplyCounts) _then) = _$ReplyCountsCopyWithImpl;
@useResult
$Res call({
 int unknown, int nodata, int nxDomain, int cname, int ip, int domain, int rrname, int servfail, int refused, int notimp, int other, int dnssec, int none, int blob, int total
});




}
/// @nodoc
class _$ReplyCountsCopyWithImpl<$Res>
    implements $ReplyCountsCopyWith<$Res> {
  _$ReplyCountsCopyWithImpl(this._self, this._then);

  final ReplyCounts _self;
  final $Res Function(ReplyCounts) _then;

/// Create a copy of ReplyCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unknown = null,Object? nodata = null,Object? nxDomain = null,Object? cname = null,Object? ip = null,Object? domain = null,Object? rrname = null,Object? servfail = null,Object? refused = null,Object? notimp = null,Object? other = null,Object? dnssec = null,Object? none = null,Object? blob = null,Object? total = null,}) {
  return _then(ReplyCounts(
unknown: null == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as int,nodata: null == nodata ? _self.nodata : nodata // ignore: cast_nullable_to_non_nullable
as int,nxDomain: null == nxDomain ? _self.nxDomain : nxDomain // ignore: cast_nullable_to_non_nullable
as int,cname: null == cname ? _self.cname : cname // ignore: cast_nullable_to_non_nullable
as int,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as int,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as int,rrname: null == rrname ? _self.rrname : rrname // ignore: cast_nullable_to_non_nullable
as int,servfail: null == servfail ? _self.servfail : servfail // ignore: cast_nullable_to_non_nullable
as int,refused: null == refused ? _self.refused : refused // ignore: cast_nullable_to_non_nullable
as int,notimp: null == notimp ? _self.notimp : notimp // ignore: cast_nullable_to_non_nullable
as int,other: null == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as int,dnssec: null == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as int,none: null == none ? _self.none : none // ignore: cast_nullable_to_non_nullable
as int,blob: null == blob ? _self.blob : blob // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplyCounts].
extension ReplyCountsPatterns on ReplyCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplyCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplyCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplyCounts value)  $default,){
final _that = this;
switch (_that) {
case _ReplyCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplyCounts value)?  $default,){
final _that = this;
switch (_that) {
case _ReplyCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int unknown,  int nodata,  int nxDomain,  int cname,  int ip,  int domain,  int rrname,  int servfail,  int refused,  int notimp,  int other,  int dnssec,  int none,  int blob,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyCounts() when $default != null:
return $default(_that.unknown,_that.nodata,_that.nxDomain,_that.cname,_that.ip,_that.domain,_that.rrname,_that.servfail,_that.refused,_that.notimp,_that.other,_that.dnssec,_that.none,_that.blob,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int unknown,  int nodata,  int nxDomain,  int cname,  int ip,  int domain,  int rrname,  int servfail,  int refused,  int notimp,  int other,  int dnssec,  int none,  int blob,  int total)  $default,) {final _that = this;
switch (_that) {
case _ReplyCounts():
return $default(_that.unknown,_that.nodata,_that.nxDomain,_that.cname,_that.ip,_that.domain,_that.rrname,_that.servfail,_that.refused,_that.notimp,_that.other,_that.dnssec,_that.none,_that.blob,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int unknown,  int nodata,  int nxDomain,  int cname,  int ip,  int domain,  int rrname,  int servfail,  int refused,  int notimp,  int other,  int dnssec,  int none,  int blob,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ReplyCounts() when $default != null:
return $default(_that.unknown,_that.nodata,_that.nxDomain,_that.cname,_that.ip,_that.domain,_that.rrname,_that.servfail,_that.refused,_that.notimp,_that.other,_that.dnssec,_that.none,_that.blob,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReplyCounts implements ReplyCounts {
  const _ReplyCounts({required this.unknown, required this.nodata, required this.nxDomain, required this.cname, required this.ip, required this.domain, required this.rrname, required this.servfail, required this.refused, required this.notimp, required this.other, required this.dnssec, required this.none, required this.blob, required this.total});
  factory _ReplyCounts.fromJson(Map<String, dynamic> json) => _$ReplyCountsFromJson(json);

@override final  int unknown;
@override final  int nodata;
@override final  int nxDomain;
@override final  int cname;
@override final  int ip;
@override final  int domain;
@override final  int rrname;
@override final  int servfail;
@override final  int refused;
@override final  int notimp;
@override final  int other;
@override final  int dnssec;
@override final  int none;
@override final  int blob;
@override final  int total;

/// Create a copy of ReplyCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyCountsCopyWith<_ReplyCounts> get copyWith => __$ReplyCountsCopyWithImpl<_ReplyCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplyCountsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyCounts&&(identical(other.unknown, unknown) || other.unknown == unknown)&&(identical(other.nodata, nodata) || other.nodata == nodata)&&(identical(other.nxDomain, nxDomain) || other.nxDomain == nxDomain)&&(identical(other.cname, cname) || other.cname == cname)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.rrname, rrname) || other.rrname == rrname)&&(identical(other.servfail, servfail) || other.servfail == servfail)&&(identical(other.refused, refused) || other.refused == refused)&&(identical(other.notimp, notimp) || other.notimp == notimp)&&(identical(other.other, this.other) || other.other == this.other)&&(identical(other.dnssec, dnssec) || other.dnssec == dnssec)&&(identical(other.none, none) || other.none == none)&&(identical(other.blob, blob) || other.blob == blob)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,unknown,nodata,nxDomain,cname,ip,domain,rrname,servfail,refused,notimp,other,dnssec,none,blob,total);
}

@override
String toString() {
    return 'ReplyCounts(unknown: $unknown, nodata: $nodata, nxDomain: $nxDomain, cname: $cname, ip: $ip, domain: $domain, rrname: $rrname, servfail: $servfail, refused: $refused, notimp: $notimp, other: $other, dnssec: $dnssec, none: $none, blob: $blob, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ReplyCountsCopyWith<$Res> implements $ReplyCountsCopyWith<$Res> {
  factory _$ReplyCountsCopyWith(_ReplyCounts value, $Res Function(_ReplyCounts) _then) = __$ReplyCountsCopyWithImpl;
@override @useResult
$Res call({
 int unknown, int nodata, int nxDomain, int cname, int ip, int domain, int rrname, int servfail, int refused, int notimp, int other, int dnssec, int none, int blob, int total
});




}
/// @nodoc
class __$ReplyCountsCopyWithImpl<$Res>
    implements _$ReplyCountsCopyWith<$Res> {
  __$ReplyCountsCopyWithImpl(this._self, this._then);

  final _ReplyCounts _self;
  final $Res Function(_ReplyCounts) _then;

/// Create a copy of ReplyCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unknown = null,Object? nodata = null,Object? nxDomain = null,Object? cname = null,Object? ip = null,Object? domain = null,Object? rrname = null,Object? servfail = null,Object? refused = null,Object? notimp = null,Object? other = null,Object? dnssec = null,Object? none = null,Object? blob = null,Object? total = null,}) {
  return _then(_ReplyCounts(
unknown: null == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as int,nodata: null == nodata ? _self.nodata : nodata // ignore: cast_nullable_to_non_nullable
as int,nxDomain: null == nxDomain ? _self.nxDomain : nxDomain // ignore: cast_nullable_to_non_nullable
as int,cname: null == cname ? _self.cname : cname // ignore: cast_nullable_to_non_nullable
as int,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as int,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as int,rrname: null == rrname ? _self.rrname : rrname // ignore: cast_nullable_to_non_nullable
as int,servfail: null == servfail ? _self.servfail : servfail // ignore: cast_nullable_to_non_nullable
as int,refused: null == refused ? _self.refused : refused // ignore: cast_nullable_to_non_nullable
as int,notimp: null == notimp ? _self.notimp : notimp // ignore: cast_nullable_to_non_nullable
as int,other: null == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as int,dnssec: null == dnssec ? _self.dnssec : dnssec // ignore: cast_nullable_to_non_nullable
as int,none: null == none ? _self.none : none // ignore: cast_nullable_to_non_nullable
as int,blob: null == blob ? _self.blob : blob // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$QueryTypeStat {

 DnsRecordType get type; double get percentage; int? get count;
/// Create a copy of QueryTypeStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryTypeStatCopyWith<QueryTypeStat> get copyWith => _$QueryTypeStatCopyWithImpl<QueryTypeStat>(this as QueryTypeStat, _$identity);

  /// Serializes this QueryTypeStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QueryTypeStat;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryTypeStat&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.percentage, _this.percentage) || other.percentage == _this.percentage)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QueryTypeStat;
  return Object.hash(runtimeType,_this.type,_this.percentage,_this.count);
}

@override
String toString() {
  final _this = this as QueryTypeStat;
  return 'QueryTypeStat(type: ${_this.type}, percentage: ${_this.percentage}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $QueryTypeStatCopyWith<$Res>  {
  factory $QueryTypeStatCopyWith(QueryTypeStat value, $Res Function(QueryTypeStat) _then) = _$QueryTypeStatCopyWithImpl;
@useResult
$Res call({
 DnsRecordType type, double percentage, int? count
});




}
/// @nodoc
class _$QueryTypeStatCopyWithImpl<$Res>
    implements $QueryTypeStatCopyWith<$Res> {
  _$QueryTypeStatCopyWithImpl(this._self, this._then);

  final QueryTypeStat _self;
  final $Res Function(QueryTypeStat) _then;

/// Create a copy of QueryTypeStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? percentage = null,Object? count = freezed,}) {
  return _then(QueryTypeStat(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueryTypeStat].
extension QueryTypeStatPatterns on QueryTypeStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueryTypeStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryTypeStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueryTypeStat value)  $default,){
final _that = this;
switch (_that) {
case _QueryTypeStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueryTypeStat value)?  $default,){
final _that = this;
switch (_that) {
case _QueryTypeStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DnsRecordType type,  double percentage,  int? count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryTypeStat() when $default != null:
return $default(_that.type,_that.percentage,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DnsRecordType type,  double percentage,  int? count)  $default,) {final _that = this;
switch (_that) {
case _QueryTypeStat():
return $default(_that.type,_that.percentage,_that.count);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DnsRecordType type,  double percentage,  int? count)?  $default,) {final _that = this;
switch (_that) {
case _QueryTypeStat() when $default != null:
return $default(_that.type,_that.percentage,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueryTypeStat implements QueryTypeStat {
  const _QueryTypeStat({required this.type, required this.percentage, this.count});
  factory _QueryTypeStat.fromJson(Map<String, dynamic> json) => _$QueryTypeStatFromJson(json);

@override final  DnsRecordType type;
@override final  double percentage;
@override final  int? count;

/// Create a copy of QueryTypeStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryTypeStatCopyWith<_QueryTypeStat> get copyWith => __$QueryTypeStatCopyWithImpl<_QueryTypeStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueryTypeStatToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryTypeStat&&(identical(other.type, type) || other.type == type)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,percentage,count);
}

@override
String toString() {
    return 'QueryTypeStat(type: $type, percentage: $percentage, count: $count)';
}


}

/// @nodoc
abstract mixin class _$QueryTypeStatCopyWith<$Res> implements $QueryTypeStatCopyWith<$Res> {
  factory _$QueryTypeStatCopyWith(_QueryTypeStat value, $Res Function(_QueryTypeStat) _then) = __$QueryTypeStatCopyWithImpl;
@override @useResult
$Res call({
 DnsRecordType type, double percentage, int? count
});




}
/// @nodoc
class __$QueryTypeStatCopyWithImpl<$Res>
    implements _$QueryTypeStatCopyWith<$Res> {
  __$QueryTypeStatCopyWithImpl(this._self, this._then);

  final _QueryTypeStat _self;
  final $Res Function(_QueryTypeStat) _then;

/// Create a copy of QueryTypeStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? percentage = null,Object? count = freezed,}) {
  return _then(_QueryTypeStat(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
