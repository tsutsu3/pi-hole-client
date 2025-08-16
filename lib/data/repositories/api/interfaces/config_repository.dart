import 'package:pi_hole_client/domain/model/config/config.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ConfigRepository {
  /// Fetches DNS query logging status.
  Future<Result<Config>> fetchDnsQueryLogging();

  /// Enables or disables DNS query logging.
  Future<Result<Config>> setDnsQueryLogging(bool status);
}
