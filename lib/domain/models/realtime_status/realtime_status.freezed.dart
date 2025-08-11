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

 int get domainsBeingBlocked; int get dnsQueriesToday; int get adsBlockedToday; double get adsPercentageToday; int get uniqueDomains; int get queriesForwarded; int get queriesCached; int get clientsEverSeen; int get uniqueClients; int get dnsQueriesAllTypes; int get replyUnknown; int get replyNodata; int get replyNxDomain; int get replyCname; int get replyIp; int get replyDomain; int get replyRrname; int get replyServfail; int get replyRefused; int get replyNotimp; int get replyOther; int get replyDnssec; int get replyNone; int get replyBlob; int get dnsQueriesAllReplies; int get privacyLevel; String get status;// TODO: use DnsBlockingStatus enum
 List<QueryStat> get topQueries; List<QueryStat> get topAds; List<SourceStat> get topSources; List<SourceStat> get topSourcesBlocked; List<DestinationStat> get forwardDestinations; List<QueryTypeStat> get queryTypes;
/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeStatusCopyWith<RealtimeStatus> get copyWith => _$RealtimeStatusCopyWithImpl<RealtimeStatus>(this as RealtimeStatus, _$identity);

  /// Serializes this RealtimeStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeStatus&&(identical(other.domainsBeingBlocked, domainsBeingBlocked) || other.domainsBeingBlocked == domainsBeingBlocked)&&(identical(other.dnsQueriesToday, dnsQueriesToday) || other.dnsQueriesToday == dnsQueriesToday)&&(identical(other.adsBlockedToday, adsBlockedToday) || other.adsBlockedToday == adsBlockedToday)&&(identical(other.adsPercentageToday, adsPercentageToday) || other.adsPercentageToday == adsPercentageToday)&&(identical(other.uniqueDomains, uniqueDomains) || other.uniqueDomains == uniqueDomains)&&(identical(other.queriesForwarded, queriesForwarded) || other.queriesForwarded == queriesForwarded)&&(identical(other.queriesCached, queriesCached) || other.queriesCached == queriesCached)&&(identical(other.clientsEverSeen, clientsEverSeen) || other.clientsEverSeen == clientsEverSeen)&&(identical(other.uniqueClients, uniqueClients) || other.uniqueClients == uniqueClients)&&(identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) || other.dnsQueriesAllTypes == dnsQueriesAllTypes)&&(identical(other.replyUnknown, replyUnknown) || other.replyUnknown == replyUnknown)&&(identical(other.replyNodata, replyNodata) || other.replyNodata == replyNodata)&&(identical(other.replyNxDomain, replyNxDomain) || other.replyNxDomain == replyNxDomain)&&(identical(other.replyCname, replyCname) || other.replyCname == replyCname)&&(identical(other.replyIp, replyIp) || other.replyIp == replyIp)&&(identical(other.replyDomain, replyDomain) || other.replyDomain == replyDomain)&&(identical(other.replyRrname, replyRrname) || other.replyRrname == replyRrname)&&(identical(other.replyServfail, replyServfail) || other.replyServfail == replyServfail)&&(identical(other.replyRefused, replyRefused) || other.replyRefused == replyRefused)&&(identical(other.replyNotimp, replyNotimp) || other.replyNotimp == replyNotimp)&&(identical(other.replyOther, replyOther) || other.replyOther == replyOther)&&(identical(other.replyDnssec, replyDnssec) || other.replyDnssec == replyDnssec)&&(identical(other.replyNone, replyNone) || other.replyNone == replyNone)&&(identical(other.replyBlob, replyBlob) || other.replyBlob == replyBlob)&&(identical(other.dnsQueriesAllReplies, dnsQueriesAllReplies) || other.dnsQueriesAllReplies == dnsQueriesAllReplies)&&(identical(other.privacyLevel, privacyLevel) || other.privacyLevel == privacyLevel)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.topQueries, topQueries)&&const DeepCollectionEquality().equals(other.topAds, topAds)&&const DeepCollectionEquality().equals(other.topSources, topSources)&&const DeepCollectionEquality().equals(other.topSourcesBlocked, topSourcesBlocked)&&const DeepCollectionEquality().equals(other.forwardDestinations, forwardDestinations)&&const DeepCollectionEquality().equals(other.queryTypes, queryTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,domainsBeingBlocked,dnsQueriesToday,adsBlockedToday,adsPercentageToday,uniqueDomains,queriesForwarded,queriesCached,clientsEverSeen,uniqueClients,dnsQueriesAllTypes,replyUnknown,replyNodata,replyNxDomain,replyCname,replyIp,replyDomain,replyRrname,replyServfail,replyRefused,replyNotimp,replyOther,replyDnssec,replyNone,replyBlob,dnsQueriesAllReplies,privacyLevel,status,const DeepCollectionEquality().hash(topQueries),const DeepCollectionEquality().hash(topAds),const DeepCollectionEquality().hash(topSources),const DeepCollectionEquality().hash(topSourcesBlocked),const DeepCollectionEquality().hash(forwardDestinations),const DeepCollectionEquality().hash(queryTypes)]);

