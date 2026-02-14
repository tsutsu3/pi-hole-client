import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class LocalDnsRepository {
  Future<Result<List<LocalDns>>> fetchRecords();

  Future<Result<Unit>> addRecord({required String ip, required String name});

  Future<Result<Unit>> updateRecord({
    required LocalDns record,
    required String oldIp,
  });

  Future<Result<Unit>> deleteRecord({required String ip, required String name});
}
