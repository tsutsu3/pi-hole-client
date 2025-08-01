// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_raw.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummaryRaw {
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

  /// Create a copy of SummaryRaw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SummaryRawCopyWith<SummaryRaw> get copyWith =>
      _$SummaryRawCopyWithImpl<SummaryRaw>(this as SummaryRaw, _$identity);

  /// Serializes this SummaryRaw to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SummaryRaw &&
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
                other.gravityLastUpdated == gravityLastUpdated));
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
        gravityLastUpdated
      ]);

  @override
  String toString() {
    return 'SummaryRaw(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxDomain: $replyNxDomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, privacyLevel: $privacyLevel, status: $status, gravityLastUpdated: $gravityLastUpdated)';
  }
}

/// @nodoc
abstract mixin class $SummaryRawCopyWith<$Res> {
  factory $SummaryRawCopyWith(
          SummaryRaw value, $Res Function(SummaryRaw) _then) =
      _$SummaryRawCopyWithImpl;
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
      GravityLastUpdated gravityLastUpdated});

  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated;
}

/// @nodoc
class _$SummaryRawCopyWithImpl<$Res> implements $SummaryRawCopyWith<$Res> {
  _$SummaryRawCopyWithImpl(this._self, this._then);

  final SummaryRaw _self;
  final $Res Function(SummaryRaw) _then;

  /// Create a copy of SummaryRaw
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
    ));
  }

  /// Create a copy of SummaryRaw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated {
    return $GravityLastUpdatedCopyWith<$Res>(_self.gravityLastUpdated, (value) {
      return _then(_self.copyWith(gravityLastUpdated: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SummaryRaw].
extension SummaryRawPatterns on SummaryRaw {
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
    TResult Function(_SummaryRaw value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SummaryRaw() when $default != null:
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
    TResult Function(_SummaryRaw value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryRaw():
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
    TResult? Function(_SummaryRaw value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryRaw() when $default != null:
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
            GravityLastUpdated gravityLastUpdated)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SummaryRaw() when $default != null:
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
            _that.gravityLastUpdated);
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
            GravityLastUpdated gravityLastUpdated)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryRaw():
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
            _that.gravityLastUpdated);
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
            GravityLastUpdated gravityLastUpdated)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryRaw() when $default != null:
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
            _that.gravityLastUpdated);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SummaryRaw implements SummaryRaw {
  const _SummaryRaw(
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
      @JsonKey(name: 'gravity_last_updated') required this.gravityLastUpdated});
  factory _SummaryRaw.fromJson(Map<String, dynamic> json) =>
      _$SummaryRawFromJson(json);

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

  /// Create a copy of SummaryRaw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SummaryRawCopyWith<_SummaryRaw> get copyWith =>
      __$SummaryRawCopyWithImpl<_SummaryRaw>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SummaryRawToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SummaryRaw &&
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
                other.gravityLastUpdated == gravityLastUpdated));
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
        gravityLastUpdated
      ]);

  @override
  String toString() {
    return 'SummaryRaw(domainsBeingBlocked: $domainsBeingBlocked, dnsQueriesToday: $dnsQueriesToday, adsBlockedToday: $adsBlockedToday, adsPercentageToday: $adsPercentageToday, uniqueDomains: $uniqueDomains, queriesForwarded: $queriesForwarded, queriesCached: $queriesCached, clientsEverSeen: $clientsEverSeen, uniqueClients: $uniqueClients, dnsQueriesAllTypes: $dnsQueriesAllTypes, replyUnknown: $replyUnknown, replyNodata: $replyNodata, replyNxDomain: $replyNxDomain, replyCname: $replyCname, replyIp: $replyIp, replyDomain: $replyDomain, replyRrname: $replyRrname, replyServfail: $replyServfail, replyRefused: $replyRefused, replyNotimp: $replyNotimp, replyOther: $replyOther, replyDnssec: $replyDnssec, replyNone: $replyNone, replyBlob: $replyBlob, dnsQueriesAllReplies: $dnsQueriesAllReplies, privacyLevel: $privacyLevel, status: $status, gravityLastUpdated: $gravityLastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$SummaryRawCopyWith<$Res>
    implements $SummaryRawCopyWith<$Res> {
  factory _$SummaryRawCopyWith(
          _SummaryRaw value, $Res Function(_SummaryRaw) _then) =
      __$SummaryRawCopyWithImpl;
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
      GravityLastUpdated gravityLastUpdated});

  @override
  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated;
}

/// @nodoc
class __$SummaryRawCopyWithImpl<$Res> implements _$SummaryRawCopyWith<$Res> {
  __$SummaryRawCopyWithImpl(this._self, this._then);

  final _SummaryRaw _self;
  final $Res Function(_SummaryRaw) _then;

  /// Create a copy of SummaryRaw
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
  }) {
    return _then(_SummaryRaw(
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
    ));
  }

  /// Create a copy of SummaryRaw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityLastUpdatedCopyWith<$Res> get gravityLastUpdated {
    return $GravityLastUpdatedCopyWith<$Res>(_self.gravityLastUpdated, (value) {
      return _then(_self.copyWith(gravityLastUpdated: value));
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

// dart format on
