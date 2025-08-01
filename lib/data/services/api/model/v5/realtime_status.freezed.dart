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
mixin _$RealTimeStatus {
  @JsonKey(name: 'domains_being_blocked')
  int get domainsBeingBlocked;
  @JsonKey(name: 'dns_queries_today')
  int get dnsQueriesToday;
  @JsonKey(name: 'ads_blocked_today')
  int get adsBlockedToday;
  @JsonKey(name: 'ads_percentage_today')
  double get adsPercentageToday;
  @JsonKey(name: 'unique_domains')
  int get uniqueDomains;
  @JsonKey(name: 'queries_forwarded')
  int get queriesForwarded;
  @JsonKey(name: 'queries_cached')
  int get queriesCached;
  @JsonKey(name: 'clients_ever_seen')
  int get clientsEverSeen;
  @JsonKey(name: 'unique_clients')
  int get uniqueClients;
  @JsonKey(name: 'dns_queries_all_types')
  int get dnsQueriesAllTypes;
  @JsonKey(name: 'reply_UNKNOWN')
  int get replyUnknown;
  @JsonKey(name: 'reply_NODATA')
  int get replyNodata;
  @JsonKey(name: 'reply_NXDOMAIN')
  int get replyNxDomain;
  @JsonKey(name: 'reply_CNAME')
  int get replyCname;
  @JsonKey(name: 'reply_IP')
  int get replyIp;
  @JsonKey(name: 'reply_DOMAIN')
  int get replyDomain;
  @JsonKey(name: 'reply_RRNAME')
  int get replyRrname;
  @JsonKey(name: 'reply_SERVFAIL')
  int get replyServfail;
  @JsonKey(name: 'reply_REFUSED')
  int get replyRefused;
  @JsonKey(name: 'reply_NOTIMP')
  int get replyNotimp;
  @JsonKey(name: 'reply_OTHER')
  int get replyOther;
  @JsonKey(name: 'reply_DNSSEC')
  int get replyDnssec;
  @JsonKey(name: 'reply_NONE')
  int get replyNone;
  @JsonKey(name: 'reply_BLOB')
  int get replyBlob;
  @JsonKey(name: 'dns_queries_all_replies')
  int get dnsQueriesAllReplies;
  @JsonKey(name: 'privacy_level')
  int get privacyLevel;
  String get status;
  @JsonKey(name: 'gravity_last_updated')
  GravityLastUpdated get gravityLastUpdated;
  @JsonKey(name: 'top_queries')
  @MapOrEmptyListConverter()
  Map<String, int> get topQueries;
  @JsonKey(name: 'top_ads')
  @MapOrEmptyListConverter()
  Map<String, int> get topAds;
  @JsonKey(name: 'top_sources')
  @MapOrEmptyListConverter()
  Map<String, int> get topSources;
  @JsonKey(name: 'top_sources_blocked')
  @MapOrEmptyListConverter()
  Map<String, int> get topSourcesBlocked;
  @JsonKey(name: 'forward_destinations')
  @MapOrEmptyListConverter()
  Map<String, double> get forwardDestinations;
  @JsonKey(name: 'querytypes')
  QueryTypes get queryTypes;

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealTimeStatusCopyWith<RealTimeStatus> get copyWith =>
      _$RealTimeStatusCopyWithImpl<RealTimeStatus>(
          this as RealTimeStatus, _$identity);

  /// Serializes this RealTimeStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealTimeStatus &&
            (identical(other.domainsBeingBlocked, domainsBeingBlocked) ||
                other.domainsBeingBlocked == domainsBeingBlocked) &&
            (identical(other.dnsQueriesToday, dnsQueriesToday) ||
                other.dnsQueriesToday == dnsQueriesToday) &&
            (identical(other.adsBlockedToday, adsBlockedToday) ||
                other.adsBlockedToday == adsBlockedToday) &&
            (identical(other.adsPercentageToday, adsPercentageToday) ||
                other.adsPercentageToday == adsPercentageToday) &&
            (identical(other.uniqueDomains, uniqueDomains) ||
                other.uniqueDomains == uniqueDomains) &&
            (identical(other.queriesForwarded, queriesForwarded) ||
                other.queriesForwarded == queriesForwarded) &&
            (identical(other.queriesCached, queriesCached) ||
                other.queriesCached == queriesCached) &&
            (identical(other.clientsEverSeen, clientsEverSeen) ||
                other.clientsEverSeen == clientsEverSeen) &&
            (identical(other.uniqueClients, uniqueClients) ||
                other.uniqueClients == uniqueClients) &&
            (identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) ||
                other.dnsQueriesAllTypes == dnsQueriesAllTypes) &&
            (identical(other.replyUnknown, replyUnknown) ||
                other.replyUnknown == replyUnknown) &&
            (identical(other.replyNodata, replyNodata) ||
                other.replyNodata == replyNodata) &&
            (identical(other.replyNxDomain, replyNxDomain) ||
                other.replyNxDomain == replyNxDomain) &&
            (identical(other.replyCname, replyCname) ||
                other.replyCname == replyCname) &&
            (identical(other.replyIp, replyIp) || other.replyIp == replyIp) &&
            (identical(other.replyDomain, replyDomain) ||
                other.replyDomain == replyDomain) &&
            (identical(other.replyRrname, replyRrname) ||
                other.replyRrname == replyRrname) &&
            (identical(other.replyServfail, replyServfail) ||
                other.replyServfail == replyServfail) &&
            (identical(other.replyRefused, replyRefused) ||
                other.replyRefused == replyRefused) &&
            (identical(other.replyNotimp, replyNotimp) ||
                other.replyNotimp == replyNotimp) &&
            (identical(other.replyOther, replyOther) ||
                other.replyOther == replyOther) &&
            (identical(other.replyDnssec, replyDnssec) ||
                other.replyDnssec == replyDnssec) &&
            (identical(other.replyNone, replyNone) ||
                other.replyNone == replyNone) &&
            (identical(other.replyBlob, replyBlob) ||
                other.replyBlob == replyBlob) &&
            (identical(other.dnsQueriesAllReplies, dnsQueriesAllReplies) ||
                other.dnsQueriesAllReplies == dnsQueriesAllReplies) &&
            (identical(other.privacyLevel, privacyLevel) ||
                other.privacyLevel == privacyLevel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gravityLastUpdated, gravityLastUpdated) ||
                other.gravityLastUpdated == gravityLastUpdated) &&
            const DeepCollectionEquality()
                .equals(other.topQueries, topQueries) &&
            const DeepCollectionEquality().equals(other.topAds, topAds) &&
            const DeepCollectionEquality()
                .equals(other.topSources, topSources) &&
            const DeepCollectionEquality()
                .equals(other.topSourcesBlocked, topSourcesBlocked) &&
            const DeepCollectionEquality()
                .equals(other.forwardDestinations, forwardDestinations) &&
            (identical(other.queryTypes, queryTypes) ||
                other.queryTypes == queryTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        domainsBeingBlocked,
        dnsQueriesToday,
        adsBlockedToday,
        adsPercentageToday,
        uniqueDomains,
        queriesForwarded,
        queriesCached,
        clientsEverSeen,
        uniqueClients,
        dnsQueriesAllTypes,
        replyUnknown,
        replyNodata,
        replyNxDomain,
        replyCname,
        replyIp,
        replyDomain,
        replyRrname,
        replyServfail,
        replyRefused,
        replyNotimp,
        replyOther,
        replyDnssec,
        replyNone,
        replyBlob,
        dnsQueriesAllReplies,
        privacyLevel,
        status,
        gravityLastUpdated,
        const DeepCollectionEquality().hash(topQueries),
        const DeepCollectionEquality().hash(topAds),
        const DeepCollectionEquality().hash(topSources),
        const DeepCollectionEquality().hash(topSourcesBlocked),
        const DeepCollectionEquality().hash(forwardDestinations),
        queryTypes
      ]);

  @override
  String toString() {
    return 'RealTimeStatus(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxDomain: $replyNxDomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, privacyLevel: $privacyLevel, status: $status, gravityLastUpdated: $gravityLastUpdated, topQueries: $topQueries, topAds: $topAds, topSources: $topSources, topSourcesBlocked: $topSourcesBlocked, forwardDestinations: $forwardDestinations, queryTypes: $queryTypes)';
  }
}

/// @nodoc
abstract mixin class $RealTimeStatusCopyWith<$Res> {
  factory $RealTimeStatusCopyWith(
          RealTimeStatus value, $Res Function(RealTimeStatus) _then) =
      _$RealTimeStatusCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
      @JsonKey(name: 'dns_queries_today') int dnsQueriesToday,
      @JsonKey(name: 'ads_blocked_today') int adsBlockedToday,
      @JsonKey(name: 'ads_percentage_today') double adsPercentageToday,
      @JsonKey(name: 'unique_domains') int uniqueDomains,
      @JsonKey(name: 'queries_forwarded') int queriesForwarded,
      @JsonKey(name: 'queries_cached') int queriesCached,
      @JsonKey(name: 'clients_ever_seen') int clientsEverSeen,
      @JsonKey(name: 'unique_clients') int uniqueClients,
      @JsonKey(name: 'dns_queries_all_types') int dnsQueriesAllTypes,
      @JsonKey(name: 'reply_UNKNOWN') int replyUnknown,
      @JsonKey(name: 'reply_NODATA') int replyNodata,
      @JsonKey(name: 'reply_NXDOMAIN') int replyNxDomain,
      @JsonKey(name: 'reply_CNAME') int replyCname,
      @JsonKey(name: 'reply_IP') int replyIp,
      @JsonKey(name: 'reply_DOMAIN') int replyDomain,
      @JsonKey(name: 'reply_RRNAME') int replyRrname,
      @JsonKey(name: 'reply_SERVFAIL') int replyServfail,
      @JsonKey(name: 'reply_REFUSED') int replyRefused,
      @JsonKey(name: 'reply_NOTIMP') int replyNotimp,
      @JsonKey(name: 'reply_OTHER') int replyOther,
      @JsonKey(name: 'reply_DNSSEC') int replyDnssec,
      @JsonKey(name: 'reply_NONE') int replyNone,
      @JsonKey(name: 'reply_BLOB') int replyBlob,
      @JsonKey(name: 'dns_queries_all_replies') int dnsQueriesAllReplies,
      @JsonKey(name: 'privacy_level') int privacyLevel,
      String status,
      @JsonKey(name: 'gravity_last_updated')
      GravityLastUpdated gravityLastUpdated,
      @JsonKey(name: 'top_queries')
      @MapOrEmptyListConverter()
      Map<String, int> topQueries,
      @JsonKey(name: 'top_ads')
      @MapOrEmptyListConverter()
      Map<String, int> topAds,
      @JsonKey(name: 'top_sources')
      @MapOrEmptyListConverter()
      Map<String, int> topSources,
      @JsonKey(name: 'top_sources_blocked')
      @MapOrEmptyListConverter()
      Map<String, int> topSourcesBlocked,
      @JsonKey(name: 'forward_destinations')
      @MapOrEmptyListConverter()
      Map<String, double> forwardDestinations,
      @JsonKey(name: 'querytypes') QueryTypes queryTypes});

  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated;
  $QueryTypesCopyWith<$Res> get queryTypes;
}

