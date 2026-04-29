import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';

/// Abstract base class for all v6 repositories.
///
/// Delegates all SID management to the shared [V6SessionCache], which is
/// created once per server and injected into every v6 repository. This
/// guarantees that all repositories see the same cached SID and that
/// concurrent session renewals are deduplicated to a single request.
abstract class BaseV6SidRepository {
  BaseV6SidRepository({required V6SessionCache sessionCache})
    : _sessionCache = sessionCache;

  final V6SessionCache _sessionCache;

  String get serverAddress => _sessionCache.serverAddress;

  Future<String> getSid() => _sessionCache.getSid();

  Future<void> saveSid(String sid) => _sessionCache.saveSid(sid);

  Future<void> clearSid() async => _sessionCache.clearSid();

  Future<void> clearAndRenewSid() => _sessionCache.clearAndRenewSid();
}
