import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class FakeDomainRepository implements DomainRepository {
  bool shouldFail = false;

  final _now = DateTime(2025, 1, 1);

  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchAllDomains failure'));
    }
    return Success(
      DomainLists(
        allowExact: [
          Domain(
            id: 1,
            name: 'example.com',
            punyCode: 'example.com',
            type: DomainType.allow,
            kind: DomainKind.exact,
            comment: null,
            groups: [0],
            enabled: true,
            dateAdded: _now,
            dateModified: _now,
          ),
        ],
        allowRegex: [
          Domain(
            id: 2,
            name: r'(^|\.)example\.net$',
            punyCode: r'(^|\.)example\.net$',
            type: DomainType.allow,
            kind: DomainKind.regex,
            comment: 'regex allow',
            groups: [0],
            enabled: true,
            dateAdded: _now,
            dateModified: _now,
          ),
        ],
        denyExact: [
          Domain(
            id: 3,
            name: 'blocked.com',
            punyCode: 'blocked.com',
            type: DomainType.deny,
            kind: DomainKind.exact,
            comment: null,
            groups: [0],
            enabled: true,
            dateAdded: _now,
            dateModified: _now,
          ),
        ],
        denyRegex: [
          Domain(
            id: 4,
            name: r'(^|\.)ads\.example\.com$',
            punyCode: r'(^|\.)ads\.example\.com$',
            type: DomainType.deny,
            kind: DomainKind.regex,
            comment: 'regex deny',
            groups: [0],
            enabled: false,
            dateAdded: _now,
            dateModified: _now,
          ),
        ],
      ),
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
    if (shouldFail) {
      return Failure(Exception('Force addDomain failure'));
    }
    return Success(
      Domain(
        id: 99,
        name: domain,
        punyCode: domain,
        type: type,
        kind: kind,
        comment: comment,
        groups: groups ?? [0],
        enabled: enabled ?? true,
        dateAdded: _now,
        dateModified: _now,
      ),
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
    if (shouldFail) {
      return Failure(Exception('Force updateDomain failure'));
    }
    return Success(
      Domain(
        id: 1,
        name: domain,
        punyCode: domain,
        type: type,
        kind: kind,
        comment: comment,
        groups: groups ?? [0],
        enabled: enabled ?? true,
        dateAdded: _now,
        dateModified: _now,
      ),
    );
  }

  @override
  Future<Result<Unit>> deleteDomain(
    DomainType type,
    DomainKind kind,
    String domain,
  ) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteDomain failure'));
    }
    return const Success(unit);
  }
}
