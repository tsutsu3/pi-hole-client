import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class DnsRepository {
  /// Fetches the current DNS blocking status.
  Future<Result<Blocking>> fetchBlockingStatus();

  /// Enables DNS blocking.
  Future<Result<Blocking>> enableBlocking();

  /// Disables DNS blocking.
  Future<Result<Blocking>> disableBlocking(int timer);
}