@override
String toString() {
  return 'RealtimeStatus(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxDomain: $replyNxDomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, privacyLevel: $privacyLevel, status: $status, topQueries: $topQueries, topAds: $topAds, topSources: $topSources, topSourcesBlocked: $topSourcesBlocked, forwardDestinations: $forwardDestinations, queryTypes: $queryTypes)';
}


}

/// @nodoc
abstract mixin class $RealtimeStatusCopyWith<$Res>  {
  factory $RealtimeStatusCopyWith(RealtimeStatus value, $Res Function(RealtimeStatus) _then) = _$RealtimeStatusCopyWithImpl;
@useResult
$Res call({
 int domainsBeingBlocked, int dnsQueriesToday, int adsBlockedToday, double adsPercentageToday, int uniqueDomains, int queriesForwarded, int queriesCached, int clientsEverSeen, int uniqueClients, int dnsQueriesAllTypes, int replyUnknown, int replyNodata, int replyNxDomain, int replyCname, int replyIp, int replyDomain, int replyRrname, int replyServfail, int replyRefused, int replyNotimp, int replyOther, int replyDnssec, int replyNone, int replyBlob, int dnsQueriesAllReplies, int privacyLevel, String status, List<QueryStat> topQueries, List<QueryStat> topAds, List<SourceStat> topSources, List<SourceStat> topSourcesBlocked, List<DestinationStat> forwardDestinations, List<QueryTypeStat> queryTypes
});




}
/// @nodoc
class _$RealtimeStatusCopyWithImpl<$Res>
    implements $RealtimeStatusCopyWith<$Res> {
  _$RealtimeStatusCopyWithImpl(this._self, this._then);

  final RealtimeStatus _self;
  final $Res Function(RealtimeStatus) _then;

/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainsBeingBlocked = null,Object? dnsQueriesToday = null,Object? adsBlockedToday = null,Object? adsPercentageToday = null,Object? uniqueDomains = null,Object? queriesForwarded = null,Object? queriesCached = null,Object? clientsEverSeen = null,Object? uniqueClients = null,Object? dnsQueriesAllTypes = null,Object? replyUnknown = null,Object? replyNodata = null,Object? replyNxDomain = null,Object? replyCname = null,Object? replyIp = null,Object? replyDomain = null,Object? replyRrname = null,Object? replyServfail = null,Object? replyRefused = null,Object? replyNotimp = null,Object? replyOther = null,Object? replyDnssec = null,Object? replyNone = null,Object? replyBlob = null,Object? dnsQueriesAllReplies = null,Object? privacyLevel = null,Object? status = null,Object? topQueries = null,Object? topAds = null,Object? topSources = null,Object? topSourcesBlocked = null,Object? forwardDestinations = null,Object? queryTypes = null,}) {
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
as int,replyNxDomain: null == replyNxDomain ? _self.replyNxDomain : replyNxDomain // ignore: cast_nullable_to_non_nullable
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
as int,privacyLevel: null == privacyLevel ? _self.privacyLevel : privacyLevel // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,topQueries: null == topQueries ? _self.topQueries : topQueries // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,topAds: null == topAds ? _self.topAds : topAds // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,topSources: null == topSources ? _self.topSources : topSources // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,topSourcesBlocked: null == topSourcesBlocked ? _self.topSourcesBlocked : topSourcesBlocked // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,forwardDestinations: null == forwardDestinations ? _self.forwardDestinations : forwardDestinations // ignore: cast_nullable_to_non_nullable
as List<DestinationStat>,queryTypes: null == queryTypes ? _self.queryTypes : queryTypes // ignore: cast_nullable_to_non_nullable
as List<QueryTypeStat>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  int replyUnknown,  int replyNodata,  int replyNxDomain,  int replyCname,  int replyIp,  int replyDomain,  int replyRrname,  int replyServfail,  int replyRefused,  int replyNotimp,  int replyOther,  int replyDnssec,  int replyNone,  int replyBlob,  int dnsQueriesAllReplies,  int privacyLevel,  String status,  List<QueryStat> topQueries,  List<QueryStat> topAds,  List<SourceStat> topSources,  List<SourceStat> topSourcesBlocked,  List<DestinationStat> forwardDestinations,  List<QueryTypeStat> queryTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeStatus() when $default != null:
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replyUnknown,_that.replyNodata,_that.replyNxDomain,_that.replyCname,_that.replyIp,_that.replyDomain,_that.replyRrname,_that.replyServfail,_that.replyRefused,_that.replyNotimp,_that.replyOther,_that.replyDnssec,_that.replyNone,_that.replyBlob,_that.dnsQueriesAllReplies,_that.privacyLevel,_that.status,_that.topQueries,_that.topAds,_that.topSources,_that.topSourcesBlocked,_that.forwardDestinations,_that.queryTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  int replyUnknown,  int replyNodata,  int replyNxDomain,  int replyCname,  int replyIp,  int replyDomain,  int replyRrname,  int replyServfail,  int replyRefused,  int replyNotimp,  int replyOther,  int replyDnssec,  int replyNone,  int replyBlob,  int dnsQueriesAllReplies,  int privacyLevel,  String status,  List<QueryStat> topQueries,  List<QueryStat> topAds,  List<SourceStat> topSources,  List<SourceStat> topSourcesBlocked,  List<DestinationStat> forwardDestinations,  List<QueryTypeStat> queryTypes)  $default,) {final _that = this;
switch (_that) {
case _RealtimeStatus():
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replyUnknown,_that.replyNodata,_that.replyNxDomain,_that.replyCname,_that.replyIp,_that.replyDomain,_that.replyRrname,_that.replyServfail,_that.replyRefused,_that.replyNotimp,_that.replyOther,_that.replyDnssec,_that.replyNone,_that.replyBlob,_that.dnsQueriesAllReplies,_that.privacyLevel,_that.status,_that.topQueries,_that.topAds,_that.topSources,_that.topSourcesBlocked,_that.forwardDestinations,_that.queryTypes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int domainsBeingBlocked,  int dnsQueriesToday,  int adsBlockedToday,  double adsPercentageToday,  int uniqueDomains,  int queriesForwarded,  int queriesCached,  int clientsEverSeen,  int uniqueClients,  int dnsQueriesAllTypes,  int replyUnknown,  int replyNodata,  int replyNxDomain,  int replyCname,  int replyIp,  int replyDomain,  int replyRrname,  int replyServfail,  int replyRefused,  int replyNotimp,  int replyOther,  int replyDnssec,  int replyNone,  int replyBlob,  int dnsQueriesAllReplies,  int privacyLevel,  String status,  List<QueryStat> topQueries,  List<QueryStat> topAds,  List<SourceStat> topSources,  List<SourceStat> topSourcesBlocked,  List<DestinationStat> forwardDestinations,  List<QueryTypeStat> queryTypes)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeStatus() when $default != null:
return $default(_that.domainsBeingBlocked,_that.dnsQueriesToday,_that.adsBlockedToday,_that.adsPercentageToday,_that.uniqueDomains,_that.queriesForwarded,_that.queriesCached,_that.clientsEverSeen,_that.uniqueClients,_that.dnsQueriesAllTypes,_that.replyUnknown,_that.replyNodata,_that.replyNxDomain,_that.replyCname,_that.replyIp,_that.replyDomain,_that.replyRrname,_that.replyServfail,_that.replyRefused,_that.replyNotimp,_that.replyOther,_that.replyDnssec,_that.replyNone,_that.replyBlob,_that.dnsQueriesAllReplies,_that.privacyLevel,_that.status,_that.topQueries,_that.topAds,_that.topSources,_that.topSourcesBlocked,_that.forwardDestinations,_that.queryTypes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RealtimeStatus implements RealtimeStatus {
   _RealtimeStatus({required this.domainsBeingBlocked, required this.dnsQueriesToday, required this.adsBlockedToday, required this.adsPercentageToday, required this.uniqueDomains, required this.queriesForwarded, required this.queriesCached, required this.clientsEverSeen, required this.uniqueClients, required this.dnsQueriesAllTypes, required this.replyUnknown, required this.replyNodata, required this.replyNxDomain, required this.replyCname, required this.replyIp, required this.replyDomain, required this.replyRrname, required this.replyServfail, required this.replyRefused, required this.replyNotimp, required this.replyOther, required this.replyDnssec, required this.replyNone, required this.replyBlob, required this.dnsQueriesAllReplies, required this.privacyLevel, required this.status, required final  List<QueryStat> topQueries, required final  List<QueryStat> topAds, required final  List<SourceStat> topSources, required final  List<SourceStat> topSourcesBlocked, required final  List<DestinationStat> forwardDestinations, required final  List<QueryTypeStat> queryTypes}): _topQueries = topQueries,_topAds = topAds,_topSources = topSources,_topSourcesBlocked = topSourcesBlocked,_forwardDestinations = forwardDestinations,_queryTypes = queryTypes;
  factory _RealtimeStatus.fromJson(Map<String, dynamic> json) => _$RealtimeStatusFromJson(json);

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
@override final  int replyNxDomain;
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
@override final  int privacyLevel;
@override final  String status;
// TODO: use DnsBlockingStatus enum
 final  List<QueryStat> _topQueries;
// TODO: use DnsBlockingStatus enum
@override List<QueryStat> get topQueries {
  if (_topQueries is EqualUnmodifiableListView) return _topQueries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topQueries);
}

 final  List<QueryStat> _topAds;
@override List<QueryStat> get topAds {
  if (_topAds is EqualUnmodifiableListView) return _topAds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topAds);
}

 final  List<SourceStat> _topSources;
@override List<SourceStat> get topSources {
  if (_topSources is EqualUnmodifiableListView) return _topSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSources);
}

 final  List<SourceStat> _topSourcesBlocked;
