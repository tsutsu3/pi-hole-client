import 'package:pi_hole_client/data/services/api/model/v5/dns.dart';
import 'package:pi_hole_client/data/services/api/model/v5/domains.dart';
import 'package:pi_hole_client/data/services/api/model/v5/over_time_data.dart';
import 'package:pi_hole_client/data/services/api/model/v5/queries.dart';
import 'package:pi_hole_client/data/services/api/model/v5/realtime_status.dart';
import 'package:pi_hole_client/data/services/api/model/v5/summary_raw.dart';
import 'package:pi_hole_client/data/services/api/model/v5/versions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:result_dart/result_dart.dart';

class FakePiholeV5ApiClient implements PiholeV5ApiClient {
  @override
  void close() {}

  @override
  Future<Result<SummaryRaw>> getSummaryRaw(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Blocking>> postDnsBlocking(
    String token, {
    required bool enabled,
    int? timer,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<RealTimeStatus>> getRealTimeStatus(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<OverTimeData>> getOverTimeData(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Queries>> getQueries(
    String token, {
    DateTime? from,
    DateTime? until,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<DomainResponse>> postDomain(
    String token, {
    required String domain,
    required V5DomainType domainType,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Domains>> getDomains(
    String token, {
    required V5DomainType domainType,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<DomainResponse>> deleteDomain(
    String token, {
    required String domain,
    required V5DomainType domainType,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Versions>> getVersions(String token) async {
    throw UnimplementedError();
  }
}