/// @nodoc
class _$RealTimeStatusCopyWithImpl<$Res>
    implements $RealTimeStatusCopyWith<$Res> {
  _$RealTimeStatusCopyWithImpl(this._self, this._then);

  final RealTimeStatus _self;
  final $Res Function(RealTimeStatus) _then;

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainsBeingBlocked = null,
    Object? dnsQueriesToday = null,
    Object? adsBlockedToday = null,
    Object? adsPercentageToday = null,
    Object? uniqueDomains = null,
    Object? queriesForwarded = null,
    Object? queriesCached = null,
    Object? clientsEverSeen = null,
    Object? uniqueClients = null,
    Object? dnsQueriesAllTypes = null,
    Object? replyUnknown = null,
    Object? replyNodata = null,
    Object? replyNxDomain = null,
    Object? replyCname = null,
    Object? replyIp = null,
    Object? replyDomain = null,
    Object? replyRrname = null,
    Object? replyServfail = null,
    Object? replyRefused = null,
    Object? replyNotimp = null,
    Object? replyOther = null,
    Object? replyDnssec = null,
    Object? replyNone = null,
    Object? replyBlob = null,
    Object? dnsQueriesAllReplies = null,
    Object? privacyLevel = null,
    Object? status = null,
    Object? gravityLastUpdated = null,
    Object? topQueries = null,
    Object? topAds = null,
    Object? topSources = null,
    Object? topSourcesBlocked = null,
    Object? forwardDestinations = null,
    Object? queryTypes = null,
  }) {
    return _then(_self.copyWith(
      domainsBeingBlocked: null == domainsBeingBlocked
          ? _self.domainsBeingBlocked
          : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesToday: null == dnsQueriesToday
          ? _self.dnsQueriesToday
          : dnsQueriesToday // ignore: cast_nullable_to_non_nullable
              as int,
      adsBlockedToday: null == adsBlockedToday
          ? _self.adsBlockedToday
          : adsBlockedToday // ignore: cast_nullable_to_non_nullable
              as int,
      adsPercentageToday: null == adsPercentageToday
          ? _self.adsPercentageToday
          : adsPercentageToday // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueDomains: null == uniqueDomains
          ? _self.uniqueDomains
          : uniqueDomains // ignore: cast_nullable_to_non_nullable
              as int,
      queriesForwarded: null == queriesForwarded
          ? _self.queriesForwarded
          : queriesForwarded // ignore: cast_nullable_to_non_nullable
              as int,
      queriesCached: null == queriesCached
          ? _self.queriesCached
          : queriesCached // ignore: cast_nullable_to_non_nullable
              as int,
      clientsEverSeen: null == clientsEverSeen
          ? _self.clientsEverSeen
          : clientsEverSeen // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueClients: null == uniqueClients
          ? _self.uniqueClients
          : uniqueClients // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesAllTypes: null == dnsQueriesAllTypes
          ? _self.dnsQueriesAllTypes
          : dnsQueriesAllTypes // ignore: cast_nullable_to_non_nullable
              as int,
      replyUnknown: null == replyUnknown
          ? _self.replyUnknown
          : replyUnknown // ignore: cast_nullable_to_non_nullable
              as int,
      replyNodata: null == replyNodata
          ? _self.replyNodata
          : replyNodata // ignore: cast_nullable_to_non_nullable
              as int,
      replyNxDomain: null == replyNxDomain
          ? _self.replyNxDomain
          : replyNxDomain // ignore: cast_nullable_to_non_nullable
              as int,
      replyCname: null == replyCname
          ? _self.replyCname
          : replyCname // ignore: cast_nullable_to_non_nullable
              as int,
      replyIp: null == replyIp
          ? _self.replyIp
          : replyIp // ignore: cast_nullable_to_non_nullable
              as int,
      replyDomain: null == replyDomain
          ? _self.replyDomain
          : replyDomain // ignore: cast_nullable_to_non_nullable
              as int,
      replyRrname: null == replyRrname
          ? _self.replyRrname
          : replyRrname // ignore: cast_nullable_to_non_nullable
              as int,
      replyServfail: null == replyServfail
          ? _self.replyServfail
          : replyServfail // ignore: cast_nullable_to_non_nullable
              as int,
      replyRefused: null == replyRefused
          ? _self.replyRefused
          : replyRefused // ignore: cast_nullable_to_non_nullable
              as int,
      replyNotimp: null == replyNotimp
          ? _self.replyNotimp
          : replyNotimp // ignore: cast_nullable_to_non_nullable
              as int,
      replyOther: null == replyOther
          ? _self.replyOther
          : replyOther // ignore: cast_nullable_to_non_nullable
              as int,
      replyDnssec: null == replyDnssec
          ? _self.replyDnssec
          : replyDnssec // ignore: cast_nullable_to_non_nullable
              as int,
      replyNone: null == replyNone
          ? _self.replyNone
          : replyNone // ignore: cast_nullable_to_non_nullable
              as int,
      replyBlob: null == replyBlob
          ? _self.replyBlob
          : replyBlob // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesAllReplies: null == dnsQueriesAllReplies
          ? _self.dnsQueriesAllReplies
          : dnsQueriesAllReplies // ignore: cast_nullable_to_non_nullable
              as int,
      privacyLevel: null == privacyLevel
          ? _self.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      gravityLastUpdated: null == gravityLastUpdated
          ? _self.gravityLastUpdated
          : gravityLastUpdated // ignore: cast_nullable_to_non_nullable
              as GravityLastUpdated,
      topQueries: null == topQueries
          ? _self.topQueries
          : topQueries // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      topAds: null == topAds
          ? _self.topAds
          : topAds // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      topSources: null == topSources
          ? _self.topSources
          : topSources // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      topSourcesBlocked: null == topSourcesBlocked
          ? _self.topSourcesBlocked
          : topSourcesBlocked // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      forwardDestinations: null == forwardDestinations
          ? _self.forwardDestinations
          : forwardDestinations // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      queryTypes: null == queryTypes
          ? _self.queryTypes
          : queryTypes // ignore: cast_nullable_to_non_nullable
              as QueryTypes,
    ));
  }

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated {
    return $GravityLastUpdatedCopyWith<$Res>(_self.gravityLastUpdated, (value) {
      return _then(_self.copyWith(gravityLastUpdated: value));
    });
  }

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueryTypesCopyWith<$Res> get queryTypes {
    return $QueryTypesCopyWith<$Res>(_self.queryTypes, (value) {
      return _then(_self.copyWith(queryTypes: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RealTimeStatus].
extension RealTimeStatusPatterns on RealTimeStatus {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RealTimeStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RealTimeStatus() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RealTimeStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RealTimeStatus():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RealTimeStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RealTimeStatus() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
            @JsonKey(name: 'dns_queries_today') int dnsQueriesToday,
            @JsonKey(name: 'ads_blocked_today') int adsBlockedToday,
            @JsonKey(name: 'ads_percentage_today') double adsPercentageToday,
            @JsonKey(name: 'unique_domains') int uniqueDomains,
            @JsonKey(name: 'queries_forwarded') int queriesForwarded,
            @JsonKey(name: 'queries_cached') int queriesCached,
            @JsonKey(name: 'clients_ever_seen') int clientsEverSeen,
            @JsonKey(name: 'unique_clients') int uniqueClients,
            @JsonKey(name: 'dns_queries_all_types') int dnsQueriesAllTypes,
            @JsonKey(name: 'reply_UNKNOWN') int replyUnknown,
            @JsonKey(name: 'reply_NODATA') int replyNodata,
            @JsonKey(name: 'reply_NXDOMAIN') int replyNxDomain,
            @JsonKey(name: 'reply_CNAME') int replyCname,
            @JsonKey(name: 'reply_IP') int replyIp,
            @JsonKey(name: 'reply_DOMAIN') int replyDomain,
            @JsonKey(name: 'reply_RRNAME') int replyRrname,
            @JsonKey(name: 'reply_SERVFAIL') int replyServfail,
            @JsonKey(name: 'reply_REFUSED') int replyRefused,
            @JsonKey(name: 'reply_NOTIMP') int replyNotimp,
            @JsonKey(name: 'reply_OTHER') int replyOther,
            @JsonKey(name: 'reply_DNSSEC') int replyDnssec,
            @JsonKey(name: 'reply_NONE') int replyNone,
            @JsonKey(name: 'reply_BLOB') int replyBlob,
            @JsonKey(name: 'dns_queries_all_replies') int dnsQueriesAllReplies,
            @JsonKey(name: 'privacy_level') int privacyLevel,
            String status,
            @JsonKey(name: 'gravity_last_updated')
            GravityLastUpdated gravityLastUpdated,
            @JsonKey(name: 'top_queries')
            @MapOrEmptyListConverter()
            Map<String, int> topQueries,
            @JsonKey(name: 'top_ads')
            @MapOrEmptyListConverter()
            Map<String, int> topAds,
            @JsonKey(name: 'top_sources')
            @MapOrEmptyListConverter()
            Map<String, int> topSources,
            @JsonKey(name: 'top_sources_blocked')
            @MapOrEmptyListConverter()
            Map<String, int> topSourcesBlocked,
            @JsonKey(name: 'forward_destinations')
            @MapOrEmptyListConverter()
            Map<String, double> forwardDestinations,
            @JsonKey(name: 'querytypes') QueryTypes queryTypes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RealTimeStatus() when $default != null:
        return $default(
            _that.domainsBeingBlocked,
            _that.dnsQueriesToday,
            _that.adsBlockedToday,
            _that.adsPercentageToday,
            _that.uniqueDomains,
            _that.queriesForwarded,
            _that.queriesCached,
            _that.clientsEverSeen,
            _that.uniqueClients,
            _that.dnsQueriesAllTypes,
            _that.replyUnknown,
            _that.replyNodata,
            _that.replyNxDomain,
            _that.replyCname,
            _that.replyIp,
            _that.replyDomain,
            _that.replyRrname,
            _that.replyServfail,
            _that.replyRefused,
            _that.replyNotimp,
            _that.replyOther,
            _that.replyDnssec,
            _that.replyNone,
            _that.replyBlob,
            _that.dnsQueriesAllReplies,
            _that.privacyLevel,
            _that.status,
            _that.gravityLastUpdated,
            _that.topQueries,
            _that.topAds,
            _that.topSources,
            _that.topSourcesBlocked,
            _that.forwardDestinations,
            _that.queryTypes);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
            @JsonKey(name: 'dns_queries_today') int dnsQueriesToday,
            @JsonKey(name: 'ads_blocked_today') int adsBlockedToday,
            @JsonKey(name: 'ads_percentage_today') double adsPercentageToday,
            @JsonKey(name: 'unique_domains') int uniqueDomains,
            @JsonKey(name: 'queries_forwarded') int queriesForwarded,
            @JsonKey(name: 'queries_cached') int queriesCached,
            @JsonKey(name: 'clients_ever_seen') int clientsEverSeen,
            @JsonKey(name: 'unique_clients') int uniqueClients,
            @JsonKey(name: 'dns_queries_all_types') int dnsQueriesAllTypes,
            @JsonKey(name: 'reply_UNKNOWN') int replyUnknown,
            @JsonKey(name: 'reply_NODATA') int replyNodata,
            @JsonKey(name: 'reply_NXDOMAIN') int replyNxDomain,
            @JsonKey(name: 'reply_CNAME') int replyCname,
            @JsonKey(name: 'reply_IP') int replyIp,
            @JsonKey(name: 'reply_DOMAIN') int replyDomain,
            @JsonKey(name: 'reply_RRNAME') int replyRrname,
            @JsonKey(name: 'reply_SERVFAIL') int replyServfail,
            @JsonKey(name: 'reply_REFUSED') int replyRefused,
            @JsonKey(name: 'reply_NOTIMP') int replyNotimp,
            @JsonKey(name: 'reply_OTHER') int replyOther,
            @JsonKey(name: 'reply_DNSSEC') int replyDnssec,
            @JsonKey(name: 'reply_NONE') int replyNone,
            @JsonKey(name: 'reply_BLOB') int replyBlob,
            @JsonKey(name: 'dns_queries_all_replies') int dnsQueriesAllReplies,
            @JsonKey(name: 'privacy_level') int privacyLevel,
            String status,
            @JsonKey(name: 'gravity_last_updated')
            GravityLastUpdated gravityLastUpdated,
            @JsonKey(name: 'top_queries')
            @MapOrEmptyListConverter()
            Map<String, int> topQueries,
            @JsonKey(name: 'top_ads')
            @MapOrEmptyListConverter()
            Map<String, int> topAds,
            @JsonKey(name: 'top_sources')
            @MapOrEmptyListConverter()
            Map<String, int> topSources,
            @JsonKey(name: 'top_sources_blocked')
            @MapOrEmptyListConverter()
            Map<String, int> topSourcesBlocked,
            @JsonKey(name: 'forward_destinations')
            @MapOrEmptyListConverter()
            Map<String, double> forwardDestinations,
            @JsonKey(name: 'querytypes') QueryTypes queryTypes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RealTimeStatus():
        return $default(
            _that.domainsBeingBlocked,
            _that.dnsQueriesToday,
            _that.adsBlockedToday,
            _that.adsPercentageToday,
            _that.uniqueDomains,
            _that.queriesForwarded,
            _that.queriesCached,
            _that.clientsEverSeen,
            _that.uniqueClients,
            _that.dnsQueriesAllTypes,
            _that.replyUnknown,
            _that.replyNodata,
            _that.replyNxDomain,
            _that.replyCname,
            _that.replyIp,
            _that.replyDomain,
            _that.replyRrname,
            _that.replyServfail,
            _that.replyRefused,
            _that.replyNotimp,
            _that.replyOther,
            _that.replyDnssec,
            _that.replyNone,
            _that.replyBlob,
            _that.dnsQueriesAllReplies,
            _that.privacyLevel,
            _that.status,
            _that.gravityLastUpdated,
            _that.topQueries,
            _that.topAds,
            _that.topSources,
            _that.topSourcesBlocked,
            _that.forwardDestinations,
            _that.queryTypes);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
            @JsonKey(name: 'dns_queries_today') int dnsQueriesToday,
            @JsonKey(name: 'ads_blocked_today') int adsBlockedToday,
            @JsonKey(name: 'ads_percentage_today') double adsPercentageToday,
            @JsonKey(name: 'unique_domains') int uniqueDomains,
            @JsonKey(name: 'queries_forwarded') int queriesForwarded,
            @JsonKey(name: 'queries_cached') int queriesCached,
            @JsonKey(name: 'clients_ever_seen') int clientsEverSeen,
            @JsonKey(name: 'unique_clients') int uniqueClients,
            @JsonKey(name: 'dns_queries_all_types') int dnsQueriesAllTypes,
            @JsonKey(name: 'reply_UNKNOWN') int replyUnknown,
            @JsonKey(name: 'reply_NODATA') int replyNodata,
            @JsonKey(name: 'reply_NXDOMAIN') int replyNxDomain,
            @JsonKey(name: 'reply_CNAME') int replyCname,
            @JsonKey(name: 'reply_IP') int replyIp,
            @JsonKey(name: 'reply_DOMAIN') int replyDomain,
            @JsonKey(name: 'reply_RRNAME') int replyRrname,
            @JsonKey(name: 'reply_SERVFAIL') int replyServfail,
            @JsonKey(name: 'reply_REFUSED') int replyRefused,
            @JsonKey(name: 'reply_NOTIMP') int replyNotimp,
            @JsonKey(name: 'reply_OTHER') int replyOther,
            @JsonKey(name: 'reply_DNSSEC') int replyDnssec,
            @JsonKey(name: 'reply_NONE') int replyNone,
            @JsonKey(name: 'reply_BLOB') int replyBlob,
            @JsonKey(name: 'dns_queries_all_replies') int dnsQueriesAllReplies,
            @JsonKey(name: 'privacy_level') int privacyLevel,
            String status,
            @JsonKey(name: 'gravity_last_updated')
            GravityLastUpdated gravityLastUpdated,
            @JsonKey(name: 'top_queries')
            @MapOrEmptyListConverter()
            Map<String, int> topQueries,
            @JsonKey(name: 'top_ads')
            @MapOrEmptyListConverter()
            Map<String, int> topAds,
            @JsonKey(name: 'top_sources')
            @MapOrEmptyListConverter()
            Map<String, int> topSources,
            @JsonKey(name: 'top_sources_blocked')
            @MapOrEmptyListConverter()
            Map<String, int> topSourcesBlocked,
            @JsonKey(name: 'forward_destinations')
            @MapOrEmptyListConverter()
            Map<String, double> forwardDestinations,
            @JsonKey(name: 'querytypes') QueryTypes queryTypes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RealTimeStatus() when $default != null:
        return $default(
            _that.domainsBeingBlocked,
            _that.dnsQueriesToday,
            _that.adsBlockedToday,
            _that.adsPercentageToday,
            _that.uniqueDomains,
            _that.queriesForwarded,
            _that.queriesCached,
            _that.clientsEverSeen,
            _that.uniqueClients,
            _that.dnsQueriesAllTypes,
            _that.replyUnknown,
            _that.replyNodata,
            _that.replyNxDomain,
            _that.replyCname,
            _that.replyIp,
            _that.replyDomain,
            _that.replyRrname,
            _that.replyServfail,
            _that.replyRefused,
            _that.replyNotimp,
            _that.replyOther,
            _that.replyDnssec,
            _that.replyNone,
            _that.replyBlob,
            _that.dnsQueriesAllReplies,
            _that.privacyLevel,
            _that.status,
            _that.gravityLastUpdated,
            _that.topQueries,
            _that.topAds,
            _that.topSources,
            _that.topSourcesBlocked,
            _that.forwardDestinations,
            _that.queryTypes);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RealTimeStatus implements RealTimeStatus {
  const _RealTimeStatus(
      {@JsonKey(name: 'domains_being_blocked')
      required this.domainsBeingBlocked,
      @JsonKey(name: 'dns_queries_today') required this.dnsQueriesToday,
      @JsonKey(name: 'ads_blocked_today') required this.adsBlockedToday,
      @JsonKey(name: 'ads_percentage_today') required this.adsPercentageToday,
      @JsonKey(name: 'unique_domains') required this.uniqueDomains,
      @JsonKey(name: 'queries_forwarded') required this.queriesForwarded,
      @JsonKey(name: 'queries_cached') required this.queriesCached,
      @JsonKey(name: 'clients_ever_seen') required this.clientsEverSeen,
      @JsonKey(name: 'unique_clients') required this.uniqueClients,
      @JsonKey(name: 'dns_queries_all_types') required this.dnsQueriesAllTypes,
      @JsonKey(name: 'reply_UNKNOWN') required this.replyUnknown,
      @JsonKey(name: 'reply_NODATA') required this.replyNodata,
      @JsonKey(name: 'reply_NXDOMAIN') required this.replyNxDomain,
      @JsonKey(name: 'reply_CNAME') required this.replyCname,
      @JsonKey(name: 'reply_IP') required this.replyIp,
      @JsonKey(name: 'reply_DOMAIN') required this.replyDomain,
      @JsonKey(name: 'reply_RRNAME') required this.replyRrname,
      @JsonKey(name: 'reply_SERVFAIL') required this.replyServfail,
      @JsonKey(name: 'reply_REFUSED') required this.replyRefused,
      @JsonKey(name: 'reply_NOTIMP') required this.replyNotimp,
      @JsonKey(name: 'reply_OTHER') required this.replyOther,
      @JsonKey(name: 'reply_DNSSEC') required this.replyDnssec,
      @JsonKey(name: 'reply_NONE') required this.replyNone,
      @JsonKey(name: 'reply_BLOB') required this.replyBlob,
      @JsonKey(name: 'dns_queries_all_replies')
      required this.dnsQueriesAllReplies,
      @JsonKey(name: 'privacy_level') required this.privacyLevel,
      required this.status,
      @JsonKey(name: 'gravity_last_updated') required this.gravityLastUpdated,
      @JsonKey(name: 'top_queries')
      @MapOrEmptyListConverter()
      required final Map<String, int> topQueries,
      @JsonKey(name: 'top_ads')
      @MapOrEmptyListConverter()
      required final Map<String, int> topAds,
      @JsonKey(name: 'top_sources')
      @MapOrEmptyListConverter()
      required final Map<String, int> topSources,
      @JsonKey(name: 'top_sources_blocked')
      @MapOrEmptyListConverter()
      required final Map<String, int> topSourcesBlocked,
      @JsonKey(name: 'forward_destinations')
      @MapOrEmptyListConverter()
      required final Map<String, double> forwardDestinations,
      @JsonKey(name: 'querytypes') required this.queryTypes})
      : _topQueries = topQueries,
        _topAds = topAds,
        _topSources = topSources,
        _topSourcesBlocked = topSourcesBlocked,
        _forwardDestinations = forwardDestinations;
  factory _RealTimeStatus.fromJson(Map<String, dynamic> json) =>
      _$RealTimeStatusFromJson(json);

  @override
  @JsonKey(name: 'domains_being_blocked')
  final int domainsBeingBlocked;
  @override
  @JsonKey(name: 'dns_queries_today')
  final int dnsQueriesToday;
  @override
  @JsonKey(name: 'ads_blocked_today')
  final int adsBlockedToday;
  @override
  @JsonKey(name: 'ads_percentage_today')
  final double adsPercentageToday;
  @override
  @JsonKey(name: 'unique_domains')
  final int uniqueDomains;
  @override
  @JsonKey(name: 'queries_forwarded')
  final int queriesForwarded;
  @override
  @JsonKey(name: 'queries_cached')
  final int queriesCached;
  @override
  @JsonKey(name: 'clients_ever_seen')
  final int clientsEverSeen;
  @override
  @JsonKey(name: 'unique_clients')
  final int uniqueClients;
  @override
  @JsonKey(name: 'dns_queries_all_types')
  final int dnsQueriesAllTypes;
  @override
  @JsonKey(name: 'reply_UNKNOWN')
  final int replyUnknown;
  @override
  @JsonKey(name: 'reply_NODATA')
  final int replyNodata;
  @override
  @JsonKey(name: 'reply_NXDOMAIN')
  final int replyNxDomain;
  @override
  @JsonKey(name: 'reply_CNAME')
  final int replyCname;
  @override
  @JsonKey(name: 'reply_IP')
  final int replyIp;
  @override
  @JsonKey(name: 'reply_DOMAIN')
  final int replyDomain;
  @override
  @JsonKey(name: 'reply_RRNAME')
  final int replyRrname;
  @override
  @JsonKey(name: 'reply_SERVFAIL')
  final int replyServfail;
  @override
  @JsonKey(name: 'reply_REFUSED')
  final int replyRefused;
  @override
  @JsonKey(name: 'reply_NOTIMP')
  final int replyNotimp;
  @override
  @JsonKey(name: 'reply_OTHER')
  final int replyOther;
  @override
  @JsonKey(name: 'reply_DNSSEC')
  final int replyDnssec;
  @override
  @JsonKey(name: 'reply_NONE')
  final int replyNone;
  @override
  @JsonKey(name: 'reply_BLOB')
  final int replyBlob;
  @override
  @JsonKey(name: 'dns_queries_all_replies')
  final int dnsQueriesAllReplies;
  @override
  @JsonKey(name: 'privacy_level')
  final int privacyLevel;
  @override
  final String status;
  @override
  @JsonKey(name: 'gravity_last_updated')
  final GravityLastUpdated gravityLastUpdated;
  final Map<String, int> _topQueries;
  @override
  @JsonKey(name: 'top_queries')
  @MapOrEmptyListConverter()
  Map<String, int> get topQueries {
    if (_topQueries is EqualUnmodifiableMapView) return _topQueries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topQueries);
  }

  final Map<String, int> _topAds;
  @override
  @JsonKey(name: 'top_ads')
  @MapOrEmptyListConverter()
  Map<String, int> get topAds {
    if (_topAds is EqualUnmodifiableMapView) return _topAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topAds);
  }

  final Map<String, int> _topSources;
  @override
  @JsonKey(name: 'top_sources')
  @MapOrEmptyListConverter()
  Map<String, int> get topSources {
    if (_topSources is EqualUnmodifiableMapView) return _topSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topSources);
  }

  final Map<String, int> _topSourcesBlocked;
  @override
  @JsonKey(name: 'top_sources_blocked')
  @MapOrEmptyListConverter()
  Map<String, int> get topSourcesBlocked {
    if (_topSourcesBlocked is EqualUnmodifiableMapView)
      return _topSourcesBlocked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topSourcesBlocked);
  }

  final Map<String, double> _forwardDestinations;
  @override
  @JsonKey(name: 'forward_destinations')
  @MapOrEmptyListConverter()
  Map<String, double> get forwardDestinations {
    if (_forwardDestinations is EqualUnmodifiableMapView)
      return _forwardDestinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_forwardDestinations);
  }

  @override
  @JsonKey(name: 'querytypes')
  final QueryTypes queryTypes;

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RealTimeStatusCopyWith<_RealTimeStatus> get copyWith =>
      __$RealTimeStatusCopyWithImpl<_RealTimeStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealTimeStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RealTimeStatus &&
            (identical(other.domainsBeingBlocked, domainsBeingBlocked) ||
                other.domainsBeingBlocked == domainsBeingBlocked) &&
            (identical(other.dnsQueriesToday, dnsQueriesToday) ||
                other.dnsQueriesToday == dnsQueriesToday) &&
            (identical(other.adsBlockedToday, adsBlockedToday) ||
                other.adsBlockedToday == adsBlockedToday) &&
            (identical(other.adsPercentageToday, adsPercentageToday) ||
                other.adsPercentageToday == adsPercentageToday) &&
            (identical(other.uniqueDomains, uniqueDomains) ||
                other.uniqueDomains == uniqueDomains) &&
            (identical(other.queriesForwarded, queriesForwarded) ||
                other.queriesForwarded == queriesForwarded) &&
            (identical(other.queriesCached, queriesCached) ||
                other.queriesCached == queriesCached) &&
            (identical(other.clientsEverSeen, clientsEverSeen) ||
                other.clientsEverSeen == clientsEverSeen) &&
            (identical(other.uniqueClients, uniqueClients) ||
                other.uniqueClients == uniqueClients) &&
            (identical(other.dnsQueriesAllTypes, dnsQueriesAllTypes) ||
                other.dnsQueriesAllTypes == dnsQueriesAllTypes) &&
            (identical(other.replyUnknown, replyUnknown) ||
                other.replyUnknown == replyUnknown) &&
            (identical(other.replyNodata, replyNodata) ||
                other.replyNodata == replyNodata) &&
            (identical(other.replyNxDomain, replyNxDomain) ||
                other.replyNxDomain == replyNxDomain) &&
            (identical(other.replyCname, replyCname) ||
                other.replyCname == replyCname) &&
            (identical(other.replyIp, replyIp) || other.replyIp == replyIp) &&
            (identical(other.replyDomain, replyDomain) ||
                other.replyDomain == replyDomain) &&
            (identical(other.replyRrname, replyRrname) ||
                other.replyRrname == replyRrname) &&
            (identical(other.replyServfail, replyServfail) ||
                other.replyServfail == replyServfail) &&
            (identical(other.replyRefused, replyRefused) ||
                other.replyRefused == replyRefused) &&
            (identical(other.replyNotimp, replyNotimp) ||
                other.replyNotimp == replyNotimp) &&
            (identical(other.replyOther, replyOther) ||
                other.replyOther == replyOther) &&
            (identical(other.replyDnssec, replyDnssec) ||
                other.replyDnssec == replyDnssec) &&
            (identical(other.replyNone, replyNone) ||
                other.replyNone == replyNone) &&
            (identical(other.replyBlob, replyBlob) ||
                other.replyBlob == replyBlob) &&
            (identical(other.dnsQueriesAllReplies, dnsQueriesAllReplies) ||
                other.dnsQueriesAllReplies == dnsQueriesAllReplies) &&
            (identical(other.privacyLevel, privacyLevel) ||
                other.privacyLevel == privacyLevel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gravityLastUpdated, gravityLastUpdated) ||
                other.gravityLastUpdated == gravityLastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._topQueries, _topQueries) &&
            const DeepCollectionEquality().equals(other._topAds, _topAds) &&
            const DeepCollectionEquality()
                .equals(other._topSources, _topSources) &&
            const DeepCollectionEquality()
                .equals(other._topSourcesBlocked, _topSourcesBlocked) &&
            const DeepCollectionEquality()
                .equals(other._forwardDestinations, _forwardDestinations) &&
            (identical(other.queryTypes, queryTypes) ||
                other.queryTypes == queryTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        domainsBeingBlocked,
        dnsQueriesToday,
        adsBlockedToday,
        adsPercentageToday,
        uniqueDomains,
        queriesForwarded,
        queriesCached,
        clientsEverSeen,
        uniqueClients,
        dnsQueriesAllTypes,
        replyUnknown,
        replyNodata,
        replyNxDomain,
        replyCname,
        replyIp,
        replyDomain,
        replyRrname,
        replyServfail,
        replyRefused,
        replyNotimp,
        replyOther,
        replyDnssec,
        replyNone,
        replyBlob,
        dnsQueriesAllReplies,
        privacyLevel,
        status,
        gravityLastUpdated,
        const DeepCollectionEquality().hash(_topQueries),
        const DeepCollectionEquality().hash(_topAds),
        const DeepCollectionEquality().hash(_topSources),
        const DeepCollectionEquality().hash(_topSourcesBlocked),
        const DeepCollectionEquality().hash(_forwardDestinations),
        queryTypes
      ]);

  @override
  String toString() {
    return 'RealTimeStatus(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxDomain: $replyNxDomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, privacyLevel: $privacyLevel, status: $status, gravityLastUpdated: $gravityLastUpdated, topQueries: $topQueries, topAds: $topAds, topSources: $topSources, topSourcesBlocked: $topSourcesBlocked, forwardDestinations: $forwardDestinations, queryTypes: $queryTypes)';
  }
}

