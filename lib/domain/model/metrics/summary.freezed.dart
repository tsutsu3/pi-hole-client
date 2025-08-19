// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Summary {

 int get domainsBeingBlocked; int get dnsQueriesToday; int get adsBlockedToday; double get adsPercentageToday; int get uniqueDomains; int get queriesForwarded; int get queriesCached; int get clientsEverSeen; int get uniqueClients; int get dnsQueriesAllTypes; int get replyUnknown; int get replyNodata; int get replyNxdomain; int get replyCname; int get replyIp; int get replyDomain; int get replyRrname; int get replyServfail; int get replyRefused; int get replyNotimp; int get replyOther; int get replyDnssec; int get replyNone; int get replyBlob; int get dnsQueriesAllReplies; List<QueryTypeStat> get queryTypes;
/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCopyWith<Summary> get copyWith => _$SummaryCopyWithImpl<Summary>(this as Summary, _$identity);

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Summary&&(identical(other.domainsBeingBlocked, domainsBeingBlocked) || other.domainsBeingBlocked == domainsBeingBlocked)&&(identical(other.dnsQueriesToday, dnsQueriesToday) || other.dnsQueriesToday == dnsQueriesToday)&&(identical(other.adsBlockedToday, adsBlockedToday) || other.adsBlockedToday == adsBlockedToday)&&(identical(other.adsPercentageToday, adsPercentageToday) || other.adsPercentageToday == adsPercentageToday)&&(identical(other.uniqueDomains, uniqueDomains) || other.uniqueDomains == uniqueDomains)&&(identical(other.queriesForwarded, queriesForwarded) || other.queriesForwarded == queriesForwarded)&&(identical(other.queriesCached, queriesCached) || other.queriesCached == queriesCached)&&(identical(other.clientsEverSeen, clientsEverSeen) || other.clientsEverSeen == clientsEverSeen)&&(identical(other.uniqueClients, uniqueClients) || other.uniqueClients == uniqueClients)&&(identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) || other.dnsQueriesAllTypes == dnsQueriesAllTypes)&&(identical(other.replyUnknown, replyUnknown) || other.replyUnknown == replyUnknown)&&(identical(other.replyNodata, replyNodata) || other.replyNodata == replyNodata)&&(identical(other.replyNxdomain, replyNxdomain) || other.replyNxdomain == replyNxdomain)&&(identical(other.replyCname, replyCname) || other.replyCname == replyCname)&&(identical(other.replyIp, replyIp) || other.replyIp == replyIp)&&(identical(other.replyDomain, replyDomain) || other.replyDomain == replyDomain)&&(identical(other.replyRrname, replyRrname) || other.replyRrname == replyRrname)&&(identical(other.replyServfail, replyServfail) || other.replyServfail == replyServfail)&&(identical(other.replyRefused, replyRefused) || other.replyRefused == replyRefused)&&(identical(other.replyNotimp, replyNotimp) || other.replyNotimp == replyNotimp)&&(identical(other.replyOther, replyOther) || other.replyOther == replyOther)&&(identical(other.replyDnssec, replyDnssec) || other.replyDnssec == replyDnssec)&&(identical(other.replyNone, replyNone) || other.replyNone == replyNone)&&(identical(other.replyBlob, replyBlob) || other.replyBlob == replyBlob)&&(identical(other.dnsQueriesAllReplies, dnsQueriesAllReplies) || other.dnsQueriesAllReplies == dnsQueriesAllReplies)&&const DeepCollectionEquality().equals(other.queryTypes, queryTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,domainsBeingBlocked,dnsQueriesToday,adsBlockedToday,adsPercentageToday,uniqueDomains,queriesForwarded,queriesCached,clientsEverSeen,uniqueClients,dnsQueriesAllTypes,replyUnknown,replyNodata,replyNxdomain,replyCname,replyIp,replyDomain,replyRrname,replyServfail,replyRefused,replyNotimp,replyOther,replyDnssec,replyNone,replyBlob,dnsQueriesAllReplies,const DeepCollectionEquality().hash(queryTypes)]);

@override
String toString() {
  return 'Summary(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxdomain: $replyNxdomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, queryTypes: $queryTypes)';
}


}

