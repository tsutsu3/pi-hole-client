import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/local_dns.dart';

class FakeLocalDnsRepository implements LocalDnsRepository {
  bool shouldFail = false;
  int fetchRecordsCallCount = 0;
  int addRecordCallCount = 0;
  int updateRecordCallCount = 0;
  int deleteRecordCallCount = 0;

  @override
  Future<Result<List<LocalDns>>> fetchRecords() async {
    fetchRecordsCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force fetchRecords failure'));
    }
    return const Success(kRepoFetchLocalDnsRecords);
  }

  @override
  Future<Result<Unit>> addRecord({
    required String ip,
    required String name,
  }) async {
    addRecordCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force addRecord failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<Unit>> updateRecord({
    required LocalDns record,
    required String oldIp,
  }) async {
    updateRecordCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force updateRecord failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<Unit>> deleteRecord({
    required String ip,
    required String name,
  }) async {
    deleteRecordCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force deleteRecord failure'));
    }
    return const Success(unit);
  }
}