/// @nodoc
abstract mixin class _$RealTimeStatusCopyWith<$Res>
    implements $RealTimeStatusCopyWith<$Res> {
  factory _$RealTimeStatusCopyWith(
          _RealTimeStatus value, $Res Function(_RealTimeStatus) _then) =
      __$RealTimeStatusCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
      @JsonKey(name: 'dns_queries_today') int dnsQueriesToday,
      @JsonKey(name: 'ads_blocked_today') int adsBlockedToday,
      @JsonKey(name: 'ads_percentage_today') double adsPercentageToday,
      @JsonKey(name: 'unique_domains') int uniqueDomains,
      @JsonKey(name: 'queries_forwarded') int queriesForwarded,
      @JsonKey(name: 'queries_cached') int queriesCached,
      @JsonKey(name: 'clients_ever_seen') int clientsEverSeen,
      @JsonKey(name: 'unique_clients') int uniqueClients,
      @JsonKey(name: 'dns_queries_all_types') int dnsQueriesAllTypes,
      @JsonKey(name: 'reply_UNKNOWN') int replyUnknown,
      @JsonKey(name: 'reply_NODATA') int replyNodata,
      @JsonKey(name: 'reply_NXDOMAIN') int replyNxDomain,
      @JsonKey(name: 'reply_CNAME') int replyCname,
      @JsonKey(name: 'reply_IP') int replyIp,
      @JsonKey(name: 'reply_DOMAIN') int replyDomain,
      @JsonKey(name: 'reply_RRNAME') int replyRrname,
      @JsonKey(name: 'reply_SERVFAIL') int replyServfail,
      @JsonKey(name: 'reply_REFUSED') int replyRefused,
      @JsonKey(name: 'reply_NOTIMP') int replyNotimp,
      @JsonKey(name: 'reply_OTHER') int replyOther,
      @JsonKey(name: 'reply_DNSSEC') int replyDnssec,
      @JsonKey(name: 'reply_NONE') int replyNone,
      @JsonKey(name: 'reply_BLOB') int replyBlob,
      @JsonKey(name: 'dns_queries_all_replies') int dnsQueriesAllReplies,
      @JsonKey(name: 'privacy_level') int privacyLevel,
      String status,
      @JsonKey(name: 'gravity_last_updated')
      GravityLastUpdated gravityLastUpdated,
      @JsonKey(name: 'top_queries')
      @MapOrEmptyListConverter()
      Map<String, int> topQueries,
      @JsonKey(name: 'top_ads')
      @MapOrEmptyListConverter()
      Map<String, int> topAds,
      @JsonKey(name: 'top_sources')
      @MapOrEmptyListConverter()
      Map<String, int> topSources,
      @JsonKey(name: 'top_sources_blocked')
      @MapOrEmptyListConverter()
      Map<String, int> topSourcesBlocked,
      @JsonKey(name: 'forward_destinations')
      @MapOrEmptyListConverter()
      Map<String, double> forwardDestinations,
      @JsonKey(name: 'querytypes') QueryTypes queryTypes});

  @override
  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated;
  @override
  $QueryTypesCopyWith<$Res> get queryTypes;
}