/// @nodoc
abstract mixin class $SummaryCopyWith<$Res>  {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) _then) = _$SummaryCopyWithImpl;
@useResult
$Res call({
 int domainsBeingBlocked, int dnsQueriesToday, int adsBlockedToday, double adsPercentageToday, int uniqueDomains, int queriesForwarded, int queriesCached, int clientsEverSeen, int uniqueClients, int dnsQueriesAllTypes, int replyUnknown, int replyNodata, int replyNxdomain, int replyCname, int replyIp, int replyDomain, int replyRrname, int replyServfail, int replyRefused, int replyNotimp, int replyOther, int replyDnssec, int replyNone, int replyBlob, int dnsQueriesAllReplies, List<QueryTypeStat> queryTypes
});




}
/// @nodoc
class _$SummaryCopyWithImpl<$Res>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._self, this._then);

  final Summary _self;
  final $Res Function(Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainsBeingBlocked = null,Object? dnsQueriesToday = null,Object? adsBlockedToday = null,Object? adsPercentageToday = null,Object? uniqueDomains = null,Object? queriesForwarded = null,Object? queriesCached = null,Object? clientsEverSeen = null,Object? uniqueClients = null,Object? dnsQueriesAllTypes = null,Object? replyUnknown = null,Object? replyNodata = null,Object? replyNxdomain = null,Object? replyCname = null,Object? replyIp = null,Object? replyDomain = null,Object? replyRrname = null,Object? replyServfail = null,Object? replyRefused = null,Object? replyNotimp = null,Object? replyOther = null,Object? replyDnssec = null,Object? replyNone = null,Object? replyBlob = null,Object? dnsQueriesAllReplies = null,Object? queryTypes = null,}) {
  return _then(_self.copyWith(
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
as int,replyUnknown: null == replyUnknown ? _self.replyUnknown : replyUnknown // ignore: cast_nullable_to_non_nullable
as int,replyNodata: null == replyNodata ? _self.replyNodata : replyNodata // ignore: cast_nullable_to_non_nullable
as int,replyNxdomain: null == replyNxdomain ? _self.replyNxdomain : replyNxdomain // ignore: cast_nullable_to_non_nullable
as int,replyCname: null == replyCname ? _self.replyCname : replyCname // ignore: cast_nullable_to_non_nullable
as int,replyIp: null == replyIp ? _self.replyIp : replyIp // ignore: cast_nullable_to_non_nullable
as int,replyDomain: null == replyDomain ? _self.replyDomain : replyDomain // ignore: cast_nullable_to_non_nullable
as int,replyRrname: null == replyRrname ? _self.replyRrname : replyRrname // ignore: cast_nullable_to_non_nullable
as int,replyServfail: null == replyServfail ? _self.replyServfail : replyServfail // ignore: cast_nullable_to_non_nullable
as int,replyRefused: null == replyRefused ? _self.replyRefused : replyRefused // ignore: cast_nullable_to_non_nullable
as int,replyNotimp: null == replyNotimp ? _self.replyNotimp : replyNotimp // ignore: cast_nullable_to_non_nullable
as int,replyOther: null == replyOther ? _self.replyOther : replyOther // ignore: cast_nullable_to_non_nullable
as int,replyDnssec: null == replyDnssec ? _self.replyDnssec : replyDnssec // ignore: cast_nullable_to_non_nullable
as int,replyNone: null == replyNone ? _self.replyNone : replyNone // ignore: cast_nullable_to_non_nullable
as int,replyBlob: null == replyBlob ? _self.replyBlob : replyBlob // ignore: cast_nullable_to_non_nullable
as int,dnsQueriesAllReplies: null == dnsQueriesAllReplies ? _self.dnsQueriesAllReplies : dnsQueriesAllReplies // ignore: cast_nullable_to_non_nullable
as int,queryTypes: null == queryTypes ? _self.queryTypes : queryTypes // ignore: cast_nullable_to_non_nullable
as List<QueryTypeStat>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  int replyUnknown,  int replyNodata,  int replyNxdomain,  int replyCname,  int replyIp,  int replyDomain,  int replyRrname,  int replyServfail,  int replyRefused,  int replyNotimp,  int replyOther,  int replyDnssec,  int replyNone,  int replyBlob,  int dnsQueriesAllReplies,  List<QueryTypeStat> queryTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replyUnknown,_that.replyNodata,_that.replyNxdomain,_that.replyCname,_that.replyIp,_that.replyDomain,_that.replyRrname,_that.replyServfail,_that.replyRefused,_that.replyNotimp,_that.replyOther,_that.replyDnssec,_that.replyNone,_that.replyBlob,_that.dnsQueriesAllReplies,_that.queryTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  int replyUnknown,  int replyNodata,  int replyNxdomain,  int replyCname,  int replyIp,  int replyDomain,  int replyRrname,  int replyServfail,  int replyRefused,  int replyNotimp,  int replyOther,  int replyDnssec,  int replyNone,  int replyBlob,  int dnsQueriesAllReplies,  List<QueryTypeStat> queryTypes)  $default,) {final _that = this;
switch (_that) {
case _Summary():
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replyUnknown,_that.replyNodata,_that.replyNxdomain,_that.replyCname,_that.replyIp,_that.replyDomain,_that.replyRrname,_that.replyServfail,_that.replyRefused,_that.replyNotimp,_that.replyOther,_that.replyDnssec,_that.replyNone,_that.replyBlob,_that.dnsQueriesAllReplies,_that.queryTypes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  int replyUnknown,  int replyNodata,  int replyNxdomain,  int replyCname,  int replyIp,  int replyDomain,  int replyRrname,  int replyServfail,  int replyRefused,  int replyNotimp,  int replyOther,  int replyDnssec,  int replyNone,  int replyBlob,  int dnsQueriesAllReplies,  List<QueryTypeStat> queryTypes)?  $default,) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replyUnknown,_that.replyNodata,_that.replyNxdomain,_that.replyCname,_that.replyIp,_that.replyDomain,_that.replyRrname,_that.replyServfail,_that.replyRefused,_that.replyNotimp,_that.replyOther,_that.replyDnssec,_that.replyNone,_that.replyBlob,_that.dnsQueriesAllReplies,_that.queryTypes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Summary implements Summary {
   _Summary({required this.domainsBeingBlocked, required this.dnsQueriesToday, required this.adsBlockedToday, required this.adsPercentageToday, required this.uniqueDomains, required this.queriesForwarded, required this.queriesCached, required this.clientsEverSeen, required this.uniqueClients, required this.dnsQueriesAllTypes, required this.replyUnknown, required this.replyNodata, required this.replyNxdomain, required this.replyCname, required this.replyIp, required this.replyDomain, required this.replyRrname, required this.replyServfail, required this.replyRefused, required this.replyNotimp, required this.replyOther, required this.replyDnssec, required this.replyNone, required this.replyBlob, required this.dnsQueriesAllReplies, required final  List<QueryTypeStat> queryTypes}): _queryTypes = queryTypes;
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
@override final  int replyUnknown;
@override final  int replyNodata;
@override final  int replyNxdomain;
@override final  int replyCname;
@override final  int replyIp;
@override final  int replyDomain;
@override final  int replyRrname;
@override final  int replyServfail;
@override final  int replyRefused;
@override final  int replyNotimp;
@override final  int replyOther;
@override final  int replyDnssec;
@override final  int replyNone;
@override final  int replyBlob;
@override final  int dnsQueriesAllReplies;
 final  List<QueryTypeStat> _queryTypes;
@override List<QueryTypeStat> get queryTypes {
  if (_queryTypes is EqualUnmodifiableListView) return _queryTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queryTypes);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Summary&&(identical(other.domainsBeingBlocked, domainsBeingBlocked) || other.domainsBeingBlocked == domainsBeingBlocked)&&(identical(other.dnsQueriesToday, dnsQueriesToday) || other.dnsQueriesToday == dnsQueriesToday)&&(identical(other.adsBlockedToday, adsBlockedToday) || other.adsBlockedToday == adsBlockedToday)&&(identical(other.adsPercentageToday, adsPercentageToday) || other.adsPercentageToday == adsPercentageToday)&&(identical(other.uniqueDomains, uniqueDomains) || other.uniqueDomains == uniqueDomains)&&(identical(other.queriesForwarded, queriesForwarded) || other.queriesForwarded == queriesForwarded)&&(identical(other.queriesCached, queriesCached) || other.queriesCached == queriesCached)&&(identical(other.clientsEverSeen, clientsEverSeen) || other.clientsEverSeen == clientsEverSeen)&&(identical(other.uniqueClients, uniqueClients) || other.uniqueClients == uniqueClients)&&(identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) || other.dnsQueriesAllTypes == dnsQueriesAllTypes)&&(identical(other.replyUnknown, replyUnknown) || other.replyUnknown == replyUnknown)&&(identical(other.replyNodata, replyNodata) || other.replyNodata == replyNodata)&&(identical(other.replyNxdomain, replyNxdomain) || other.replyNxdomain == replyNxdomain)&&(identical(other.replyCname, replyCname) || other.replyCname == replyCname)&&(identical(other.replyIp, replyIp) || other.replyIp == replyIp)&&(identical(other.replyDomain, replyDomain) || other.replyDomain == replyDomain)&&(identical(other.replyRrname, replyRrname) || other.replyRrname == replyRrname)&&(identical(other.replyServfail, replyServfail) || other.replyServfail == replyServfail)&&(identical(other.replyRefused, replyRefused) || other.replyRefused == replyRefused)&&(identical(other.replyNotimp, replyNotimp) || other.replyNotimp == replyNotimp)&&(identical(other.replyOther, replyOther) || other.replyOther == replyOther)&&(identical(other.replyDnssec, replyDnssec) || other.replyDnssec == replyDnssec)&&(identical(other.replyNone, replyNone) || other.replyNone == replyNone)&&(identical(other.replyBlob, replyBlob) || other.replyBlob == replyBlob)&&(identical(other.dnsQueriesAllReplies, dnsQueriesAllReplies) || other.dnsQueriesAllReplies == dnsQueriesAllReplies)&&const DeepCollectionEquality().equals(other._queryTypes, _queryTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,domainsBeingBlocked,dnsQueriesToday,adsBlockedToday,adsPercentageToday,uniqueDomains,queriesForwarded,queriesCached,clientsEverSeen,uniqueClients,dnsQueriesAllTypes,replyUnknown,replyNodata,replyNxdomain,replyCname,replyIp,replyDomain,replyRrname,replyServfail,replyRefused,replyNotimp,replyOther,replyDnssec,replyNone,replyBlob,dnsQueriesAllReplies,const DeepCollectionEquality().hash(_queryTypes)]);

