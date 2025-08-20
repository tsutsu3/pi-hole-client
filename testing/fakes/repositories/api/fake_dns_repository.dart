import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/dns.dart';

class FakeDnsRepository implements DnsRepository {
  bool shouldFail = false;

  @override
  Future<Result<Blocking>> fetchBlockingStatus() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchBlockingStatus failure'));
    }
    return Success(kRepoFetchDnsBlocking);
  }

  @override
  Future<Result<Blocking>> enableBlocking() async {
    if (shouldFail) {
      return Failure(Exception('Force enableBlocking failure'));
    }
    return Success(kRepoEnableDnsBlocking);
  }

  @override
  Future<Result<Blocking>> disableBlocking(int timer) async {
    if (shouldFail) {
      return Failure(Exception('Force disableBlocking failure'));
    }
    return Success(kRepoDisableDnsBlocking.copyWith(timer: timer));
  }
}