/// @nodoc
class __$RealTimeStatusCopyWithImpl<$Res>
    implements _$RealTimeStatusCopyWith<$Res> {
  __$RealTimeStatusCopyWithImpl(this._self, this._then);

  final _RealTimeStatus _self;
  final $Res Function(_RealTimeStatus) _then;

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domainsBeingBlocked = null,
    Object? dnsQueriesToday = null,
    Object? adsBlockedToday = null,
    Object? adsPercentageToday = null,
    Object? uniqueDomains = null,
    Object? queriesForwarded = null,
    Object? queriesCached = null,
    Object? clientsEverSeen = null,
    Object? uniqueClients = null,
    Object? dnsQueriesAllTypes = null,
    Object? replyUnknown = null,
    Object? replyNodata = null,
    Object? replyNxDomain = null,
    Object? replyCname = null,
    Object? replyIp = null,
    Object? replyDomain = null,
    Object? replyRrname = null,
    Object? replyServfail = null,
    Object? replyRefused = null,
    Object? replyNotimp = null,
    Object? replyOther = null,
    Object? replyDnssec = null,
    Object? replyNone = null,
    Object? replyBlob = null,
    Object? dnsQueriesAllReplies = null,
    Object? privacyLevel = null,
    Object? status = null,
    Object? gravityLastUpdated = null,
    Object? topQueries = null,
    Object? topAds = null,
    Object? topSources = null,
    Object? topSourcesBlocked = null,
    Object? forwardDestinations = null,
    Object? queryTypes = null,
  }) {
    return _then(_RealTimeStatus(
      domainsBeingBlocked: null == domainsBeingBlocked
          ? _self.domainsBeingBlocked
          : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesToday: null == dnsQueriesToday
          ? _self.dnsQueriesToday
          : dnsQueriesToday // ignore: cast_nullable_to_non_nullable
              as int,
      adsBlockedToday: null == adsBlockedToday
          ? _self.adsBlockedToday
          : adsBlockedToday // ignore: cast_nullable_to_non_nullable
              as int,
      adsPercentageToday: null == adsPercentageToday
          ? _self.adsPercentageToday
          : adsPercentageToday // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueDomains: null == uniqueDomains
          ? _self.uniqueDomains
          : uniqueDomains // ignore: cast_nullable_to_non_nullable
              as int,
      queriesForwarded: null == queriesForwarded
          ? _self.queriesForwarded
          : queriesForwarded // ignore: cast_nullable_to_non_nullable
              as int,
      queriesCached: null == queriesCached
          ? _self.queriesCached
          : queriesCached // ignore: cast_nullable_to_non_nullable
              as int,
      clientsEverSeen: null == clientsEverSeen
          ? _self.clientsEverSeen
          : clientsEverSeen // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueClients: null == uniqueClients
          ? _self.uniqueClients
          : uniqueClients // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesAllTypes: null == dnsQueriesAllTypes
          ? _self.dnsQueriesAllTypes
          : dnsQueriesAllTypes // ignore: cast_nullable_to_non_nullable
              as int,
      replyUnknown: null == replyUnknown
          ? _self.replyUnknown
          : replyUnknown // ignore: cast_nullable_to_non_nullable
              as int,
      replyNodata: null == replyNodata
          ? _self.replyNodata
          : replyNodata // ignore: cast_nullable_to_non_nullable
              as int,
      replyNxDomain: null == replyNxDomain
          ? _self.replyNxDomain
          : replyNxDomain // ignore: cast_nullable_to_non_nullable
              as int,
      replyCname: null == replyCname
          ? _self.replyCname
          : replyCname // ignore: cast_nullable_to_non_nullable
              as int,
      replyIp: null == replyIp
          ? _self.replyIp
          : replyIp // ignore: cast_nullable_to_non_nullable
              as int,
      replyDomain: null == replyDomain
          ? _self.replyDomain
          : replyDomain // ignore: cast_nullable_to_non_nullable
              as int,
      replyRrname: null == replyRrname
          ? _self.replyRrname
          : replyRrname // ignore: cast_nullable_to_non_nullable
              as int,
      replyServfail: null == replyServfail
          ? _self.replyServfail
          : replyServfail // ignore: cast_nullable_to_non_nullable
              as int,
      replyRefused: null == replyRefused
          ? _self.replyRefused
          : replyRefused // ignore: cast_nullable_to_non_nullable
              as int,
      replyNotimp: null == replyNotimp
          ? _self.replyNotimp
          : replyNotimp // ignore: cast_nullable_to_non_nullable
              as int,
      replyOther: null == replyOther
          ? _self.replyOther
          : replyOther // ignore: cast_nullable_to_non_nullable
              as int,
      replyDnssec: null == replyDnssec
          ? _self.replyDnssec
          : replyDnssec // ignore: cast_nullable_to_non_nullable
              as int,
      replyNone: null == replyNone
          ? _self.replyNone
          : replyNone // ignore: cast_nullable_to_non_nullable
              as int,
      replyBlob: null == replyBlob
          ? _self.replyBlob
          : replyBlob // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesAllReplies: null == dnsQueriesAllReplies
          ? _self.dnsQueriesAllReplies
          : dnsQueriesAllReplies // ignore: cast_nullable_to_non_nullable
              as int,
      privacyLevel: null == privacyLevel
          ? _self.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      gravityLastUpdated: null == gravityLastUpdated
          ? _self.gravityLastUpdated
          : gravityLastUpdated // ignore: cast_nullable_to_non_nullable
              as GravityLastUpdated,
      topQueries: null == topQueries
          ? _self._topQueries
          : topQueries // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      topAds: null == topAds
          ? _self._topAds
          : topAds // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      topSources: null == topSources
          ? _self._topSources
          : topSources // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      topSourcesBlocked: null == topSourcesBlocked
          ? _self._topSourcesBlocked
          : topSourcesBlocked // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      forwardDestinations: null == forwardDestinations
          ? _self._forwardDestinations
          : forwardDestinations // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      queryTypes: null == queryTypes
          ? _self.queryTypes
          : queryTypes // ignore: cast_nullable_to_non_nullable
              as QueryTypes,
    ));
  }

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated {
    return $GravityLastUpdatedCopyWith<$Res>(_self.gravityLastUpdated, (value) {
      return _then(_self.copyWith(gravityLastUpdated: value));
    });
  }

  /// Create a copy of RealTimeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueryTypesCopyWith<$Res> get queryTypes {
    return $QueryTypesCopyWith<$Res>(_self.queryTypes, (value) {
      return _then(_self.copyWith(queryTypes: value));
    });
  }
}