@override
String toString() {
  return 'Summary(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxdomain: $replyNxdomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, queryTypes: $queryTypes)';
}


}

/// @nodoc
abstract mixin class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) _then) = __$SummaryCopyWithImpl;
@override @useResult
$Res call({
 int domainsBeingBlocked, int dnsQueriesToday, int adsBlockedToday, double adsPercentageToday, int uniqueDomains, int queriesForwarded, int queriesCached, int clientsEverSeen, int uniqueClients, int dnsQueriesAllTypes, int replyUnknown, int replyNodata, int replyNxdomain, int replyCname, int replyIp, int replyDomain, int replyRrname, int replyServfail, int replyRefused, int replyNotimp, int replyOther, int replyDnssec, int replyNone, int replyBlob, int dnsQueriesAllReplies, List<QueryTypeStat> queryTypes
});




}
/// @nodoc
class __$SummaryCopyWithImpl<$Res>
    implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(this._self, this._then);

  final _Summary _self;
  final $Res Function(_Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainsBeingBlocked = null,Object? dnsQueriesToday = null,Object? adsBlockedToday = null,Object? adsPercentageToday = null,Object? uniqueDomains = null,Object? queriesForwarded = null,Object? queriesCached = null,Object? clientsEverSeen = null,Object? uniqueClients = null,Object? dnsQueriesAllTypes = null,Object? replyUnknown = null,Object? replyNodata = null,Object? replyNxdomain = null,Object? replyCname = null,Object? replyIp = null,Object? replyDomain = null,Object? replyRrname = null,Object? replyServfail = null,Object? replyRefused = null,Object? replyNotimp = null,Object? replyOther = null,Object? replyDnssec = null,Object? replyNone = null,Object? replyBlob = null,Object? dnsQueriesAllReplies = null,Object? queryTypes = null,}) {
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
as int,replyUnknown: null == replyUnknown ? _self.replyUnknown : replyUnknown // ignore: cast_nullable_to_non_nullable
as int,replyNodata: null == replyNodata ? _self.replyNodata : replyNodata // ignore: cast_nullable_to_non_nullable
as int,replyNxdomain: null == replyNxdomain ? _self.replyNxdomain : replyNxdomain // ignore: cast_nullable_to_non_nullable
as int,replyCname: null == replyCname ? _self.replyCname : replyCname // ignore: cast_nullable_to_non_nullable
as int,replyIp: null == replyIp ? _self.replyIp : replyIp // ignore: cast_nullable_to_non_nullable
as int,replyDomain: null == replyDomain ? _self.replyDomain : replyDomain // ignore: cast_nullable_to_non_nullable
as int,replyRrname: null == replyRrname ? _self.replyRrname : replyRrname // ignore: cast_nullable_to_non_nullable
as int,replyServfail: null == replyServfail ? _self.replyServfail : replyServfail // ignore: cast_nullable_to_non_nullable
as int,replyRefused: null == replyRefused ? _self.replyRefused : replyRefused // ignore: cast_nullable_to_non_nullable
as int,replyNotimp: null == replyNotimp ? _self.replyNotimp : replyNotimp // ignore: cast_nullable_to_non_nullable
as int,replyOther: null == replyOther ? _self.replyOther : replyOther // ignore: cast_nullable_to_non_nullable
as int,replyDnssec: null == replyDnssec ? _self.replyDnssec : replyDnssec // ignore: cast_nullable_to_non_nullable
as int,replyNone: null == replyNone ? _self.replyNone : replyNone // ignore: cast_nullable_to_non_nullable
as int,replyBlob: null == replyBlob ? _self.replyBlob : replyBlob // ignore: cast_nullable_to_non_nullable
as int,dnsQueriesAllReplies: null == dnsQueriesAllReplies ? _self.dnsQueriesAllReplies : dnsQueriesAllReplies // ignore: cast_nullable_to_non_nullable
as int,queryTypes: null == queryTypes ? _self._queryTypes : queryTypes // ignore: cast_nullable_to_non_nullable
as List<QueryTypeStat>,
  ));
}


}


