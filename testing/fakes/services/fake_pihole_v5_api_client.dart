import 'package:pi_hole_client/data/model/v5/dns.dart';
import 'package:pi_hole_client/data/model/v5/domains.dart';
import 'package:pi_hole_client/data/model/v5/over_time_data.dart';
import 'package:pi_hole_client/data/model/v5/queries.dart';
import 'package:pi_hole_client/data/model/v5/realtime_status.dart'
    hide GravityLastUpdated, GravityRelativeTime;
import 'package:pi_hole_client/data/model/v5/summary_raw.dart';
import 'package:pi_hole_client/data/model/v5/versions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:result_dart/result_dart.dart';

import '../../models/v5/domain.dart';
import '../../models/v5/merics.dart';
import '../../models/v5/realtime_status.dart';
import '../../models/v5/versions.dart';

class FakePiholeV5ApiClient implements PiholeV5ApiClient {
  bool shouldFail = false;
  bool isDocker = false;

  @override
  void close() {}

  @override
  Future<Result<SummaryRaw>> getSummaryRaw(String token) async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch summary'));
    }
    return const Success(
      SummaryRaw(
        domainsBeingBlocked: 100,
        dnsQueriesToday: 50,
        adsBlockedToday: 10,
        adsPercentageToday: 20.0,
        uniqueDomains: 30,
        queriesForwarded: 20,
        queriesCached: 10,
        clientsEverSeen: 5,
        uniqueClients: 3,
        dnsQueriesAllTypes: 50,
        replyUnknown: 0,
        replyNodata: 0,
        replyNxDomain: 0,
        replyCname: 0,
        replyIp: 0,
        replyDomain: 0,
        replyRrname: 0,
        replyServfail: 0,
        replyRefused: 0,
        replyNotimp: 0,
        replyOther: 0,
        replyDnssec: 0,
        replyNone: 0,
        replyBlob: 0,
        dnsQueriesAllReplies: 50,
        privacyLevel: 0,
        status: 'enabled',
        gravityLastUpdated: GravityLastUpdated(
          fileExists: true,
          absolute: 1700000000,
          relative: GravityRelativeTime(days: 0, hours: 1, minutes: 30),
        ),
      ),
    );
  }

  @override
  Future<Result<Blocking>> postDnsBlocking(
    String token, {
    required bool enabled,
    int? timer,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Failed to set DNS blocking'));
    }
    return Success(Blocking(status: enabled ? 'enabled' : 'disabled'));
  }

  @override
  Future<Result<RealTimeStatus>> getRealTimeStatus(String token) async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch real-time status'));
    }
    return const Success(kSrvGetRealTimeStatus);
  }

  @override
  Future<Result<OverTimeData>> getOverTimeData(String token) async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch over time data'));
    }
    return const Success(kSrvGetOverTimeData);
  }

  @override
  Future<Result<Queries>> getQueries(
    String token, {
    DateTime? from,
    DateTime? until,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch queries'));
    }
    return const Success(kSrvGetQueries);
  }

  @override
  Future<Result<DomainResponse>> postDomain(
    String token, {
    required String domain,
    required V5DomainType domainType,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Failed to add domain'));
    }
    return const Success(DomainResponse(success: true));
  }

  @override
  Future<Result<Domains>> getDomains(
    String token, {
    required V5DomainType domainType,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch domains'));
    }

    switch (domainType) {
      case V5DomainType.white:
        return const Success(kSrvGetDomainsWhite);
      case V5DomainType.regex_white:
        return const Success(kSrvGetDomainsWhiteRegex);
      case V5DomainType.black:
        return const Success(kSrvGetDomainsBlack);
      case V5DomainType.regex_black:
        return const Success(kSrvGetDomainsBlackRegex);
    }
  }

  @override
  Future<Result<DomainResponse>> deleteDomain(
    String token, {
    required String domain,
    required V5DomainType domainType,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Failed to delete domain'));
    }
    return const Success(DomainResponse(success: true));
  }

  @override
  Future<Result<Versions>> getVersions(String token) async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch versions'));
    }

    if (isDocker) {
      return const Success(kSrvVersionsWithDocker);
    }
    return const Success(kSrvVersions);
  }
}