/// @nodoc
mixin _$GravityLastUpdated {
  @JsonKey(name: 'file_exists')
  bool get fileExists;
  int get absolute;
  GravityRelativeTime get relative;

  /// Create a copy of GravityLastUpdated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GravityLastUpdatedCopyWith<GravityLastUpdated> get copyWith =>
      _$GravityLastUpdatedCopyWithImpl<GravityLastUpdated>(
          this as GravityLastUpdated, _$identity);

  /// Serializes this GravityLastUpdated to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GravityLastUpdated &&
            (identical(other.fileExists, fileExists) ||
                other.fileExists == fileExists) &&
            (identical(other.absolute, absolute) ||
                other.absolute == absolute) &&
            (identical(other.relative, relative) ||
                other.relative == relative));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileExists, absolute, relative);

  @override
  String toString() {
    return 'GravityLastUpdated(fileExists: $fileExists, absolute: $absolute, relative: $relative)';
  }
}

/// @nodoc
abstract mixin class $GravityLastUpdatedCopyWith<$Res> {
  factory $GravityLastUpdatedCopyWith(
          GravityLastUpdated value, $Res Function(GravityLastUpdated) _then) =
      _$GravityLastUpdatedCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'file_exists') bool fileExists,
      int absolute,
      GravityRelativeTime relative});

  $GravityRelativeTimeCopyWith<$Res> get relative;
}

