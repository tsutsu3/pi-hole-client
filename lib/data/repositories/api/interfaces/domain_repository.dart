import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class DomainRepository {
  Future<Result<DomainLists>> fetchAllDomains();

  // Future<Result<List<Domain>>> fetchDomains({
  //   DomainType? type,
  //   DomainKind? kind,
  // });

  Future<Result<Domain>> addDomain(
    DomainType type,
    DomainKind kind,
    String domain, {
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  });

  Future<Result<Domain>> updateDomain(
    DomainType type,
    DomainKind kind,
    String domain, {
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  });

  Future<Result<Unit>> deleteDomain(
    DomainType type,
    DomainKind kind,
    String domain,
  );
}
