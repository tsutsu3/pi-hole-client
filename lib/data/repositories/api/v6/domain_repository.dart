import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v6/domain_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class DomainRepositoryV6 implements DomainRepository {
  DomainRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    return runWithResultRetry<DomainLists>(
      action: () async {
        final result = await _client.getDomains(_sid);
        return Success(result.getOrThrow().toDomainLists());
      },
    );
  }

  // @override
  // Future<Result<List<Domain>>> fetchDomains({
  //   DomainType? type,
  //   DomainKind? kind,
  // }) async {
  //   return runWithResultRetry<List<Domain>>(
  //     action: () async {
  //       final result = await _client.getDomains(
  //         _sid,
  //         type: type,
  //         kind: kind,
  //       );
  //       return Success(result.getOrThrow().toDomain());
  //     },
  //   );
  // }

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
        final result = await _client.postDomains(
          _sid,
          type: type,
          kind: kind,
          domain: domain,
          comment: comment,
          groups: groups,
          enabled: enabled,
        );
        return Success(result.getOrThrow().toSingleDomain());
      },
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
        final result = await _client.putDomains(
          _sid,
          type: type,
          kind: kind,
          domain: domain,
          comment: comment,
          groups: groups,
          enabled: enabled,
        );
        return Success(result.getOrThrow().toSingleDomain());
      },
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
        final result = await _client.deleteDomains(
          _sid,
          type: type,
          kind: kind,
          domain: domain,
        );
        return Success(result.getOrThrow());
      },
    );
  }
}