/// @nodoc
class _$GravityLastUpdatedCopyWithImpl<$Res>
    implements $GravityLastUpdatedCopyWith<$Res> {
  _$GravityLastUpdatedCopyWithImpl(this._self, this._then);

  final GravityLastUpdated _self;
  final $Res Function(GravityLastUpdated) _then;

  /// Create a copy of GravityLastUpdated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileExists = null,
    Object? absolute = null,
    Object? relative = null,
  }) {
    return _then(_self.copyWith(
      fileExists: null == fileExists
          ? _self.fileExists
          : fileExists // ignore: cast_nullable_to_non_nullable
              as bool,
      absolute: null == absolute
          ? _self.absolute
          : absolute // ignore: cast_nullable_to_non_nullable
              as int,
      relative: null == relative
          ? _self.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as GravityRelativeTime,
    ));
  }

  /// Create a copy of GravityLastUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityRelativeTimeCopyWith<$Res> get relative {
    return $GravityRelativeTimeCopyWith<$Res>(_self.relative, (value) {
      return _then(_self.copyWith(relative: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GravityLastUpdated].
extension GravityLastUpdatedPatterns on GravityLastUpdated {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GravityLastUpdated value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GravityLastUpdated() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GravityLastUpdated value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityLastUpdated():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GravityLastUpdated value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityLastUpdated() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'file_exists') bool fileExists,
            int absolute, GravityRelativeTime relative)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GravityLastUpdated() when $default != null:
        return $default(_that.fileExists, _that.absolute, _that.relative);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'file_exists') bool fileExists,
            int absolute, GravityRelativeTime relative)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityLastUpdated():
        return $default(_that.fileExists, _that.absolute, _that.relative);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'file_exists') bool fileExists,
            int absolute, GravityRelativeTime relative)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityLastUpdated() when $default != null:
        return $default(_that.fileExists, _that.absolute, _that.relative);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _GravityLastUpdated implements GravityLastUpdated {
  const _GravityLastUpdated(
      {@JsonKey(name: 'file_exists') required this.fileExists,
      required this.absolute,
      required this.relative});
  factory _GravityLastUpdated.fromJson(Map<String, dynamic> json) =>
      _$GravityLastUpdatedFromJson(json);

  @override
  @JsonKey(name: 'file_exists')
  final bool fileExists;
  @override
  final int absolute;
  @override
  final GravityRelativeTime relative;

  /// Create a copy of GravityLastUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GravityLastUpdatedCopyWith<_GravityLastUpdated> get copyWith =>
      __$GravityLastUpdatedCopyWithImpl<_GravityLastUpdated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GravityLastUpdatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GravityLastUpdated &&
            (identical(other.fileExists, fileExists) ||
                other.fileExists == fileExists) &&
            (identical(other.absolute, absolute) ||
                other.absolute == absolute) &&
            (identical(other.relative, relative) ||
                other.relative == relative));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileExists, absolute, relative);

  @override
  String toString() {
    return 'GravityLastUpdated(fileExists: $fileExists, absolute: $absolute, relative: $relative)';
  }
}

/// @nodoc
abstract mixin class _$GravityLastUpdatedCopyWith<$Res>
    implements $GravityLastUpdatedCopyWith<$Res> {
  factory _$GravityLastUpdatedCopyWith(
          _GravityLastUpdated value, $Res Function(_GravityLastUpdated) _then) =
      __$GravityLastUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'file_exists') bool fileExists,
      int absolute,
      GravityRelativeTime relative});

  @override
  $GravityRelativeTimeCopyWith<$Res> get relative;
}

/// @nodoc
class __$GravityLastUpdatedCopyWithImpl<$Res>
    implements _$GravityLastUpdatedCopyWith<$Res> {
  __$GravityLastUpdatedCopyWithImpl(this._self, this._then);

  final _GravityLastUpdated _self;
  final $Res Function(_GravityLastUpdated) _then;

  /// Create a copy of GravityLastUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fileExists = null,
    Object? absolute = null,
    Object? relative = null,
  }) {
    return _then(_GravityLastUpdated(
      fileExists: null == fileExists
          ? _self.fileExists
          : fileExists // ignore: cast_nullable_to_non_nullable
              as bool,
      absolute: null == absolute
          ? _self.absolute
          : absolute // ignore: cast_nullable_to_non_nullable
              as int,
      relative: null == relative
          ? _self.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as GravityRelativeTime,
    ));
  }

  /// Create a copy of GravityLastUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityRelativeTimeCopyWith<$Res> get relative {
    return $GravityRelativeTimeCopyWith<$Res>(_self.relative, (value) {
      return _then(_self.copyWith(relative: value));
    });
  }
}

/// @nodoc
mixin _$GravityRelativeTime {
  int get days;
  int get hours;
  int get minutes;

  /// Create a copy of GravityRelativeTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GravityRelativeTimeCopyWith<GravityRelativeTime> get copyWith =>
      _$GravityRelativeTimeCopyWithImpl<GravityRelativeTime>(
          this as GravityRelativeTime, _$identity);

  /// Serializes this GravityRelativeTime to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GravityRelativeTime &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, days, hours, minutes);

  @override
  String toString() {
    return 'GravityRelativeTime(days: $days, hours: $hours, minutes: $minutes)';
  }
}

/// @nodoc
abstract mixin class $GravityRelativeTimeCopyWith<$Res> {
  factory $GravityRelativeTimeCopyWith(
          GravityRelativeTime value, $Res Function(GravityRelativeTime) _then) =
      _$GravityRelativeTimeCopyWithImpl;
  @useResult
  $Res call({int days, int hours, int minutes});
}

