import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v6/domain_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class DomainRepositoryV6 extends BaseV6SidRepository
    implements DomainRepository {
  DomainRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    return runWithResultRetry<DomainLists>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getDomains(sid);
        return result.map((e) => e.toDomainLists());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Domain>> addDomain(
    DomainType type,
    DomainKind kind,
    String domain, {
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    return runWithResultRetry<Domain>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postDomains(
          sid,
          type: type,
          kind: kind,
          domain: domain,
          comment: comment,
          groups: groups,
          enabled: enabled,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Domain>> updateDomain(
    DomainType type,
    DomainKind kind,
    String domain, {
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    return runWithResultRetry<Domain>(
      action: () async {
        final sid = await getSid();
        final result = await _client.putDomains(
          sid,
          type: type,
          kind: kind,
          domain: domain,
          comment: comment,
          groups: groups,
          enabled: enabled,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteDomain(
    DomainType type,
    DomainKind kind,
    String domain,
  ) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteDomains(
          sid,
          type: type,
          kind: kind,
          domain: domain,
        );
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }
}