@override List<SourceStat> get topSourcesBlocked {
  if (_topSourcesBlocked is EqualUnmodifiableListView) return _topSourcesBlocked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSourcesBlocked);
}

 final  List<DestinationStat> _forwardDestinations;
@override List<DestinationStat> get forwardDestinations {
  if (_forwardDestinations is EqualUnmodifiableListView) return _forwardDestinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forwardDestinations);
}

 final  List<QueryTypeStat> _queryTypes;
@override List<QueryTypeStat> get queryTypes {
  if (_queryTypes is EqualUnmodifiableListView) return _queryTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queryTypes);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeStatus&&(identical(other.domainsBeingBlocked, domainsBeingBlocked) || other.domainsBeingBlocked == domainsBeingBlocked)&&(identical(other.dnsQueriesToday, dnsQueriesToday) || other.dnsQueriesToday == dnsQueriesToday)&&(identical(other.adsBlockedToday, adsBlockedToday) || other.adsBlockedToday == adsBlockedToday)&&(identical(other.adsPercentageToday, adsPercentageToday) || other.adsPercentageToday == adsPercentageToday)&&(identical(other.uniqueDomains, uniqueDomains) || other.uniqueDomains == uniqueDomains)&&(identical(other.queriesForwarded, queriesForwarded) || other.queriesForwarded == queriesForwarded)&&(identical(other.queriesCached, queriesCached) || other.queriesCached == queriesCached)&&(identical(other.clientsEverSeen, clientsEverSeen) || other.clientsEverSeen == clientsEverSeen)&&(identical(other.uniqueClients, uniqueClients) || other.uniqueClients == uniqueClients)&&(identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) || other.dnsQueriesAllTypes == dnsQueriesAllTypes)&&(identical(other.replyUnknown, replyUnknown) || other.replyUnknown == replyUnknown)&&(identical(other.replyNodata, replyNodata) || other.replyNodata == replyNodata)&&(identical(other.replyNxDomain, replyNxDomain) || other.replyNxDomain == replyNxDomain)&&(identical(other.replyCname, replyCname) || other.replyCname == replyCname)&&(identical(other.replyIp, replyIp) || other.replyIp == replyIp)&&(identical(other.replyDomain, replyDomain) || other.replyDomain == replyDomain)&&(identical(other.replyRrname, replyRrname) || other.replyRrname == replyRrname)&&(identical(other.replyServfail, replyServfail) || other.replyServfail == replyServfail)&&(identical(other.replyRefused, replyRefused) || other.replyRefused == replyRefused)&&(identical(other.replyNotimp, replyNotimp) || other.replyNotimp == replyNotimp)&&(identical(other.replyOther, replyOther) || other.replyOther == replyOther)&&(identical(other.replyDnssec, replyDnssec) || other.replyDnssec == replyDnssec)&&(identical(other.replyNone, replyNone) || other.replyNone == replyNone)&&(identical(other.replyBlob, replyBlob) || other.replyBlob == replyBlob)&&(identical(other.dnsQueriesAllReplies, dnsQueriesAllReplies) || other.dnsQueriesAllReplies == dnsQueriesAllReplies)&&(identical(other.privacyLevel, privacyLevel) || other.privacyLevel == privacyLevel)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._topQueries, _topQueries)&&const DeepCollectionEquality().equals(other._topAds, _topAds)&&const DeepCollectionEquality().equals(other._topSources, _topSources)&&const DeepCollectionEquality().equals(other._topSourcesBlocked, _topSourcesBlocked)&&const DeepCollectionEquality().equals(other._forwardDestinations, _forwardDestinations)&&const DeepCollectionEquality().equals(other._queryTypes, _queryTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,domainsBeingBlocked,dnsQueriesToday,adsBlockedToday,adsPercentageToday,uniqueDomains,queriesForwarded,queriesCached,clientsEverSeen,uniqueClients,dnsQueriesAllTypes,replyUnknown,replyNodata,replyNxDomain,replyCname,replyIp,replyDomain,replyRrname,replyServfail,replyRefused,replyNotimp,replyOther,replyDnssec,replyNone,replyBlob,dnsQueriesAllReplies,privacyLevel,status,const DeepCollectionEquality().hash(_topQueries),const DeepCollectionEquality().hash(_topAds),const DeepCollectionEquality().hash(_topSources),const DeepCollectionEquality().hash(_topSourcesBlocked),const DeepCollectionEquality().hash(_forwardDestinations),const DeepCollectionEquality().hash(_queryTypes)]);