/// @nodoc
class _$GravityRelativeTimeCopyWithImpl<$Res>
    implements $GravityRelativeTimeCopyWith<$Res> {
  _$GravityRelativeTimeCopyWithImpl(this._self, this._then);

  final GravityRelativeTime _self;
  final $Res Function(GravityRelativeTime) _then;

  /// Create a copy of GravityRelativeTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? hours = null,
    Object? minutes = null,
  }) {
    return _then(_self.copyWith(
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      hours: null == hours
          ? _self.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _self.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [GravityRelativeTime].
extension GravityRelativeTimePatterns on GravityRelativeTime {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GravityRelativeTime value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GravityRelativeTime() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GravityRelativeTime value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityRelativeTime():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GravityRelativeTime value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityRelativeTime() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int days, int hours, int minutes)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GravityRelativeTime() when $default != null:
        return $default(_that.days, _that.hours, _that.minutes);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int days, int hours, int minutes) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityRelativeTime():
        return $default(_that.days, _that.hours, _that.minutes);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int days, int hours, int minutes)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravityRelativeTime() when $default != null:
        return $default(_that.days, _that.hours, _that.minutes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GravityRelativeTime implements GravityRelativeTime {
  const _GravityRelativeTime(
      {required this.days, required this.hours, required this.minutes});
  factory _GravityRelativeTime.fromJson(Map<String, dynamic> json) =>
      _$GravityRelativeTimeFromJson(json);

  @override
  final int days;
  @override
  final int hours;
  @override
  final int minutes;

  /// Create a copy of GravityRelativeTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GravityRelativeTimeCopyWith<_GravityRelativeTime> get copyWith =>
      __$GravityRelativeTimeCopyWithImpl<_GravityRelativeTime>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GravityRelativeTimeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GravityRelativeTime &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, days, hours, minutes);

  @override
  String toString() {
    return 'GravityRelativeTime(days: $days, hours: $hours, minutes: $minutes)';
  }
}

/// @nodoc
abstract mixin class _$GravityRelativeTimeCopyWith<$Res>
    implements $GravityRelativeTimeCopyWith<$Res> {
  factory _$GravityRelativeTimeCopyWith(_GravityRelativeTime value,
          $Res Function(_GravityRelativeTime) _then) =
      __$GravityRelativeTimeCopyWithImpl;
  @override
  @useResult
  $Res call({int days, int hours, int minutes});
}

/// @nodoc
class __$GravityRelativeTimeCopyWithImpl<$Res>
    implements _$GravityRelativeTimeCopyWith<$Res> {
  __$GravityRelativeTimeCopyWithImpl(this._self, this._then);

  final _GravityRelativeTime _self;
  final $Res Function(_GravityRelativeTime) _then;

  /// Create a copy of GravityRelativeTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? days = null,
    Object? hours = null,
    Object? minutes = null,
  }) {
    return _then(_GravityRelativeTime(
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      hours: null == hours
          ? _self.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _self.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$QueryTypes {
  @JsonKey(name: 'A (IPv4)')
  double get a;
  @JsonKey(name: 'AAAA (IPv6)')
  double get aaaa;
  @JsonKey(name: 'ANY')
  double get any;
  @JsonKey(name: 'SRV')
  double get srv;
  @JsonKey(name: 'SOA')
  double get soa;
  @JsonKey(name: 'PTR')
  double get ptr;
  @JsonKey(name: 'TXT')
  double get txt;
  @JsonKey(name: 'NAPTR')
  double get naptr;
  @JsonKey(name: 'MX')
  double get mx;
  @JsonKey(name: 'DS')
  double get ds;
  @JsonKey(name: 'RRSIG')
  double get rrsig;
  @JsonKey(name: 'DNSKEY')
  double get dnskey;
  @JsonKey(name: 'NS')
  double get ns;
  @JsonKey(name: 'OTHER')
  double get other;
  @JsonKey(name: 'SVCB')
  double get svcb;
  @JsonKey(name: 'HTTPS')
  double get https;

  /// Create a copy of QueryTypes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryTypesCopyWith<QueryTypes> get copyWith =>
      _$QueryTypesCopyWithImpl<QueryTypes>(this as QueryTypes, _$identity);

  /// Serializes this QueryTypes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryTypes &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.aaaa, aaaa) || other.aaaa == aaaa) &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.srv, srv) || other.srv == srv) &&
            (identical(other.soa, soa) || other.soa == soa) &&
            (identical(other.ptr, ptr) || other.ptr == ptr) &&
            (identical(other.txt, txt) || other.txt == txt) &&
            (identical(other.naptr, naptr) || other.naptr == naptr) &&
            (identical(other.mx, mx) || other.mx == mx) &&
            (identical(other.ds, ds) || other.ds == ds) &&
            (identical(other.rrsig, rrsig) || other.rrsig == rrsig) &&
            (identical(other.dnskey, dnskey) || other.dnskey == dnskey) &&
            (identical(other.ns, ns) || other.ns == ns) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.svcb, svcb) || other.svcb == svcb) &&
            (identical(other.https, https) || other.https == https));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, aaaa, any, srv, soa, ptr, txt,
      naptr, mx, ds, rrsig, dnskey, ns, other, svcb, https);

  @override
  String toString() {
    return 'QueryTypes(a: $a, aaaa: $aaaa, any: $any, srv: $srv, soa: $soa, ptr: $ptr, txt: $txt, naptr: $naptr, mx: $mx, ds: $ds, rrsig: $rrsig, dnskey: $dnskey, ns: $ns, other: $other, svcb: $svcb, https: $https)';
  }
}

/// @nodoc
abstract mixin class $QueryTypesCopyWith<$Res> {
  factory $QueryTypesCopyWith(
          QueryTypes value, $Res Function(QueryTypes) _then) =
      _$QueryTypesCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'A (IPv4)') double a,
      @JsonKey(name: 'AAAA (IPv6)') double aaaa,
      @JsonKey(name: 'ANY') double any,
      @JsonKey(name: 'SRV') double srv,
      @JsonKey(name: 'SOA') double soa,
      @JsonKey(name: 'PTR') double ptr,
      @JsonKey(name: 'TXT') double txt,
      @JsonKey(name: 'NAPTR') double naptr,
      @JsonKey(name: 'MX') double mx,
      @JsonKey(name: 'DS') double ds,
      @JsonKey(name: 'RRSIG') double rrsig,
      @JsonKey(name: 'DNSKEY') double dnskey,
      @JsonKey(name: 'NS') double ns,
      @JsonKey(name: 'OTHER') double other,
      @JsonKey(name: 'SVCB') double svcb,
      @JsonKey(name: 'HTTPS') double https});
}

/// @nodoc
class _$QueryTypesCopyWithImpl<$Res> implements $QueryTypesCopyWith<$Res> {
  _$QueryTypesCopyWithImpl(this._self, this._then);

  final QueryTypes _self;
  final $Res Function(QueryTypes) _then;