/// @nodoc
mixin _$QueryTypeStat {

 DnsRecordType get type; double get percentage;
/// Create a copy of QueryTypeStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryTypeStatCopyWith<QueryTypeStat> get copyWith => _$QueryTypeStatCopyWithImpl<QueryTypeStat>(this as QueryTypeStat, _$identity);

  /// Serializes this QueryTypeStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryTypeStat&&(identical(other.type, type) || other.type == type)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,percentage);

@override
String toString() {
  return 'QueryTypeStat(type: $type, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $QueryTypeStatCopyWith<$Res>  {
  factory $QueryTypeStatCopyWith(QueryTypeStat value, $Res Function(QueryTypeStat) _then) = _$QueryTypeStatCopyWithImpl;
@useResult
$Res call({
 DnsRecordType type, double percentage
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DnsRecordType type,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryTypeStat() when $default != null:
return $default(_that.type,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DnsRecordType type,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _QueryTypeStat():
return $default(_that.type,_that.percentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DnsRecordType type,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _QueryTypeStat() when $default != null:
return $default(_that.type,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueryTypeStat implements QueryTypeStat {
  const _QueryTypeStat({required this.type, required this.percentage});
  factory _QueryTypeStat.fromJson(Map<String, dynamic> json) => _$QueryTypeStatFromJson(json);

@override final  DnsRecordType type;
@override final  double percentage;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryTypeStat&&(identical(other.type, type) || other.type == type)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,percentage);

@override
String toString() {
  return 'QueryTypeStat(type: $type, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$QueryTypeStatCopyWith<$Res> implements $QueryTypeStatCopyWith<$Res> {
  factory _$QueryTypeStatCopyWith(_QueryTypeStat value, $Res Function(_QueryTypeStat) _then) = __$QueryTypeStatCopyWithImpl;
@override @useResult
$Res call({
 DnsRecordType type, double percentage
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? percentage = null,}) {
  return _then(_QueryTypeStat(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DnsRecordType,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
