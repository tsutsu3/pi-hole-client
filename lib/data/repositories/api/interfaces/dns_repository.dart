import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class DnsRepository {
  /// Fetches the current DNS blocking status.
  ///
  /// When [skipRenewal] is true, the call retries on transient failures but
  /// never triggers a session renewal via `clearAndRenewSid`. Use this after
  /// `createSession` to verify the connection without risking a duplicate
  /// session being created on a transient error.
  Future<Result<Blocking>> fetchBlockingStatus({bool skipRenewal = false});

  /// Enables DNS blocking.
  Future<Result<Blocking>> enableBlocking();

  /// Disables DNS blocking.
  Future<Result<Blocking>> disableBlocking(int timer);
}