@override
String toString() {
  return 'RealtimeStatus(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxDomain: $replyNxDomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, privacyLevel: $privacyLevel, status: $status, topQueries: $topQueries, topAds: $topAds, topSources: $topSources, topSourcesBlocked: $topSourcesBlocked, forwardDestinations: $forwardDestinations, queryTypes: $queryTypes)';
}


}

/// @nodoc
abstract mixin class _$RealtimeStatusCopyWith<$Res> implements $RealtimeStatusCopyWith<$Res> {
  factory _$RealtimeStatusCopyWith(_RealtimeStatus value, $Res Function(_RealtimeStatus) _then) = __$RealtimeStatusCopyWithImpl;
@override @useResult
$Res call({
 int domainsBeingBlocked, int dnsQueriesToday, int adsBlockedToday, double adsPercentageToday, int uniqueDomains, int queriesForwarded, int queriesCached, int clientsEverSeen, int uniqueClients, int dnsQueriesAllTypes, int replyUnknown, int replyNodata, int replyNxDomain, int replyCname, int replyIp, int replyDomain, int replyRrname, int replyServfail, int replyRefused, int replyNotimp, int replyOther, int replyDnssec, int replyNone, int replyBlob, int dnsQueriesAllReplies, int privacyLevel, String status, List<QueryStat> topQueries, List<QueryStat> topAds, List<SourceStat> topSources, List<SourceStat> topSourcesBlocked, List<DestinationStat> forwardDestinations, List<QueryTypeStat> queryTypes
});




}
/// @nodoc
class __$RealtimeStatusCopyWithImpl<$Res>
    implements _$RealtimeStatusCopyWith<$Res> {
  __$RealtimeStatusCopyWithImpl(this._self, this._then);

  final _RealtimeStatus _self;
  final $Res Function(_RealtimeStatus) _then;

/// Create a copy of RealtimeStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainsBeingBlocked = null,Object? dnsQueriesToday = null,Object? adsBlockedToday = null,Object? adsPercentageToday = null,Object? uniqueDomains = null,Object? queriesForwarded = null,Object? queriesCached = null,Object? clientsEverSeen = null,Object? uniqueClients = null,Object? dnsQueriesAllTypes = null,Object? replyUnknown = null,Object? replyNodata = null,Object? replyNxDomain = null,Object? replyCname = null,Object? replyIp = null,Object? replyDomain = null,Object? replyRrname = null,Object? replyServfail = null,Object? replyRefused = null,Object? replyNotimp = null,Object? replyOther = null,Object? replyDnssec = null,Object? replyNone = null,Object? replyBlob = null,Object? dnsQueriesAllReplies = null,Object? privacyLevel = null,Object? status = null,Object? topQueries = null,Object? topAds = null,Object? topSources = null,Object? topSourcesBlocked = null,Object? forwardDestinations = null,Object? queryTypes = null,}) {
  return _then(_RealtimeStatus(
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
as int,replyNxDomain: null == replyNxDomain ? _self.replyNxDomain : replyNxDomain // ignore: cast_nullable_to_non_nullable
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
as int,privacyLevel: null == privacyLevel ? _self.privacyLevel : privacyLevel // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,topQueries: null == topQueries ? _self._topQueries : topQueries // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,topAds: null == topAds ? _self._topAds : topAds // ignore: cast_nullable_to_non_nullable
as List<QueryStat>,topSources: null == topSources ? _self._topSources : topSources // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,topSourcesBlocked: null == topSourcesBlocked ? _self._topSourcesBlocked : topSourcesBlocked // ignore: cast_nullable_to_non_nullable
as List<SourceStat>,forwardDestinations: null == forwardDestinations ? _self._forwardDestinations : forwardDestinations // ignore: cast_nullable_to_non_nullable
as List<DestinationStat>,queryTypes: null == queryTypes ? _self._queryTypes : queryTypes // ignore: cast_nullable_to_non_nullable
as List<QueryTypeStat>,
  ));
}


}

// dart format on
