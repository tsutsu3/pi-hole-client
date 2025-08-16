import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/mapper/v5/domain_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class DomainRepositoryV5 extends BaseV5TokenRepository
    implements DomainRepository {
  DomainRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) : _client = client;

  final PiholeV5ApiClient _client;

  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    return runWithResultRetry<DomainLists>(
      action: () async {
        final token = await getToken();
        final results = await Future.wait([
          _client.getDomains(token, domainType: V5DomainType.white),
          _client.getDomains(token, domainType: V5DomainType.regex_white),
          _client.getDomains(token, domainType: V5DomainType.black),
          _client.getDomains(token, domainType: V5DomainType.regex_black),
        ]);

        for (final res in results) {
          if (res.isError()) return Failure(res.exceptionOrNull()!);
        }

        final domainLists = DomainLists(
          whitelist: results[0].getOrThrow().toDomain(),
          whitelistRegex: results[1].getOrThrow().toDomain(),
          blacklist: results[2].getOrThrow().toDomain(),
          blacklistRegex: results[3].getOrThrow().toDomain(),
        );

        return Success(domainLists);
      },
      onRetry: (_) => clearToken(),
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
        final token = await getToken();
        final result = await _client.postDomain(
          token,
          domain: domain,
          domainType: type.toV5DomainType(kind),
        );

        if (result.isError()) {
          return Failure(result.exceptionOrNull()!);
        }

        // Pi-hole v5 API does not return a response containing the full domain data,
        // such as ID, timestamps, or other metadata.
        // Therefore, we construct a placeholder Domain object with minimal information.
        return Success(
          Domain(
            id: -1,
            name: domain,
            type: type,
            kind: kind,
            comment: comment,
            groups: groups ?? [0],
            enabled: enabled ?? true,
            dateAdded: DateTime.fromMillisecondsSinceEpoch(0),
            dateModified: DateTime.fromMillisecondsSinceEpoch(0),
          ),
        );
      },
      onRetry: (_) => clearToken(),
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
    // Pi-hole v5 API does not support updating domains directly.
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
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
        final token = await getToken();
        final result = await _client.deleteDomain(
          token,
          domain: domain,
          domainType: type.toV5DomainType(kind),
        );
        if (result.isError()) {
          return Failure(result.exceptionOrNull()!);
        }
        return Success.unit();
      },
      onRetry: (_) => clearToken(),
    );
  }
}