  /// Create a copy of QueryTypes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? aaaa = null,
    Object? any = null,
    Object? srv = null,
    Object? soa = null,
    Object? ptr = null,
    Object? txt = null,
    Object? naptr = null,
    Object? mx = null,
    Object? ds = null,
    Object? rrsig = null,
    Object? dnskey = null,
    Object? ns = null,
    Object? other = null,
    Object? svcb = null,
    Object? https = null,
  }) {
    return _then(_self.copyWith(
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as double,
      aaaa: null == aaaa
          ? _self.aaaa
          : aaaa // ignore: cast_nullable_to_non_nullable
              as double,
      any: null == any
          ? _self.any
          : any // ignore: cast_nullable_to_non_nullable
              as double,
      srv: null == srv
          ? _self.srv
          : srv // ignore: cast_nullable_to_non_nullable
              as double,
      soa: null == soa
          ? _self.soa
          : soa // ignore: cast_nullable_to_non_nullable
              as double,
      ptr: null == ptr
          ? _self.ptr
          : ptr // ignore: cast_nullable_to_non_nullable
              as double,
      txt: null == txt
          ? _self.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as double,
      naptr: null == naptr
          ? _self.naptr
          : naptr // ignore: cast_nullable_to_non_nullable
              as double,
      mx: null == mx
          ? _self.mx
          : mx // ignore: cast_nullable_to_non_nullable
              as double,
      ds: null == ds
          ? _self.ds
          : ds // ignore: cast_nullable_to_non_nullable
              as double,
      rrsig: null == rrsig
          ? _self.rrsig
          : rrsig // ignore: cast_nullable_to_non_nullable
              as double,
      dnskey: null == dnskey
          ? _self.dnskey
          : dnskey // ignore: cast_nullable_to_non_nullable
              as double,
      ns: null == ns
          ? _self.ns
          : ns // ignore: cast_nullable_to_non_nullable
              as double,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as double,
      svcb: null == svcb
          ? _self.svcb
          : svcb // ignore: cast_nullable_to_non_nullable
              as double,
      https: null == https
          ? _self.https
          : https // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [QueryTypes].
extension QueryTypesPatterns on QueryTypes {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryTypes value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QueryTypes() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryTypes value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypes():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QueryTypes value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypes() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'A (IPv4)') double a,
            @JsonKey(name: 'AAAA (IPv6)') double aaaa,
            @JsonKey(name: 'ANY') double any,
            @JsonKey(name: 'SRV') double srv,
            @JsonKey(name: 'SOA') double soa,
            @JsonKey(name: 'PTR') double ptr,
            @JsonKey(name: 'TXT') double txt,
            @JsonKey(name: 'NAPTR') double naptr,
            @JsonKey(name: 'MX') double mx,
            @JsonKey(name: 'DS') double ds,
            @JsonKey(name: 'RRSIG') double rrsig,
            @JsonKey(name: 'DNSKEY') double dnskey,
            @JsonKey(name: 'NS') double ns,
            @JsonKey(name: 'OTHER') double other,
            @JsonKey(name: 'SVCB') double svcb,
            @JsonKey(name: 'HTTPS') double https)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QueryTypes() when $default != null:
        return $default(
            _that.a,
            _that.aaaa,
            _that.any,
            _that.srv,
            _that.soa,
            _that.ptr,
            _that.txt,
            _that.naptr,
            _that.mx,
            _that.ds,
            _that.rrsig,
            _that.dnskey,
            _that.ns,
            _that.other,
            _that.svcb,
            _that.https);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'A (IPv4)') double a,
            @JsonKey(name: 'AAAA (IPv6)') double aaaa,
            @JsonKey(name: 'ANY') double any,
            @JsonKey(name: 'SRV') double srv,
            @JsonKey(name: 'SOA') double soa,
            @JsonKey(name: 'PTR') double ptr,
            @JsonKey(name: 'TXT') double txt,
            @JsonKey(name: 'NAPTR') double naptr,
            @JsonKey(name: 'MX') double mx,
            @JsonKey(name: 'DS') double ds,
            @JsonKey(name: 'RRSIG') double rrsig,
            @JsonKey(name: 'DNSKEY') double dnskey,
            @JsonKey(name: 'NS') double ns,
            @JsonKey(name: 'OTHER') double other,
            @JsonKey(name: 'SVCB') double svcb,
            @JsonKey(name: 'HTTPS') double https)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypes():
        return $default(
            _that.a,
            _that.aaaa,
            _that.any,
            _that.srv,
            _that.soa,
            _that.ptr,
            _that.txt,
            _that.naptr,
            _that.mx,
            _that.ds,
            _that.rrsig,
            _that.dnskey,
            _that.ns,
            _that.other,
            _that.svcb,
            _that.https);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'A (IPv4)') double a,
            @JsonKey(name: 'AAAA (IPv6)') double aaaa,
            @JsonKey(name: 'ANY') double any,
            @JsonKey(name: 'SRV') double srv,
            @JsonKey(name: 'SOA') double soa,
            @JsonKey(name: 'PTR') double ptr,
            @JsonKey(name: 'TXT') double txt,
            @JsonKey(name: 'NAPTR') double naptr,
            @JsonKey(name: 'MX') double mx,
            @JsonKey(name: 'DS') double ds,
            @JsonKey(name: 'RRSIG') double rrsig,
            @JsonKey(name: 'DNSKEY') double dnskey,
            @JsonKey(name: 'NS') double ns,
            @JsonKey(name: 'OTHER') double other,
            @JsonKey(name: 'SVCB') double svcb,
            @JsonKey(name: 'HTTPS') double https)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypes() when $default != null:
        return $default(
            _that.a,
            _that.aaaa,
            _that.any,
            _that.srv,
            _that.soa,
            _that.ptr,
            _that.txt,
            _that.naptr,
            _that.mx,
            _that.ds,
            _that.rrsig,
            _that.dnskey,
            _that.ns,
            _that.other,
            _that.svcb,
            _that.https);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QueryTypes implements QueryTypes {
  const _QueryTypes(
      {@JsonKey(name: 'A (IPv4)') required this.a,
      @JsonKey(name: 'AAAA (IPv6)') required this.aaaa,
      @JsonKey(name: 'ANY') required this.any,
      @JsonKey(name: 'SRV') required this.srv,
      @JsonKey(name: 'SOA') required this.soa,
      @JsonKey(name: 'PTR') required this.ptr,
      @JsonKey(name: 'TXT') required this.txt,
      @JsonKey(name: 'NAPTR') required this.naptr,
      @JsonKey(name: 'MX') required this.mx,
      @JsonKey(name: 'DS') required this.ds,
      @JsonKey(name: 'RRSIG') required this.rrsig,
      @JsonKey(name: 'DNSKEY') required this.dnskey,
      @JsonKey(name: 'NS') required this.ns,
      @JsonKey(name: 'OTHER') required this.other,
      @JsonKey(name: 'SVCB') required this.svcb,
      @JsonKey(name: 'HTTPS') required this.https});
  factory _QueryTypes.fromJson(Map<String, dynamic> json) =>
      _$QueryTypesFromJson(json);

  @override
  @JsonKey(name: 'A (IPv4)')
  final double a;
  @override
  @JsonKey(name: 'AAAA (IPv6)')
  final double aaaa;
  @override
  @JsonKey(name: 'ANY')
  final double any;
  @override
  @JsonKey(name: 'SRV')
  final double srv;
  @override
  @JsonKey(name: 'SOA')
  final double soa;
  @override
  @JsonKey(name: 'PTR')
  final double ptr;
  @override
  @JsonKey(name: 'TXT')
  final double txt;
  @override
  @JsonKey(name: 'NAPTR')
  final double naptr;
  @override
  @JsonKey(name: 'MX')
  final double mx;
  @override
  @JsonKey(name: 'DS')
  final double ds;
  @override
  @JsonKey(name: 'RRSIG')
  final double rrsig;
  @override
  @JsonKey(name: 'DNSKEY')
  final double dnskey;
  @override
  @JsonKey(name: 'NS')
  final double ns;
  @override
  @JsonKey(name: 'OTHER')
  final double other;
  @override
  @JsonKey(name: 'SVCB')
  final double svcb;
  @override
  @JsonKey(name: 'HTTPS')
  final double https;

  /// Create a copy of QueryTypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueryTypesCopyWith<_QueryTypes> get copyWith =>
      __$QueryTypesCopyWithImpl<_QueryTypes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueryTypesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QueryTypes &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.aaaa, aaaa) || other.aaaa == aaaa) &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.srv, srv) || other.srv == srv) &&
            (identical(other.soa, soa) || other.soa == soa) &&
            (identical(other.ptr, ptr) || other.ptr == ptr) &&
            (identical(other.txt, txt) || other.txt == txt) &&
            (identical(other.naptr, naptr) || other.naptr == naptr) &&
            (identical(other.mx, mx) || other.mx == mx) &&
            (identical(other.ds, ds) || other.ds == ds) &&
            (identical(other.rrsig, rrsig) || other.rrsig == rrsig) &&
            (identical(other.dnskey, dnskey) || other.dnskey == dnskey) &&
            (identical(other.ns, ns) || other.ns == ns) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.svcb, svcb) || other.svcb == svcb) &&
            (identical(other.https, https) || other.https == https));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, aaaa, any, srv, soa, ptr, txt,
      naptr, mx, ds, rrsig, dnskey, ns, other, svcb, https);

  @override
  String toString() {
    return 'QueryTypes(a: $a, aaaa: $aaaa, any: $any, srv: $srv, soa: $soa, ptr: $ptr, txt: $txt, naptr: $naptr, mx: $mx, ds: $ds, rrsig: $rrsig, dnskey: $dnskey, ns: $ns, other: $other, svcb: $svcb, https: $https)';
  }
}

/// @nodoc
abstract mixin class _$QueryTypesCopyWith<$Res>
    implements $QueryTypesCopyWith<$Res> {
  factory _$QueryTypesCopyWith(
          _QueryTypes value, $Res Function(_QueryTypes) _then) =
      __$QueryTypesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'A (IPv4)') double a,
      @JsonKey(name: 'AAAA (IPv6)') double aaaa,
      @JsonKey(name: 'ANY') double any,
      @JsonKey(name: 'SRV') double srv,
      @JsonKey(name: 'SOA') double soa,
      @JsonKey(name: 'PTR') double ptr,
      @JsonKey(name: 'TXT') double txt,
      @JsonKey(name: 'NAPTR') double naptr,
      @JsonKey(name: 'MX') double mx,
      @JsonKey(name: 'DS') double ds,
      @JsonKey(name: 'RRSIG') double rrsig,
      @JsonKey(name: 'DNSKEY') double dnskey,
      @JsonKey(name: 'NS') double ns,
      @JsonKey(name: 'OTHER') double other,
      @JsonKey(name: 'SVCB') double svcb,
      @JsonKey(name: 'HTTPS') double https});
}

/// @nodoc
class __$QueryTypesCopyWithImpl<$Res> implements _$QueryTypesCopyWith<$Res> {
  __$QueryTypesCopyWithImpl(this._self, this._then);

  final _QueryTypes _self;
  final $Res Function(_QueryTypes) _then;

  /// Create a copy of QueryTypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? a = null,
    Object? aaaa = null,
    Object? any = null,
    Object? srv = null,
    Object? soa = null,
    Object? ptr = null,
    Object? txt = null,
    Object? naptr = null,
    Object? mx = null,
    Object? ds = null,
    Object? rrsig = null,
    Object? dnskey = null,
    Object? ns = null,
    Object? other = null,
    Object? svcb = null,
    Object? https = null,
  }) {
    return _then(_QueryTypes(
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as double,
      aaaa: null == aaaa
          ? _self.aaaa
          : aaaa // ignore: cast_nullable_to_non_nullable
              as double,
      any: null == any
          ? _self.any
          : any // ignore: cast_nullable_to_non_nullable
              as double,
      srv: null == srv
          ? _self.srv
          : srv // ignore: cast_nullable_to_non_nullable
              as double,
      soa: null == soa
          ? _self.soa
          : soa // ignore: cast_nullable_to_non_nullable
              as double,
      ptr: null == ptr
          ? _self.ptr
          : ptr // ignore: cast_nullable_to_non_nullable
              as double,
      txt: null == txt
          ? _self.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as double,
      naptr: null == naptr
          ? _self.naptr
          : naptr // ignore: cast_nullable_to_non_nullable
              as double,
      mx: null == mx
          ? _self.mx
          : mx // ignore: cast_nullable_to_non_nullable
              as double,
      ds: null == ds
          ? _self.ds
          : ds // ignore: cast_nullable_to_non_nullable
              as double,
      rrsig: null == rrsig
          ? _self.rrsig
          : rrsig // ignore: cast_nullable_to_non_nullable
              as double,
      dnskey: null == dnskey
          ? _self.dnskey
          : dnskey // ignore: cast_nullable_to_non_nullable
              as double,
      ns: null == ns
          ? _self.ns
          : ns // ignore: cast_nullable_to_non_nullable
              as double,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as double,
      svcb: null == svcb
          ? _self.svcb
          : svcb // ignore: cast_nullable_to_non_nullable
              as double,
      https: null == https
          ? _self.https
          : https // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
