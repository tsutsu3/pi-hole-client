import 'package:pi_hole_client/data/repositories/api/interfaces/config_repository.dart';
import 'package:pi_hole_client/domain/model/config/config.dart';
import 'package:pi_hole_client/domain/model/config/dns_config.dart';
import 'package:result_dart/result_dart.dart';

class FakeConfigRepository implements ConfigRepository {
  bool shouldFailFetch = false;
  bool shouldFailSet = false;
  bool queryLoggingValue = true;

  @override
  Future<Result<Config>> fetchDnsQueryLogging() async {
    if (shouldFailFetch) {
      return Failure(Exception('Force fetchDnsQueryLogging failure'));
    }
    return Success(Config(dns: DnsConfig(queryLogging: queryLoggingValue)));
  }

  @override
  Future<Result<Config>> setDnsQueryLogging(bool status) async {
    if (shouldFailSet) {
      return Failure(Exception('Force setDnsQueryLogging failure'));
    }
    return Success(Config(dns: DnsConfig(queryLogging: status)));
  }
}
